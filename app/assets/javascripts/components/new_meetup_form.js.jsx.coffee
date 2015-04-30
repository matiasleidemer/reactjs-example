CreateNewMeetupForm = React.createClass
  displayName: 'CreateNewMeetupForm'

  getInitialState: ->
    title: ''
    description: ''
    date: new Date(2014, 4, 8)

  fieldChanged: (fieldName, event) ->
    stateUpdate = {}
    stateUpdate[fieldName] = event.target.value
    @setState(stateUpdate)

  dateChanged: (newDate) ->
    @setState(date: newDate)

  formSubmitted: (event) ->
    event.preventDefault()

    $.ajax
      url: '/meetups.json'
      type: 'POST'
      dataType: 'JSON'
      contentType: 'application/json'
      processData: false
      data: JSON.stringify
        meetup:
          title: @state.title
          description: @state.description
          date: "#{@state.date.getFullYear()}-#{@state.date.getMonth()+1}-#{@state.date.getDate()}"

  render: ->
    `(
      <form className='form-horizontal' method='post' action='/meetups'>
        <fieldset>
          <legend>New Meetup</legend>

          <FormInputWithLabel id='title' value={this.state.title}
            onChange={this.fieldChanged.bind(null, 'title')}
            placeholder='Meetup title' labelText='Title' />

          <FormInputWithLabel id='description' value={this.state.description}
            onChange={this.fieldChanged.bind(null, 'description')}
            placeholder='Meetup description' labelText='Description'
            elementType='textarea' />

          <DateWithLabel onChange={this.dateChanged} date={this.state.date} />

          <div className='form-group'>
            <div className='col-lg-10 col-lg-offset-2'>
              <button type='button' className='btn btn-summary' onClick={this.formSubmitted}>
                Save
              </button>
            </div>
          </div>
        </fieldset>
      </form>
    )`

window.CreateNewMeetupForm = CreateNewMeetupForm
