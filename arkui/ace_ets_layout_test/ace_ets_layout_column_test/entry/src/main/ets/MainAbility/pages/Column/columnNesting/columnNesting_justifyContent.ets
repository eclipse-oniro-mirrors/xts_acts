/**
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
import { MessageManager, Callback, Message } from './../../../common/MessageManager';
@Entry
@Component
struct columnNesting_justifyContent {
  @State addSpace: string = '10vp'
  messageManager: MessageManager<string> = new MessageManager()
  onPageShow() {
    console.info('columnNesting_justifyContent onPageShow');
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback: Callback<string> = (message: Message<string>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'addSpace') {
        this.addSpace = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }
  build() {
    Column({space:10}){
      Column({space:10}) {
        Column(){Text('1')}.width(300).height(50).backgroundColor(0xF5DEB3).key('columnNesting_justifyContent_011')
        Column(){Text('2')}.width(300).height(50).backgroundColor(0xD2B48C).key('columnNesting_justifyContent_012')
        Column(){Text('3')}.width(300).height(50).backgroundColor(0xF5DEB3).key('columnNesting_justifyContent_013')
      }.key('columnNesting_justifyContent_01').width(350).height(300).backgroundColor(0xAFEEEE).justifyContent(FlexAlign.Start)
      Column({space:10}) {
        Column(){Text('1')}.width(300).height(50).backgroundColor(0xF5DEB3).key('columnNesting_justifyContent_021')
        Column(){Text('2')}.width(300).height(50).backgroundColor(0xD2B48C).key('columnNesting_justifyContent_022')
        Column(){Text('3')}.width(300).height(50).backgroundColor(0xF5DEB3).key('columnNesting_justifyContent_023')
      }.key('columnNesting_justifyContent_02').width(350).height(300).backgroundColor(0xAFEEEE).justifyContent(FlexAlign.End)
    }.width(350).height(700).backgroundColor(0xF5DEB3).key('columnNesting_justifyContent_1').justifyContent(FlexAlign.SpaceBetween)
  }
}