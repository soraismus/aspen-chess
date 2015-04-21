var Pando            = require('pando');
var React            = require('react');
var DOM              = React.DOM;
var render           = React.render;
var getBridge        = require('react-bridge');
var Bridge           = getBridge(DOM);
var connectTo        = Bridge.connectTo;
var getReactiveAspen = require('reactive-aspen');
var ReactiveAspen    = getReactiveAspen(render, connectTo, Pando);
var initialize       = ReactiveAspen.initialize;
var topViewFactory   = require('../components/main_view');
var viewImports      = [];
var appNodeId        = 'react-node';
var appNode          = document.getElementById(appNodeId);
var reactProps       = appNode.dataset.reactProps;
var initialState     = JSON.parse(reactProps);

initialize(appNodeId, topViewFactory, initialState, viewImports);

// Load event-controllers.
