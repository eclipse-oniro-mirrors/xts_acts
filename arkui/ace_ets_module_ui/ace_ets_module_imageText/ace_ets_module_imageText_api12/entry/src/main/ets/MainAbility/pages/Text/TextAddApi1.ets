/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
struct TextAddApi1 {
  @State text: string = 'editMenuOptions'

  onCreateMenu(menuItems: Array<TextMenuItem>) {
    menuItems.forEach((value, index) => {
      value.icon = $r('app.media.icon')
      if (value.id.equals(TextMenuItemId.COPY)) {
        value.content = '复制change'
      }
      if (value.id.equals(TextMenuItemId.SELECT_ALL)) {
        value.content = '全选change'
      }
      if (value.id.equals(TextMenuItemId.CUT)) {
        value.content = 'CUT'
      }
      if (value.id.equals(TextMenuItemId.PASTE)) {
        value.content = 'PASTE'
      }
      if (value.id.equals(TextMenuItemId.COLLABORATION_SERVICE)) {
        value.content = 'COLLABORATION_SERVICE'
      }
      if (value.id.equals(TextMenuItemId.CAMERA_INPUT)) {
        value.content = 'CAMERA_INPUT'
      }
    })
    let item1: TextMenuItem = {
      content: 'custom1',
      icon: $r('app.media.icon'),
      id: TextMenuItemId.of('custom1'),
    }
    let item2: TextMenuItem = {
      content: 'custom2',
      id: TextMenuItemId.of('custom2'),
      icon: $r('app.media.icon'),
    }
    menuItems.push(item1)
    menuItems.unshift(item2)
    return menuItems
  }

  build() {
    Column() {
      Search()
        .key('SearchAddApi1')
        .editMenuOptions({
          onCreateMenu: this.onCreateMenu, onMenuItemClick: (menuItem: TextMenuItem, textRange: TextRange) => {
            if (menuItem.id.equals(TextMenuItemId.of('custom2'))) {
              console.log('拦截 id: custom2 start:' + textRange.start + '; end:' + textRange.end)
              return true;
            }
            if (menuItem.id.equals(TextMenuItemId.COPY)) {
              console.log('拦截 COPY start:' + textRange.start + '; end:' + textRange.end)
              return true;
            }
            if (menuItem.id.equals(TextMenuItemId.SELECT_ALL)) {
              console.log('不拦截 SELECT_ALL start:' + textRange.start + '; end:' + textRange.end)
              return false;
            }
            return false;
          }
        })

      Text(this.text)
        .key('TextAddApi1')
        .fontSize(20)
        .copyOption(CopyOptions.LocalDevice)
        .editMenuOptions({
          onCreateMenu: this.onCreateMenu, onMenuItemClick: (menuItem: TextMenuItem, textRange: TextRange) => {
            if (menuItem.id.equals(TextMenuItemId.of('custom2'))) {
              console.log('拦截 id: custom2 start:' + textRange.start + '; end:' + textRange.end)
              return true;
            }
            if (menuItem.id.equals(TextMenuItemId.COPY)) {
              console.log('拦截 COPY start:' + textRange.start + '; end:' + textRange.end)
              return true;
            }
            if (menuItem.id.equals(TextMenuItemId.SELECT_ALL)) {
              console.log('不拦截 SELECT_ALL start:' + textRange.start + '; end:' + textRange.end)
              return false;
            }
            return false;
          }
        })
        .margin({ top: 100 })
    }
    .width('90%')
    .margin('5%')
  }
}