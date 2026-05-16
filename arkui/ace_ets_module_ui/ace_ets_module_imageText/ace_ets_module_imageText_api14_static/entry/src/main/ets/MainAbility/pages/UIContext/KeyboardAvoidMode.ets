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
import {UIContext } from '@kit.ArkUI';
import { KeyboardAvoidMode } from '@ohos.arkui.UIContext'
import { MessageManager, Callback, Message } from '../../common/MessageManager';
import { Entry, Component, Column, Text, Button, ClickEvent} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'

export interface GlobalMessage<T> {
  name: string,
  message: MessageManager<T>
}

@Entry
@Component
struct UIContextKeyboardAvoidMode {
  messageManager: MessageManager<string> = new MessageManager<string>();
  @State text:string = ''
  @State value:string = ''
  onPageShow() {
    const globalMessage: GlobalMessage<string> = {
      name: 'messageManager', message: this.messageManager
    } as GlobalMessage<string>;
    AppStorage.setOrCreate<GlobalMessage<string>>('UIContextKeyboardAvoidMode', globalMessage);
    AppStorage.setOrCreate<MessageManager<string>>("messageManager",  this.messageManager);
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
      Button('getKeyboardAvoidMode').onClick((e: ClickEvent)=>{
        let uiContext :UIContext = this.getUIContext();
        this.text = '' + uiContext.getKeyboardAvoidMode();
      })
	  .id('getKeyboardAvoidMode')
    }
  }
}