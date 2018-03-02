#
# Build stage
#
FROM fpco/stack-build:lts-10.7 as builder
MAINTAINER Pat Brisbin <pbrisbin@gmail.com>

ENV LANG en_US.UTF-8
ENV PATH /root/.local/bin:$PATH

RUN mkdir -p /build
WORKDIR /build

# Copy the stack file and setup stack
COPY stack.yaml /build/stack.yaml
RUN stack setup
# Copy the source files and install
COPY package.yaml /build/package.yaml
COPY app /build/app
COPY src /build/src
COPY Setup.hs /build/Setup.hs
COPY test /build/test
COPY README.md /build/README.md
COPY ChangeLog.md /build/ChangeLog.md
# Install
RUN stack --version
RUN stack install

#
# Runtime
#
FROM fpco/stack-run:lts-10.7
MAINTAINER Pat Brisbin <pbrisbin@gmail.com>

ENV LANG en_US.UTF-8

# Executables from build stage
COPY --from=builder /root/.local/bin/codeclimate-argon /usr/bin/codeclimate-argon

RUN mkdir -p /code
VOLUME /code
WORKDIR /code

RUN useradd app --uid 9000
USER app

# Reset fpco/stack-run's dumb ENTRYPOINT
ENTRYPOINT []
CMD ["/usr/bin/codeclimate-argon"]
