# Mojo-Docker

Mojoは、PythonのシンプルさとRustのスピードとメモリの安全性を組み合わせたAI開発者向けの新しいプログラミング言語です。このガイドでは、Docker上でMojo環境を手軽に構築する手順を紹介します。
## 1. 前提条件
- Dockerおよびdocker-composeがインストールされていること
- 基本的なDockerの知識
## 2. Dockerイメージとコンテナをビルド 
1. `Dockerfile`と`docker-compose.yml`ファイルをプロジェクトディレクトリに保存します。 


```

# 使用するベースイメージ
FROM ubuntu:latest

# 必要なツールのインストール (curlなど)
RUN apt-get update && apt-get install -y curl

# 「Modular CLI」のインストール
RUN curl https://get.modular.com | \
    MODULAR_AUTH=mut_113031cad3ed4ad59cfeea0bead52d37 \
    sh -

# 「Mojo SDK」のインストール
RUN modular install mojo

# 環境変数の設定
ENV MODULAR_HOME /root/.modular
ENV PATH $MODULAR_HOME/pkg/packages.modular.com_mojo/bin:$PATH

```


```

version: '3'

services:
  mojo:
    build: 
      context: .
      dockerfile: Dockerfile
    volumes:
      - .:/home

    tty:
      true

```


2. ターミナルを開き、プロジェクトディレクトリに移動します。

```bash

$ cd E:\Prj\Mojo-Docker
``` 
3. Dockerイメージをビルドし、コンテナを起動します。

```bash

$ docker-compose up --build -d
```
## 3. Mojoを実行 
1. 作成されたMojoコンテナに接続します。

```bash

$ docker-compose exec mojo /bin/bash
``` 
2. コンテナのシェル内でMojoを起動します。

```bash

# mojo
```



出力:

```css

Welcome to Mojo! 🔥
Expressions are delimited by a blank line.
Type `:mojo help` for further assistance.
``` 
3. Mojoコンソール内でコマンドを実行してみましょう。

```bash

1>  print("Hello, world!")
```



出力:

```

Hello, world!
```
## 4. 終了

Mojoセッションを終了するには、`2>` の後に `:exit` を入力してEnterキーを押します。Dockerコンテナを停止するには、以下のコマンドを実行します。

```bash

$ docker-compose down
```

---

以上がDockerを使用してMojoを実行するためのステップバイステップガイドです。初心者の方も、この手順に沿って進めれば簡単にMojo環境を構築できるはずです。お試し下さい！
