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
  TextAttribute,
  Column,
  Component,
  Button,
  ButtonAttribute,
  ClickEvent,

  Image,
  ImageFit,
  Scroller,
  Scroll,
  ForEach,
  Search,
  SafeAreaType,
  ScrollDirection,
  BarState,
  Color,
  EdgeEffect,
  HorizontalAlign,
  FlexAlign,
  GridLayoutOptions,
  ColumnOptions,
  Grid,
  Margin,
  GridItem,
  TextAlign,
  List,
  ListItem,
  Builder,
  Axis
} from '@ohos.arkui.component'
import{
  State,
  AppStorage
} from '@ohos.arkui.stateManagement'

@Entry
@Component
struct List_Space_Percentage {
  @State space: string = '10';
  messageManager: MessageManager<string> = new MessageManager<string>();

  onPageShow() {
    console.info('Grid_RowCol_ItemContentSize onPageShow');
      AppStorage.setOrCreate<MessageManager<string>>("messageManager", this.messageManager);
    let callback: Callback<string> = (message: Message<string>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'space') {
        this.space = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column() {
      List({ space: this.space }) {
        ListItem() {
          Text('1')
            .width(300)
            .height(50)
            .fontSize(16)
            .borderRadius(10)
            .textAlign(TextAlign.Center)
            .backgroundColor(0xAFEEEE)
            .key('List_Space_Percentage_ListItem_01')
        }

        ListItem() {
          Text('2')
            .width(300)
            .height(50)
            .fontSize(16)
            .borderRadius(10)
            .textAlign(TextAlign.Center)
            .backgroundColor(0xAFEEEE)
            .key('List_Space_Percentage_ListItem_02')

        }

        ListItem() {
          Text('3')
            .width(300)
            .height(50)
            .fontSize(16)
            .borderRadius(10)
            .textAlign(TextAlign.Center)
            .backgroundColor(0xAFEEEE)
            .key('List_Space_Percentage_ListItem_03')

        }

        ListItem() {
          Text('4')
            .width(300)
            .height(50)
            .fontSize(16)
            .borderRadius(10)
            .textAlign(TextAlign.Center)
            .backgroundColor(0xAFEEEE)
            .key('List_Space_Percentage_ListItem_04')

        }
      }
      .width(350)
      .height(520)
      .listDirection(Axis.Vertical)
      .scrollBar(BarState.On)
      .key('List_Space_Percentage_01')
    }
    .width('100%')
    .height('100%')
  }
}