-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-04-05 03:51:33
-- 服务器版本： 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- 表的结构 `app`
--

CREATE TABLE `app` (
  `id` int(11) NOT NULL,
  `user` varchar(14) NOT NULL,
  `level` int(2) NOT NULL,
  `power` int(6) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `note` text,
  `text` text NOT NULL,
  `tag` text NOT NULL,
  `view` int(14) NOT NULL,
  `reply` int(14) NOT NULL,
  `show` tinyint(1) NOT NULL DEFAULT '1',
  `del` tinyint(1) NOT NULL DEFAULT '0',
  `time` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `app`
--

INSERT INTO `app` (`id`, `user`, `level`, `power`, `title`, `note`, `text`, `tag`, `view`, `reply`, `show`, `del`, `time`) VALUES
(1, 'admin', 1, 10, '20161030 前端开发周报', '本期热门文章:1) 纯css3画出小黄人并实现动画效果 2) 通过微信小程序看前端 3) 最全面的javascript调试技巧总结 4) JS 六种排序算法 5) jQuery ready与window.onload的区别 6) jQuery/CSS3实现鼠标点击波浪特效 7) 前沿开发团队的面试过程，以面试前端工程师为例，魅族科技开发团队的面试过程 8) 统一回复《怎么学 JavaScript？》', '<ol class="feddaily-list"><li class="fed-li"><p class="fed-meta"><span class="fed-time">9月27日 18:42</span><span class="fed-user">慕课网</span>(<span class="fed-views">181次阅读</span>/<span class="fed-shr">11次分享</span>/<span class="fed-cmt">7次评论</span>/<span class="fed-zan">18次点赞</span>)</p><div class="fed-con">【<span class="fed-title">\r\n<a href="http://hao.caibaojian.com/6859.html" target="_blank">纯CSS3画出小黄人并实现动画效果</a></span>】：<a href="http://hao.caibaojian.com/t?url=http://t.cn/Rc3hAaUCSS3" target="_blank" rel="nofollow" class="tlink"><em></em></a>实现小黄人动画的博客，非常可爱，程序员撩妹必备！除了撩妹，你最需要的仍然是一往无前的提升自己的技能，点下面链接必能让<span class="wp_keywordlink">\r\n<a href="http://caibaojian.com/css3/" title="CSS">CSS</a></span>技能的力量注入到自己的内心深处，从而实现巨大的提升！前端网站<span class="wp_keywordlink"><a href="http://caibaojian.com/356.html" title="响应式布局">响应式</a></span>开发：<a href="http://hao.caibaojian.com/t?url=http://t.cn/RtZHxT6" target="_blank" rel="nofollow" class="tlink"><em></em></a><div class="fedimg"><img src="http://ww4.sinaimg.cn/large/c5131475jw1f88bzxe2coj20740740sz.jpg" alt="纯CSS3画出小黄人并实现动画效果"></div></div></li><li class="fed-li"><p class="fed-meta"><span class="fed-time">9月26日 21:09</span><span class="fed-user">SegmentFault</span>(<span class="fed-views">139次阅读</span>/<span class="fed-shr">2次分享</span>/<span class="fed-cmt">2次评论</span>/<span class="fed-zan">2次点赞</span>)</p><div class="fed-con">【<span class="fed-title">\r\n<a href="http://hao.caibaojian.com/6738.html" target="_blank">通过微信小程序看前端</a></span>】作者从<span class="wp_keywordlink">\r\n<a href="http://caibaojian.com/c/code" title="代码">代码</a></span>角度和宏观角度介绍了对于微信小程序的看法，文章传送门:<a href="http://hao.caibaojian.com/t?url=http://t.cn/RcEuWPY" target="_blank" rel="nofollow" class="tlink"><em></em></a><span class="desc2">前言 2016年9月22日凌晨，微信官方通过“微信公开课”公众号发布了关于微信小程序（微信应用号）的内测通知。整个朋友圈瞬间便像炸开了锅似的，各种揣测、介绍性文章在一夜里诞生。而真正收到内测邀请的公众号据说...</span><div class="fedimg"><img src="http://ww4.sinaimg.cn/large/795bf814gw1f86usyr0nzj20m80ccmz0.jpg" alt="通过微信小程序看前端"></div></div></li>\r\n<li class="fed-li"><p class="fed-meta"><span class="fed-time">9月26日 22:00</span><span class="fed-user">LUPA开源社区</span>(<span class="fed-views">111次阅读</span>/<span class="fed-shr">2次分享</span>/<span class="fed-cmt">2次评论</span>/<span class="fed-zan">2次点赞</span>)</p><div class="fed-con">【<span class="fed-title"><a href="http://hao.caibaojian.com/6702.html" target="_blank">最全面的JavaScript调试技巧总结</a></span>】调试技巧，在任何一项技术研发中都可谓是必不可少的技能。掌握各种调试技巧，必定能在工作中起到事半功倍的效果。譬如，快速定位 ... <a href="http://hao.caibaojian.com/t?url=http://t.cn/Rcm4Ye7" target="_blank" rel="nofollow" class="tlink"><em></em></a><div class="fedimg"><img src="http://ww4.sinaimg.cn/large/4c50644ajw1f87bothk3kg20ch084785.gif" alt="最全面的JavaScript调试技巧总结"></div></div></li><li class="fed-li"><p class="fed-meta"><span class="fed-time">9月27日 15:13</span><span class="fed-user">SegmentFault</span>(<span class="fed-views">85次阅读</span>/<span class="fed-shr">28次分享</span>/<span class="fed-cmt">8次评论</span>/<span class="fed-zan">18次点赞</span>)</p><div class="fed-con">【<span class="fed-title"><a href="http://hao.caibaojian.com/6841.html" target="_blank">JS 六种排序算法</a></span>】\r\n<a href="http://hao.caibaojian.com/t?url=http://t.cn/Rcmz3lL" target="_blank" rel="nofollow" class="tlink"><em></em></a>- 冒泡排序- 选择排序- 插入排序- 希尔排序- 归并排序- 快速排序<span class="desc2">// 冒泡排序// 循环的最大值从length递减// 基本就是每次循环只能排好最后一个 然后递减到第一个 {代码...} // 选择排序// 外循环 j选取当前元素 到length-1// 内循环 j+1开始 到length 逐个比较出最小值min// 交...</span><div class="fedimg"><img src="http://ww4.sinaimg.cn/large/795bf814gw1f87xabgi3pj20b40b4aaa.jpg" alt="JS 六种排序算法"></div></div></li>\r\n<li class="fed-li"><p class="fed-meta"><span class="fed-time">9月26日 16:00</span><span class="fed-user"><span class="wp_keywordlink"><a href="http://caibaojian.com/" title="前端开发">前端开发</a></span>博客</span>(<span class="fed-views">83次阅读</span>/<span class="fed-shr">2次分享</span>/<span class="fed-cmt">2次评论</span>/<span class="fed-zan">2次点赞</span>)</p><div class="fed-con">#jQuery#【<span class="fed-title"><a href="http://hao.caibaojian.com/6660.html" target="_blank">jQuery ready与window.onload的区别</a></span>】最近做一个项目，在上一篇文章里面写了一个插件：jQuery滚动固定插件，刚开始时在本地测试，发现都没问题，后来架设到服务器上，发现浮动的末位置总是不对，总以为是哪些代...请戳→<a href="http://hao.caibaojian.com/t?url=http://t.cn/8sYBQXd" target="_blank" rel="nofollow" class="tlink"><em></em></a> #<span class="wp_keywordlink"><a href="http://caibaojian.com/" title="前端开发博客">前端开发博客</a></span>#<div class="fedimg"><img src="http://ww4.sinaimg.cn/large/6830a53bjw1f871o8mfzhj206j04ja9v.jpg" alt="jQuery ready与window.onload的区别"></div></div></li><li class="fed-li fed-li5"><p class="fed-meta"><span class="fed-time">9月26日 18:00</span><span class="fed-user">程序员俱乐部</span>(<span class="fed-views">80次阅读</span>/<span class="fed-shr">2次分享</span>/<span class="fed-cmt">2次评论</span>/<span class="fed-zan">2次点赞</span>)</p><div class="fed-con">【<span class="fed-title"><a href="http://hao.caibaojian.com/6717.html" target="_blank">jQuery/CSS3实现鼠标点击波浪特效</a></span>】在线演示：<a href="http://hao.caibaojian.com/t?url=http://t.cn/RUedIo0" target="_blank" rel="nofollow" class="tlink"><em></em></a> 源码下载：<a href="http://hao.caibaojian.com/t?url=http://t.cn/RAbqwP0" target="_blank" rel="nofollow" class="tlink"><em></em></a><span class="desc2">这次要分享的是一款jQuery/CSS3应用插件，这款插件可以帮助你实现网页元素点击的波浪特效，特别是点击按钮后再按钮上可以出现各种波浪的动画特效。当然除了点击按钮外，点击页面上的图片同样可以出现波浪动画，是一款很实用的jQuery插件。</span><div class="fedimg"><img src="http://ww4.sinaimg.cn/large/a8d43f7egw1f8686aexu3j20gy0a2ab9.jpg" alt="jQuery/CSS3实现鼠标点击波浪特效"></div></div></li>\r\n<li class="fed-li"><p class="fed-meta"><span class="fed-time">9月27日 11:10</span><span class="fed-user">SegmentFault</span>(<span class="fed-views">78次阅读</span>/<span class="fed-shr">6次分享</span>/<span class="fed-cmt">3次评论</span>/<span class="fed-zan">8次点赞</span>)</p><div class="fed-con">【<span class="fed-title"><a href="http://hao.caibaojian.com/6844.html" target="_blank">前沿开发团队的面试过程，以面试前端工程师为例，魅族科技开发团队的面试过程</a></span>】分享自&nbsp;@SegmentFault，传送门： <a href="http://hao.caibaojian.com/t?url=http://t.cn/RcuSM0Z" target="_blank" rel="nofollow" class="tlink"><em></em></a>一起来SegmentFault 头条阅读和讨论高阳Sunny分享的技术内容《前沿开发团队的面试过程 - 魅族科技开发团队》</div></li><li class="fed-li"><p class="fed-meta"><span class="fed-time">9月27日 19:01</span><span class="fed-user">稀土掘金</span>(<span class="fed-views">78次阅读</span>/<span class="fed-shr">14次分享</span>/<span class="fed-cmt">6次评论</span>/<span class="fed-zan">17次点赞</span>)</p><div class="fed-con"><a href="http://hao.caibaojian.com/t?url=http://t.cn/RcuFcEV" target="_blank" rel="nofollow" class="tlink"><em></em></a> <span class="fed-title"><a href="http://hao.caibaojian.com/6905.html" target="_blank">统一回复《怎么学 JavaScript？》</a></span> - 怎么学 JavaScript？原创by老姚 /分享by@Canglingyue 详戳→<a href="http://hao.caibaojian.com/t?url=http://t.cn/RcuFcEV" target="_blank" rel="nofollow" class="tlink"><em></em></a></div></li>\r\n<li class="fed-li"><p class="fed-meta"><span class="fed-time">9月26日 17:00</span><span class="fed-user">程序员俱乐部</span>(<span class="fed-views">75次阅读</span>/<span class="fed-shr">14次分享</span>/<span class="fed-cmt">2次评论</span>/<span class="fed-zan">7次点赞</span>)</p><div class="fed-con">【<span class="fed-title"><a href="http://hao.caibaojian.com/6718.html" target="_blank">CSS3自定义美化复选框Checkbox组合</a></span>】在线演示：<a href="http://hao.caibaojian.com/t?url=http://t.cn/Ry4Wyq8" target="_blank" rel="nofollow" class="tlink"><em></em></a> 源码下载：<a href="http://hao.caibaojian.com/t?url=http://t.cn/RAbG2Ug" target="_blank" rel="nofollow" class="tlink"><em></em></a><span class="desc2">今天我们要来分享一组非常漂亮的CSS3自定义复选框checkbox，每一个checkbox都有其各自的特点。有几款checkbox在选中的情况下还会出现动画效果，非常不错的CSS3自定义美化checkbox组合。另外，之前分享过的jQuery实现美化版的单选框和复选框也是非常不错。</span><div class="fedimg"><img src="http://ww4.sinaimg.cn/large/a8d43f7egw1f8685m5crzj20gy0ajgm3.jpg" alt="CSS3自定义美化复选框Checkbox组合"></div></div></li>\r\n<li class="fed-li"><p class="fed-meta"><span class="fed-time">9月27日 08:21</span><span class="fed-user"><span class="wp_keywordlink"><a href="http://caibaojian.com/t/html5" title="HTML5">HTML5</a></span>中国</span>(<span class="fed-views">73次阅读</span>/<span class="fed-shr">2次分享</span>/<span class="fed-cmt">2次评论</span>/<span class="fed-zan">2次点赞</span>)</p><div class="fed-con">【SpringBoot：<span class="fed-title"><a href="http://hao.caibaojian.com/6807.html" target="_blank">Web项目中如何优雅的同时处理Json和Html请求的异常</a></span>】<a href="http://hao.caibaojian.com/t?url=http://t.cn/Rcu2I5F" target="_blank" rel="nofollow" class="tlink"><em></em></a> 在一个<span class="wp_keywordlink"><a href="http://caibaojian.com/c/web" title="网站建设">web</a></span>项目开发中，通常都会涉及到<span class="wp_keywordlink"><a href="http://caibaojian.com/t/html" title="html">html</a></span>和<span class="wp_keywordlink"><a href="http://caibaojian.com/t/json" title="json">JSON</a></span>请求。当出现异常的时候，我们需要根据请求类型返回不同的信息<div class="fedimg"><img src="http://ww4.sinaimg.cn/large/8c81192fjw1f87u0vrexhj20p00dwq3y.jpg" alt="Web项目中如何优雅的同时处理Json和Html请求的异常"></div></div></li><li class="fed-li fed-li5"><p class="fed-meta"><span class="fed-time">9月26日 16:45</span><span class="fed-user">JAVA大本营</span>(<span class="fed-views">68次阅读</span>/<span class="fed-shr">5次分享</span>/<span class="fed-cmt">3次评论</span>/<span class="fed-zan">10次点赞</span>)</p><div class="fed-con"><span class="fed-title"><a href="http://hao.caibaojian.com/6710.html" target="_blank">12岁开始自学Web开发的5个经验</a></span> <a href="http://hao.caibaojian.com/t?url=http://t.cn/RwdQTjY" target="_blank" rel="nofollow" class="tlink"><em></em></a><span class="desc2">自从我12岁的时候，发现Microsoft Word中的“另存为Web页面”选项后，我就开始自学Web开发。我先学的是HTML，接着是CSS和JavaScript，然后是一些<span class="wp_keywordlink"><a href="http://caibaojian.com/t/php" title="PHP">PHP</a></span>和Rails的皮毛。 （近段时间，我投入了Meteor的怀抱。）    我也考虑过接受正式和系统的教育，但是，最后我发现：  	费用太高。 	我有课堂环境恐惧症。 	已经学了不少，没必要学重复的东西。  自学的过程实际上并不轻松。我不但需要学习如何编写代码，还..</span><div class="fedimg"><img src="http://ww4.sinaimg.cn/large/bf1b7d04gw1f867uvguuvj208w05rmxs.jpg" alt="12岁开始自学Web开发的5个经验"></div></div></li>\r\n<li class="fed-li"><p class="fed-meta"><span class="fed-time">9月29日 08:41</span><span class="fed-user">稀土掘金</span>(<span class="fed-views">68次阅读</span>/<span class="fed-shr">2次分享</span>/<span class="fed-cmt">2次评论</span>/<span class="fed-zan">2次点赞</span>)</p><div class="fed-con"><a href="http://hao.caibaojian.com/t?url=http://t.cn/RcBpxDa" target="_blank" rel="nofollow" class="tlink"><em></em></a> 谈谈一些有趣的 CSS 题目（五）-- 单行居中，两行居左，超过两行省略 - 本系列，讨论一些有趣的 CSS 题目，抛开实用性而言，一些题目为了拓宽一下解决问题的思路，此外，涉及一些容易忽视的 CSS 细节。对提升 CSS 水平大有裨益。原创by chokcoco 详戳→<a href="http://hao.caibaojian.com/t?url=http://t.cn/RcBpxDa" target="_blank" rel="nofollow" class="tlink"><em></em></a></div></li>\r\n<li class="fed-li"><p class="fed-meta"><span class="fed-time">9月28日 19:53</span><span class="fed-user">慕课网</span>(<span class="fed-views">68次阅读</span>/<span class="fed-shr">3次分享</span>/<span class="fed-cmt">4次评论</span>/<span class="fed-zan">4次点赞</span>)</p><div class="fed-con">【<span class="fed-title"><a href="http://hao.caibaojian.com/7023.html" target="_blank">为Web开发者准备的10个最新工具</a></span>】：<a href="http://hao.caibaojian.com/t?url=http://t.cn/R5ynoW9" target="_blank" rel="nofollow" class="tlink"><em></em></a> Web开发设计是一个很有前途的职业。然而，这其中也有许多挑战。现在的企业和品牌正在朝网络进军。10套全新web工具，面对不断更新的技术，你值得拥有！一套技能，设备全拥有！！ 前端网站响应式开发：<a href="http://hao.caibaojian.com/t?url=http://t.cn/RtZHxT6" target="_blank" rel="nofollow" class="tlink"><em></em></a><div class="fedimg"><img src="http://ww4.sinaimg.cn/large/c5131475jw1f89jntheexj20dv07o75d.jpg" alt="为Web开发者准备的10个最新工具"></div></div></li>\r\n<li class="fed-li"><p class="fed-meta"><span class="fed-time">9月28日 08:59</span><span class="fed-user">稀土掘金</span>(<span class="fed-views">64次阅读</span>/<span class="fed-shr">2次分享</span>/<span class="fed-cmt">2次评论</span>/<span class="fed-zan">2次点赞</span>)</p><div class="fed-con"><a href="http://hao.caibaojian.com/t?url=http://t.cn/Rc3u1XA" target="_blank" rel="nofollow" class="tlink"><em></em></a> <span class="fed-title"><a href="http://hao.caibaojian.com/6932.html" target="_blank">剖析 js 原型链</a></span> - 彻底剖析 <span class="wp_keywordlink"><a href="http://caibaojian.com/t/javascript" title="js">js</a></span> 原型链. 一张图让你明白 js 的 ''继承'' 机制. 以及 js 内部对象的关系。原创by walfud 详戳→<a href="http://hao.caibaojian.com/t?url=http://t.cn/Rc3u1XA" target="_blank" rel="nofollow" class="tlink"><em></em></a></div></li><li class="fed-li"><p class="fed-meta"><span class="fed-time">9月27日 08:00</span><span class="fed-user">前端开发博客</span>(<span class="fed-views">61次阅读</span>/<span class="fed-shr">16次分享</span>/<span class="fed-cmt">3次评论</span>/<span class="fed-zan">10次点赞</span>)</p><div class="fed-con">#HTML5#【<span class="fed-title"><a href="http://hao.caibaojian.com/6835.html" target="_blank">HTML5视频及其兼容实践</a></span>】我们都知道HTML5 video标签是现在比较流行的播放器，几乎很多高级的浏览器如chrome、firefox和Safari都支持video标签，但是仍然有一部分老的浏览器不支持，特别是IE9以下的浏览器，这样...请戳→<a href="http://hao.caibaojian.com/t?url=http://t.cn/RZ7zWna" target="_blank" rel="nofollow" class="tlink"><em></em></a> #前端开发博客#<div class="fedimg"><img src="http://ww4.sinaimg.cn/large/6830a53bjw1f87tf458kij20p00dwq3k.jpg" alt="HTML5视频及其兼容实践"></div></div></li></ol>', '前端,周报', 348, 1, 1, 0, '1480041745'),
(2, 'admin', 1, 10, '20160911 前端开发周报', '本期热门文章:1) HTML5 Canvas瀑布动画 超逼真 2) 12个免费学习编程的好地方 3) 你应该知道CSS选择器技巧 4) 适用于小团队的前端规范 5) jQuery带爆炸特效的焦点图动画 6) 在 github 上部署自己的简历 7) 3 分钟掌握 CSS Flexbox 8) javascript高阶函数的应用', '<ol class="feddaily-list"><li class="fed-li"><p class="fed-meta"><span class="fed-time">9月07日 13:00</span><span class="fed-user">程序员俱乐部</span>(<span class="fed-views">141次阅读</span>/<span class="fed-shr">2次分享</span>/<span class="fed-cmt">2次评论</span>/<span class="fed-zan">2次点赞</span>)</p><div class="fed-con">【<span class="fed-title"><a href="http://hao.caibaojian.com/3154.html" target="_blank">HTML5 Canvas瀑布动画 超逼真</a></span>】在线演示：HTML5 Canvas瀑布动画DEMO演示 源码下载：<a href="http://hao.caibaojian.com/t?url=http://t.cn/RZX5AVL" target="_blank" rel="nofollow" class="tlink"><em></em></a><span class="desc2">这次我们来分享一款很酷的HTML5 Canvas瀑布动画，瀑布动画非常逼真。整个瀑布动画像是从石头缝里流出来的溪水，然后沿着悬崖飞落下来，效果非常不错。</span><div class="fedimg"><img src="http://ww4.sinaimg.cn/large/a8d43f7egw1f7k9byb9s8j20gy07iglt.jpg" alt="HTML5 Canvas瀑布动画 超逼真"></div></div></li><li class="fed-li"><p class="fed-meta"><span class="fed-time">9月05日 12:00</span><span class="fed-user">慕课网</span>(<span class="fed-views">126次阅读</span>/<span class="fed-shr">20次分享</span>/<span class="fed-cmt">6次评论</span>/<span class="fed-zan">20次点赞</span>)</p><div class="fed-con">#慕课网分享# 【<span class="fed-title"><a href="http://hao.caibaojian.com/2723.html" target="_blank">12个免费学习编程的好地方</a></span>】过去的一年，我也在学写<span class="wp_keywordlink"><a href="http://caibaojian.com/c/code" title="代码">代码</a></span>，懂的代码令我成为更好的企业家。在团队需要修复网站bug时我也能参与进去了。学习编程，你甚至不必砸钱。 12个免费学习编程的网站强烈推荐！[来]全文：曾几何时，懂编程的都是些顶级极客，但是现在，情况已大不相同，大多数企业家、威客、运营都会告诉你，学点编程能如何让自己更加成功。过去的一年，我也在学写代码，懂的代码令我成为更好的企业家。在团队需要修复网站bug时我也能参与进去了。 学习编程，你甚至不必砸钱。这里有 12 个网站，你可以免费学到编程课程： C基础编程知识与项目运用：<a href="http://hao.caibaojian.com/t?url=http://t.cn/Rq5Zfky" target="_blank" rel="nofollow" class="tlink"><em></em></a><div class="fedimg"><img src="http://ww4.sinaimg.cn/large/c5131475jw1f7ijf8t7o2j20hs0cqjth.jpg" alt="12个免费学习编程的好地方"></div></div></li><li class="fed-li"><p class="fed-meta"><span class="fed-time">9月05日 10:15</span><span class="fed-user">慕课网</span>(<span class="fed-views">108次阅读</span>/<span class="fed-shr">26次分享</span>/<span class="fed-cmt">7次评论</span>/<span class="fed-zan">18次点赞</span>)</p><div class="fed-con">【<span class="fed-title"><a href="http://hao.caibaojian.com/2724.html" target="_blank">你应该知道CSS选择器技巧</a></span>】本文选取了一些CSS选择器技巧，如:before和:after ，通过这两个选择器的内容对CSS选择器展开了深度的探讨。[good]全文地址：你应该知道CSS选择器技巧CSS选择器运用技巧和项目的运用：<a href="http://hao.caibaojian.com/t?url=http://t.cn/Rq5Zfky" target="_blank" rel="nofollow" class="tlink"><em></em></a><div class="fedimg"><img src="http://ww4.sinaimg.cn/large/c5131475jw1f7ihpfes4pj20dw0bxmxg.jpg" alt="你应该知道CSS选择器技巧"></div></div></li><li class="fed-li"><p class="fed-meta"><span class="fed-time">9月08日 12:01</span><span class="fed-user">慕课网</span>(<span class="fed-views">102次阅读</span>/<span class="fed-shr">21次分享</span>/<span class="fed-cmt">8次评论</span>/<span class="fed-zan">20次点赞</span>)</p><div class="fed-con">#IT技术分享#【<span class="fed-title"><a href="http://hao.caibaojian.com/3286.html" target="_blank">适用于小团队的前端规范</a></span>】一份适用于小团队的前端规范，以及<span class="wp_keywordlink"><a href="http://caibaojian.com/c/tools" title="前端工具箱">前端工具</a></span>的资源汇总。地址：前端规范 | Front-End-Standards.com <span class="wp_keywordlink"><a href="http://caibaojian.com/t/php" title="PHP">PHP</a></span>开发全栈：<a href="http://hao.caibaojian.com/t?url=http://t.cn/R5UOrNs" target="_blank" rel="nofollow" class="tlink"><em></em></a><div class="fedimg"><img src="http://ww4.sinaimg.cn/large/c5131475jw1f7m178vnmcj20go0ciwf8.jpg" alt="适用于小团队的前端规范"></div></div></li><li class="fed-li"><p class="fed-meta"><span class="fed-time">9月08日 13:02</span><span class="fed-user">程序员俱乐部</span>(<span class="fed-views">91次阅读</span>/<span class="fed-shr">2次分享</span>/<span class="fed-cmt">2次评论</span>/<span class="fed-zan">2次点赞</span>)</p><div class="fed-con">【<span class="fed-title"><a href="http://hao.caibaojian.com/3327.html" target="_blank">jQuery带爆炸特效的焦点图动画</a></span>】在线演示：jQuery带爆炸特效的焦点图动画DEMO演示 源码下载：jQuery带爆炸特效的焦点图动画 | HTML5资源教程<span class="desc2">上一篇我们分享了一款可以鼠标滑动jQuery焦点图插件，效果相当不错。这次要带来的也是一款jQuery焦点图插件，它的特点是当图片切换时，图片会发生爆炸的动画特效，非常有创意，也是一款很不错的jQuery焦点图应用。</span><div class="fedimg"><img src="http://ww4.sinaimg.cn/large/a8d43f7egw1f7lgcwfyfyj20gy09i779.jpg" alt="jQuery带爆炸特效的焦点图动画"></div><p><a href="http://hao.caibaojian.com/t?url=http://t.cn/RGW0Rzt" target="_blank" rel="nofollow"><em></em></a></p></div></li><li class="fed-li fed-li5"><p class="fed-meta"><span class="fed-time">9月06日 09:31</span><span class="fed-user">SegmentFault</span>(<span class="fed-views">91次阅读</span>/<span class="fed-shr">54次分享</span>/<span class="fed-cmt">12次评论</span>/<span class="fed-zan">19次点赞</span>)</p><div class="fed-con">【<span class="fed-title"><a href="http://hao.caibaojian.com/2989.html" target="_blank">在 Github 上部署自己的简历</a></span>】文章传送门；<a href="http://hao.caibaojian.com/t?url=http://t.cn/RcyEX6k" target="_blank" rel="nofollow" class="tlink"><em></em></a><span class="desc2">项目简介：本课程将带领大家在 Github Pages 上部署自己的简历，教大家如何将简历保存为 pdf 格式且该简历文件可直接在 A4 纸上打印。另外本课程还提供了简单的在线可编辑的简历页面，同学可直接使用它来生成自己...</span><div class="fedimg"><img src="http://ww4.sinaimg.cn/large/795bf814gw1f7jm11qrbej20ep08cwfe.jpg" alt="在 Github 上部署自己的简历"></div></div></li><li class="fed-li"><p class="fed-meta"><span class="fed-time">9月07日 08:20</span><span class="fed-user">IT程序狮</span>(<span class="fed-views">87次阅读</span>/<span class="fed-shr">2次分享</span>/<span class="fed-cmt">2次评论</span>/<span class="fed-zan">2次点赞</span>)</p><div class="fed-con">#前端技术#【<span class="fed-title"><a href="http://hao.caibaojian.com/3210.html" target="_blank">3 分钟掌握 CSS Flexbox</a></span>】详见：<a href="http://hao.caibaojian.com/t?url=http://t.cn/Rc4clUW" target="_blank" rel="nofollow" class="tlink"><em></em></a> 在这篇文章中，你将学到关于 CSS 中弹性布局最重要的概念。如果你发现你经常在 CSS 布局上纠结，这篇文章将帮你解脱出来。[给力]<div class="fedimg"><img src="http://ww4.sinaimg.cn/large/006q8Q6bjw1f7k4o42bokj30go05hwey.jpg" alt="3 分钟掌握 CSS Flexbox"></div></div></li><li class="fed-li"><p class="fed-meta"><span class="fed-time">9月07日 08:03</span><span class="fed-user">前端大全</span>(<span class="fed-views">87次阅读</span>/<span class="fed-shr">25次分享</span>/<span class="fed-cmt">6次评论</span>/<span class="fed-zan">18次点赞</span>)</p><div class="fed-con">《<span class="fed-title"><a href="http://hao.caibaojian.com/3146.html" target="_blank">javascript高阶函数的应用</a></span>》在实际开发中，无论是将函数当作参数传递，还是让函数的执行结果返回另外一个函数，这两种情形都有很多应用场景，以下就是一些高阶函数的应用。<a href="http://hao.caibaojian.com/t?url=http://t.cn/RcU4HjO" target="_blank" rel="nofollow" class="tlink"><em></em></a>（by @laixiangran <a href="http://hao.caibaojian.com/t?url=http://t.cn/RqfysgJ" target="_blank" rel="nofollow" class="tlink"><em></em></a>）<div class="fedimg"><img src="http://ww4.sinaimg.cn/large/005K6mYCgw1f7k3iw3n3mj308c08ca9x.jpg" alt="javascript高阶函数的应用"></div></div></li><li class="fed-li"><p class="fed-meta"><span class="fed-time">9月09日 13:03</span><span class="fed-user">程序员俱乐部</span>(<span class="fed-views">78次阅读</span>/<span class="fed-shr">14次分享</span>/<span class="fed-cmt">3次评论</span>/<span class="fed-zan">11次点赞</span>)</p><div class="fed-con"><span class="fed-title"><a href="http://hao.caibaojian.com/3497.html" target="_blank">20个为前端开发者准备的文档和指南（2）</a></span> <a href="http://hao.caibaojian.com/t?url=http://t.cn/Rta9mn6" target="_blank" rel="nofollow" class="tlink"><em></em></a><span class="desc2">本周开始,你也许想静下心来学些什么新的东西,或者提高一下你在一门特殊计算机语言或者技术的能力。  在四月份,我把a collection of useful docs and guides(一些有用的文档和指南)打包到了一起,那是一个很受欢迎的帖子。自此以后,我又收集了一些。请尽情享受! 1. Adobe <span class="wp_keywordlink"><a href="http://caibaojian.com/c/web" title="网站建设">web</a></span> Platform Team(Adobe Web Platform团队) 新设计的Adobe Web Platform站点的网..</span><div class="fedimg"><img src="http://ww4.sinaimg.cn/large/a8d43f7egw1f7ml2rpa5cj20m809qgme.jpg" alt="20个为前端开发者准备的文档和指南（2）"></div></div></li><li class="fed-li"><p class="fed-meta"><span class="fed-time">9月06日 17:12</span><span class="fed-user">HTML5中国</span>(<span class="fed-views">69次阅读</span>/<span class="fed-shr">8次分享</span>/<span class="fed-cmt">2次评论</span>/<span class="fed-zan">8次点赞</span>)</p><div class="fed-con">【<span class="fed-title"><a href="http://hao.caibaojian.com/2977.html" target="_blank">在大型项目中组织CSS</a></span>】<a href="http://hao.caibaojian.com/t?url=http://t.cn/RcUNDTG" target="_blank" rel="nofollow" class="tlink"><em></em></a> 编写CSS容易。 编写可维护的CSS难。这句话你之前可能听过100次了。 原因是CSS中的一切都默认为全局的。如果你是一个C程序员你就知道全局变量不好。如果你是任何一种程序员，你都知道隔离和可组合的模块是构建可维护 ...<div class="fedimg"><img src="http://ww4.sinaimg.cn/large/8c81192fjw1f7jzdwi4wcj20rs0rs0v3.jpg" alt="在大型项目中组织CSS"></div></div></li><li class="fed-li fed-li5"><p class="fed-meta"><span class="fed-time">9月06日 14:00</span><span class="fed-user">程序员俱乐部</span>(<span class="fed-views">64次阅读</span>/<span class="fed-shr">4次分享</span>/<span class="fed-cmt">6次评论</span>/<span class="fed-zan">3次点赞</span>)</p><div class="fed-con">【<span class="fed-title"><a href="http://hao.caibaojian.com/2943.html" target="_blank">HTML5 Canvas放射线动画</a></span>】在线演示：HTML5 Canvas放射线动画DEMO演示 源码下载：HTML5 Canvas放射线动画 | HTML5资源教程<span class="desc2">这是一款基于HTML5 Canvas的放射线动画，实现这款动画的思路也比较简单，先是根据数学图形公式构造放射线绘制的路径，然后利用HTML5将射线绘制在Canvas上，并在射线上绘制随机的颜色，这样整个射线图形看上去色彩斑斓。</span><div class="fedimg"><img src="http://ww4.sinaimg.cn/large/a8d43f7egw1f7j3egj8kaj20gy09h3zh.jpg" alt="HTML5 Canvas放射线动画"></div><p><a href="http://hao.caibaojian.com/t?url=http://t.cn/RZKh1Lu" target="_blank" rel="nofollow"><em></em></a></p></div></li><li class="fed-li"><p class="fed-meta"><span class="fed-time">9月05日 08:55</span><span class="fed-user">SegmentFault</span>(<span class="fed-views">63次阅读</span>/<span class="fed-shr">16次分享</span>/<span class="fed-cmt">6次评论</span>/<span class="fed-zan">11次点赞</span>)</p><div class="fed-con">《<span class="fed-title"><a href="http://hao.caibaojian.com/2731.html" target="_blank">JavaScript 事件循环</a></span>》文章传送门:<a href="http://hao.caibaojian.com/t?url=http://t.cn/RcLCHfF" target="_blank" rel="nofollow" class="tlink"><em></em></a><span class="desc2">听多了JavaScript单线程，异步，V8，便会很想去知道JavaScript是如何利用单线程来实现所谓的异步的。我参考了一些文章，了解到一个很重要的词汇：事件循环(Event Loop)。在这些文章中，有： 阮一峰老师的JavaScri...</span><div class="fedimg"><img src="http://ww4.sinaimg.cn/large/795bf814gw1f7ifbs2cfqj20ip06tt9c.jpg" alt="JavaScript 事件循环"></div></div></li><li class="fed-li"><p class="fed-meta"><span class="fed-time">9月08日 13:10</span><span class="fed-user">IT程序狮</span>(<span class="fed-views">59次阅读</span>/<span class="fed-shr">2次分享</span>/<span class="fed-cmt">2次评论</span>/<span class="fed-zan">2次点赞</span>)</p><div class="fed-con">#<span class="wp_keywordlink"><a href="http://caibaojian.com/" title="前端开发">前端开发</a></span>那些事#【<span class="fed-title"><a href="http://hao.caibaojian.com/3402.html" target="_blank">JS中绑定this的几种方法及简单比较</a></span>】详见：<span class="wp_keywordlink"><a href="http://caibaojian.com/t/javascript" title="JS">JS</a></span>中绑定this的几种方法及简单比较 在文章里，作者将从为什么需要绑定 this 说起，并分享绑定 this 的几种方法及简单比较。[喵喵]<div class="fedimg"><img src="http://ww4.sinaimg.cn/large/006q8Q6bjw1f7lbl5nqvhj30t80t8myh.jpg" alt="JS中绑定this的几种方法及简单比较"></div><p><a href="http://hao.caibaojian.com/t?url=http://t.cn/RcqzSLL" target="_blank" rel="nofollow"><em></em></a></p></div></li><li class="fed-li"><p class="fed-meta"><span class="fed-time">9月09日 10:01</span><span class="fed-user">伯乐在线官方微博</span>(<span class="fed-views">59次阅读</span>/<span class="fed-shr">19次分享</span>/<span class="fed-cmt">8次评论</span>/<span class="fed-zan">6次点赞</span>)</p><div class="fed-con">《老司机教你如何撩妹：<span class="fed-title"><a href="http://hao.caibaojian.com/3436.html" target="_blank">程序员撩妹技术 30 分钟从门到精通</a></span>》大家都说程序员不会跟女生打交道，甚至程序员被强行打上“性格内向”“表情木讷”的标签，更加给女生“无趣”的印象。<a href="http://hao.caibaojian.com/t?url=http://t.cn/RcbNmmV" target="_blank" rel="nofollow" class="tlink"><em></em></a>（by @熊绎 <a href="http://hao.caibaojian.com/t?url=http://t.cn/RqfysgJ" target="_blank" rel="nofollow" class="tlink"><em></em></a>）<div class="fedimg"><img src="http://ww4.sinaimg.cn/large/63918611gw1f7mg673348j209n060t8v.jpg" alt="程序员撩妹技术 30 分钟从门到精通"></div></div></li><li class="fed-li"><p class="fed-meta"><span class="fed-time">9月06日 20:00</span><span class="fed-user">伯乐在线官方微博</span>(<span class="fed-views">52次阅读</span>/<span class="fed-shr">9次分享</span>/<span class="fed-cmt">3次评论</span>/<span class="fed-zan">7次点赞</span>)</p><div class="fed-con">《<span class="fed-title"><a href="http://hao.caibaojian.com/3066.html" target="_blank">别工作太长时间，这对你和公司都有好处</a></span>》在软件公司，永远都有做不完的工作：太多新功能要实现，太多bug要修补。有时候你就是没法快速完成积压的工作，写不够代码量，花太多时间在一个看上去不可能修复的bug上。<a href="http://hao.caibaojian.com/t?url=http://t.cn/RcUUcRs" target="_blank" rel="nofollow" class="tlink"><em></em></a>（@小米云豆粥 译）<div class="fedimg"><img src="http://ww4.sinaimg.cn/large/63918611gw1f7k06o32jnj20gz0b8dgo.jpg" alt="别工作太长时间，这对你和公司都有好处"></div></div></li></ol>', '前端,周报,js,css,html5', 543, 0, 1, 0, '1479950629'),
(3, 'admin', 1, 10, '20161031 前端开发月报', '一道常被人轻视的前端 JS 面试题；微信小程序最新版102700：新增19个API；常用的 web 前端框架汇总；彻底理解javascript原型；HTML5+css3 整体回顾；你应该了解的4种js设计模式；作为前端需要了解的B/S架构；我终于弄懂了各种前端build工具', '<ol class="feddaily-list"><li class="fed-li"><p class="fed-meta"><span class="fed-user">稀土掘金</span>(<span class="fed-views">289次阅读</span>/<span class="fed-shr">2次分享</span>/<span class="fed-cmt">2次评论</span>/<span class="fed-zan">2次点赞</span>)</p><div class="fed-con"><span class="fed-title"><a href="http://hao.caibaojian.com/11401.html" target="_blank">一道常被人轻视的前端 JS 面试题</a></span> - 年前刚刚离职了，分享下我曾经出过的一道面试题，此题是我出的一套前端面试题中的最后一题，用来考核面试者的 JavaScript 的综合能力，很可惜到目前为止的将近两年中，几乎没有人能够完全答对。 分享 by @Pober_Wong | 查看全文：<a href="http://hao.caibaojian.com/t?url=http://t.cn/RVWge7a" target="_blank" rel="nofollow" class="tlink"><em></em></a></div></li><li class="fed-li"><p class="fed-meta"><span class="fed-user"><span class="wp_keywordlink"><a href="http://caibaojian.com/" title="前端开发">前端开发</a></span>博客</span>(<span class="fed-views">185次阅读</span>/<span class="fed-shr">2次分享</span>/<span class="fed-cmt">2次评论</span>/<span class="fed-zan">2次点赞</span>)</p><div class="fed-con">【<span class="fed-title"><a href="http://hao.caibaojian.com/11839.html" target="_blank">微信小程序最新版102700：新增19个API</a></span>】wx开发者工具版本更新公告：最新版本10月27日版：102700<br> 新增 19 个全新的 API<br> 拓展了 4 个组件属性，修复了数十个组件 bug<br> 开发者工具添加实时刷新功能等 7 个功能<br> 编辑模块增加自动保存、实时预览等 8 个功能</div></li><li class="fed-li"><p class="fed-meta"><span class="fed-user">IT程序狮</span>(<span class="fed-views">182次阅读</span>/<span class="fed-shr">2次分享</span>/<span class="fed-cmt">2次评论</span>/<span class="fed-zan">2次点赞</span>)</p><div class="fed-con">#前端开发那些事#【<span class="fed-title"><a href="http://hao.caibaojian.com/11602.html" target="_blank">常用的 Web 前端框架汇总</a></span>】详见：常用的web前端框架有哪些？ 随着前端开发的迅猛发展，前端框架也层出不穷、各有千秋。本文作者收集了一些具有代表性 Web 前端开发工具和框架，与大家一同分享。[围观]（作者：杜Amy）欢迎来【前端开发那些事】专辑投稿。[耶]<span class="desc2">目前前端开发非常火爆，导致了前端的一系列框架，层出不穷，各有千秋，那么多的框架，不知道从哪里下手，也不知道该如何使用，这里我收集了目前互联网最具有代表性web 前端开发工具和框架,希望对你有所帮助。 Bootstrap中文网 Bootstrap 是最受欢迎的 <span class="wp_keywordlink"><a href="http://caibaojian.com/t/html" title="html">html</a></span>、<span class="wp_keywordlink"><a href="http://caibaojian.com/css3/" title="CSS">CSS</a></span> 和 JS 框架，用于开发<span class="wp_keywordlink"><a href="http://caibaojian.com/356.html" title="响应式布局">响应式</a></span>布局、移动设备优先的 WEB 项...</span><div class="fedimg"><img src="http://ww4.sinaimg.cn/large/006q8Q6bjw1f95evhjt5nj30f40a4tad.jpg" alt="常用的 Web 前端框架汇总"></div><p><a href="http://hao.caibaojian.com/t?url=http://t.cn/RVKPm0A" target="_blank" rel="nofollow"><em></em></a></p></div></li><li class="fed-li"><p class="fed-meta"><span class="fed-user">实验楼官方微博</span>(<span class="fed-views">158次阅读</span>/<span class="fed-shr">2次分享</span>/<span class="fed-cmt">2次评论</span>/<span class="fed-zan">2次点赞</span>)</p><div class="fed-con">#编程技术分享#【<span class="fed-title"><a href="http://hao.caibaojian.com/11306.html" target="_blank">彻底理解JavaScript原型</a></span>】原型是JavaScript中一个比较难理解的概念，原型相关的属性也比较多。相信通过这篇文章一定能够清楚的认识到原型，[给力] 详情：<a href="http://hao.caibaojian.com/t?url=http://t.cn/RqWPfyS" target="_blank" rel="nofollow" class="tlink"><em></em></a><div class="fedimg"><img src="http://ww4.sinaimg.cn/large/005AWTo8jw1f936n4uxmbj308b04ojrb.jpg" alt="彻底理解JavaScript原型"></div></div></li><li class="fed-li"><p class="fed-meta"><span class="fed-user">IT程序狮</span>(<span class="fed-views">157次阅读</span>/<span class="fed-shr">2次分享</span>/<span class="fed-cmt">2次评论</span>/<span class="fed-zan">2次点赞</span>)</p><div class="fed-con">#前端开发那些事#【 <span class="fed-title"><a href="http://hao.caibaojian.com/11449.html" target="_blank">HTML5+CSS3 整体回顾</a></span>】详见：HTML5+CSS3整体回顾 这篇文章主要总结 HTML5 的一些新增的功能以及一些基础归纳，供大家参考、学习。（作者：poetries）欢迎大家来【前端开发那些事】专辑投稿咯。[耶]<span class="desc2">转载请声明 原文链接 这篇文章主要总结H5的一些新增的功能以及一些基础归纳，并不是很详细，后面会一直完善补充新的内容，本文是一些笔记记录，放在这里供自己参考也供他人学习！ 第一课 HTML5结构 HTML5 是新一代的 HTML DTD声明改变 新的结构标签 注意的地方 ie8 不兼...</span><div class="fedimg"><img src="http://ww4.sinaimg.cn/large/006q8Q6bjw1f949rn6n6aj30vy0dwwgv.jpg" alt="HTML5+CSS3 整体回顾"></div><p><a href="http://hao.caibaojian.com/t?url=http://t.cn/RVjYg5m" target="_blank" rel="nofollow"><em></em></a></p></div></li><li class="fed-li fed-li5"><p class="fed-meta"><span class="fed-user">李松峰</span>(<span class="fed-views">132次阅读</span>/<span class="fed-shr">2次分享</span>/<span class="fed-cmt">2次评论</span>/<span class="fed-zan">2次点赞</span>)</p><div class="fed-con"><span class="fed-title"><a href="http://hao.caibaojian.com/11329.html" target="_blank">你应该了解的4种JS设计模式</a></span> （by 旭日云中竹 - 众成翻译）：2016-10-07每个JS开发者都力求写出可维护、复用性和可读性高的<span class="wp_keywordlink"><a href="http://caibaojian.com/c/code" title="代码">代码</a></span>。随着应用不断扩大，代码组织的合理性也越来越重要。设计模式为特定环境下的常见问题提供了一个组织结构，对于克服这些挑战起到...... <a href="http://hao.caibaojian.com/t?url=http://t.cn/RVWKCEz" target="_blank" rel="nofollow" class="tlink"><em></em></a></div></li><li class="fed-li"><p class="fed-meta"><span class="fed-user">全栈开发者</span>(<span class="fed-views">121次阅读</span>/<span class="fed-shr">2次分享</span>/<span class="fed-cmt">2次评论</span>/<span class="fed-zan">2次点赞</span>)</p><div class="fed-con">【<span class="fed-title"><a href="http://hao.caibaojian.com/11573.html" target="_blank">作为前端需要了解的B/S架构</a></span> 】全文=&gt;<a href="http://hao.caibaojian.com/t?url=http://t.cn/RVYDS9M" target="_blank" rel="nofollow" class="tlink"><em></em></a>其实B/S架构是属于后台方面的东西,不过作为一个前端,也是需要了解一下滴 C/S架构简要介绍 在了解什么是B/S架构之前,我们有必要了解一下什么是C/S架构:...</div></li><li class="fed-li"><p class="fed-meta"><span class="fed-user">酷勤网-程序员的那点事</span>(<span class="fed-views">106次阅读</span>/<span class="fed-shr">26次分享</span>/<span class="fed-cmt">12次评论</span>/<span class="fed-zan">23次点赞</span>)</p><div class="fed-con">《<span class="fed-title"><a href="http://hao.caibaojian.com/11447.html" target="_blank">我终于弄懂了各种前端build工具</a></span>》即使对于一些经验丰富的开发者来说，诸多的<span class="wp_keywordlink"><a href="http://caibaojian.com/c/tools" title="前端工具箱">前端工具</a></span>还是会让他们感到头痛，例如我。解决这个问题的最好办法，就是在概念上理解他们的工作方式，已经他们之间相互配合的方式。我终于弄懂了各种前端build工具（来自： SDK.cn @SDKcn）<a href="http://hao.caibaojian.com/t?url=http://t.cn/RVjGDrR" target="_blank" rel="nofollow"><em></em></a></div></li><li class="fed-li"><p class="fed-meta"><span class="fed-user"><span class="wp_keywordlink"><a href="http://caibaojian.com/" title="前端开发博客">前端开发博客</a></span></span>(<span class="fed-views">103次阅读</span>/<span class="fed-shr">3次分享</span>/<span class="fed-cmt">3次评论</span>/<span class="fed-zan">2次点赞</span>)</p><div class="fed-con">#JavaScript#【<span class="fed-title"><a href="http://hao.caibaojian.com/11355.html" target="_blank">JavaScript 图片切换</a></span>】用原生的JS写动画效果的确是个很令人纠结的事情，倒不如直接用<span class="wp_keywordlink"><a href="http://caibaojian.com/jquery/" title="jQuery手册">jQuery</a></span>来写，亦或找一些jQuery插件。能力达不到的时候，为了工作进度，只能采取心有不甘的手段。如果真的获得能力的提高，我...请戳→<a href="http://hao.caibaojian.com/t?url=http://t.cn/8sYC3ig" target="_blank" rel="nofollow" class="tlink"><em></em></a> #前端开发博客#<div class="fedimg"><img src="http://ww4.sinaimg.cn/large/6830a53bjw1f93f0znh17j20p00dwadc.jpg" alt="JavaScript 图片切换"></div></div></li><li class="fed-li"><p class="fed-meta"><span class="fed-user">IT程序狮</span>(<span class="fed-views">95次阅读</span>/<span class="fed-shr">1次分享</span>/<span class="fed-cmt">3次评论</span>/<span class="fed-zan">2次点赞</span>)</p><div class="fed-con">#IT技术分享#【<span class="fed-title"><a href="http://hao.caibaojian.com/11895.html" target="_blank">Github学习指南</a></span>】详见：<a href="http://hao.caibaojian.com/t?url=http://t.cn/RVHElV0" target="_blank" rel="nofollow" class="tlink"><em></em></a> <span class="wp_keywordlink"><a href="http://caibaojian.com/t/github" title="github">github</a></span> 指南汇集了各类 GitHub、Git 学习资源，转需收藏咯。[耶]<div class="fedimg"><img src="http://ww4.sinaimg.cn/large/006q8Q6bjw1f97pb6mhezj309n064dga.jpg" alt="Github学习指南"></div></div></li><li class="fed-li fed-li5"><p class="fed-meta"><span class="fed-user">稀土掘金</span>(<span class="fed-views">93次阅读</span>/<span class="fed-shr">2次分享</span>/<span class="fed-cmt">2次评论</span>/<span class="fed-zan">2次点赞</span>)</p><div class="fed-con">全方位提升网站打开速度：<span class="fed-title"><a href="http://hao.caibaojian.com/11403.html" target="_blank">前端、后端、新的技术</a></span> - 如何在 1s 内完整打开网站会直接影响用户的满意度及留存率，在前端、后端、数据缓存、CDN 加速等等方面都有诸多可以提升。分享 by @kalasoo | 查看全文：<a href="http://hao.caibaojian.com/t?url=http://t.cn/RVlva4y" target="_blank" rel="nofollow" class="tlink"><em></em></a></div></li><li class="fed-li"><p class="fed-meta"><span class="fed-user">开发者头条</span>(<span class="fed-views">93次阅读</span>/<span class="fed-shr">2次分享</span>/<span class="fed-cmt">2次评论</span>/<span class="fed-zan">2次点赞</span>)</p><div class="fed-con"><span class="fed-title"><a href="http://hao.caibaojian.com/11516.html" target="_blank">《webpack 多页应用架构系列》电子书</a></span> <a href="http://hao.caibaojian.com/t?url=http://t.cn/RVjt7KO" target="_blank" rel="nofollow" class="tlink"><em></em></a><span class="desc2">这系列文章讲什么？ 本系列文章主要介绍如何用webpack这一当前流行的构建工具来设计一个多页应用的架构。请注意，本文并非新手教程，着重点更多是在于提供解决问题的思路，而非手把手带你装逼。 作者介绍 本人供职于某互联网物流公司，专职前端，公司虽仍处于创业阶段，但产品线已经拉得挺长的了，因...</span></div></li><li class="fed-li"><p class="fed-meta"><span class="fed-user">IT程序狮</span>(<span class="fed-views">88次阅读</span>/<span class="fed-shr">2次分享</span>/<span class="fed-cmt">2次评论</span>/<span class="fed-zan">2次点赞</span>)</p><div class="fed-con">#前端开发那些事#【<span class="fed-title"><a href="http://hao.caibaojian.com/11353.html" target="_blank">CSS3 画形状</a></span>】详见：CSS3 画形状 在制作页面时，常用CSS画各种形状带代替img，这样可以免去一次<span class="wp_keywordlink"><a href="http://caibaojian.com/t/http" title="http">HTTP</a></span>请求。而且有些基本形状用CSS实现比切图更方便和灵活。本篇就介绍一下常用形状的画法。[耶]（作者：张歆琳）【前端开发那些事】专辑，期待你的投稿。[耶]<span class="desc2">在制作页面时，常用CSS画各种形状带代替img，这样可以免去一次HTTP请求。而且有些基本形状用CSS实现比切图更方便和灵活。本篇就介绍一下常用形状的画法。 圆形 椭圆（半椭圆，4分之一椭圆） 三角形 平行四边形 菱形 梯形 圆形 是最常见最基本的图型，给宽高相等的div设border-radius: 50%，轻松实现： 椭圆 参照border-r...</span><div class="fedimg"><img src="http://ww4.sinaimg.cn/large/006q8Q6bjw1f933s4ysixj30dw0bxmxg.jpg" alt="CSS3 画形状"></div><p><a href="http://hao.caibaojian.com/t?url=http://t.cn/RcX5wOL" target="_blank" rel="nofollow"><em></em></a></p></div></li><li class="fed-li"><p class="fed-meta"><span class="fed-user">前端大全</span>(<span class="fed-views">88次阅读</span>/<span class="fed-shr">22次分享</span>/<span class="fed-cmt">6次评论</span>/<span class="fed-zan">20次点赞</span>)</p><div class="fed-con">《有趣的CSS题目（8）：<span class="fed-title"><a href="http://hao.caibaojian.com/12040.html" target="_blank">纯CSS的导航栏Tab切换方案</a></span>》CSS 的强大之处有的时候超乎我们的想象，Tab 切换，常规而言确实需要用到一定的脚本才能实现。下面看看如何使用 CSS 完成同样的事情。<a href="http://hao.caibaojian.com/t?url=http://t.cn/RVR5LKO" target="_blank" rel="nofollow" class="tlink"><em></em></a> （by chokcoco<a href="http://hao.caibaojian.com/t?url=http://t.cn/RqUcVYY" target="_blank" rel="nofollow" class="tlink"><em></em></a> ）<div class="fedimg"><img src="http://ww4.sinaimg.cn/large/005K6mYCgw1f988j0mt2kj30b908cdfv.jpg" alt="纯CSS的导航栏Tab切换方案"></div></div></li><li class="fed-li"><p class="fed-meta"><span class="fed-user">IT程序狮</span>(<span class="fed-views">85次阅读</span>/<span class="fed-shr">3次分享</span>/<span class="fed-cmt">2次评论</span>/<span class="fed-zan">2次点赞</span>)</p><div class="fed-con">#IT职场#【<span class="fed-title"><a href="http://hao.caibaojian.com/11603.html" target="_blank">前端面试中的常见的算法问题</a></span>】详见：<a href="http://hao.caibaojian.com/t?url=http://t.cn/RVjdJYF" target="_blank" rel="nofollow" class="tlink"><em></em></a> 一篇前端开发面试中常见算法问题的总结。这些基础知识的积累可以帮助我们更好的优化解决思路。一起来看看。[二哈]<div class="fedimg"><img src="http://ww4.sinaimg.cn/large/006q8Q6bjw1f95eonjkitj30ci071q3q.jpg" alt="前端面试中的常见的算法问题"></div></div></li></ol>', '前端,月报', 141, 0, 1, 0, '1479955019826'),
(11, 'admin', 0, 0, 'js代码片段收集', '1、随机token\nfunction setToken(){\nreturn Math.random(', '<pre>1、随机token\r\nfunction setToken(){\r\nreturn Math.random().toString(36).substring(2);\r\n}\r\n\r\n2、统计字符串出现次数\r\n\r\nfunction count(s,o){\r\nreturn o={},s.replace(/./g,function(m){o[m]=1+o[m]||1;}),o;\r\n}\r\n\r\n\r\n3、获取类型\r\nfunction typeOf(o) {\r\nreturn Object.prototype.toString.call(o).match(/^[.* (.*)]$/)[1].toLowerCase();\r\n}\r\n4、字符串 && ASCLL码互相转换\r\nfunction code(a,b){\r\nreturn typeof a==''string''?(b=[],a.replace(/./g,function(m){b.push(m.charCodeAt())}),b):String.fromCharCode.apply(",a);\r\n}\r\n5、数组去重(es6)\r\nfunction dedupe(array){\r\nreturn Array.from(new Set(array));\r\n}\r\n6、时间戳\r\n+new Date;\r\n7、多维数组降维\r\nfunction reduceAry(ary){\r\nreturn array.push.apply(ary);\r\n}\r\n8、字符串转义\r\nfunction HtmlCode(str){\r\nreturn str.replace(/[<>]/g,function(m){return {''<'':''&lt;'',''>'':''&gt;''}[m]})\r\n}\r\n9、颜色转换\r\nfunction toHex(str,res,len){\r\nreturn len=str.length,res=[],len>6||len%3!=0?str:(len===3?str.replace(/./g,function(m){return m+m;}):str).replace(/[0-9a-f]{2}/gi,function(m){res.push(parseInt(m,16))}),res\r\n}\r\nfunction toRgb(){\r\nreturn [].slice.call(arguments).join().replace(/d+(,|)/g,function(m){return parseInt(m).toString(16)})\r\n}\r\n\r\n\r\n\r\n部分代码取自网络</pre>', 'web', 16, 0, 1, 0, '1490685330517'),
(12, 'admin', 0, 0, '请输入文章标题', '声明提升\r\n	函数声明提升在前 变量声明提升在后\r\n	var a=1;\r\n	function a(){};', '声明提升\r\n	函数声明提升在前 变量声明提升在后\r\n	var a=1;\r\n	function a(){};\r\n	console.log(a);//1\r\n\r\n静态作用域、动态作用域\r\n	静态作用域又称之为词法作用域：即词法作用域的函数中遇到既不是形参也不是函数内部定义的局部变量的变量时，它会根据函数定义的环境中查询。\r\n	动态域的函数中遇到既不是形参也不是函数内部定义的局部变量的变量时，到函数调用的环境去查询。\r\n	function test(){\r\n		var name=''c'';\r\n    		return {\r\n        		name:"a",\r\n			log:function(){\r\n				return name;\r\n    			},\r\n			log2:function(){\r\n				return this.name;\r\n			}\r\n		};\r\n	}\r\n	var name="b";\r\n	var person=test();\r\n	var log2=person.log2;\r\n	console.log("静态作用域里name是"+person.log())//c\r\n	console.log("person的name是"+person.name,"和 "+person.log2(),"在动态作用域中是"+log2());//a a b\r\n函数声明与函数表达式\r\n	var a=function b(){\r\n		console.log(typeof b);//function\r\n	}\r\n	console.log(typeof b);//undefined\r\n柯里化\r\n	var currying = function(fn,args) {		return function(){\r\n			return fn.apply(null,[args].concat([].slice.call(arguments)))\r\n		}\r\n	};\r\n	var test=currying(function(){\r\n		return [].slice.call(arguments).join(" ");\r\n	},"Hello ,");\r\n\r\n	console.log(test("wellcome","to","Beijing. "),test("wellcome","to","Shanghai.")) 原型链\r\n	实例会继承原型对象原型链上的方法 因此：实例可调用Object.prototype上定义的方法。\r\n	类似于jQuery的：jQuery.fn.init.prototype=jQuery.prototype', 'web', 4, 0, 1, 0, '1490688187989'),
(15, 'admin', 0, 0, '请输入文章标题', '2声明提升\n	函数声明提升在前 变量声明提升在后\n	var a=1;\n	function a(){}', '2声明提升\n	函数声明提升在前 变量声明提升在后\n	var a=1;\n	function a(){};\n	console.log(a);//1\n\n静态作用域、动态作用域\n	静态作用域又称之为词法作用域：即词法作用域的函数中遇到既不是形参也不是函数内部定义的局部变量的变量时，它会根据函数定义的环境中查询。\n	动态域的函数中遇到既不是形参也不是函数内部定义的局部变量的变量时，到函数调用的环境去查询。\n	function test(){\n		var name=''c'';\n    		return {\n        		name:"a",\n			log:function(){\n				return name;\n    			},\n			log2:function(){\n				return this.name;\n			}\n		};\n	}\n	var name="b";\n	var person=test();\n	var log2=person.log2;\n	console.log("静态作用域里name是"+person.log())//c\n	console.log("person的name是"+person.name,"和 "+person.log2(),"在动态作用域中是"+log2());//a a b\n函数声明与函数表达式\n	var a=function b(){\n		console.log(typeof b);//function\n	}\n	console.log(typeof b);//undefined\n柯里化\n	var currying = function(fn,args) {		return function(){\n			return fn.apply(null,[args].concat([].slice.call(arguments)))\n		}\n	};\n	var test=currying(function(){\n		return [].slice.call(arguments).join(" ");\n	},"Hello ,");\n\n	console.log(test("wellcome","to","Beijing. "),test("wellcome","to","Shanghai.")) 原型链\n	实例会继承原型对象原型链上的方法 因此：实例可调用Object.prototype上定义的方法。\n	类似于jQuery的：jQuery.fn.init.prototype=jQuery.prototype', 'web', 1, 0, 1, 0, '1490688380182'),
(16, 'admin', 0, 0, '1111111111', 'wwwwwwwwww', 'wwwwwwwwww', 'web', 5, 0, 1, 0, '1490782336259');

-- --------------------------------------------------------

--
-- 表的结构 `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` text,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog`
--

INSERT INTO `blog` (`id`, `title`, `text`, `created`) VALUES
(1, 'test', '1111111', '2010-08-16 10:00:23'),
(2, 'my-nodejs-blog', '测试测试', '0000-00-00 00:00:00'),
(3, 'my-nodejs-blog', '测试测试', '0000-00-00 00:00:00'),
(4, 'my-nodejs-blog', '测试测试', '0000-00-00 00:00:00'),
(5, 'my-nodejs-blog', '测试测试', '0000-00-00 00:00:00'),
(6, 'test', '1111111', '2010-08-16 10:00:23');

-- --------------------------------------------------------

--
-- 表的结构 `reply`
--

CREATE TABLE `reply` (
  `id` int(11) NOT NULL,
  `uid` int(14) NOT NULL,
  `user` varchar(14) NOT NULL,
  `time` bigint(14) NOT NULL,
  `text` text NOT NULL,
  `del` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `reply_1`
--

CREATE TABLE `reply_1` (
  `id` int(11) NOT NULL,
  `uid` int(14) NOT NULL,
  `user` varchar(14) NOT NULL,
  `time` bigint(14) NOT NULL,
  `text` text NOT NULL,
  `del` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `reply_1`
--

INSERT INTO `reply_1` (`id`, `uid`, `user`, `time`, `text`, `del`) VALUES
(1, 1, 'admin', 1480915984519, '监控室看看', 0),
(2, 1, 'admin', 1480916082784, '我当然反弹过一会就卡了', 0),
(3, 1, 'admin', 1480916219071, '我当然反弹过一会就卡了', 0),
(4, 1, 'admin', 1480916226027, 'sdfghjk', 0),
(5, 1, 'admin', 1480916585384, 'sdftghjkdfgh', 0),
(6, 1, 'admin', 1480916601164, 'sdfghjkl;', 0),
(7, 1, 'admin', 1480916707633, '是大法官会尽快', 0),
(8, 1, 'admin', 1480916893839, 'erdtyu,d', 0),
(9, 1, 'admin', 1480916935484, '是对方可根据回复几点开始', 0),
(10, 1, 'admin', 1480916982878, '时的法国和', 0),
(11, 1, 'admin', 1480917089645, '劝我说的人发腿骨婚戒', 0),
(12, 1, 'admin', 1480917123402, 'sdfghjh', 0),
(13, 1, 'admin', 1480917139221, 'sdfgh', 0),
(14, 1, 'admin', 1480917174836, 'sdfghj', 0),
(15, 1, 'admin', 1480917202858, 'sdfghjksdfg', 0),
(16, 1, 'admin', 1480917223359, 'asdfghj', 0),
(17, 1, 'admin', 1480917261146, 'asderftghj', 0),
(18, 1, 'admin', 1480917339908, 'sdfgh', 0),
(19, 1, 'admin', 1480917365011, 'sdfghj', 0),
(20, 1, 'admin', 1480917433708, 'sdfghjk', 0),
(21, 1, 'admin', 1480917474898, 'ASxzdfgnfgh', 0),
(22, 1, 'admin', 1480917496347, 'sdgvrfgffffffffffff', 0),
(23, 1, 'admin', 1480917541964, 'asdfghjhnh', 0),
(24, 1, 'admin', 1480917546166, 'asdfghjhnh', 0),
(25, 1, 'admin', 1480917604698, 'asdfghb', 0),
(26, 1, 'admin', 1488520735337, '地方规划局快乐', 0),
(27, 1, 'admin', 1488520739463, '地方规划局快乐是是是', 0),
(28, 1, 'admin', 1490239774882, 'qqqqqqqqqq', 0);

-- --------------------------------------------------------

--
-- 表的结构 `reply_2`
--

CREATE TABLE `reply_2` (
  `id` int(11) NOT NULL,
  `uid` int(14) NOT NULL,
  `user` varchar(14) NOT NULL,
  `time` bigint(14) NOT NULL,
  `text` text NOT NULL,
  `del` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `reply_2`
--

INSERT INTO `reply_2` (`id`, `uid`, `user`, `time`, `text`, `del`) VALUES
(1, 1, 'admin', 1480917789612, '8错8错', 0),
(2, 1, 'admin', 1480917894221, '时的法国和', 0),
(3, 1, 'admin', 1480917909619, '地方规划及', 0),
(4, 1, 'admin', 1480917930911, '是地方规划及', 0),
(5, 1, 'admin', 1480917990465, 'asdfghjkl', 0),
(6, 1, 'admin', 1480918048270, 'sxdfghjkl', 0),
(7, 1, 'admin', 1480918500549, 'ascvbnh', 0),
(8, 1, 'admin', 1480918518877, 'wdvggn', 0),
(9, 1, 'admin', 1480918548137, 'sderftgyhuj', 0),
(10, 1, 'admin', 1480918569916, 'sdfghjk', 0),
(11, 1, 'admin', 1480918616586, 'dfgh', 0),
(12, 1, 'admin', 1483681669627, 'sfddddddddddddd', 0),
(13, 1, 'admin', 1483681679627, '是地方规划及', 0),
(14, 1, 'admin', 1483681694972, '是地方规划及', 0),
(15, 1, 'admin', 1483681868304, 'admin 2017-1-6 13:48:14\n是地方规划及', 0),
(16, 1, 'admin', 1483681879151, '--------------\n\n\n', 0),
(17, 1, 'admin', 1483681905655, '&lt;script>alert(1)&lt;/script>', 0),
(18, 1, 'admin', 1490261042234, 'dfghjkl', 0),
(19, 1, 'admin', 1490261074799, '&lt;script>alet=console.log&lt;/script>', 0),
(20, 1, 'admin', 1490261078755, '&lt;script>alert=console.log&lt;/script>', 0),
(21, 1, 'admin', 1490584124440, 'sdfghjkl', 0),
(22, 1, 'admin', 1490601147188, '&lt;script>alert(123)&lt;/script>', 0),
(30, 1, 'admin', 1490602347120, '%3Cscript%3Ealert(133322333)%3C%2Fscript%3E', 0),
(33, 1, 'admin', 1490602425638, 'undefined', 0),
(34, 1, 'admin', 1490602611860, 'undefined', 0),
(36, 1, 'admin', 1490603532655, '&lt;script>alert(345633337)&lt;/script>', 0),
(37, 1, 'admin', 1490603631442, '&lt;script>alert(3411111111137)&lt;/script>', 0);

-- --------------------------------------------------------

--
-- 表的结构 `reply_3`
--

CREATE TABLE `reply_3` (
  `id` int(11) NOT NULL,
  `uid` int(14) NOT NULL,
  `user` varchar(14) NOT NULL,
  `time` bigint(14) NOT NULL,
  `text` text NOT NULL,
  `del` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `reply_3`
--

INSERT INTO `reply_3` (`id`, `uid`, `user`, `time`, `text`, `del`) VALUES
(1, 1, 'admin', 1480663960252, '地方', 0),
(2, 1, 'admin', 1480664188558, '地方规划及', 0),
(3, 1, 'admin', 1480664550766, '是吗？', 0),
(4, 1, 'admin', 1480664594048, '是的', 0),
(5, 1, 'admin', 1480664722401, '地方规划及', 0),
(6, 1, 'admin', 1480664745669, '地方规划及', 0),
(7, 1, 'admin', 1480664802612, '是大法官会尽快', 0),
(8, 1, 'admin', 1480664834164, '是大法官会尽快', 0),
(9, 1, 'admin', 1480664871027, '是大法官会尽快', 0),
(10, 1, 'admin', 1480664898834, '阿萨德飞规划局', 0),
(11, 1, 'admin', 1480664962606, '小地方规划及', 0),
(12, 1, 'admin', 1480665426651, 'sdfgh\ndfghj\nsdfghdf\ndfgh\n', 0),
(13, 1, 'admin', 1480665428805, 'sdfgh\ndfghj\nsdfghdf\ndfgh\n', 0),
(14, 1, 'admin', 1480665442034, 'dfghj\ndfghjkl\ndfghj', 0),
(15, 1, 'admin', 1480665552138, 'dfghjsgbgb', 0),
(16, 1, 'admin', 1490669104114, '&lt;script>alert(12345678)&lt;/script>', 0);

-- --------------------------------------------------------

--
-- 表的结构 `reply_11`
--

CREATE TABLE `reply_11` (
  `id` int(11) NOT NULL,
  `uid` int(14) NOT NULL,
  `user` varchar(14) NOT NULL,
  `time` bigint(14) NOT NULL,
  `text` text NOT NULL,
  `del` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `reply_11`
--

INSERT INTO `reply_11` (`id`, `uid`, `user`, `time`, `text`, `del`) VALUES
(5, 1, 'admin', 1490686135646, '&lt;script>alert(6543456321234)&lt;/script>', 0);

-- --------------------------------------------------------

--
-- 表的结构 `reply_12`
--

CREATE TABLE `reply_12` (
  `id` int(11) NOT NULL,
  `uid` int(14) NOT NULL,
  `user` varchar(14) NOT NULL,
  `time` bigint(14) NOT NULL,
  `text` text NOT NULL,
  `del` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `reply_12`
--

INSERT INTO `reply_12` (`id`, `uid`, `user`, `time`, `text`, `del`) VALUES
(1, 1, 'admin', 1490688766569, '&lt;script&gt;alert(234567)&lt;/script&gt;', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app`
--
ALTER TABLE `app`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reply`
--
ALTER TABLE `reply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reply_1`
--
ALTER TABLE `reply_1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reply_2`
--
ALTER TABLE `reply_2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reply_3`
--
ALTER TABLE `reply_3`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reply_11`
--
ALTER TABLE `reply_11`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reply_12`
--
ALTER TABLE `reply_12`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `app`
--
ALTER TABLE `app`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- 使用表AUTO_INCREMENT `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `reply`
--
ALTER TABLE `reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `reply_1`
--
ALTER TABLE `reply_1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- 使用表AUTO_INCREMENT `reply_2`
--
ALTER TABLE `reply_2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- 使用表AUTO_INCREMENT `reply_3`
--
ALTER TABLE `reply_3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- 使用表AUTO_INCREMENT `reply_11`
--
ALTER TABLE `reply_11`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `reply_12`
--
ALTER TABLE `reply_12`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
