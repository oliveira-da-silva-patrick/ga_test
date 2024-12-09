FROM base_image

RUN mkdir -p /home/graphs/

RUN mkdir -p /home/project/fig/

COPY . /home/project/

WORKDIR /home/project/

RUN R -e "install.packages('renv', repos = c(CRAN = 'https://cloud.r-project.org'))"

RUN R -e "renv::restore()"

RUN R -e "targets::tar_make()"

CMD cp /home/project/fig/* /home/graphs
