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
import GlobalContext from './../../../common/GlobalContext';
import { Value } from './../../../common/Value';
import { MessageManager, Callback } from './../../../common/MessageManager';

type MessageData = number | string

@Entry
@Component
struct Column_Space_Default {
  @State addSpace1:number=0
  @State addSpace2:string='0'
  messageManager: MessageManager<MessageData> = new MessageManager()
  onPageShow() {
    console.info('Column_Space_Default onPageShow');
    let value: Value<MessageData> = {
      name: 'messageManager', message: this.messageManager
    }
    GlobalContext.getContext().setObject('value', value);
    let callback: Callback<MessageData> = message => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'addSpace1') {
        this.addSpace1 = message.value as number
      } else if(message.name == 'addSpace2'){
        this.addSpace2 = message.value as string
      }
    }
    this.messageManager.registerCallback(callback);
  }
  build() {
    Column(){
      Column({space:this.addSpace1}) {
        Column(){Text('1')}.width(300).height(50).backgroundColor(0xF5DEB3).key('Column_Space_Default_011')
        Column(){Text('2')}.width(300).height(100).backgroundColor(0xD2B48C).key('Column_Space_Default_012')
        Column(){Text('3')}.width(300).height(150).backgroundColor(0xF5DEB3).key('Column_Space_Default_013')
      }.key('Column_Space_Default_01').width(350).height(400).backgroundColor(0xAFEEEE)

      Column({space:this.addSpace2}) {
        Column(){Text('1')}.width(300).height(50).backgroundColor(0xF5DEB3).key('Column_Space_Default_021')
        Column(){Text('2')}.width(300).height(100).backgroundColor(0xD2B48C).key('Column_Space_Default_022')
        Column(){Text('3')}.width(300).height(150).backgroundColor(0xF5DEB3).key('Column_Space_Default_023')
      }.key('Column_Space_Default_02').width(350).height(400).backgroundColor(0xAFEEEE)

    }

  }
}