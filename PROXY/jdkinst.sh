mkdir /usr/lib/jvm
jarch=$(find -name 'jdk.tar*' -print)
echo "JRE archive name: ${jarch}" 
jdir=$(tar -tzf ${jarch} | head -n1 | cut -d "/" -f1)
echo "java dir name: $jdir" 
tar -xzvf $jarch -C /usr/lib/jvm
update-alternatives --install /usr/bin/rmid rmid /usr/lib/jvm/${jdir}/bin/rmid 1
update-alternatives --install /usr/bin/java java /usr/lib/jvm/${jdir}/bin/java 1
update-alternatives --install /usr/bin/keytool keytool /usr/lib/jvm/${jdir}/bin/keytool 1
update-alternatives --install /usr/bin/jjs jjs /usr/lib/jvm/${jdir}/bin/jjs 1
update-alternatives --install /usr/bin/pack200 pack200 /usr/lib/jvm/${jdir}/bin/pack200 1
update-alternatives --install /usr/bin/rmiregistry rmiregistry /usr/lib/jvm/${jdir}/bin/rmiregistry 1
update-alternatives --install /usr/bin/unpack200 unpack200 /usr/lib/jvm/${jdir}/bin/unpack200 1
update-alternatives --install /usr/bin/orbd orbd /usr/lib/jvm/${jdir}/bin/orbd 1
update-alternatives --install /usr/bin/servertool servertool /usr/lib/jvm/${jdir}/bin/servertool 1
update-alternatives --install /usr/bin/tnameserv tnameserv /usr/lib/jvm/${jdir}/bin/tnameserv 1
update-alternatives --install /usr/bin/jexec jexec /usr/lib/jvm/${jdir}/lib/jexec 1
update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/${jdir}/bin/javac 1
update-alternatives --install /usr/bin/jar jar /usr/lib/jvm/${jdir}/bin/jar 1

update-alternatives --set rmid /usr/lib/jvm/${jdir}/bin/rmid
update-alternatives --set java /usr/lib/jvm/${jdir}/bin/java
update-alternatives --set keytool /usr/lib/jvm/${jdir}/bin/keytool
update-alternatives --set jjs /usr/lib/jvm/${jdir}/bin/jjs
update-alternatives --set pack200 /usr/lib/jvm/${jdir}/bin/pack200
update-alternatives --set rmiregistry /usr/lib/jvm/${jdir}/bin/rmiregistry
update-alternatives --set unpack200 /usr/lib/jvm/${jdir}/bin/unpack200
update-alternatives --set orbd /usr/lib/jvm/${jdir}/bin/orbd
update-alternatives --set servertool /usr/lib/jvm/${jdir}/bin/servertool
update-alternatives --set tnameserv /usr/lib/jvm/${jdir}/bin/tnameserv
update-alternatives --set jexec /usr/lib/jvm/${jdir}/lib/jexec
update-alternatives --set javac /usr/lib/jvm/${jdir}/bin/javac
update-alternatives --set jar /usr/lib/jvm/${jdir}/bin/jar
