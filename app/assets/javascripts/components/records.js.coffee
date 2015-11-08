# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
R = React.DOM

@Records = React.createClass
  getInitialState: ->
    records: @props.data
  
  getDefaultProps: ->
    records: []
  
  addRecord: (record) ->
    records = @state.records.slice()
    records.push record
    @setState records: records
    
  credits: ->
    credits = @state.records.filter (val) -> val.amount >= 0
    credits.reduce ((prev, curr) ->
      prev + parseFloat(curr.amount)), 0
  
  debits: ->
    debits = @state.records.filter (val) -> val.amount < 0
    debits.reduce ((prev, curr) ->
      prev + parseFloat(curr.amount)
    ), 0
    
  balance: ->
    @debits() + @credits()
    
  deleteRecord: (record) ->
    records = @state.records.slice()
    index = records.indexOf record
    records.splice index, 1
    @replaceState records: records
  
  render: ->
    R.div
      className: 'records'
      R.h2
        className: 'title'
        'Records'
      R.div
        className: 'row'
        React.createElement AmountBox, type: 'success', amount: @credits(), text: "Credit"
        React.createElement AmountBox, type: 'danger', amount: @debits(), text: "Debit"
        React.createElement AmountBox, type: 'info', amount: @balance(), text: "Balance"
      React.createElement RecordForm, handleNewRecord: @addRecord
      R.hr null
      R.table
        className: 'table table-bordered'
        R.thead null,
          R.tr null,
            R.th null, 'Date'
            R.th null, 'Title'
            R.th null, 'Amount'
            R.th null, 'Actions'
        R.tbody null,
          for record in @state.records
            React.createElement Record, key: record.id, record: record, handleDeleteRecord: @deleteRecord
  
#React.DOM.div
#  className: 'records'
#  React.DOM.h2
#    className: 'title'
#    'Records'
#      React.DOM.table
#      className: 'table table-bordered'
#        React.DOM.thead null,
#          React.DOM.tr null,
#            React.DOM.th null, 'Date'
#            React.DOM.th null, 'Title'
#            React.DOM.th null, 'Amount'
#          React.DOM.tbody null,
#           for record in @state.records
#             React.createElement Record, key: record.id, record: record

  

    

