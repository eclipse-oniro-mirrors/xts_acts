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
struct FocusScopePriority11 {
  @State select: boolean = true

  @Builder
  MyMenu(){
    Menu() {
      MenuItemGroup({ header: '焦点组' }) {
        MenuItem({
          content: '菜单选项',
        })
          .id('FocusScopePriority11_Item1_1')
        MenuItem({
          content: 'FocusPriority.PREVIOUS',
        })
          .focusScopePriority('FocusScopePriority11_focusGroup1', FocusPriority.PREVIOUS)
          .id('FocusScopePriority11_Item2_1')
      }.focusScopeId('FocusScopePriority11_focusGroup1', true)

      MenuItemGroup({ header: '非焦点组' }) {
        MenuItem({
          content: '菜单选项',
        })
          .id('FocusScopePriority11_Item1_2')
        MenuItem({
          content: 'FocusPriority.PRIOR',
        })
          .focusScopePriority('FocusScopePriority11_focusGroup2', FocusPriority.PRIOR)
          .id('FocusScopePriority11_Item2_2')
      }.focusScopeId('FocusScopePriority11_focusGroup2', false)
    }
  }

  build() {
    Column({space:10}) {
      Button('bindMenu 非子窗口')
        .bindMenu(this.MyMenu, {showInSubWindow: false})
        .id('FocusScopePriority11_open')

    }
    .width('100%')
  }
}