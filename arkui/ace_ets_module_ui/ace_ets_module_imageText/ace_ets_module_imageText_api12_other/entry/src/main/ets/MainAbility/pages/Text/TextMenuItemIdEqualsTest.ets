/*
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
struct TextMenuItemIdEqualsTest {
  @State text: string = 'Text editMenuOptions'
  @State textArea: string = 'TextArea editMenuOptions'
  @State textInput: string = 'TextInput editMenuOptions'

  onCreateMenu1(menuItems: Array<TextMenuItem>) {
    menuItems.forEach((value, index) => {
      value.icon = $r('app.media.icon')
      if (value.id.equals(TextMenuItemId.COPY)) {
        value.content = 'Copy_Custom'
        AppStorage.setOrCreate('TextMenuItemIdEquals1',value.id.equals(TextMenuItemId.COPY))
        console.log('TextMenuItemIdEquals1'+AppStorage.get('TextMenuItemIdEquals1'))
      }
    })
    return menuItems
  }
  onCreateMenu2(menuItems: Array<TextMenuItem>) {
    AppStorage.setOrCreate('TextMenuItemIdEquals2',menuItems[0].id.equals(TextMenuItemId.AI_WRITER))
    console.log('TextMenuItemIdEquals2'+AppStorage.get('TextMenuItemIdEquals2'))
    return menuItems
  }
  // 自定义键盘组件
  @Builder CustomKeyboardBuilder() {
    Column() {
    }.backgroundColor(Color.Gray).height(0)
  }
  build() {
    Column() {
      TextInput({text:this.text})
        .id('TextEditMenuOptions1')
        .fontSize(15)
        .textAlign(TextAlign.Center)
        .editMenuOptions({
          onCreateMenu: this.onCreateMenu1, onMenuItemClick: (menuItem: TextMenuItem, textRange: TextRange) => {
            if (menuItem.id.equals(TextMenuItemId.of('custom2'))) {
              console.log('Intercepted id: custom2 start:' + textRange.start + '; end:' + textRange.end)
              return true;
            }
            if (menuItem.id.equals(TextMenuItemId.COPY)) {
              console.log('Intercepted COPY start:' + textRange.start + '; end:' + textRange.end)
              return true;
            }
            if (menuItem.id.equals(TextMenuItemId.SELECT_ALL)) {
              console.log('Did not intercept SELECT_ALL start:' + textRange.start + '; end:' + textRange.end)
              return false;
            }
            return false;
          }
        })
        .customKeyboard(this.CustomKeyboardBuilder)
        .height('10%')
      TextInput({text:this.text})
        .id('TextEditMenuOptions2')
        .fontSize(15)
        .textAlign(TextAlign.Center)
        .editMenuOptions({
          onCreateMenu: this.onCreateMenu2, onMenuItemClick: (menuItem: TextMenuItem, textRange: TextRange) => {
            if (menuItem.id.equals(TextMenuItemId.of('custom2'))) {
              console.log('Intercepted id: custom2 start:' + textRange.start + '; end:' + textRange.end)
              return true;
            }
            if (menuItem.id.equals(TextMenuItemId.COPY)) {
              console.log('Intercepted COPY start:' + textRange.start + '; end:' + textRange.end)
              return true;
            }
            if (menuItem.id.equals(TextMenuItemId.SELECT_ALL)) {
              console.log('Did not intercept SELECT_ALL start:' + textRange.start + '; end:' + textRange.end)
              return false;
            }
            return false;
          }
        })
        .customKeyboard(this.CustomKeyboardBuilder)
        .height('10%')
    }
    .width('90%')
    .margin('5%')
  }
}