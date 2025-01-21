/*
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

import { MessageManager, Callback } from './../../../../common/MessageManager';
@Entry
@Component
struct AlignStart_NoSpace {
  @State DadWidth: number = 200;
  messageManager:MessageManager = new MessageManager();
  onPageShow() {
    console.info('AlignStart_NoSpace onPageShow');
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message:any) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'DadWidth') {
        this.DadWidth = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }
  @State justifyContent: FlexAlign = FlexAlign.Start;
  build() {
    Column() {
      Text('justifyContent:FlexAlign.Start').fontSize(9).fontColor(0xCCCCCC).width('90%');
      Flex({ justifyContent: this.justifyContent, direction: FlexDirection.Row }) {
        Text('1').width(150).height(50).backgroundColor(0xF5DEB3).key("Start_NoSpace_011");
        Text('2').width(150).height(100).backgroundColor(0xD2B48C).key("Start_NoSpace_012");
        Text('3').width(150).height(150).backgroundColor(0xF5DEB3).key("Start_NoSpace_013");
      }
      .key("Start_NoSpace_01")
      .width(this.DadWidth)
      .height(200)
      .backgroundColor(0xAFEEEE)
    }
  }
}
