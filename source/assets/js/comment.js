function validate() {
  var body = document.getElementById('comment-body');
  if (body.value.trim && body.value.trim() == '') {
    alert('コメントを入力してください。');
    return false;
  }
  return confirm('コメントを送信します。よろしいですか？');
}

document.addEventListener('DOMContentLoaded', function () {
  var query = location.href.split('?')[1];
  var rawParams = query ? query.split('&') : [];
  var params = rawParams.reduce(function (res, param) {
    var pair = param.split('=');
    res[pair[0]] = pair[1];
    return res;
  }, {});

  if (params['subject'] && params['subject'] != '') {
    var subject = document.getElementById('comment-subject');
    subject.value = decodeURIComponent(params['subject'].replace(/\+/g, ' '));
  }

  if (params['referer'] && params['referer'] != '') {
    var subject = document.getElementById('comment-referer');
    subject.value = decodeURIComponent(params['referer']);
  }
}, false);
