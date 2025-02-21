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

import { MessageManager, Callback, Message } from '../../../common/MessageManager';

@Entry
@Component
struct listItemGroup_Space_Percentage {
  @State space1: string = '0';
  @State space2: string = '0';

  @Builder
  itemHead(text: string) {
    Text(text)
      .fontSize(20)
      .backgroundColor(0xAABBCC)
      .width(300)
      .padding(10)
  }

  @Builder
  itemFoot(text: string) {
    Text(text)
      .fontSize(16)
      .backgroundColor(0xAABBCC)
      .width(300)
      .padding(5)
  }

  messageManager: MessageManager<string> = new MessageManager();

  onPageShow() {
    console.info('listItemGroup_Space_Percentage onPageShow');
    globalThis.value = {
      name: 'messageManager', message: this.messageManager
    };
    let callback: Callback<string> = (message: Message<string>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'space1') {
        this.space1 = message.value;
      } else if (message.name == 'space2') {
        this.space2 = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column() {
      List({ space: this.space1 }) {
        ListItemGroup({ header: this.itemHead('001'), footer: this.itemFoot('共3个'), space: this.space2 }) {
          ListItem() {
            Text('1')
              .width(300)
              .height(50)
              .fontSize(16)
              .borderRadius(10)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xAFEEEE)
              .key('listItemGroup_Space_Percentage_ListItem_11')
          }

          ListItem() {
            Text('2')
              .width(300)
              .height(50)
              .fontSize(16)
              .borderRadius(10)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xAFEEEE)
              .key('listItemGroup_Space_Percentage_ListItem_12')

          }

          ListItem() {
            Text('3')
              .width(300)
              .height(50)
              .fontSize(16)
              .borderRadius(10)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xAFEEEE)
              .key('listItemGroup_Space_Percentage_ListItem_13')

          }
        }
        .borderRadius(20)
        .key('listItemGroup_Space_Percentage_ListItemGroup_1')

        ListItemGroup({ header: this.itemHead('001'), footer: this.itemFoot('共3个'), space: this.space2 }) {
          ListItem() {
            Text('1')
              .width(300)
              .height(50)
              .fontSize(16)
              .borderRadius(10)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xAFEEEE)
              .key('listItemGroup_Space_Percentage_ListItem_21')
          }

          ListItem() {
            Text('2')
              .width(300)
              .height(50)
              .fontSize(16)
              .borderRadius(10)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xAFEEEE)
              .key('listItemGroup_Space_Percentage_ListItem_22')

          }

          ListItem() {
            Text('3')
              .width(300)
              .height(50)
              .fontSize(16)
              .borderRadius(10)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xAFEEEE)
              .key('listItemGroup_Space_Percentage_ListItem_23')

          }
        }
        .borderRadius(20)
        .key('listItemGroup_Space_Percentage_ListItemGroup_2')

      }
      .width(350)
      .height(520)
      .listDirection(Axis.Vertical)
      .scrollBar(BarState.On)
      .key('listItemGroup_Space_Percentage_01')
    }
    .width('100%')
    .height('100%')
  }
}