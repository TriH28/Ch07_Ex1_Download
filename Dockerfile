# Sử dụng Tomcat 9 + JDK 17
FROM tomcat:9.0-jdk17

# Xóa các ứng dụng mặc định của Tomcat (ROOT, docs, examples…)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR file của bạn vào Tomcat
# Nếu bạn build ra file .war (vd: ch07_ex1_download.war), copy vào đây
COPY ./ch07_ex1_download_war.war /usr/local/tomcat/webapps/ROOT.war

# Mở port 8080
EXPOSE 8080

# Chạy Tomcat
CMD ["catalina.sh", "run"]
