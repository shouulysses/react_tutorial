  @Record = React.createClass
    render: -> 
       `<tr>
        <td>{this.props.record.date}</td>
        <td>{this.props.record.title}</td>
        <td>{amountFormat(this.props.record.amount)}</td>
      </tr>`
   
   
   
#React.DOM.tr null,
# React.DOM.td null, @props.record.date
# React.DOM.td null, @props.record.title
# React.DOM.td null, amountFormat(@props.record.amount)