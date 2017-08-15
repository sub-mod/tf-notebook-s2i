FROM submod/tf-base-notebook

MAINTAINER Subin Modeel <smodeel@redhat.com>


USER root

LABEL io.k8s.description="S2I builder for Jupyter (minimal-notebook)." \
      io.k8s.display-name="Jupyter (minimal-notebook)" \
      io.openshift.expose-services="8888:http" \
      io.openshift.tags="builder,python,jupyter" \
	  io.openshift.s2i.scripts-url="image:///opt/app-root/s2i/bin"



COPY s2i /opt/app-root/s2i


RUN chgrp -Rf root /home/$NB_USER && chmod -Rf g+w /home/$NB_USER


RUN chmod g+w /etc/passwd

USER 1000

CMD [ "/opt/app-root/s2i/bin/run" ]