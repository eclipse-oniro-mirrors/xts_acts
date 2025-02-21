/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct ImageApi {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller }

  @Builder
  panel() {
    Column() {
      Text('menu')
    }.width(256)
  }

  build() {
    Column({ space: 5 }) {
      Image($r('app.media.icon'))
        .width(100)
        .enableAnalyzer(true)
        .id('ImageApi_Image')


      QRCode('hello')
        .width(100)
        .height(100)
        .contentOpacity(1)

      RichEditor(this.options)
        .bindSelectionMenu(RichEditorSpanType.TEXT, this.panel, RichEditorResponseType.LONG_PRESS)
        .bindSelectionMenu(RichEditorSpanType.TEXT, this.panel, RichEditorResponseType.RIGHT_CLICK)
        .bindSelectionMenu(RichEditorSpanType.TEXT, this.panel, RichEditorResponseType.SELECT)
        .borderWidth(1)
        .borderColor(Color.Green)
        .width('60%')


      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column()
            .width('100%')
            .height('100%')
            .backgroundColor(Color.Red)
        }.tabBar(new SubTabBarStyle("red"))

        TabContent() {
          Column()
            .width('100%')
            .height('100%')
            .backgroundColor(Color.Blue)
        }.tabBar(new SubTabBarStyle("blue"))

      }
      .width(300)
      .height(200)
      .backgroundColor('#F1F3F5')
    }.width('100%')
  }
}
