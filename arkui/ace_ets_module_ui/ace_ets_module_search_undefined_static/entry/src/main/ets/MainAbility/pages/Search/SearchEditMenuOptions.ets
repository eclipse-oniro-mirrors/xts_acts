'use static'

/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {
  Entry,
  Component,
  TextMenuItem,
  ResourceStr,
  RichEditorController,
  RichEditorOptions,
  RichEditor,
  TextRange,
  Column,
  TextMenuItemId,
  $r,
  Button,
  TextArea,
  TextInput,
  Search,
  Color,
  Text,
  CopyOptions,
  ClickEvent,
  EditMenuOptions
} from '@ohos.arkui.component'
import {
  State,

} from '@ohos.arkui.stateManagement'
@Entry
@Component
struct editMenuOptionsExample {
  @State changeValue:boolean = true;
  @State content: ResourceStr = '';
  @State searchLabelInfo: ResourceStr | undefined = '';

  onCreateMenu(menuItems: Array<TextMenuItem>) {
    let item1: TextMenuItem = {
      content: '123456',
      icon: $r('app.media.icon'),
      id: TextMenuItemId.of('custom1'),
      labelInfo: 'abc123456'
    }
    let item3: TextMenuItem = {
      content: '111111',
      icon: $r('app.media.icon'),
      id: TextMenuItemId.of('custom1'),
      labelInfo: undefined
    }
    let item2: TextMenuItem = {
      content: 'custom2',
      id: TextMenuItemId.of('custom2'),
      icon: $r('app.media.icon'),
      labelInfo: $r('app.media.icon')
    }

    let extensionMenuItems: TextMenuItem[] = [];

    extensionMenuItems.push(item1);
    extensionMenuItems.push(item3);
    extensionMenuItems.unshift(item2);
    return extensionMenuItems;
  }


  build() {
    Column(undefined) {
      Button(`${this.changeValue}`)
        .id('button_ChangeValue')
        .onClick((e:ClickEvent)=>{
          this.changeValue = !this.changeValue;
        })
      Text('回调content:'+this.content)
      Text(this.searchLabelInfo)
        .id('searchLabelInfo')
      Search({value: 'search'})
        .width('95%')
        .copyOption(CopyOptions.InApp)
        .height(50)
        .editMenuOptions(this.changeValue ? {
          onCreateMenu: this.onCreateMenu, onMenuItemClick: (menuItem: TextMenuItem, textRange: TextRange) => {
            if (menuItem.id.equals(TextMenuItemId.of('custom1'))) {
              console.log('拦截 id: custom2 start:' + textRange.start + '; end:' + textRange.end )
              this.content = menuItem.content;
              this.searchLabelInfo = menuItem.labelInfo;
              return true;
            }
            if (menuItem.id.equals(TextMenuItemId.of('custom2'))) {
              console.log('拦截 id: custom1 start:' + textRange.start + '; end:' + textRange.end )
              this.content = menuItem.content;
              this.searchLabelInfo = menuItem.labelInfo;
              return true;
            }
            if (menuItem.id.equals(TextMenuItemId.COPY)) {
              console.log('拦截 COPY start:' + textRange.start + '; end:' + textRange.end+
                'labelInfo:'+menuItem.labelInfo + '   content:'+menuItem.content);
              this.content = menuItem.content;
              this.searchLabelInfo = menuItem.labelInfo;
              return true;
            }
            if (menuItem.id.equals(TextMenuItemId.SELECT_ALL)) {
              console.log('不拦截 SELECT_ALL start:' + textRange.start + '; end:' + textRange.end+'labelInfo:' +
              menuItem.labelInfo + '   content:'+menuItem.content);
              this.content = menuItem.content;
              this.searchLabelInfo = menuItem.labelInfo;
              return false;
            }
            return true;
          }
        } as EditMenuOptions : undefined)
        .id('search')

      Search()
        .id('search2')
    }
    .borderWidth(1)
    .borderColor(Color.Red)
    .width('100%')
    .height('100%')
  }
}