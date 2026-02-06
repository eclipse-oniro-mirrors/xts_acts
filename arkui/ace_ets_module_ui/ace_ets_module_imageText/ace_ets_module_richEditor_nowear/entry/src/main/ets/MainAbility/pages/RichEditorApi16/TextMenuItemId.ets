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
struct TextMenuItemIdExample {
  @State text: string = '测试文本测试文本测试文本'
  @State content: ResourceStr = ''
  @State textLabelInfo: ResourceStr | undefined = ''
  @State textAreaLabelInfo: ResourceStr | undefined = ''
  @State textInputLabelInfo: ResourceStr | undefined = ''
  @State richEditorLabelInfo: ResourceStr | undefined = ''
  @State searchLabelInfo: ResourceStr | undefined = ''
  @State flag: boolean = false
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller }


  onCreateMenu(menuItems: Array<TextMenuItem>) {
    let extensionMenuItems: TextMenuItem[] = [];
    menuItems.forEach(value => {
      if (value.id.equals(TextMenuItemId.TRANSLATE)) {
        value.content = 'TRANSLATE'
        extensionMenuItems.push(value)
      }
    });
    return extensionMenuItems
  }

  build() {
    Column() {
      Text(this.text)
        .fontSize(20)
        .copyOption(CopyOptions.LocalDevice)
        .editMenuOptions({
          onCreateMenu: (menuItems: Array<TextMenuItem>)=>{
            return this.onCreateMenu(menuItems)
          }, onMenuItemClick: (menuItem: TextMenuItem, textRange: TextRange) => {
            if (menuItem.id.equals(TextMenuItemId.of('custom1'))) {
              console.log('拦截 id: custom1 start:' + textRange.start + '; end:' + textRange.end )
              this.content = menuItem.content
              this.textLabelInfo = menuItem.labelInfo
              return true;
            }
            if (menuItem.id.equals(TextMenuItemId.of('custom2'))) {
              console.log('拦截 id: custom2 start:' + textRange.start + '; end:' + textRange.end )
              this.content = menuItem.content
              this.textLabelInfo = menuItem.labelInfo
              return true;
            }
            if (menuItem.id.equals(TextMenuItemId.COPY)) {
              console.log('拦截 COPY start:' + textRange.start + '; end:' + textRange.end+'   labelInfo:'+menuItem.labelInfo + '   content:'+menuItem.content)
              this.content = menuItem.content
              this.textLabelInfo = menuItem.labelInfo
              return true;
            }
            if (menuItem.id.equals(TextMenuItemId.SELECT_ALL)) {
              console.log('不拦截 SELECT_ALL start:' + textRange.start + '; end:' + textRange.end+'   labelInfo:'+menuItem.labelInfo + '   content:'+menuItem.content)
              this.content = menuItem.content
              this.textLabelInfo = menuItem.labelInfo
              return false;
            }
            return true;
          }
        })
        .id('text').textAlign(TextAlign.Center).height('10%')

      TextArea({ text: this.text })
        .width('95%').fontSize(20)
        .height('10%').textAlign(TextAlign.Center)
        .align(Alignment.Center)
        .editMenuOptions({
          onCreateMenu: (menuItems: Array<TextMenuItem>)=>{
            return this.onCreateMenu(menuItems)
          }, onMenuItemClick: (menuItem: TextMenuItem, textRange: TextRange) => {
            if (menuItem.id.equals(TextMenuItemId.of('custom1'))) {
              console.log('拦截 id: custom1 start:' + textRange.start + '; end:' + textRange.end )
              this.content = menuItem.content
              this.textAreaLabelInfo = menuItem.labelInfo
              return true;
            }
            if (menuItem.id.equals(TextMenuItemId.of('custom2'))) {
              console.log('拦截 id: custom2 start:' + textRange.start + '; end:' + textRange.end )
              this.content = menuItem.content
              this.textAreaLabelInfo = menuItem.labelInfo
              return true;
            }
            if (menuItem.id.equals(TextMenuItemId.COPY)) {
              console.log('拦截 COPY start:' + textRange.start + '; end:' + textRange.end+'   labelInfo:'+menuItem.labelInfo + '   content:'+menuItem.content)
              this.content = menuItem.content
              this.textAreaLabelInfo = menuItem.labelInfo
              return true;
            }
            if (menuItem.id.equals(TextMenuItemId.SELECT_ALL)) {
              console.log('不拦截 SELECT_ALL start:' + textRange.start + '; end:' + textRange.end+'   labelInfo:'+menuItem.labelInfo + '   content:'+menuItem.content)
              this.content = menuItem.content
              this.textAreaLabelInfo = menuItem.labelInfo
              return false;
            }
            return true;
          }
        })
        .id('textArea')

      TextInput({ text: this.text })
        .width('95%').fontSize(20)
        .height('8%').textAlign(TextAlign.Center)
        .editMenuOptions({
          onCreateMenu: (menuItems: Array<TextMenuItem>)=>{
            return this.onCreateMenu(menuItems)
          }, onMenuItemClick: (menuItem: TextMenuItem, textRange: TextRange) => {
            if (menuItem.id.equals(TextMenuItemId.of('custom1'))) {
              console.log('拦截 id: custom2 start:' + textRange.start + '; end:' + textRange.end )
              this.content = menuItem.content
              this.textInputLabelInfo = menuItem.labelInfo
              return true;
            }
            if (menuItem.id.equals(TextMenuItemId.of('custom2'))) {
              console.log('拦截 id: custom1 start:' + textRange.start + '; end:' + textRange.end )
              this.content = menuItem.content
              this.textInputLabelInfo = menuItem.labelInfo
              return true;
            }
            if (menuItem.id.equals(TextMenuItemId.COPY)) {
              console.log('拦截 COPY start:' + textRange.start + '; end:' + textRange.end+'   labelInfo:'+menuItem.labelInfo + '   content:'+menuItem.content)
              this.content = menuItem.content
              this.textInputLabelInfo = menuItem.labelInfo
              return true;
            }
            if (menuItem.id.equals(TextMenuItemId.SELECT_ALL)) {
              console.log('不拦截 SELECT_ALL start:' + textRange.start + '; end:' + textRange.end+'   labelInfo:'+menuItem.labelInfo + '   content:'+menuItem.content)
              this.content = menuItem.content
              this.textInputLabelInfo = menuItem.labelInfo
              return false;
            }
            return true;
          }
        })
        .id('textInput')

      RichEditor(this.options)
        .onReady(() => {
          this.controller.addTextSpan('RichEditor扩展RichEditor扩展RichEditor扩展RichEditor扩展RichEditor扩展')
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
        .id('richEditor')

      Search({value: 'search文本测试'})
        .width('95%').textAlign(TextAlign.Center)
        .copyOption(CopyOptions.InApp)
        .height('10%')
        .editMenuOptions({
          onCreateMenu: (menuItems: Array<TextMenuItem>)=>{
            return this.onCreateMenu(menuItems)
          }, onMenuItemClick: (menuItem: TextMenuItem, textRange: TextRange) => {
            if (menuItem.id.equals(TextMenuItemId.of('custom1'))) {
              console.log('拦截 id: custom2 start:' + textRange.start + '; end:' + textRange.end )
              this.content = menuItem.content
              this.searchLabelInfo = menuItem.labelInfo
              return true;
            }
            if (menuItem.id.equals(TextMenuItemId.of('custom2'))) {
              console.log('拦截 id: custom1 start:' + textRange.start + '; end:' + textRange.end )
              this.content = menuItem.content
              this.searchLabelInfo = menuItem.labelInfo
              return true;
            }
            if (menuItem.id.equals(TextMenuItemId.COPY)) {
              console.log('拦截 COPY start:' + textRange.start + '; end:' + textRange.end+'   labelInfo:'+menuItem.labelInfo + '   content:'+menuItem.content)
              this.content = menuItem.content
              this.searchLabelInfo = menuItem.labelInfo
              return true;
            }
            if (menuItem.id.equals(TextMenuItemId.SELECT_ALL)) {
              console.log('不拦截 SELECT_ALL start:' + textRange.start + '; end:' + textRange.end+'   labelInfo:'+menuItem.labelInfo + '   content:'+menuItem.content)
              this.content = menuItem.content
              this.searchLabelInfo = menuItem.labelInfo
              return false;
            }
            return true;
          }
        })
        .id('search')
      Search({value: 'search文本测试'})
        .id('search2')
    }
    .borderWidth(1)
    .borderColor(Color.Red)
    .width('100%')
    .height('100%')
  }
}