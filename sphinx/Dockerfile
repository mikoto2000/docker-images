FROM test-base

# ベースのアップグレード
RUN apt -y update
RUN apt -y upgrade && apt-get -y clean

# sphinx 環境構築
RUN apt -y install make && apt-get -y clean
RUN apt -y install sphinx-common && apt-get -y clean

# nodejs 環境構築
RUN echo "Acquire::http::Proxy { deb.nodesource.com DIRECT; };" >> /etc/apt/apt.conf.d/02proxy
RUN apt -y install curl && apt-get -y clean
RUN apt -y install gnupg1 gnupg2 && apt-get -y clean
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt -y install -y nodejs && apt-get -y clean

# textlint 環境構築
RUN npm install -g textlint
RUN npm install -g prh
RUN npm install -g textlint-rule-prh

RUN apt -y install -y python-pip && apt-get -y clean
RUN pip install docutils-ast-writer
RUN npm install -g textlint-plugin-rst

# textlint 結果可視化するための環境構築
RUN apt -y install lcov && apt-get -y clean
RUN npm install -g textlint-formatter-lcov

