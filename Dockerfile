FROM continuumio/miniconda

RUN apt-get install unzip

RUN useradd -ms /bin/bash wyte
USER wyte
WORKDIR /home/wyte

COPY --chown=wyte:wyte . ./shbaam
WORKDIR /home/wyte/shbaam
COPY environment.yml .

RUN conda env create -f environment.yml
SHELL ["/bin/bash", "-c"]

CMD source activate shbaam && \
    cd tst && \
    ./tst_pub_dwnl_David_etal_201x_SER.sh && \
    ./tst_pub_repr_David_etal_201x_SER.sh
