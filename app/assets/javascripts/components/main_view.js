var React = require('react');

var MainView = function (props) {
  var color  = props.color  || 'red';
  var height = props.height || '100px';
  var width  = props.width  || '100px';
  var msg    = props.msg    || 'Hello';
  return React.DOM.div({
    style: {
      backgroundColor: color,
      height: height,
      width: width
    }
  }, msg);
}

module.exports = MainView;
