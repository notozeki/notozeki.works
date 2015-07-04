---
title: TumblrとIllustfolio 2でイケメンかつカジュアルな画像置き場をつくる
header_image: notozeki-on-tumblr_lead.png
---

[ブログ記事一覧](/blog/)を見ていたら「こいつコミティアの話しかしてねぇな」ってなったので、たまにはそれ以外の話題についても書いてみようかと思います。

最近、Web上で絵を載せるところを迷っていました。READMORE

これまでは、ラフに描いたものは[Twitter](https://twitter.com/)に上げていました。TwitterはWeb UIから数クリックポチポチするだけで簡単に画像を上げられますし、なんならブラウザを立ち上げずともMacの共有メニューからでもいけます。こういうカジュアルさが気に入っていました。

しかし残念なのが[画像一覧ページ](https://twitter.com/notozeki/media)。このページは、あるときからサムネイルの一覧からツイートごとの表示に変わり、どんな画像があるのかひと目で見ることができなくなってしまいました。
そもそもTwitterは画像投稿に特化したサービスではないので、この件は投稿先を考えなおすきっかけになりました。

画像投稿といえば[pixiv](http://www.pixiv.net/)がありますが、アップロードが少し手間です。いろいろと入力する事項があって、Twitterのように数クリックポチポチという手軽さはありません。ちょっと気合の入った絵でないとなかなか上げづらいと感じます。
あと、アカウントを持っていない人にとっては、（一応画像は見れるようですが）いろいろ不便ですしね。

カジュアルに画像を投げられて、なおかつイケメンに一覧してくれればうれしい。そんな都合のいいサービスは……

<blockquote class="twitter-tweet" lang="en"><p lang="ja" dir="ltr">そこまでするなら自サイトでなくても良いのかな。ある程度自由にレイアウトできればそれで良いはず。Tumblr？</p>&mdash; のとぜき (@notozeki) <a href="https://twitter.com/notozeki/status/600406291844976640">May 18, 2015</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

**Tumblr？**

### イケメンに一覧する

前置きが長くなりましたが、結論としては[Tumblr](https://www.tumblr.com/)を画像置き場として使うことにしました。

作ったのはこちら: http://notozeki.tumblr.com/

Tumblrはいっぱいテーマが選べて、画像に特化したものもたくさんあります。
今回は、他の方が使っているのを見てイケメンだと思った[**Illustfolio 2**](http://sanographix.github.io/tumblr/illustfolio2/)を使うことにしました。
ちなみに、[Illustfolio 3](http://sanographix.github.io/tumblr/illustfolio3/)もあって、作者の方は3を推しているようですが、四角いサムネイルが気に入ったのでぼくは2を使うことにしました。

Illustfolio 2は[Tumblrのテーマサイト](https://www.tumblr.com/themes)では公開されていないので、自分で導入する必要があります。
その手順は[README](https://github.com/sanographix/tumblr/blob/master/illustfolio2/readme.md)の「[インストール手順](https://github.com/sanographix/tumblr/blob/master/illustfolio2/readme.md#%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB%E6%89%8B%E9%A0%86)」に非常に丁寧に書かれているので、基本的にはそれに従えばOKです。
ぼくは以下の2点だけ変更しています。

* 最近の投稿については表示しなくてもいいかなと思ったので、ステップ2は飛ばしています。
* スライドショーを消すのと、パーマリンクページの画像サイズをいじるために、少しだけカスタムCSSを書きました。

```
.flexslider {
    display: none;
}

.photo-image img {
    max-width: 640px;
}
```

これだけでイケメンな画像置き場ができてしまいました。

![notozeki on Tumblr](/assets/img/notozeki-on-tumblr.png)

イケメン！

### カジュアルに投げる

TumblrはWeb UIからもカジュアルに画像を投げることができますが、Macではさらにカジュアルに画像を投げることができます。共有メニューを使う方法です。

まず、Mac App StoreからTumblr Appをインストールします。
https://itunes.apple.com/jp/app/tumblr/id929285034?mt=12

すると、Finderなどの共有メニューからTumblrが使えるようになります（最初にシステム環境設定から有効にする必要があります）。

![Tumblr共有メニュー](/assets/img/tumblr-share-menu.png)

投稿したい画像を選択して、共有メニューからTumblrを選ぶと、ポップアップが出てきます。
お好みでキャプションを書いて「Post」を押せば、カジュアルに投稿することができます。ブラウザすら開く必要がありません。

![Tumblrで共有](/assets/img/share-with-tumblr.png)

カジュアル！[^1]

### 使い始めて思ったこと

タグによる整理が意外と便利です。[#にのめちゃん](http://notozeki.tumblr.com/tagged/%E3%81%AB%E3%81%AE%E3%82%81%E3%81%A1%E3%82%83%E3%82%93)でにのめちゃんをまとめられます。にのめちゃんがいっぱいでうれしい。

[^1]: 自動でTwitterにもポストしてくれれば完璧だったのですが、共有メニューからの投稿ではできませんでした。なんでだろう。
