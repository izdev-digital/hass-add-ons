ARG BUILD_FROM
FROM izdevdigital/e-paper-dashboard:0.0.4

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
