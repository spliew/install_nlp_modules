# todo
* cabochaでエラー。
    ```sh
        param.cpp(69) [ifs] no such file or directory: /usr/local/etc/cabocharc
    ```
* --rc_files オプションでcabocharcの場所を指定すれば通る。

# install

## mecab
* インストール
    ```sh
        ./mecab_all.sh
    ```
* pyenv環境だと、iconvが複数あるといって怒られるかも。pyenv local system をしてからやれば良い。
* きちんとインストールされたかチェック
    ``` sh
        echo "インスタ映え" | mecab -d $HOME/.local/lib/mecab/dic/mecab-ipadic-neologd
    ```

## cabocha
* cabocha-python
    - anacondaの高いバージョンだと、失敗する。`python setup.py build`時のコンパイラの探索パスがanacondaの場所になることによる。
    - anaconda3-2.0.0 3-4.0.0 なら上手く行く。


# 参考資料
* [MeCabをUTF-8でインストールしたい。 - Qiita](https://qiita.com/junpooooow/items/0a7d13addc0acad10606)
* [MeCabとNEologdのインストール方法(CentOS6) - Qiita](https://qiita.com/bokotomo/items/3e9d78a4bc94c0314346)
* [Python3で形態素解析エンジンMeCabを使えるようにする(2016年3月版) - Qiita](https://qiita.com/grachro/items/4fbc9bf8174c5abb7bdd)
* [mecab]($DOCS/topics/mecab.md)
* [cabocha]($DOCS/topics/cabocha.md)
