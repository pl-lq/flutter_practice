# lib ディレクトリ構成

機能（feature）ごとにフォルダを分け、各機能の中をさらにレイヤー分けする構成。

```
lib/
  core/                 # 全機能で共有するもの
    theme/              # アプリ全体のテーマ・色・フォント定義
    widgets/            # 共通UIパーツ（ボタン、ローディング表示など）
    utils/              # 日付フォーマットなど汎用ロジック
    errors/             # 共通の例外・エラー型

  features/
    camera/             # カメラ撮影機能
      presentation/     # 画面・Widget・状態管理（Webのcontrollerに近い）
      domain/           # ユースケース・ビジネスロジック・エンティティ（Webのserviceに近い）
      data/             # カメラ操作・ローカル保存の実装（Webのrepository/DAOに近い）

    gallery/            # 撮影した写真の一覧・閲覧
      presentation/
      domain/
      data/

    drive_sync/         # Googleドライブ連携（アップロード・認証など）
      presentation/
      domain/
      data/

    settings/           # アプリ設定
      presentation/
      domain/
      data/

  main.dart             # エントリーポイント
```

## 各レイヤーの役割

- **presentation**: 画面（Widget）と、画面の状態管理（StateNotifier/Bloc/Providerなど）。ユーザー操作の受け口。
- **domain**: 「写真をドライブにアップロードする」のようなユースケース。UIやデータ保存方法に依存しない純粋なロジック。
- **data**: 実際のAPI呼び出し・ローカルDB・プラットフォームAPI（camera, googleapisパッケージなど）とのやり取り。

## 機能を追加するとき

新しい機能ができたら `features/` の下に同じ3層構成のフォルダを追加する。
機能間で共有したくなったロジックが出てきたら `core/` に引き上げる。
