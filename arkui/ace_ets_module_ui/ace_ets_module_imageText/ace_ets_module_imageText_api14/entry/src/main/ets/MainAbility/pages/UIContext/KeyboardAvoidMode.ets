/**
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
import { KeyboardAvoidMode, UIContext } from '@kit.ArkUI';
import { MessageManager, Callback, Message } from '../../common/MessageManager';

@Entry
@Component
struct UIContextKeyboardAvoidMode {
  messageManager: MessageManager<string> = new MessageManager();
  @State text:string = ''
  @State value:string = ''
  onPageShow() {
    globalThis.value = {
      name: 'messageManager',
      message: this.messageManager
    };
    let callback: Callback<string> = (message: Message<string>) => {
	  if(message.value == 'OFFSET_WITH_CARET'){
		let uiContext :UIContext = this.getUIContext();
		uiContext.setKeyboardAvoidMode(KeyboardAvoidMode.OFFSET_WITH_CARET);
		this.value = message.value
	  }
	  if(message.value == 'RESIZE_WITH_CARET'){
		let uiContext :UIContext = this.getUIContext();
		uiContext.setKeyboardAvoidMode(KeyboardAvoidMode.RESIZE_WITH_CARET);
		this.value = message.value
	  }
    if(message.value == 'NONE'){
		let uiContext :UIContext = this.getUIContext();
		uiContext.setKeyboardAvoidMode(KeyboardAvoidMode.NONE);
		this.value = message.value
	  }
    if(message.value == 'OFFSET'){
		let uiContext :UIContext = this.getUIContext();
		uiContext.setKeyboardAvoidMode(KeyboardAvoidMode.OFFSET);
		this.value = message.value
	  }
    if(message.value == 'RESIZE'){
		let uiContext :UIContext = this.getUIContext();
		uiContext.setKeyboardAvoidMode(KeyboardAvoidMode.RESIZE);
		this.value = message.value
	  }
    };
    this.messageManager.registerCallback(callback);
    
  }

  build() {
    Column(){
      Text(this.text)
        .height(50)
        .width('100%')
        .key('Text')
	  Text(this.value)
      Button('getKeyboardAvoidMode').onClick(()=>{
        let uiContext :UIContext = this.getUIContext();
        this.text = '' + uiContext.getKeyboardAvoidMode();
      })
	  .id('getKeyboardAvoidMode')
    }
  }
}