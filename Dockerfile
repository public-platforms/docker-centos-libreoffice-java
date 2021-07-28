FROM centos:8.3.2011
VOLUME /tmp

RUN yum -y install wget && yum -y install java-1.8.0-openjdk-devel && yum -y install libSM

RUN wget  http://mirrors.ustc.edu.cn/tdf/libreoffice/stable/7.1.5/rpm/x86_64/LibreOffice_7.1.5_Linux_x86-64_rpm.tar.gz \
  && wget http://mirrors.ustc.edu.cn/tdf/libreoffice/stable/7.1.5/rpm/x86_64/LibreOffice_7.1.5_Linux_x86-64_rpm_sdk.tar.gz \
  && wget http://mirrors.ustc.edu.cn/tdf/libreoffice/stable/7.1.5/rpm/x86_64/LibreOffice_7.1.5_Linux_x86-64_rpm_langpack_zh-CN.tar.gz \
  && tar -zxvf LibreOffice_7.1.5_Linux_x86-64_rpm.tar.gz \
  && tar -zxvf LibreOffice_7.1.5_Linux_x86-64_rpm_sdk.tar.gz \
  && tar -zxvf LibreOffice_7.1.5_Linux_x86-64_rpm_langpack_zh-CN.tar.gz \
  && yum -y localinstall /LibreOffice_7.1.5.2_Linux_x86-64_rpm/RPMS/*.rpm \
  && yum -y localinstall /LibreOffice_7.1.5.2_Linux_x86-64_rpm_sdk/RPMS/*.rpm \
  && yum -y localinstall /LibreOffice_7.1.5.2_Linux_x86-64_rpm_langpack_zh-CN/RPMS/*.rpm

RUN rm LibreOffice_7.1.5_Linux_x86-64_rpm.tar.gz \
  && rm LibreOffice_7.1.5_Linux_x86-64_rpm_sdk.tar.gz \
  && rm LibreOffice_7.1.5_Linux_x86-64_rpm_langpack_zh-CN.tar.gz \
  && rm -rf LibreOffice_7.1.5.2_Linux_x86-64_rpm \
  && rm -rf LibreOffice_7.1.5.2_Linux_x86-64_rpm_sdk \
  && rm -rf LibreOffice_7.1.5.2_Linux_x86-64_rpm_langpack_zh-CN

ADD fonts/* /usr/share/fonts/
RUN mkfontscale && mkfontdir

# RUN yum clean all