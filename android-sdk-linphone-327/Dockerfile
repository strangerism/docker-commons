FROM strangerism/android-sdk-base:latest

MAINTAINER Massimo Virgilio

ARG ANDROID_COMPILE_SDK="25"
ARG ANDROID_BUILD_TOOLS="24.0.0"
ARG ANDROID_SDK_TOOLS="24.4.1"

ENV HOME /opt

WORKDIR $HOME

# add androind user group
RUN groupadd android

# Add Android SDK path
ENV ANDROID_HOME $HOME/android-sdk-linux

 # This is the place where will sit the .android folder commonly used
 # by `android create avd` and `emulator64-x86 -avd test`
 # Without this the two commande uses different folder and produce an error of mismatch
 ENV ANDROID_SDK_HOME $ANDROID_HOME 

RUN curl https://dl.google.com/android/android-sdk_r${ANDROID_SDK_TOOLS}-linux.tgz | tar xz \
 && echo y  | $ANDROID_HOME/tools/android update sdk --no-ui --all --filter android-${ANDROID_COMPILE_SDK} \
 && echo y  | $ANDROID_HOME/tools/android update sdk --no-ui --all --filter platform-tools \
 && echo y  | $ANDROID_HOME/tools/android update sdk --no-ui --all --filter build-tools-${ANDROID_BUILD_TOOLS} \
 && echo y  | $ANDROID_HOME/tools/android update sdk --no-ui --all --filter extra-android-m2repository \
 && echo y  | $ANDROID_HOME/tools/android update sdk --no-ui --all --filter extra-google-google_play_services \
 && echo y  | $ANDROID_HOME/tools/android update sdk --no-ui --all --filter extra-google-m2repository \
 && echo y  | $ANDROID_HOME/tools/android update sdk --no-ui --all --filter sys-img-x86-google_apis-${ANDROID_COMPILE_SDK} \
 && echo no | $ANDROID_HOME/tools/android create avd -n test -t android-${ANDROID_COMPILE_SDK} --abi google_apis/x86 \
 && echo y  | $ANDROID_HOME/tools/android update sdk -u -a -t build-tools-25.0.2 && \
 && echo y  | $ANDROID_HOME/tools/android update sdk -u -a -t android-23 \
 && chgrp -R android $ANDROID_HOME && chmod -R 775 $ANDROID_HOME
ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# # adding gradle dependencies
# RUN echo y | android update sdk -u -a -t build-tools-25.0.2 && \
# 	echo y | android update sdk -u -a -t android-23

# Add android-wait-for-emulator executable
RUN mkdir -p bin \
 && cd bin \
 && curl https://raw.githubusercontent.com/travis-ci/travis-cookbooks/0f497eb71291b52a703143c5cd63a217c8766dc9/community-cookbooks/android-sdk/files/default/android-wait-for-emulator > android-wait-for-emulator \
 && chmod +x android-wait-for-emulator \
 && chgrp -R android $HOME/bin && chmod -R 775 $HOME/bin
ENV PATH $PATH:$HOME/bin

# Add Android NDK
RUN curl https://dl.google.com/android/repository/android-ndk-r12b-linux-x86_64.zip > android-ndk-r12b.zip \
 && unzip android-ndk-r12b.zip \
 && rm android-ndk-r12b.zip \
 && chgrp -R android $ANDROID_NDK_HOME && chmod -R 775 $ANDROID_NDK_HOME
ENV ANDROID_NDK_HOME $HOME/android-ndk-r12b
ENV PATH $PATH:$ANDROID_NDK_HOME

