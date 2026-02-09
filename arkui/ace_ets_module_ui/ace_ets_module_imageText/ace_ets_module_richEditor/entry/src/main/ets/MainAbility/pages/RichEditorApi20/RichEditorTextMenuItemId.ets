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

@Entry
@Component
struct RichEditorTextMenuItemId {
  @State content: ResourceStr = ''
  @State richEditorLabelInfo: ResourceStr | undefined = ''
  @State flag: boolean = false
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller }

  onCreateMenu(menuItems: Array<TextMenuItem>) {
    let extensionMenuItems: TextMenuItem[] = [];
    menuItems.forEach(value => {
      if (value.id.equals(TextMenuItemId.url)) {
        value.content = 'url'
        this.flag = true
        extensionMenuItems.push(value)
      }
      if (value.id.equals(TextMenuItemId.email)) {
        value.content = 'email'
        this.flag = true
        extensionMenuItems.push(value)
      }
      if (value.id.equals(TextMenuItemId.phoneNumber)) {
        value.content = 'phoneNumber'
        this.flag = true
        extensionMenuItems.push(value)
      }
      if (value.id.equals(TextMenuItemId.address)) {
        value.content = 'address'
        this.flag = true
        extensionMenuItems.push(value)
      }
      if (value.id.equals(TextMenuItemId.dateTime)) {
        value.content = 'dateTime'
        this.flag = true
        extensionMenuItems.push(value)
      }
      if (value.id.equals(TextMenuItemId.phoneNumber)) {
        value.content = 'askAI'
        this.flag = true
        extensionMenuItems.push(value)
      }
    });
    return extensionMenuItems
  }

  build() {
    Column() {
      RichEditor(this.options)
        .onReady(() => {
          this.controller.addTextSpan('RichEditor:TextMenuItemId.url/email/phoneNumber/address/dateTime/askAI相关测试')
        })
        .editMenuOptions({
          onCreateMenu: (menuItems: Array<TextMenuItem>)=>{
            return this.onCreateMenu(menuItems)
          }, onMenuItemClick: (menuItem: TextMenuItem, textRange: TextRange) => {
            if (menuItem.id.equals(TextMenuItemId.of('custom1'))) {
              console.log('拦截 id: custom2 start:' + textRange.start + '; end:' + textRange.end )
              this.content = menuItem.content
              this.richEditorLabelInfo = menuItem.labelInfo
              return true;
            }
            if (menuItem.id.equals(TextMenuItemId.of('custom2'))) {
              console.log('拦截 id: custom1 start:' + textRange.start + '; end:' + textRange.end )
              this.content = menuItem.content
              this.richEditorLabelInfo = menuItem.labelInfo
              return true;
            }
            if (menuItem.id.equals(TextMenuItemId.COPY)) {
              console.log('拦截 COPY start:' + textRange.start + '; end:' + textRange.end+'   labelInfo:'+menuItem.labelInfo + '   content:'+menuItem.content)
              this.content = menuItem.content
              this.richEditorLabelInfo = menuItem.labelInfo
              return true;
            }
            if (menuItem.id.equals(TextMenuItemId.SELECT_ALL)) {
              console.log('不拦截 SELECT_ALL start:' + textRange.start + '; end:' + textRange.end+'   labelInfo:'+menuItem.labelInfo + '   content:'+menuItem.content)
              this.content = menuItem.content
              this.richEditorLabelInfo = menuItem.labelInfo
              return false;
            }
            return true;
          }
        })
        .height('10%')
        .copyOptions(CopyOptions.InApp)
        .id('richEditor_TextMenuItemId')
    }
    .borderWidth(1)
    .borderColor(Color.Red)
    .width('100%')
    .height('100%')
  }
}