  @Record = React.createClass
    
    getInitialState: ->
      edit: false
    
    handleToggle: (e) ->
      e.preventDefault()
      @setState edit: !@state.edit
    
    # @refs get the value of xxx from input with ref = xxx
    # No validating of user data here
    handleEdit: (e) ->
      e.preventDefault()
      data = 
        title: React.findDOMNode(@refs.title).value
        date: React.findDOMNode(@refs.date).value
        amount: React.findDOMNode(@refs.amount).value
      $.ajax
        method: 'PUT'
        url: "/records/#{ @props.record.id }"
        dataType: 'JSON'
        data:
          record: data
        success: (data) =>
          @setState edit: false
          @props.handleEditRecord @props.record, data
    
    handleDelete: (e) ->
      e.preventDefault()
      $.ajax
        method: 'DELETE'
        url: "/records/#{ @props.record.id }"
        dataType: 'JSON'
        success: () =>
          @props.handleDeleteRecord @props.record
          
    
    
    recordRow: -> 
        `<tr>
        <td>{this.props.record.date}</td>
        <td>{this.props.record.title}</td>
        <td>{amountFormat(this.props.record.amount)}</td>
        <td><a className = 'btn btn-default' onClick={this.handleToggle}>Edit</a>
        <a className = 'btn btn-danger' onClick={this.handleDelete}>Delete</a></td>
      </tr>`
      
    recordForm: ->
      `<tr>
        <td><input className = 'form-control' type = 'text' defaultValue = {this.props.record.date} ref = 'date'></input></td>
        <td><input className = 'form-control' type = 'text' defaultValue= {this.props.record.title} ref = 'title'></input></td>
        <td><input className = 'form-control' type = 'number' defaultValue = {this.props.record.amount} ref = 'amount'></input></td>
        <td><a className = 'btn btn-default' onClick={this.handleEdit}>Update</a>
        <a className = 'btn btn-danger' onClick={this.handleToggle}>Cancel</a></td>
        </tr>`
        
    render: ->
      if @state.edit
        @recordForm()
      else
        @recordRow()
   
#React.DOM.tr null,
# React.DOM.td null, @props.record.date
# React.DOM.td null, @props.record.title
# React.DOM.td null, amountFormat(@props.record.amount)