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
struct aboutToAppearFalse {
  private iconStr: ResourceStr = $r("app.media.icon");
  @State isShown: boolean = false;
  @State arr: Array<String> = [];

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" })
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" })
      MenuItem({ startIcon: this.iconStr, content: "菜单选项" })
    }
  }

  build() {
    Column({ space: 10 }) {

      Text('aboutToAppearFalse')
        .textAlign(TextAlign.Center)
        .bindContextMenu(this.isShown, this.MyMenu, {
          aboutToAppear: () => {
            this.arr.push("aboutToAppear");
          },
          onAppear: () => {
            this.arr.push("onAppear");
            this.isShown = false;
          }
        })
      Button('click')
        .id("aboutToAppearFalse")
        .onClick(() => {
          this.isShown = !this.isShown;
        })

      Text(this.arr.toString()).id("aboutToAppearFalseText")
    }
    .justifyContent(FlexAlign.Center)
    .height('100%')
    .width('100%')
  }
}