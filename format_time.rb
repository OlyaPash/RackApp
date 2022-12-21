class FormatTime

  FORMAT_TIME = { 'year' => '%Y',
                  'month' => '%m',
                  'day' => '%d',
                  'hour' => '%H',
                  'minute' => '%M',
                  'second' => '%S' }.freeze

  attr_reader :incorrect

  def initialize(params)
    @params = params['format'].split(',')
  end

  def check_format
    @correct, @incorrect = @params.partition { |format| FORMAT_TIME[format] }
  end

  def valid?
    @incorrect.empty?
  end

  def time_format
    formats = @correct.map { |format| FORMAT_TIME[format] }
    Time.now.strftime(formats.join('-'))
  end
  
end
