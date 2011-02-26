# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{cloudist}
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ivan Vanderbyl"]
  s.date = %q{2011-02-26}
  s.description = %q{Cloudist is a simple, highly scalable job queue for Ruby applications, it can run within Rails, DaemonKit or your own custom application. Refer to github page for examples}
  s.email = %q{ivanvanderbyl@me.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "cloudist.gemspec",
    "examples/extending_values.rb",
    "examples/queue_message.rb",
    "examples/sandwich_client.rb",
    "examples/sandwich_client_with_custom_listener.rb",
    "examples/sandwich_worker.rb",
    "examples/sandwich_worker_with_class.rb",
    "lib/cloudist.rb",
    "lib/cloudist/callback.rb",
    "lib/cloudist/callback_methods.rb",
    "lib/cloudist/callbacks/error_callback.rb",
    "lib/cloudist/core_ext/class.rb",
    "lib/cloudist/core_ext/kernel.rb",
    "lib/cloudist/core_ext/module.rb",
    "lib/cloudist/core_ext/object.rb",
    "lib/cloudist/core_ext/string.rb",
    "lib/cloudist/errors.rb",
    "lib/cloudist/job.rb",
    "lib/cloudist/listener.rb",
    "lib/cloudist/listener_old.rb",
    "lib/cloudist/payload.rb",
    "lib/cloudist/publisher.rb",
    "lib/cloudist/queues/basic_queue.rb",
    "lib/cloudist/queues/job_queue.rb",
    "lib/cloudist/queues/log_queue.rb",
    "lib/cloudist/queues/reply_queue.rb",
    "lib/cloudist/request.rb",
    "lib/cloudist/utils.rb",
    "lib/cloudist/worker.rb",
    "spec/cloudist/basic_queue_spec.rb",
    "spec/cloudist/job_spec.rb",
    "spec/cloudist/payload_spec.rb",
    "spec/cloudist/request_spec.rb",
    "spec/cloudist/utils_spec.rb",
    "spec/cloudist_spec.rb",
    "spec/core_ext/string_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/ivanvanderbyl/cloudist}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.0}
  s.summary = %q{Super fast job queue using AMQP}
  s.test_files = [
    "examples/extending_values.rb",
    "examples/queue_message.rb",
    "examples/sandwich_client.rb",
    "examples/sandwich_client_with_custom_listener.rb",
    "examples/sandwich_worker.rb",
    "examples/sandwich_worker_with_class.rb",
    "spec/cloudist/basic_queue_spec.rb",
    "spec/cloudist/job_spec.rb",
    "spec/cloudist/payload_spec.rb",
    "spec/cloudist/request_spec.rb",
    "spec/cloudist/utils_spec.rb",
    "spec/cloudist_spec.rb",
    "spec/core_ext/string_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<amqp>, [">= 0"])
      s.add_runtime_dependency(%q<json>, ["~> 1.4.6"])
      s.add_runtime_dependency(%q<i18n>, [">= 0"])
      s.add_runtime_dependency(%q<activesupport>, ["~> 3.0.3"])
      s.add_development_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_development_dependency(%q<moqueue>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<reek>, ["~> 1.2.8"])
      s.add_development_dependency(%q<roodi>, ["~> 2.1.0"])
    else
      s.add_dependency(%q<amqp>, [">= 0"])
      s.add_dependency(%q<json>, ["~> 1.4.6"])
      s.add_dependency(%q<i18n>, [">= 0"])
      s.add_dependency(%q<activesupport>, ["~> 3.0.3"])
      s.add_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_dependency(%q<moqueue>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<reek>, ["~> 1.2.8"])
      s.add_dependency(%q<roodi>, ["~> 2.1.0"])
    end
  else
    s.add_dependency(%q<amqp>, [">= 0"])
    s.add_dependency(%q<json>, ["~> 1.4.6"])
    s.add_dependency(%q<i18n>, [">= 0"])
    s.add_dependency(%q<activesupport>, ["~> 3.0.3"])
    s.add_dependency(%q<rspec>, ["~> 2.3.0"])
    s.add_dependency(%q<moqueue>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<reek>, ["~> 1.2.8"])
    s.add_dependency(%q<roodi>, ["~> 2.1.0"])
  end
end

