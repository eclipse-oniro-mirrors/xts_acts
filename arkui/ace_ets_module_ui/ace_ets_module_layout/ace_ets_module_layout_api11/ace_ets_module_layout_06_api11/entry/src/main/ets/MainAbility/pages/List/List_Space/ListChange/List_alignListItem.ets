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

import { MessageManager, Callback, Message } from '../../../../common/MessageManager';

@Entry
@Component
struct List_alignListItem {
  @State addAlignListItem: number = ListItemAlign.Start;
  messageManager: MessageManager<number> = new MessageManager();
  private content: string = "List_alignListItem Page";

  onPageShow() {
    console.info('List_alignListItem page show called');
    globalThis.value = {
      name: 'messageManager', message: this.messageManager
    };
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'addAlignListItem') {
        this.addAlignListItem = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  onBuildDone() {
    console.info('List_alignListItem page build done called');
  }

  build() {
    Column() {
      List({ space: 20, initialIndex: 0 }) {
        ListItem() {
          Text('1')
            .width('100%')
            .height('100%')
            .fontSize(16)
        }
        .width(300)
        .height(100)
        .key('List_alignListItem_011')
        .editable(true)
        .backgroundColor(0xF5DEB3)

        ListItem() {
          Text('2')
            .width('100%')
            .height('100%')
            .fontSize(16)
        }
        .width(300)
        .height(100)
        .key('List_alignListItem_012')
        .editable(true)
        .backgroundColor(0xD2B48C)

        ListItem() {
          Text('3')
            .width('100%')
            .height('100%')
            .fontSize(16)
        }
        .width(300)
        .height(100)
        .key('List_alignListItem_013')
        .editable(true)
        .backgroundColor(0xffa500)

        ListItem() {
          Text('4')
            .width('100%')
            .height('100%')
            .fontSize(16)
        }
        .width(300)
        .height(100)
        .key('List_alignListItem_014')
        .editable(true)
        .backgroundColor(0xFFFFFF)
      }
      .height(520)
      .width(350)
      .key('List_alignListItem_01')
      .backgroundColor(0xAFEEEE)
      .alignListItem(this.addAlignListItem)
      .scrollBar(BarState.On)
    }.width('100%').height('100%').backgroundColor(0xDCDCDC)
  }
}