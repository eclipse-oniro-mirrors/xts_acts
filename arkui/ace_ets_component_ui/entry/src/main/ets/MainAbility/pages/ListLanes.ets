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
import {MessageManager,Callback} from '../utils/MessageManager';

type Message = string|number|Dimension|Axis

@Entry
@Component
struct ListLanes {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  listGutter: Dimension = '0vp'
  @State listDirection: Axis = Axis.Vertical
  @State listSpace: string = '20'
  @State alignListItem: ListItemAlign = ListItemAlign.Start
  @State initialIndex: number = 0
  messageManager = new MessageManager<Message>()

  onPageShow() {
    console.info('ListLanes  onPageShow');
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback: Callback<Message> = message => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'listGutter') {
        this.listGutter = message.value as Dimension;
      }
      if (message.name == 'listDirection') {
        this.listDirection = message.value as Axis;
      }
      if (message.name == 'listSpace') {
        this.listSpace = message.value as string;
      }
      if (message.name == 'initialIndex') {
        this.initialIndex = message.value as number;
      }

    }
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column() {
      List({ space: this.listSpace, initialIndex: this.initialIndex }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('' + item)
              .width('100%').height(100).fontSize(16)
              .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
          }.key('ListItem' + item)
        }, (item: string) => item)
      }
      .key('ListLanesKey')
      .listDirection(this.listDirection) // 排列方向
      .edgeEffect(EdgeEffect.Spring) // 边缘效果设置为Spring
      .alignListItem(this.alignListItem)
      .lanes(2,this.listGutter)
      .width('100%')
      .padding(20)
      .margin({ top: 10 })
    }
    .key('ColumnKey')
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
  }
}