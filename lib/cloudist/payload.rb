module Cloudist
  DEFAULT_TTL = 300

  class Payload
    include Utils
    
    attr_reader :body, :publish_opts, :headers

    def initialize(data_hash_or_json, headers = {}, publish_opts = {})
      @publish_opts, @headers = publish_opts, headers
      @published = false
      
      data_hash_or_json = parse_message(data_hash_or_json) if data_hash_or_json.is_a?(String)
      
      raise Cloudist::BadPayload, "Expected Hash for payload" unless data_hash_or_json.is_a?(Hash)

      @body = HashWithIndifferentAccess.new(data_hash_or_json)
      update_headers
    end

    # Return message formatted as JSON and headers ready for transport in array
    def formatted
      update_headers
      
      [body.to_json, publish_opts]
    end
    
    def id
      @id ||= event_hash.to_s
    end
    
    def id=(new_id)
      @id = new_id.to_s
      update_headers
    end
    
    def frozen?
      headers.frozen?
    end
    
    def freeze!
      headers.freeze
      body.freeze
    end
    
    def update_headers
      headers = extract_custom_headers
      (publish_opts[:headers] ||= {}).merge!(headers)
    end
    
    def extract_custom_headers
      raise StaleHeadersError, "Headers cannot be changed because payload has already been published" if published?
      headers[:published_on] ||= body.delete('published_on') || Time.now.utc.to_i
      headers[:ttl] ||= body.delete('ttl') || Cloudist::DEFAULT_TTL

      # this is the event hash that gets transferred through various publish/reply actions
      headers[:event_hash] ||= id

      # this value should be unique for each published/received message pair
      headers[:message_id] ||= id
      
      # We use JSON for message transport exclusively
      headers[:content_type] ||= 'application/json'
      
      # headers[:headers][:message_type] = 'event'
       # ||= body.delete('message_type') || 'reply'
      
      # headers[:headers] = custom_headers
      
      # some strange behavior with integers makes it better to
      # convert all amqp headers to strings to avoid any problems
      headers.each { |k,v| headers[k] = v.to_s }
      
      headers
    end

    def parse_custom_headers
      return { } unless headers

      h = headers.dup

      h[:published_on] = h[:published_on].to_i

      h[:ttl] = h[:ttl].to_i rescue -1
      h[:ttl] = -1 if h[:ttl] == 0

      h
    end
    
    def set_reply_to(queue_name)
      headers[:reply_to] = reply_name(queue_name)
      set_master_queue_name(queue_name)
    end
    
    def set_master_queue_name(queue_name)
      headers[:master_queue] = queue_name 
    end
    
    def reply_name(queue_name)
      # "#{queue_name}.#{id}"
      Utils.reply_prefix(queue_name)
    end
    
    def reply_to
      headers[:reply_to]
    end
    
    def message_type
      headers[:message_type]
    end
    
    def event_hash
      @event_hash ||= headers[:event_hash] || body.delete('event_hash') || create_event_hash
    end
    
    def create_event_hash
      s = Time.now.to_s + object_id.to_s + rand(100).to_s
      Digest::MD5.hexdigest(s)
    end
    
    def parse_message(raw)
      return { } unless raw
      decode_json(raw)
    end
    
    def [](key)
      body[key]
    end
    
    def published?
      @published == true
    end
    
    def publish
      return if published?
      @published = true
      freeze!
    end
    
  end
end