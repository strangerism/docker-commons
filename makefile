android-sdk-base:
	@docker build -t strangerism/android-sdk-base android-sdk-base/.

android-sdk-linphone-327:
	@docker build -t strangerism/android-sdk-linphone-327 android-sdk-linphone-327/.

all:
	@docker build -t strangerism/android-sdk-base android-sdk-base/.
	@docker build -t strangerism/android-sdk-linphone-327 android-sdk-linphone-327/.
