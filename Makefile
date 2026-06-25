.PHONY: get run ios clean build-ios format analyze test doctor device run-device release-device

# 自分のiPhoneのデバイスID（複数台つなぐ場合は make run-device DEVICE_ID=xxxx で上書き可）
DEVICE_ID ?= 00008150-0006586911F3401C

get:
	flutter pub get

run:
	flutter run

ios:
	flutter run -d ios

build-ios:
	flutter build ios

# 接続中の実機の一覧を表示
device:
	@flutter devices

# 実機で開発実行（ホットリロード可、毎回 flutter run が必要）
run-device:
	flutter run -d $(DEVICE_ID)

# リリースビルドを実機にインストール（アイコンから単独起動できる）
release-device:
	flutter build ios --release
	xcrun devicectl device install app --device $(DEVICE_ID) build/ios/iphoneos/Runner.app

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
