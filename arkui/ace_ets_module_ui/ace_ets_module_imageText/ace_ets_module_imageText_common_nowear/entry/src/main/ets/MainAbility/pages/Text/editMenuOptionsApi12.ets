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
struct TextEditMenuOptionsApi12 {
  @State text: string = 'Text editMenuOptions'
  @State textArea: string = 'TextArea editMenuOptions'
  @State textInput: string = 'TextInput editMenuOptions'

  onCreateMenu(menuItems: Array<TextMenuItem>) {
    menuItems.forEach((value, index) => {
      value.icon = $r('app.media.icon')
      if (value.id.equals(TextMenuItemId.COPY)) {
        value.content = 'Copy_Custom'
      }
      if (value.id.equals(TextMenuItemId.SELECT_ALL)) {
        value.content = 'Select All_Custom'
      }
    })
    let item1: TextMenuItem = {
      content: 'Custom 1',
      icon: $r('app.media.icon'),
      id: TextMenuItemId.of('Custom 1'),
    }
    let item2: TextMenuItem = {
      content: 'Custom 2',
      id: TextMenuItemId.of('Custom 2'),
      icon: $r('app.media.icon'),
    }
    menuItems.push(item1)
    menuItems.unshift(item2)
    return menuItems
  }

  build() {
    Column() {
      Text(this.text)
        .id('TextEditMenuOptions')
        .fontSize(15)
        .copyOption(CopyOptions.LocalDevice)
        .editMenuOptions({
          onCreateMenu: this.onCreateMenu, onMenuItemClick: (menuItem: TextMenuItem, textRange: TextRange) => {
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
        .height('10%')

      TextArea({ text:this.textArea })
        .id('TextAreaEditMenuOptions')
        .fontSize(15)
        .copyOption(CopyOptions.LocalDevice)
        .editMenuOptions({
          onCreateMenu: this.onCreateMenu, onMenuItemClick: (menuItem: TextMenuItem, textRange: TextRange) => {
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
        .height('10%')

      TextInput({ text:this.textInput })
        .id('TextInputEditMenuOptions')
        .fontSize(15)
        .copyOption(CopyOptions.LocalDevice)
        .editMenuOptions({
          onCreateMenu: this.onCreateMenu, onMenuItemClick: (menuItem: TextMenuItem, textRange: TextRange) => {
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
        .height('10%')
    }
    .width('90%')
    .margin('5%')
  }
}