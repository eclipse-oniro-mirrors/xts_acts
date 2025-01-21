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
import GlobalContext from './../../common/GlobalContext';
import { Value } from './../../common/Value';
import { MessageManager, Callback } from './../../common/MessageManager';

type MessageData = string | number | Dimension | Axis

@Entry
@Component
struct ListLanes02 {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  listGutter: Dimension = '0vp'
  @State listDirection: Axis = Axis.Vertical
  @State listSpace: string = '20'
  @State alignListItem: ListItemAlign = ListItemAlign.Start
  @State initialIndex: number = 0
  messageManager: MessageManager<MessageData> = new MessageManager()

  onPageShow() {
    console.info('ListLanes  onPageShow');
    let value: Value<MessageData> = {
      name: 'messageManager', message: this.messageManager
    }
    GlobalContext.getContext().setObject('value', value);
    let callback: Callback<MessageData> = message => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'listGutter') {
        this.listGutter = message.value as Dimension
      }
      if (message.name == 'listDirection') {
        this.listDirection = message.value as Axis
      }
      if (message.name == 'listSpace') {
        this.listSpace = message.value as string
      }
      if (message.name == 'initialIndex') {
        this.initialIndex = message.value as number
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
          }.key('ListItem02_' + item).borderWidth(1)
        }, (item: string) => item)
      }
      .key('ListLanesKey02')
      .listDirection(this.listDirection) // 排列方向
      .alignListItem(this.alignListItem)
      .borderWidth(1)
      .lanes(3,$r('app.string.gutter_10'))
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
  }
}