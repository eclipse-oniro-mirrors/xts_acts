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
struct FlexAlign_SpaceBetween_TextSize{
  @State testHeight: number = 50;
  messageManager:MessageManager = new MessageManager();

  onPageShow() {
    console.info('FlexAlign_SpaceBetween_TextSize onPageShow');
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message:any) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'height') {
        this.testHeight = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }
  build(){
    Column({ space:30 }){
      Flex({ wrap:FlexWrap.Wrap, alignContent: FlexAlign.SpaceBetween }){
        Text('1')
          .width(150)
          .height(this.testHeight)
          .backgroundColor(0xD2B48C)
          .key('AlignContent_SpaceBetween_TextSize01');
        Text('2').width(150).height(100).backgroundColor(0xF5DEB3).key('AlignContent_SpaceBetween_TextSize02');
        Text('3').width(150).height(50).backgroundColor(0xD2B48C).key('AlignContent_SpaceBetween_TextSize03');
        Text('4').width(150).height(100).backgroundColor(0xF5DEB3).key('AlignContent_SpaceBetween_TextSize04');
      }
      .width(200)
      .height(400)
      .backgroundColor(0xAFEEEE)
      .key('FlexAlign_SpaceBetween_TextSize_Container01')
    }
    .width('100%')
    .height('100%')
  }
}