/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct bindMenuNullUndefinedExample {
  @State isShow: boolean = false
  @State isShow2: boolean = false
  @State isShow3: boolean = false
  @State isShow4: boolean = false
  @State isShow5: boolean = false
  @State isShow6: boolean = false

  @Builder
  MyMenu1() {
    Menu() {
      MenuItem({ content: '菜单1' }).id('menuItem_nullUn_1')
      MenuItem({ content: '菜单2' })
    }
  }

  @Builder
  MyMenu2() {
    Menu() {
      MenuItem({ content: '菜单1' }).id('menuItem_nullUn_2')
      MenuItem({ content: '菜单2' })
    }
  }

  build() {
    Column() {
      // ========== bindMenu tests ==========
      Text('bindMenu1')
      Row(){
        Button('null1')
          .id('bindMenu_content_null')
          .bindMenu(null)

        Button('undefined1')
          .id('bindMenu_content_undefined')
          .bindMenu(undefined)
      }.height('10%')

      Row(){
        Button('null2')
          .id('bindMenu_options_null')
          .bindMenu(this.MyMenu1(),null)

        Button('undefined2')
          .id('bindMenu_options_undefined')
          .bindMenu(this.MyMenu1(), undefined)
      }.height('10%')

      Text('bindMenu2')
      Row(){
        Button('isShow1')
          .id('bindMenu_isShow_null')
          .bindMenu(true, this.MyMenu1(), {
            showInSubWindow: false
          })

        Button('isShow2')
          .id('bindMenu_isShow_undefined')
          .bindMenu(false, this.MyMenu1(), {
            showInSubWindow: false
          })
      }.height('10%')

      Row(){
        Button('null2')
          .id('bindMenu_content_null_2')
          .onClick(()=>{
            this.isShow = true
          })
          .bindMenu(this.isShow!!, null, {
            showInSubWindow: false
          })

        Button('undefined2')
          .id('bindMenu_content_undefined_2')
          .onClick(()=>{
            this.isShow2 = true
          })
          .bindMenu(this.isShow2!!, undefined, {
            showInSubWindow: false
          })
      }.height('10%')

      Row(){
        Button('null3')
          .id('bindMenu_options_null_3')
          .onClick(()=>{
            this.isShow3 = true
          })
          .bindMenu(this.isShow3!!, this.MyMenu2(), null)

        Button('undefined3')
          .id('bindMenu_options_undefined_3')
          .onClick(()=>{
            this.isShow4 = true
          })
          .bindMenu(this.isShow4!!, this.MyMenu2(), undefined)
      }.height('10%')

      Text('showInSubWindow')
      Row(){
        Button('true')
          .id('bindMenu_showInSubWindow_true')
          .onClick(()=>{
            this.isShow5 = true
          })
          .bindMenu(this.isShow5!!, this.MyMenu2(), {
            showInSubWindow: true
          })
        Button('false')
          .id('bindMenu_showInSubWindow_false')
          .onClick(()=>{
            this.isShow6 = true
          })
          .bindMenu(this.isShow6!!, this.MyMenu2(), {
            showInSubWindow: false
          })
      }.height('10%')

    }.width('100%')
    .height('100%')
  }
}