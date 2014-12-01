FROM tomxiong/node_1026_ghost_apmagent:0.0.1
MAINTAINER Tom Xiong<tomxiongzh@gmail.com>

# Set correct environment variables.
ENV HOME /root

# Add ghost start file to runit
ADD uploadmgr.sh /etc/my_init.d/01_uplodmgr.sh
ADD quest-fglam.sh /etc/my_init.d/02_fglam.sh
ADD ghost-start.sh /etc/my_init.d/03_ghost.sh

# Set environment variables.
ENV PATH $PATH:/nodejs/bin
ENV NODE_ENV production

# Define mountable directories.
VOLUME ["/data", "/ghost-override"]

# Define working directory.
WORKDIR /ghost

# Expose ports.
EXPOSE 2368


# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
#RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]
