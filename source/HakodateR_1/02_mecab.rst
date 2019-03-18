Mecab
=========

日本語を名詞や動詞などにわけて解析(形態素解析)するなら、MeCabを使おう!

CentOS
------------

.. code-block:: bash
   
   sudo yum install https://packages.groonga.org/centos/groonga-release-latest.noarch.rpm
   sudo yum install groonga
   sudo yum install mecab
   sudo yum install mecab-ipadic
   sudo yum install mecab-devel

Ubuntu
-----------

.. code-block:: bash
   
   sudo apt-get install mecab
   sudo apt-get install libmecab-dev
   sudo apt-get install mecab-ipadic-utf8

Mac
----------

.. code-block:: bash
   
   brew install mecab
   brew install mecab-ipadic

Windows
----------

* `github <http://taku910.github.io/mecab/>`_ から.exe(実行ファイル)をダウンロード
* `こちらからも <https://github.com/ikegami-yukino/mecab/releases/tag/v0.996>`_ ダウンロードできます。
* mecab-0.996.exeを実行してインストール

RMeCab
==========

RでMeCabを使うためのパッケージ

.. code-block:: R

   install.packages("RMeCab", repos = "http://rmecab.jp/R")

WordCloud
============

wordcloudという図をつくるためのパッケージ

.. code-block:: R

   install.packages("wordcloud")

フォント
-------------

念の為、フォントのインストールも載せておく

.. code-block:: bash

   fc-list | grep Gothic
   sudo yum install ipa-pgothic-fonts

実際にやってみよう!
========================

.. literalinclude:: ../../src_R/wordcloud.R
   :language: R


