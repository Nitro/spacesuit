FROM elixir:1.7.4

ADD . /spacesuit

WORKDIR /spacesuit
RUN rm -rf _build
RUN mix local.rebar --force
RUN mix local.hex --force
RUN mix clean
RUN mix deps.get
RUN mix compile

EXPOSE 8080

CMD [ "mix", "run", "--no-halt" ]
