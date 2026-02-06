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

import render from 'libnativerender.so'
import { CommonView } from '../../componet/CommonView';
import { typeNode } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct BindController {
  PAGE_TAG: string = 'BindController';
  textController: TextController = new TextController()
  textAreaController:TextAreaController = new TextAreaController()
  textInputController:TextInputController = new TextInputController()
  build() {
    Column() {
      CommonView({
        pageTag: this.PAGE_TAG,
      }).onAppear(() => {
        render.testBindController001(this.PAGE_TAG);
      }).height('50%')
      Button('Text-TS2C').onClick(()=> {
          const uiContext: UIContext = this.getUIContext()
          if (uiContext) {
            const node: FrameNode | null = uiContext.getFrameNodeById('cTextNode') || null
            try {
              typeNode.bindController(node, this.textController, 'Text')
            }catch (e){
              console.log('errorCodeText---'+(e as BusinessError).code)
              AppStorage.SetOrCreate('TextErrorStr100021',(e as BusinessError).code)
            }
          }
        }).height('5%').id('TestErrorCodeText')
        Button('TextInput-TS2C').onClick(()=> {
          const uiContext: UIContext = this.getUIContext()
          if (uiContext) {
            const node: FrameNode | null = uiContext.getFrameNodeById('cTextInputNode') || null
            try {
              typeNode.bindController(node, this.textInputController, 'TextInput')
            }catch (e){
              console.log('errorCodeTextInput---'+(e as BusinessError).code)
              AppStorage.SetOrCreate('TextInputErrorStr100021',(e as BusinessError).code)
            }
          }
        }).height('5%').id('TestErrorCodeTextInput')
        Button('TextArea-TS2C').onClick(()=> {
          const uiContext: UIContext = this.getUIContext()
          if (uiContext) {
            const node: FrameNode | null = uiContext.getFrameNodeById('cTextAreaNode') || null
            try {
              typeNode.bindController(node, this.textAreaController, 'TextArea')
            }catch (e){
              console.log('errorCodeTextArea---'+(e as BusinessError).code)
              AppStorage.SetOrCreate('TextAreaErrorStr100021',(e as BusinessError).code)
            }
          }
        }).height('5%').id('TestErrorCodeTextArea')
    }
  }
}