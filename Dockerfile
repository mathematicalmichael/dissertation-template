FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    texlive-base \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra

RUN apt-get install -y \
    latexmk

# make
RUN apt-get install -y \
    build-essential

# extras
#RUN apt-get install -y \
    #dvipng \
    #ghostscript \
    #fonts-dejavu \
    #texlive \
    #texlive-latex-recommended \
    #texlive-science \
    
# poster
RUN apt-get install -y \
    fonts-lato \
    lmodern \
    context \
    texlive-luatex \
    ;    
RUN context --generate && \
    mtxrun --script fonts --reload

RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && apt-get autoremove -y
