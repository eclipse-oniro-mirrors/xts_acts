/**
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
import { MessageManager, Callback } from '../../../../common/MessageManager';
@Entry
@Component
struct Flex_NoWrap_layoutWeight{
  @State firstTextLayoutWeight: number = 1;
  @State secondTextLayoutWeight: number = 1;
  @State thirdTextLayoutWeight: number = 1;
  messageManager:MessageManager = new MessageManager();

  onPageShow() {
    console.info('Flex_NoWrap_layoutWeight onPageShow');
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message:any) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'firstTextLayoutWeight') {
        this.firstTextLayoutWeight = message.value;
      }
      if (message.name == 'secondTextLayoutWeight') {
        this.secondTextLayoutWeight = message.value;
      }
      if (message.name == 'thirdTextLayoutWeight') {
        this.thirdTextLayoutWeight = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }
  build(){
    Column({space:30}){
      Flex({wrap:FlexWrap.NoWrap}){
        Text('1').width(150).height(100).backgroundColor(0xF5DEB3)
          .layoutWeight(this.firstTextLayoutWeight).key('NoWrap_LayoutWeight01');
        Text('2').width(150).height(150).backgroundColor(0xD2B48C)
          .layoutWeight(this.secondTextLayoutWeight).key('NoWrap_LayoutWeight02');
        Text('3').width(150).height(200).backgroundColor(0xF5DEB3)
          .layoutWeight(this.thirdTextLayoutWeight).key('NoWrap_LayoutWeight03');
      }
      .width(500)
      .height(200)
      .backgroundColor(0xAFEEEE)
      .key('Flex_NoWrap_layoutWeight_Container01')
    }
    .width('100%')
    .height('100%')
  }
}