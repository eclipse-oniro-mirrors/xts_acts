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

type MessageData = string

@Entry
@Component
struct layoutWeight_Part {
  @State layoutWeight1: string = '0'
  @State layoutWeight2: string = '0'
  messageManager: MessageManager<MessageData> = new MessageManager()
  onPageShow() {
    console.info('layoutWeight_Part onPageShow');
    let value: Value<MessageData> = {
      name: 'messageManager', message: this.messageManager
    }
    GlobalContext.getContext().setObject('value', value);
    let callback: Callback<MessageData> = message => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'layoutWeight1') {
        this.layoutWeight1 = message.value;
      }else if(message.name == 'layoutWeight2'){
        this.layoutWeight2 = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }
  build() {
    Column(){
      Column({space:10}) {
        Column(){Text('1')}.width(300).height(100).layoutWeight(this.layoutWeight1).backgroundColor(0xF5DEB3).key('Column_layoutWeight_021')
        Column(){Text('2')}.width(300).height(100).layoutWeight(this.layoutWeight2).backgroundColor(0xD2B48C).key('Column_layoutWeight_022')
        Column(){Text('3')}.width(300).height(100).backgroundColor(0xF5DEB3).key('Column_layoutWeight_023')
      }.key('Column_layoutWeight_02').width(350).height(450).backgroundColor(0xAFEEEE)
    }
  }
}