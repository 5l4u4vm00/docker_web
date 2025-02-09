FROM ubuntu:24.04

WORKDIR /root/workspace

RUN apt update

# Some basic tools for development
RUN apt install -y build-essential curl fish git tmux vim neovim make

# Some basic tools for vue.
RUN apt install -y npm nodejs dotnet-sdk-8.0
ENV ASPNETCORE_URLS http://*:5209
# Set the neovim config
RUN git clone -b Ubuntu https://github.com/5l4u4vm00/neovimoption.git ~/.config/nvim
RUN rm -rf ~/.config/nvim/.git
RUN rm -f ~/.config/nvim/.gitignore

# Install Laygit
RUN curl -Lo go1.23.6.linux-amd64.tar.gz "https://go.dev/dl/go1.23.6.linux-amd64.tar.gz"
RUN tar -C /usr/local -xzf go1.23.6.linux-amd64.tar.gz
ENV PATH="$PATH:/usr/local/go/bin"
RUN go install github.com/jesseduffield/lazygit@latest
RUN mv /root/go/bin/lazygit /usr/local/bin/
RUN rm -r /root/go
