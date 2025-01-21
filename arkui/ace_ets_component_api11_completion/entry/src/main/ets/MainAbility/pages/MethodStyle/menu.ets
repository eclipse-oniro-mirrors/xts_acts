/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
struct Index1 {
  private iconStr: ResourceStr = $r("app.media.icon");
  @State preview: string = '';
  @State start: number = 0.1;
  @State end: number = 0.8;

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" })
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" })
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" })
    }
  }

  build() {
    Column({ space: 50 }) {
      Column() {
        Column() {
          Text('' + this.start).id('preview_start')
          Text('' + this.end).id('preview_end')
          Text('preview-image')
            .width(200)
            .height(100)
            .textAlign(TextAlign.Center)
            .margin(100)
            .fontSize(30)
            .id('preview-image')
            .bindContextMenu(this.MyMenu, ResponseType.LongPress,
              {
                preview: MenuPreviewMode.IMAGE,
                previewAnimationOptions: { scale: [this.start, this.end] },
              })
            .backgroundColor("#ff3df2f5")

          Button('change开始').onClick(() => {
            this.start = 10
          }).id('button_start_preview')

          Button('change结束').onClick(() => {
            this.end = 20
          }).id('button_end_preview')

        }
      }.width('100%')
    }
  }
}