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

//Menu禁用
@Entry
@Component
struct menuEnabledDemo {
  @State mText: string  ='init'
  @Builder
  SubMenu() {
    Menu() {
      MenuItem({ content: "text1" })
      MenuItem({ content: "text2" })
    }.key("menuEnd")
  }

  @Builder
  MyMenu(){
    Menu() {
      MenuItem({
        content: "一级菜单",
        builder: this.SubMenu.bind(this)
      }).key('menuEnabled')
    }.enabled(false)
  }

  build() {
    Column({ space: 10 }) {
      Column() {
        Text("bindMenu-禁用")
      }
      .key("bindMenuEnd")
      .width('100%')
      .margin(30)
      .bindMenu([
        {
          value: 'Menu',
          action: () => {
            console.info('handle Menu select')
          }
        }
      ]).enabled(false)



      Column() {
        Text('menu禁用，无法点出二级').key('cmEnd')
      }
      .bindMenu(this.MyMenu)
      .width('100%')
      Text(this.mText).key('text')
      Button('test').onClick((event: ClickEvent) => {
        this.mText = 'enabled'
      }).key('change')
    }
  }
}