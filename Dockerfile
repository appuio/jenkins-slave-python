# extend the official jenkins slave base image
FROM openshift/jenkins-slave-base-centos7

# specify wanted version of python
ENV PYTHON_VERSION 3.6.1

# install python
RUN set -x \
    && yum install -y \
        gcc \
        make \
        wget \
        zlib-devel \
    && cd /tmp \
    && wget https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz \
    && tar xzf Python-${PYTHON_VERSION}.tgz \
    && cd Python-${PYTHON_VERSION} \
    && ./configure \
    && make altinstall \
    && cd .. \
    && rm -rf Python-${Python_VERSION} \
    && yum remove gcc wget \
    && yum clean all -y

# TODO: install oc if needed?
# TODO: ...