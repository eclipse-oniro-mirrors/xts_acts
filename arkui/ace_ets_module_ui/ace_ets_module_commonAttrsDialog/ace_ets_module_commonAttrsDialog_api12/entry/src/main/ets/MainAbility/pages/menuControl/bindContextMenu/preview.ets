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
struct preview {
  private iconStr: ResourceStr = $r("app.media.icon")
  @State isShown: boolean = false
  @State text: string = "false"

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" })
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" })
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" })
    }
  }

  @Builder
  MyPreview() {
    Column() {
      Image($r('app.media.icon'))
        .id("MyPreview")
        .onClick(() => {
          this.text = "true";
        })
        .width("200px")
        .height("200px")
    }
  }

  build() {
    Column({ space: 10 }) {
      Text('preview-builder')
        .textAlign(TextAlign.Center)
        .bindContextMenu(this.isShown, this.MyMenu,
          {
            preview: this.MyPreview,
            onDisappear: () => {
              this.isShown = false;
            },
            previewAnimationOptions: { scale: [0.8, 1.0] },
          })
      Button(this.text)
        .id("preview")
        .onClick(() => {
          this.isShown = true;
        })

    }
    .justifyContent(FlexAlign.Center)
    .height('100%')
    .width('100%')
  }
}