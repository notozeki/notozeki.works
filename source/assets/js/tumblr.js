var Tumblr;

Tumblr = (function () {
  "use strict";

  var apiHost = 'https://api.tumblr.com/v2';

  var Tumblr = function (blogHostName, apiKey) {
    this.blogHostName = blogHostName;
    this.apiKey = apiKey;
  };

  Tumblr._callbackSeq = 0;

  Tumblr._getJSON = function (uri, callback) {
    var script = document.createElement('script');
    var callbackName = '_callback' + (this._callbackSeq++);
    var delim = uri.indexOf('?') >= 0 ? '&' : '?';

    script.src = uri + delim + 'callback=' + encodeURIComponent('Tumblr.' + callbackName);
    this[callbackName] = this._callbackGate(callback);
    document.body.appendChild(script);
  };

  Tumblr._callbackGate = function (callback) {
    return function (response) {
      if (response.meta.status === 200) {
        callback(response.response);
      } else {
        console.error('Tumblr API failed: ' + response.meta.status + ' ' + response.meta.msg);
      }
    };
  };

  // public instance methods

  Tumblr.prototype.posts = function () {
    var type, options = {}, callback;
    switch (arguments.length) {
    case 1:
      callback = arguments[0];
      break;
    case 2:
      if (typeof arguments[0] === 'string') {
        type = arguments[0];
      } else if (typeof arguments[0] === 'object') {
        options = arguments[0];
      } else {
        throw new TypeError('1st argument must be string or object');
      }
      callback = arguments[1];
      break;
    case 3:
      type = arguments[0];
      options = arguments[1];
      callback = arguments[2];
      break;
    default:
      throw 'wrong number of arguments (' + arguments.length + ' for 1..3)';
    }

    var requestURI = this._makeRequestURI('posts');
    if (type !== undefined) {
      requestURI += '/' + type
    }
    requestURI += this._makeRequestParamsWithAPIKey(options);

    Tumblr._getJSON(requestURI, callback);
  };

  // private instance methods

  Tumblr.prototype._makeRequestURI = function (method) {
    return apiHost + '/blog/' + this.blogHostName + '/' + method;
  };

  Tumblr.prototype._makeRequestParamsWithAPIKey = function (options) {
    options.api_key = this.apiKey;
    return this._makeRequestParams(options);
  };

  Tumblr.prototype._makeRequestParams = function (options) {
    var params = [];
    for (var key in options) {
      params.push(encodeURIComponent(key) + '=' + encodeURIComponent(options[key]));
    }
    return '?' + params.join('&');
  };

  return Tumblr;
})();
