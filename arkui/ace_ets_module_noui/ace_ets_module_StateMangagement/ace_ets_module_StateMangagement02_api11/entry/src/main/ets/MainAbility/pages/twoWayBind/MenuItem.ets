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
struct MenuItemTest {
  @State select: boolean = true;

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({
        content: '菜单选项',
      }).selected($$this.select).id('menuItem')
    }
  }

  build() {
    Row() {
      Text(`select: ${this.select}`).fontSize(9).id('menuItemText1').height('5%')
      Column() {
        Text('click to show menu')
          .height('5%')
          .fontSize(9)
          .fontWeight(FontWeight.Bold)
          .id('menuItemText')
      }
      .bindMenu(this.MyMenu)
      .width('100%')
    }
    .height('100%')
  }
}