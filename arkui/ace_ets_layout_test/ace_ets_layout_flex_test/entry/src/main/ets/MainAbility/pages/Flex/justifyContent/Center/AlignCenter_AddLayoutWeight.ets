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
struct AlignCenter_AddLayoutWeight {
  @State OneLayoutWeight1: number = 1;
  @State OneLayoutWeight2: number = 1;
  @State OneLayoutWeight3: number = 1;
  messageManager:MessageManager = new MessageManager();
  onPageShow() {
    console.info('AlignCenter_AddLayoutWeight  onPageShow');
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message:any) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'OneLayoutWeight1') {
        this.OneLayoutWeight1 = message.value;
      }
      if (message.name == 'OneLayoutWeight2') {
        this.OneLayoutWeight2 = message.value;
      }
      if (message.name == 'OneLayoutWeight3') {
        this.OneLayoutWeight3 = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }
  @State justifyContent: FlexAlign = FlexAlign.Center
  build() {
    Column() {
        Text('justifyContent:FlexAlign.Center').fontSize(9).fontColor(0xCCCCCC).width('90%');
        Flex({ justifyContent: this.justifyContent, direction: FlexDirection.Row }) {
          Text('1')
            .width(150)
            .height(50)
            .backgroundColor(0xF5DEB3)
            .key("Center_AddLayoutWeight_011")
            .layoutWeight(this.OneLayoutWeight1);
          Text('2').width(150).height(100).backgroundColor(0xD2B48C).key("Center_AddLayoutWeight_012")
            .layoutWeight(this.OneLayoutWeight2);
          Text('3').width(150).height(150).backgroundColor(0xF5DEB3).key("Center_AddLayoutWeight_013")
            .layoutWeight(this.OneLayoutWeight3);
        }
        .key("Center_AddLayoutWeight_01")
        .width(500)
        .height(200)
        .backgroundColor(0xAFEEEE)
      }
      .width("100%")
    }
}
