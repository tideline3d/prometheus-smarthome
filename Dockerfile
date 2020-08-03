FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive 
RUN apt-get update && \        
     apt-get install -y git golang
WORKDIR /home
RUN git clone https://github.com/nik-johnson-net/prometheus-smarthome.git
#Set working directory
WORKDIR /home/prometheus-smarthome/cmd/prometheus-smarthome
RUN go build
ENTRYPOINT ["/home/prometheus-smarthome/cmd/prometheus-smarthome/prometheus-smarthome", " -port 2112"]