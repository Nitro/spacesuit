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

EXPOSE 8080

CMD [ "mix", "run", "--no-halt" ]
