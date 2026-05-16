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
  BarState,
  Builder,
  Button,
  ButtonAttribute,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  EdgeEffect,
  Entry,
  FlexAlign,
  ForEach,
  Grid,
  GridItem,
  GridLayoutOptions,
  HorizontalAlign,
  Image,
  ImageFit,
  List,
  ListItem,
  Margin,
  SafeAreaType,
  Scroll,
  ScrollDirection,
  Scroller,
  Search,
  Text,
  TextAlign,
  TextAttribute
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ListItem_Delete_Start {
  @State arr: Array<number> = new Array<number>(0, 1, 2, 3, 4);
  @State actionAreaDistance: number = 56;
  @State enterEndDeleteAreaString: string = "not enterEndDeleteArea";
  @State exitEndDeleteAreaString: string = "not exitEndDeleteArea";
  messageManager: MessageManager<number> = new MessageManager<number>();

  onPageShow() {
    console.info('ListItem_Delete_Start onPageShow');
    AppStorage.setOrCreate<MessageManager<number>>("messageManager", this.messageManager);
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'actionAreaDistance') {
        this.actionAreaDistance = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column() {
      Text(this.enterEndDeleteAreaString).fontSize(12).key("ListItem_Delete_Start_text_01")
      Text(this.exitEndDeleteAreaString).fontSize(12).key("ListItem_Delete_Start_text_02")
      Text('' + this.arr.length).fontSize(12).key("ListItem_Delete_Start_text_03")
      Button('点击还原')
        .height('8%')
        .onClick((e: ClickEvent) => {
          this.arr = [0, 1, 2, 3, 4]
          this.enterEndDeleteAreaString = "not enterEndDeleteArea"
          this.exitEndDeleteAreaString = "not exitEndDeleteArea"
        })
        .id('ListItem_Delete_Start_button1')
      List({ space: 10 }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text("item" + item)
              .width('100%')
              .height(100)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }.key("ListItem_Delete_Start_ListItem_0" + item)
          .swipeAction({
            start: {
              onAction: () => {
                this.getUIContext().animateTo({ duration: 1000 }, () => {
                  let index = this.arr.indexOf(item)
                  this.arr.splice(index, 1)
                })
              },
              actionAreaDistance: this.actionAreaDistance,

              onEnterActionArea: () => {
                this.enterEndDeleteAreaString = "enterEndDeleteArea"
                this.exitEndDeleteAreaString = "not exitEndDeleteArea"
              },
              onExitActionArea: () => {
                this.enterEndDeleteAreaString = "not enterEndDeleteArea"
                this.exitEndDeleteAreaString = "exitEndDeleteArea"
              }
            }
          })
        }, (item: number) => item.toString())
      }
      .width('90%')
      .height('80%')

    }
    .backgroundColor(0xDCDCDC)
    .width('100%')
    .height('100%')
  }
}