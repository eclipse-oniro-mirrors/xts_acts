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

import { TextMenuController } from '@ohos.arkui.UIContext';

@Entry
@Component
struct SetMenuOptions1 {
  @State TextMenuController1: TextMenuController = this.getUIContext().getTextMenuController()
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  build() {
    Row() {
      Column() {
        Text('这是一个Text,长按弹出文本选择菜单')
          .height('5%')
          .id('text_SetMenuOptions')
          .copyOption(CopyOptions.InApp)
        TextInput({ text: '这是一个TextInput,长按弹出文本选择菜单' })
          .height('5%')
          .id('textInput_SetMenuOptions')
          .copyOption(CopyOptions.InApp)
        TextArea({ text: '这是一个TextArea,长按弹出文本选择菜单' })
          .height('5%')
          .id('TextArea_SetMenuOptions')
          .copyOption(CopyOptions.InApp)
        Search({ value: '这是一个Search,长按弹出文本选择菜单' })
          .height('5%')
          .id('Search_SetMenuOptions')
          .copyOption(CopyOptions.InApp)
        RichEditor(this.options)
          .height('5%')
          .onReady(() => {
            this.controller.addTextSpan('这是一个RichEditor,长按弹出文本选择菜单')
          })
          .height('5%')
          .id('TextArea_SetMenuOptions')
        Button('DEFAULT').id('button_DEFAULT')
          .height('5%')
          .onClick(() => {
            this.TextMenuController1
              .setMenuOptions(
                {
                  showMode: TextMenuShowMode.DEFAULT
                })
        })
        Button('点击设置为跨窗口显示')
          .height('5%')
          .id('button_PREFER_WINDOW')
          .onClick(() => {
            this.TextMenuController1
              .setMenuOptions(
                {
                  showMode: TextMenuShowMode.PREFER_WINDOW
                })
          })
        Button('点击设置为异常值undefined')
          .height('5%')
          .id('button_undefined')
          .onClick(() => {
            this.TextMenuController1
              .setMenuOptions(
                {
                  showMode: undefined
                })
        })
        Button('点击设置为异常值Null')
          .height('5%')
          .id('button_null')
          .onClick(() => {
          this.TextMenuController1
            .setMenuOptions(
              {
                showMode: null
              })
        })
      }
      .width('100%')
    }
  }
}
