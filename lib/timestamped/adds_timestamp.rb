module Timestamped
  module AddsTimestamp

    # we'll assume that the test run starts around the time this 
    # file is evaluated. Pretty hacky, and not terribly accurate, but
    # I think it's good enough
    TEST_RUN_START = Time.now
      
    def self.formatter_with_timestamped_scenario_names(formatter_class)
      Class.new( formatter_class ){ include AddsTimestamp }
    end

    def scenario_name(keyword, name, file_colon_line, source_indent)
      name = append_timestamp_to(name)
      super( keyword, name, file_colon_line, source_indent )
    end


    def append_timestamp_to( name )
      formatted_date_now = Time.now.strftime("%y/%m/%d")
      formatted_time_now = Time.now.strftime("%H:%M:%S (%Z)")
      "#{name}  [Run on #{formatted_date_now} at #{formatted_time_now}]"
    end
  end
end
