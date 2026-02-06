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

import { MessageManager, Callback, Message } from '../../../common/MessageManager';
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Scroller,
  Scroll,
  ForEach,
  Search,
  Color,
  EdgeEffect,
  ColumnOptions,
  Grid,
  GridItem,
  List,
  ListItem,
  ListItemAlign,
  BarState,
  Axis,
  ListItemGroup,
  Builder,
  TextAlign,
  CustomBuilder
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct List_divider_string {
  @State strokeWidth: string = '1';
  @State lanes: int = 1;
  messageManager: MessageManager<string | int> = new MessageManager<string | int>();

  onPageShow() {
    console.info('List_divider_string onPageShow');
    AppStorage.setOrCreate<MessageManager<string | int>>("messageManager", this.messageManager );
    let callback: Callback<string | int> = (message: Message<string | int>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'strokeWidth') {
        this.strokeWidth = message.value as string;
      } else if (message.name == 'lanes') {
        this.lanes = message.value as int;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  @Builder
  itemHead(text: string) {
    Text(text)
      .fontSize(20)
      .backgroundColor(0xAABBCC)
      .width(300)
      .height(50)
      .padding(10)
  }

  @Builder
  itemFoot(text: string) {
    Text(text)
      .fontSize(16)
      .backgroundColor(0xAABBCC)
      .width(300)
      .height(50)
      .padding(5)
  }

  build() {
    Column() {
      List() {
        ListItemGroup({ header: () => {
          this.itemHead('001')
        }, footer: () => {
          this.itemFoot('共2个')
        }, space: 10 }) {
          ListItem() {
            Text('1')
              .width('100%')
              .height('100%')
              .fontSize(16)
              .borderRadius(10)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xAFEEEE)
          }.width('100%').height(100)

          ListItem() {
            Text('2')
              .width('100%')
              .height('100%')
              .fontSize(16)
              .borderRadius(10)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xAFEEEE)
          }.width('100%').height(100)
        }
        .width(300)
        .height(420)
        .borderRadius(20)
        .key("List_divider_string_listItem_01")

        ListItemGroup({ header: () => {
          this.itemHead('002')
        }, footer: () => {
          this.itemFoot('共2个')
        }, space: 10 }) {
          ListItem() {
            Text('1')
              .width('100%')
              .height('100%')
              .fontSize(16)
              .borderRadius(10)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xAFEEEE)
          }.width('100%').height(100)

          ListItem() {
            Text('2')
              .width('100%')
              .height('100%')
              .fontSize(16)
              .borderRadius(10)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xAFEEEE)
          }.width('100%').height(100)
        }
        .width(300)
        .height(420)
        .borderRadius(20)
        .key("List_divider_string_listItem_02")

      }
      .key('List_divider_string_list_01')
      .width(300)
      .height(700)
      .listDirection(Axis.Vertical)
      .scrollBar(BarState.On)
      .lanes(this.lanes)
      .divider({ strokeWidth: this.strokeWidth, color: Color.Pink })
    }
    .width(350)
    .height('100%')
  }
}