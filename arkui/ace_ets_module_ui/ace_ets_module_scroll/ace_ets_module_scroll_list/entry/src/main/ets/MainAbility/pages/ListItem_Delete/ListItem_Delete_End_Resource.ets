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

import { MessageManager, Callback, Message } from '../../common/MessageManager';

@Entry
@Component
struct ListItem_Delete_End_Resource {
  @State arr: number[] = [0, 1, 2, 3, 4];
  @State actionAreaDistance: Resource = $r('app.float.actionAreaDistance1');
  @State enterEndDeleteAreaString: string = 'not enterEndDeleteArea';
  @State exitEndDeleteAreaString: string = 'not exitEndDeleteArea';
  messageManager: MessageManager<Resource> = new MessageManager();

  onPageShow() {
    console.info('ListItem_Delete_End_Resource onPageShow');
    globalThis.value = {
      name: 'messageManager', message: this.messageManager
    };
    let callback: Callback<Resource> = (message: Message<Resource>) => {
      console.log('message = ' + message.name + '--' + message.value);
      if (message.name == 'actionAreaDistance') {
        this.actionAreaDistance = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column() {
      Text(this.enterEndDeleteAreaString).fontSize(12).key('ListItem_Delete_End_Resource_text_01')
      Text(this.exitEndDeleteAreaString).fontSize(12).key('ListItem_Delete_End_Resource_text_02')
      Text('' + this.arr.length).fontSize(12).key('ListItem_Delete_End_Resource_text_03')
      Button('点击还原')
        .height('8%')
        .onClick(() => {
          this.arr = [0, 1, 2, 3, 4]
          this.enterEndDeleteAreaString = 'not enterEndDeleteArea'
          this.exitEndDeleteAreaString = 'not exitEndDeleteArea'
        })
        .id('ListItem_Delete_End_Resource_button1')
      List({ space: 10 }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('item' + item)
              .width('100%')
              .height(100)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }.key('ListItem_Delete_End_Resource_ListItem_0' + item)
          .swipeAction({
            end: {
              onAction: () => {
                animateTo({ duration: 1000 }, () => {
                  let index = this.arr.indexOf(item)
                  this.arr.splice(index, 1)
                })
              },
              actionAreaDistance: this.actionAreaDistance,

              onEnterActionArea: () => {
                this.enterEndDeleteAreaString = 'enterEndDeleteArea'
                this.exitEndDeleteAreaString = 'not exitEndDeleteArea'
              },
              onExitActionArea: () => {
                this.enterEndDeleteAreaString = 'not enterEndDeleteArea'
                this.exitEndDeleteAreaString = 'exitEndDeleteArea'
              }
            }
          })
        }, (item: string) => item)
      }.key('ListItem_Delete_End_Resource_List_1')
      .width('90%')
      .height('80%')

    }
    .backgroundColor(0xDCDCDC)
    .width('100%')
    .height('100%')
  }
}