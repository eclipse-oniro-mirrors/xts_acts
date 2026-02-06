'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { Callback, Message, MessageManager } from '../../../common/MessageManager';
import {
  Axis,
  BarState,
  Builder,
  Button,
  ClickEvent,
  Column,
  Component,
  EdgeEffect,
  Entry,
  FlexAlign,
  ForEach,
  List,
  ListItem,
  ListItemGroup,
  ListScroller,
  Row,
  Text,
  TextAlign
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct getListItemGroupRect6 {
  @State arr: string[] = ['0', '1', '2', '3']
  @State space1: number = 20
  @State space2: number = 0
  @State index: Int = 0
  @State indexInGroup: Int = 4
  @State x: number = 0
  @State y: number = 0
  @State width1: number = 0
  @State height1: number = 0
  messageManager: MessageManager<Int> = new MessageManager<Int>()
  private listScroller: ListScroller = new ListScroller()

  @Builder
  itemHead(text: string) {
    Text(text)
      .fontSize(20)
      .backgroundColor(0xAABBCC)
      .width('100%')
      .height(50)
  }

  @Builder
  itemFoot(num: number) {
    Text('共' + num + '个')
      .fontSize(20)
      .backgroundColor(0xAABBCC)
      .width('100%')
      .height(50)
  }

  @Builder
  itemEnd() {
    Row() {
      Button('Delete').margin('4vp')
      Button('Set').margin('4vp')
    }.padding('4vp').justifyContent(FlexAlign.SpaceEvenly).width(0).height(0)
  }

  onPageShow() {
    console.info('getListItemGroupRect6 onPageShow');
    AppStorage.setOrCreate<MessageManager<Int>>('messageManager', this.messageManager);
    let callback: Callback<Int> = (message: Message<Int>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'index') {
        this.index = message.value as Int;
      } else if (message.name == 'indexInGroup') {
        this.indexInGroup = message.value as Int;
      }
    }
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column() {
      Button('点击获取信息').onClick((event: ClickEvent) => {
        this.x = this.listScroller.getItemRectInGroup(this.index, this.indexInGroup).x
        this.y = this.listScroller.getItemRectInGroup(this.index, this.indexInGroup).y
        this.width1 = this.listScroller.getItemRectInGroup(this.index, this.indexInGroup).width
        this.height1 = this.listScroller.getItemRectInGroup(this.index, this.indexInGroup).height
        console.log('tset get data height is: ' +
        this.listScroller.getItemRectInGroup(this.index, this.indexInGroup).height)
      }).id('getListItemGroupRect6_button')
      Text('' + this.x).key('getListItemGroupRect6_text1')
      Text('' + this.y).key('getListItemGroupRect6_text2')
      Text('' + this.width1).key('getListItemGroupRect6_text3')
      Text('' + this.height1).key('getListItemGroupRect6_text4')

      List({ space: this.space1, initialIndex: 0, scroller: this.listScroller }) {
        ListItemGroup({
          header: () => {
            this.itemHead('0')
          }, footer: () => {
            this.itemFoot(this.arr.length)
          }, space: this.space2
        }) {
          ForEach(this.arr, (item: string) => {
            ListItem() {
              Text('listItemGroup' + item)
                .width('100%')
                .height("100%")
                .fontSize(16)
                .borderRadius(10)
                .textAlign(TextAlign.Center)
                .backgroundColor('#3366CC')
            }
            .swipeAction({
              end: {
                builder: () => {
                  this.itemEnd()
                },
                onAction: () => {
                  let index = this.arr.indexOf(item)
                  this.arr.splice(index, 1)
                },
                actionAreaDistance: 20,
              }
            })
            .width('100%').height(10)
            .key('getListItemGroupRect6_listItemGroup_' + item)
          })
        }
        .key('getListItemGroupRect6_listItemGroup_1')
      }
      .key('getListItemGroupRect6_list_1')
      .listDirection(Axis.Vertical) // 排列方向
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring) // 边缘效果设置为Spring
      .width(300)
      .height(500)

    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .margin(5)
  }
}
