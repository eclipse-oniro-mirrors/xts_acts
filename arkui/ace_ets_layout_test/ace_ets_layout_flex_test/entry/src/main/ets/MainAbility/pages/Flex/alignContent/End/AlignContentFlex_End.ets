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
 
import { MessageManager,Callback } from '../../../../common/MessageManager';
@Entry
@Component
struct AlignContentFlex_End {
  @State flexHeight: number = 300;
  messageManager:MessageManager = new MessageManager()
  onPageShow() {
    console.info('AlignContentFlex onPageShow');
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message:any) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'height') {
        this.flexHeight = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column() {
      Text('AlignContentFlex_End').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Flex({
        direction: FlexDirection.Row,
        wrap: FlexWrap.Wrap,
        alignContent: FlexAlign.End,
        alignItems: ItemAlign.Start
      }) {
        Text('1').width(150).height(50).backgroundColor(0xF5DEB3).key('AlignContentFlexEnd_flex001_1')
        Text('2').width(150).height(100).backgroundColor(0xD2B48C).key('AlignContentFlexEnd_flex001_2')
        Text('3').width(150).height(150).backgroundColor(0xD2B48C).key('AlignContentFlexEnd_flex001_3')
        Text('4').width(150).height(200).backgroundColor(0xF5DEB3).key('AlignContentFlexEnd_flex001_4')
      }
      .key('AlignContentFlexEnd_flex001')
      .width(400)
      .height(this.flexHeight)
      .backgroundColor(0xAFEEEE)
    }.width('100%')
  }
}
