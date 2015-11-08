  @Record = React.createClass
   
    handleDelete: (e) ->
      e.preventDefault()
      $.ajax
        method: 'DELETE'
        url: "/records/#{ @props.record.id }"
        dataType: 'JSON'
        success: () =>
          @props.handleDeleteRecord @props.record
    
    render: -> 
        `<tr>
        <td>{this.props.record.date}</td>
        <td>{this.props.record.title}</td>
        <td>{amountFormat(this.props.record.amount)}</td>
        <td><a className = 'btn btn-danger' onClick={this.handleDelete}>Delete</a></td>
      </tr>`
   
   
#React.DOM.tr null,
# React.DOM.td null, @props.record.date
# React.DOM.td null, @props.record.title
# React.DOM.td null, amountFormat(@props.record.amount)