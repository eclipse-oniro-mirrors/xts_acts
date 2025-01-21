/*
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
import { MessageManager, Callback } from '../../test/MessageManager';

@Entry
@Component
struct TextAreaSelect {
  controller: TextAreaController = new TextAreaController()
  controller2: TextAreaController = new TextAreaController()
  controller3: TextAreaController = new TextAreaController()
  @State text: string = '123456'
  @State text1: string = "Show selected "
  messageManager: MessageManager = new MessageManager()

  onPageShow() {
    globalThis.value = {
      name: 'messageManager', message: this.messageManager
    }
    let callback: Callback = (message: ESObject) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'Show selected (-2,-1)') {
        this.controller.setTextSelection(-2, -1)
      }
      if (message.name == 'requestFocus') {
        focusControl.requestFocus("TextAreaSelect_TextArea_1")
      }
      if (message.name == 'Show selected (-1,0)') {
        this.controller.setTextSelection(-1, 0)
      }
      if (message.name == 'Show selected (0,3)') {
        this.controller.setTextSelection(0, 3)
      }
      if (message.name == 'Show selected (1,3)') {

        this.controller.setTextSelection(1, 3)
      }
      if (message.name == 'Show selected (-1,6)') {
        this.controller.setTextSelection(-1, 6)
      }
      if (message.name == 'Show selected (0,6)') {
        this.controller.setTextSelection(0, 6)
      }
      if (message.name == 'Show selected (-1,8)') {
        this.controller.setTextSelection(-1, 8)
      }
      if (message.name == 'Show selected (0,8)') {
        this.controller.setTextSelection(0, 8)
      }
      if (message.name == 'Show selected (null,null)') {
        this.controller.setTextSelection(null, null)
      }
      if (message.name == 'Show selected (null,undefined)') {
        this.controller.setTextSelection(null, undefined)
      }
      if (message.name == 'Show selected (undefined,null)') {
        this.controller.setTextSelection(undefined, null)
      }

      if (message.name == 'Show selected(undefined,undefined)') {
        this.controller.setTextSelection(undefined, undefined)
      }

    }
    this.messageManager.registerCallback(callback)

  }

  build() {
    Column() {
      TextArea({ text: this.text, placeholder: 'input your word', controller: this.controller })
        .placeholderColor("rgb(0,0,225)")
        .placeholderFont({ size: 20, weight: 100, family: 'cursive', style: FontStyle.Italic })
        .textAlign(TextAlign.Center)
        .caretColor(Color.Blue)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .fontFamily("sans-serif")
        .fontStyle(FontStyle.Normal)
        .fontColor(Color.Red)
        .tabIndex(1)
        .key('TextAreaSelect_TextArea_1')
        .focusable(true)
        .focusOnTouch(true)
        .defaultFocus(true)


      Button("Show selected (-2,-1)")
        .margin(30)
        .onClick(() => {
          this.controller.setTextSelection(-2, -1)
        })
        .key('TextAreaSelect_Button_1')

      TextArea({ text: '', placeholder: 'input your word', controller: this.controller2 })
        .placeholderColor("rgb(0,0,225)")
        .placeholderFont({ size: 20, weight: 100, family: 'cursive', style: FontStyle.Italic })
        .textAlign(TextAlign.Center)
        .caretColor(Color.Blue)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .fontFamily("sans-serif")
        .fontStyle(FontStyle.Normal)
        .fontColor(Color.Red)
        .tabIndex(2)
        .key('TextAreaSelect_TextArea_2')
      Button("Show selected (1,3)")
        .margin(30)
        .onClick(() => {
          this.controller2.setTextSelection(1, 3)
        })
        .key('TextAreaSelect_Button_13')
      TextArea({ text: '北京aaaaa上海tianjin深圳', placeholder: 'input your word', controller: this.controller3 })
        .width(200)
        .height(50)
        .placeholderColor("rgb(0,0,225)")
        .placeholderFont({ size: 20, weight: 100, family: 'cursive', style: FontStyle.Italic })
        .textAlign(TextAlign.Center)
        .caretColor(Color.Blue)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .fontFamily("sans-serif")
        .fontStyle(FontStyle.Normal)
        .fontColor(Color.Red)
        .tabIndex(3)
        .key('TextAreaSelect_TextArea_3')
      Button("Show selected (6,10)")
        .margin(30)
        .onClick(() => {
          this.controller3.setTextSelection(6, 10)
        })
        .key('TextAreaSelect_Button_14')
    }
  }
}