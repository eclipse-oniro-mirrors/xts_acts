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

import { Entry, Column, Component, Flex, FlexDirection, ItemAlign, FlexAlign, Text, Button, FontWeight,
  Row, ClickEvent, Margin, ButtonType,SideBarContainer,SideBarContainerType,ForEach,Color,ColumnOptions,Dimension} from '@ohos.arkui.component'
import { State,AppStorage } from '@ohos.arkui.stateManagement'
import { MessageManager, Callback, Message } from '../../../common/MessageManager';

@Entry
@Component
struct SideBarContainerDivider {
  @State arr: Array<number> = new Array<number>(1,2,3);
  @State current: number = 1;
  @State sideBarWidth: number = 150;
  @State minSideBarWidth: number = 200;
  @State maxSideBarWidth: number = 200;
  minContentWidth: Dimension = 400 as Dimension;
  @State width1: number = 700;
  messageManager: MessageManager<number> = new MessageManager<number>();

  onPageShow() {
    console.info('SideBarContainerDivider page show called');
    AppStorage.setOrCreate<MessageManager<number>>('messageManager', this.messageManager)
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message!.value);
      if (message.name == 'sideBarWidth') {
        this.sideBarWidth = message!.value as number;
      } else if (message.name == 'minSideBarWidth') {
        this.minSideBarWidth = message!.value as number;
      } else if (message.name == 'maxSideBarWidth') {
        this.maxSideBarWidth = message!.value as number;
      } else if (message.name == 'minContentWidth') {
        this.minContentWidth = message!.value as Dimension;
      } else if (message.name == 'width1') {
        this.width1 = message!.value as number;
        console.log("============================== " + this.width1);
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    SideBarContainer(SideBarContainerType.AUTO) {
      Column() {
        ForEach(this.arr, (item: number) => {
          Column({ space: 5 } as ColumnOptions) {
            Text("Index0" + item)
              .fontSize(25)
              .fontColor(this.current === item ? '#0A59F7' : '#999')
              .fontFamily('source-sans-pro,cursive,sans-serif')
          }
          .onClick((e: ClickEvent) => {
            this.current = item
          })
        }, (item: number) => item!.toString())
      }.width('100%').key("SideBarContainerDivider_SideBar_01")
      .justifyContent(FlexAlign.SpaceEvenly)
      .backgroundColor('#19000000')

      Column() {
        Text('SideBarContainer content text1').fontSize(25)
        Text('SideBarContainer content text2').fontSize(25)
      }
      .key("SideBarContainerDivider_sideBarContent_01")
    }
    .sideBarWidth(this.sideBarWidth)
    .minSideBarWidth(this.minSideBarWidth)
    .maxSideBarWidth(this.maxSideBarWidth)
    .minContentWidth(this.minContentWidth)
    .width(this.width1)
    .key("SideBarContainerDivider_SideBarContainer_01")
    .divider({ strokeWidth: '10vp', color: Color.Gray, startMargin: '4vp', endMargin: '4vp' })
  }
}
