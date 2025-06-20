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
struct FunctionKeyTest {

  @State message2: string = 'single key test'
  @State message3: string = 'three key test'
  @State message4: string = ''
  @State message5: string = ''
  @State message6: string = ''
  @State message7: string = ''
  @State message8: string = ''
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

  @State changeChar2:string | FunctionKey = "";

  @State keys: Array<ModifierKey> = [];
  @State changeChar3:string | FunctionKey = "";

  @State changeChar4:string | FunctionKey = "1";

  onPageShow(): void {
    console.info("FunctionKeyTest onPageShow");
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback: Callback = (message: ESObject) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'changeChar2') {
        this.changeChar2 = message.value
      }
      if (message.name == 'changeChar3') {
        this.changeChar3 = message.value
      }
      if (message.name == 'changeChar4') {
        this.changeChar4 = message.value
      }
      if (message.name == 'keys') {
        this.keys = message.value
      }

    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Row() {
      Column({ space: 5 }) {
        Text(this.message2).key("keyTest2")
        Button("Test short cut 2").onClick((event: ClickEvent) => {
          this.message2 = "I clicked Button2 " + this.changeChar2;
          console.info("I clicked 2");
        }).keyboardShortcut(this.changeChar2, []).onKeyEvent((event: KeyEvent)=>{
          console.info("event.keyCode: " + JSON.stringify(event));
          this.message2 = "the key Button " + this.changeChar2;
        })
        Text(this.message3).key("keyTest3")
        Button("Test short cut 3").onClick((event: ClickEvent) => {
          this.message3 = "I clicked Button3 " + this.changeChar3;
          console.info("I clicked 3");
        }).keyboardShortcut(this.changeChar3, this.keys)
        Text(this.message5).key("keyTest5")
        Button("Test short cut 5").onClick((event: ClickEvent) => {
          this.message5 = "I clicked Button 5";
          console.info("I clicked 5");
        }).keyboardShortcut("M", [ModifierKey.CTRL],undefined)
          .focusable(false)
        Text(this.message7).key("keyTest7")
        Button("Test short cut 7").onClick((event: ClickEvent) => {
          this.message7 = "I clicked Button 7";
          console.info("I clicked 7");
        }).keyboardShortcut("I", [ModifierKey.CTRL]).visibility(Visibility.Hidden)

        Text(this.message8).key("keyTest8")
        Button("Test short cut 8").onClick((event: ClickEvent) => {
          this.message8 = "I clicked Button 8";
          console.info("I clicked 8");
        }).keyboardShortcut(FunctionKey.DPAD_RIGHT, [ModifierKey.SHIFT])
        Text("Test short cut 8").onClick((event: ClickEvent) => {
          this.message8 = "I clicked text 8";
          console.info("I clicked text 8");
        }).keyboardShortcut(FunctionKey.DPAD_RIGHT, [ModifierKey.SHIFT])

        Text(this.message6).key("keyTest6")
        Button("Test short cut 6").onClick((event: ClickEvent) => {
          this.message6 = "I clicked Button 6";
          console.info("I clicked 6");
        }).keyboardShortcut(FunctionKey.DPAD_LEFT, [ModifierKey.CTRL,ModifierKey.SHIFT]).enabled(false)

      }
      .width('100%').height('100%')
    }
    .height('100%')
  }
}