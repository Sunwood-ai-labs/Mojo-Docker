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