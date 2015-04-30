DateWithLabel = React.createClass
  displayName: 'DateWithLabel'

  getDefaultProps: ->
    date: new Date()

  onYearChange: (event) ->
    newDate = new Date(
      event.target.value,
      @props.date.getMonth(),
      @props.date.getDate()
    )
    @props.onChange(newDate)

  onMonthChange: (event) ->
    newDate = new Date(
      @props.date.getFullYear(),
      event.target.value,
      @props.date.getDate()
    )
    @props.onChange(newDate)

  onDateChange: (event) ->
    newDate = new Date(
      @props.date.getFullYear(),
      @props.date.getMonth(),
      event.target.value
    )
    @props.onChange(newDate)

  monthName: (monthNumberStartingFromZero) ->
    [
      "January", "February", "March", "April", "May", "June", "July",
      "August", "September", "October", "November", "December"
    ][monthNumberStartingFromZero]

  dayName: (date) ->
    dayNameStartingWithSundayZero = new Date(
      @props.date.getFullYear(),
      @props.date.getMonth(),
      date
    ).getDay()
    [
      "Sunday", "Monday", "Tuesday", "Wednesday","Thursday", "Friday",
      "Saturday"
    ][dayNameStartingWithSundayZero]

  yearsOptions: ->
    `<option value={year} key={year}>{year}</option>` for year in [2014..2020]

  monthsOptions: ->
    `<option value={month} key={month}>{this.monthName(month)}</option>` for month in [0..11]

  daysOptions: ->
    `<option value={date} key={date}>{date}-{this.dayName(date)}</option>` for date in [1..31]

  render: ->
    `(
      <div className='form-group'>
        <label className='col-lg-2 control-label'>Date</label>

        <div className='col-lg-2'>
          <select className='form-control' value={this.props.date.getFullYear()} onChange={this.onYearChange}>
            {this.yearsOptions()}
          </select>
        </div>

        <div className='col-lg-3'>
          <select className='form-control' value={this.props.date.getMonth()} onChange={this.onMonthChange}>
            {this.monthsOptions()}
          </select>
        </div>

        <div className='col-lg-2'>
          <select className='form-control' value={this.props.date.getDate()} onChange={this.onDateChange}>
            {this.daysOptions()}
          </select>
        </div>
      </div>
    )`

window.DateWithLabel = DateWithLabel
