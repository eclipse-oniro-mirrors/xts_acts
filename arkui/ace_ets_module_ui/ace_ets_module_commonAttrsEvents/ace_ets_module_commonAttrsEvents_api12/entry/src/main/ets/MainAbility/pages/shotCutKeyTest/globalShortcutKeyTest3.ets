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

import input from '@ohos.multimodalInput.keyCode';
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';
@Entry
@Component
struct FunctionKeyTest3 {
  @State message: string = 'Hello World'
  functionkey:FunctionKey[] =[ FunctionKey.ESC, FunctionKey.F1, FunctionKey.F2,
    FunctionKey.F3, FunctionKey.F3,
    FunctionKey.F4, FunctionKey.F5,
    FunctionKey.F6, FunctionKey.F7,
    FunctionKey.F8, FunctionKey.F9,
    FunctionKey.F10, FunctionKey.F12,
    FunctionKey.TAB, FunctionKey.DPAD_UP,
    FunctionKey.DPAD_DOWN, FunctionKey.DPAD_LEFT,
    FunctionKey.DPAD_RIGHT]
  messageManager:MessageManager = new MessageManager();
  @State changeChar:string | FunctionKey = "3";

  onPageShow(): void {
    console.info("FunctionKeyTest onPageShow");
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback: Callback = (message: ESObject) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'changeChar') {
        this.changeChar = message.value
      }

    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Row() {
      Column({ space: 5 }) {
        Text(this.message).key("keyTest").margin({top:15})
        Button("Test short cut 1").onClick((event: ClickEvent) => {
          this.message = "I clicked Button " + this.changeChar;
        }).keyboardShortcut(this.changeChar, [ModifierKey.CTRL])
          .onKeyEvent((event: KeyEvent)=>{
            console.info("event.keyCode: " + JSON.stringify(event));
          })
      }
      .width('100%').height('100%')
    }
    .height('100%')
  }
}