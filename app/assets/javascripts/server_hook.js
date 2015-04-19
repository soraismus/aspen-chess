var React    = require('react');
var MainView = require('./components/main_view');

module.exports = function (props) {
  return React.renderToString(React.createElement(MainView, props));
};
