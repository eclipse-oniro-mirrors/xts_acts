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

type MessageData = number

@Entry
@Component
struct ColumnSetPositionTest {
  @State testPosx: number = 0
  @State testPosy: number = 0
  messageManager: MessageManager<MessageData> = new MessageManager()
  private content: string = "ColumnSetPosition Page";
  onPageShow() {
    console.info('ColumnSetPosition onPageShow');
    let value: Value<MessageData> = {
      name: 'messageManager', message: this.messageManager
    }
    GlobalContext.getContext().setObject('value', value);
    let callback: Callback<MessageData> = message => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'position_x') {
        this.testPosx = message.value;
      }
      if (message.name == 'position_y') {
        this.testPosy = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }
  onBuildDone() {
    console.info('ColumnSetPosition page build done called');
  }
  build() {
    Column() {
      Column() {
        Text('subComponenSetPosition').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Column({
          space: 30,
        }) {
          Column(){Text('1')}.width(300).height(50).backgroundColor(0xF5DEB3).key('columnPosition_1').position({x:this.testPosx,y:this.testPosy})
          Column(){Text('2')}.width(300).height(100).backgroundColor(0xD2B48C).key('columnPosition_2')
          Column(){Text('3')}.width(300).height(150).backgroundColor(0xF5DEB3).key('columnPosition_3')
        }
        .key('columnPosition')
        .height(400)
        .width(350)
        .margin(5)
        .backgroundColor(0xAFEEEE)
      }.width('100%').alignItems(HorizontalAlign.Start)
    }.width('100%')
  }
}
