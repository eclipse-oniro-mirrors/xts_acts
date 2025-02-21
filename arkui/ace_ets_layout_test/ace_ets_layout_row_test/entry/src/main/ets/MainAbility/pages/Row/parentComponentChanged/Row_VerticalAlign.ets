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
 
import { MessageManager,Callback } from '../../../common/MessageManager';
@Entry
@Component
struct Row_VerticalAlign {
  @State rowAlignItems: number = VerticalAlign.Center;
  messageManager:MessageManager = new MessageManager()
  onPageShow() {
    console.info('Row_VerticalAlign onPageShow');
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message:any) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'alignItems') {
        this.rowAlignItems = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }
  build() {
    Column() {
      Text('Row_VerticalAlign').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Row({ space:10 }) {
        Text('1').width(100).height(50).backgroundColor(0xAFEEEE).key('Row_VerticalAlign_Text1')
        Text('2').width(100).height(100).backgroundColor(0x00FFFF).key('Row_VerticalAlign_Text2')
        Text('3').width(100).height(150).backgroundColor(0xAFEEEE).key('Row_VerticalAlign_Text3')
      }
      .key('Row_VerticalAlign_Row')
      .alignItems(this.rowAlignItems)
      .width(350)
      .height(200)
      .backgroundColor(0xB05F77)
    }
    .width('100%')
  }
}
