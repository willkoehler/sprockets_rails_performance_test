# Formats for Time and DateTime classes
Time::DATE_FORMATS.merge!(
 short_date: '%b %-e, %Y',
)

# Formats for Date class
Date::DATE_FORMATS.merge!(
 short_date: '%b %-e, %Y',
 mdy: '%-m/%-d/%Y',
 month_year: '%b %Y',
 monthabbr_day_year: '%b %-d, %Y',
 year_quarter: ->(date) { "#{date.year} Q#{(date.month + 2)/3}" },
 month_abbr: '%b'
)
