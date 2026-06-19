.PHONY: get run ios clean build-ios format analyze test doctor

get:
	flutter pub get

run:
	flutter run

ios:
	flutter run -d ios

build-ios:
	flutter build ios

clean:
	flutter clean

format:
	dart format .

analyze:
	flutter analyze

test:
	flutter test

doctor:
	flutter doctor
