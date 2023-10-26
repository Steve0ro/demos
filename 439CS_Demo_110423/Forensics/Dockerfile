FROM ubuntu:latest

LABEL maintainer="Steve0ro"

ENV OPT /opt
ENV HOME /root
ENV DFIR ${OPT}/dfir_data
ENV DEBIAN_FRONTEND=noninteractive
ENV PYENV_ROOT ${HOME}/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

RUN mkdir ${OPT}/Tool && \ 
    mkdir ${OPT}/dfir_data && \
    mkdir ${DFIR}/malware

RUN apt-get update -y && apt-get upgrade -y && apt-get update --fix-missing && apt-get install -y --no-install-recommends \
    gcc iputils-ping yara jq gron wget apt-transport-https software-properties-common zip zsh binwalk llvm build-essential \
    libssl-dev zlib1g-dev libbz2-dev libreadline-dev vim libsqlite3-dev curl libncursesw5-dev xz-utils \
    tk-dev git libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev grep hexedit highlight libfuse2 \
    libguestfs-tools libncurses5-dev net-tools p7zip-full p7zip-rar poppler-utils reglookup sqlite3-tools tar tshark \
    unrar unzip && apt-get update --fix-missing 
    
RUN . /etc/os-release && echo $VERSION_ID && \
    wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && rm packages-microsoft-prod.deb && apt-get update && apt-get install -y powershell && rm -rf /var/lib/apt/lists/* && \
    curl https://pyenv.run | bash && echo "Y" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    apt-get autoclean -y && apt-get autoremove -y

# Git Repos
RUN git clone https://github.com/danielbohannon/Revoke-Obfuscation ${OPT}/Tool/Revoke-Obfuscation && \
    git clone https://github.com/DidierStevens/DidierStevensSuite ${OPT}/Tool/DidierStevensSuite && \
    git clone https://github.com/decalage2/oletools ${OPT}/Tool/oletools && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions && \
    git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
  

COPY src/unzip_me.zip ${DFIR}
COPY src/caution.zip ${DFIR}
COPY src/steve0ro.zsh-theme ${HOME}/.oh-my-zsh/themes/
COPY src/.zshrc ${HOME}
COPY src/requirements.txt ${HOME}

RUN pyenv update && pyenv install 3.11.3 && pyenv global 3.11.3 && \
    pip install --upgrade pip && pip install --use-feature=fast-deps -r ${HOME}/requirements.txt && \
    rm -rf ${HOME}/requirements.txt && unzip -d ${DFIR} ${DFIR}/unzip_me.zip && unzip -d ${DFIR}/unzip_me ${DFIR}/unzip_me/logs.zip && \
    unzip -d ${DFIR}/malware ${DFIR}/caution.zip && gunzip ${DFIR}/malware/caution/attacks.pcapng.gz && \
    unzip -d ${DFIR}/unzip_me ${DFIR}/unzip_me/prefetch.zip && mv ${DFIR}/unzip_me/* ${DFIR} && rm -rf ${DFIR}/*.zip ${DFIR}/unzip_me