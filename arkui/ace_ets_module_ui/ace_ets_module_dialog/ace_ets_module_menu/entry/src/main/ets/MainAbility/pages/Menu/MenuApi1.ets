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
struct MenuApi1 {
  @State text:string = ''

  @Builder
  MyMenu() {
      Menu() {
        MenuItem({
          content: "菜单选项",
        }).height('8%')
        MenuItem({
          content: "菜单选项",
        }).height('8%')
        MenuItem({
          startIcon: $r("app.media.app_icon"),
          content: "菜单选项",
        }).height('8%')
        MenuItem({
          content: "菜单选项",
        }).height('8%')

      }.height('80%')
      .menuItemDivider(undefined)
      .id('Menu')

      Text(this.text).id('MenuApi1_text1')
      Button('getInspectorByKey').onClick(() => {
        this.text = String(JSON.parse(getInspectorByKey('Menu')).$attrs.menuItemDivider)
      }).id('MenuApi1_btn2')

  }

  build() {
    Column({ space: 20 }) {
      Button('bindMenu')
        .bindMenu(this.MyMenu, {
          showInSubWindow: false
        })
        .width('100%')
        .id('MenuApi1_btn1')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}