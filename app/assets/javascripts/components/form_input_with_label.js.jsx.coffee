FormInputWithLabel = React.createClass
  displayName: 'FormInputWithLabel'

  getDefaultProps: ->
    elementType: 'input'
    inputType: 'text'

  tagType: ->
    {
      input: @props.inputType,
      textarea: null,
    }[@props.elementType]

  render: ->
    `(
      <div className='form-group'>
        <label htmlFor={this.props.id} className='col-lg-2 control-label'>
          {this.props.labelText}
        </label>

        <div className='col-lg-10'>
          <this.props.elementType className='form-control'
            placeholder={this.props.placeholder} id={this.props.id}
            type={this.tagType()} value={this.props.value}
            onChange={this.props.onChange} />
        </div>
      </div>
    )`

window.FormInputWithLabel = FormInputWithLabel
