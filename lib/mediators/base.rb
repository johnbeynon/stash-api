class Mediators
  class Base
    def self.run(options={})
      new(options).call
    end

    def filter_args(args, allowed_args)
      args.select {|k,v| allowed_args.include? k}.deep_symbolize_keys
    end
  end
end
