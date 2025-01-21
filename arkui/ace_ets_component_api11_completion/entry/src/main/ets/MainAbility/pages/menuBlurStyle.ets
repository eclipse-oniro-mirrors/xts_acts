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
struct menuBlurStyleExample {

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: $r("app.media.icon"), content: "菜单选项" })
      MenuItem({ startIcon: $r("app.media.icon"), content: "菜单选项" })
      MenuItem({ startIcon: $r("app.media.icon"), content: "菜单选项" })
    }
  }

  build() {
    Column({ space: 50 }) {
      Column() {
        Column() {
          Text('menuBlurStyle').key('menu_blurStyle')
            .width(200)
            .height(80)
            .textAlign(TextAlign.Center)
            .margin(100)
            .fontSize(25)
            .bindContextMenu(this.MyMenu, ResponseType.LongPress,
              { placement: Placement.Bottom,
                backgroundBlurStyle: BlurStyle.Thin
              })
            .backgroundColor("#ff3df2f5")
        }
      }.width('100%')
    }
  }
}