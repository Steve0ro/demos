FROM ubuntu:latest

LABEL maintainer="Steve0ro"

ENV OPT /opt
ENV CTF ${OPT}/CTF
ENV HOME /root
ENV DEBIAN_FRONTEND=noninteractive
ENV PYENV_ROOT ${HOME}/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

RUN mkdir ${OPT}/Tool && \ 
    mkdir ${OPT}/CTF && \
    mkdir ${CTF}/MALWARE && \
    mkdir ${CTF}/DECODE && \
    mkdir ${CTF}/FORENSICS && \
    mkdir ${CTF}/MISC && \
    mkdir ${CTF}/STEGO

RUN apt-get update -y && apt-get upgrade -y && apt-get update --fix-missing && apt-get install -y build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev curl libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev grep unzip binwalk \
    file grep openjdk-17-jdk openjdk-17-jre zsh wget vim bsdextrautils iproute2 git && apt-get update --fix-missing && . /etc/os-release && echo $VERSION_ID && \
    wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && rm packages-microsoft-prod.deb && apt-get update -y && apt-get install -y powershell && rm -rf /var/lib/apt/lists/* && \
    apt-get autoclean -y && apt-get autoremove -y && git clone https://github.com/danielbohannon/Revoke-Obfuscation ${OPT}/Tool/Revoke-Obfuscation && \
    curl https://pyenv.run | bash && echo "Y" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && apt-get autoclean -y && \
    apt-get autoremove -y && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions && \
    git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

COPY src/Cobalt_Not_Strike ${CTF}/MALWARE
COPY src/Decode_this_message ${CTF}/DECODE
COPY src/Fetch_Preposterous ${CTF}/FORENSICS
COPY src/Gimme_The_Loot ${CTF}/MISC
COPY src/Istego_Ustego ${CTF}/STEGO
COPY src/steve0ro.zsh-theme ${HOME}/.oh-my-zsh/themes/
COPY src/.zshrc ${HOME}
COPY src/requirements.txt ${HOME}

RUN pyenv update && pyenv install 3.11.3 && pyenv global 3.11.3 && pip install --upgrade pip && pip install --use-feature=fast-deps -r ${HOME}/requirements.txt