FROM elixir:1.8.2

ADD . /spacesuit

WORKDIR /spacesuit
RUN rm -Rf {_build,data.nonode@nohost,log.nonode@nohost,deps,mix.lock,tmp}
RUN rm -rf _build
RUN mix local.rebar --force
RUN mix local.hex --force
RUN mix clean
RUN mix deps.get
RUN mix compile

RUN wget https://github.com/redboxllc/scuttle/releases/download/v1.3.1/scuttle-linux-amd64.zip \
  && unzip scuttle-linux-amd64.zip \
  && mv scuttle /usr/bin \
  && chmod +x /usr/bin/scuttle \
  && rm scuttle-linux-amd64.zip

EXPOSE 8080

CMD [ "scuttle", "mix", "run", "--no-halt" ]
