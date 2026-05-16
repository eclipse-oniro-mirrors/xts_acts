'use static';
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
  RichEditorAttribute,
  CopyOptions,
  RichEditorController,
  RichEditorOptions,
  Row,
  RichEditor,
  Column,
  Color,
  AttributeModifier
} from '@ohos.arkui.component'
import {
  State,
  Observed,
  AppStorage
} from '@ohos.arkui.stateManagement'
import { MessageManagerBase, CallbackBase,MessageBase } from '../../common/MessageManager2';


@Observed
class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  _testType: CopyOptions = CopyOptions.None
  applyNormalAttribute(instance: RichEditorAttribute): void {
    console.info(`RichEditor page Test Type ${this._testType}`)
    instance.copyOptions(this._testType);
  }
}

@Entry
@Component
struct RichEditorExample {
  @State _RichEditorModifier: RichEditorModifier = new RichEditorModifier();
  messageManagerRichEditorPage:MessageManagerBase<CopyOptions> = new MessageManagerBase<CopyOptions>()

  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller } as RichEditorOptions;

  onPageShow() {
    AppStorage.setOrCreate<MessageManagerBase<CopyOptions>>('messageManagerRichEditorPage', this.messageManagerRichEditorPage)
    let stateChangCallBack: CallbackBase<CopyOptions> = (message: MessageBase<CopyOptions>) => {
      console.error('message = ' + message.name + "--" + message.value)
      if(message.name == "typeValue"){
        this._RichEditorModifier._testType = message.value;
      }
    }
    this.messageManagerRichEditorPage.registerCallback(stateChangCallBack)
  }

  build() {
    Column() {
 
      Row() {
        RichEditor(this.options)
        .onReady(() :void=> {
          this.controller.addTextSpan("0123456789")
        })
        .border({ width: 1, color: Color.Red })
        .height(300)
        .width('100%')
        .key('key_RichEditor')
        .attributeModifier(this._RichEditorModifier)
      }.padding(20)
    }
  }
}