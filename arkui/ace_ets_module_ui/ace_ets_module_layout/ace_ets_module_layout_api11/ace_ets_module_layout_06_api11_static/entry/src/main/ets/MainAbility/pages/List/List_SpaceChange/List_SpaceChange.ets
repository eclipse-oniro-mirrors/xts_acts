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
  Axis,
  Builder
} from '@ohos.arkui.component'
import{
  State,
  AppStorage
} from '@ohos.arkui.stateManagement'

@Entry
@Component
struct List_SpaceChange {
  @State testSpace: number = 0;
  messageManager: MessageManager<number> = new MessageManager<number>();

  onPageShow() {
    console.info('Grid_RowCol_ItemContentSize onPageShow');
      AppStorage.setOrCreate<MessageManager<number>>("messageManager", this.messageManager );
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'Space') {
        this.testSpace = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column({ space: 30 } as ColumnOptions) {
      List({ space: this.testSpace }) {
        ListItem() {
          Text('1').width('100%').height('100%').backgroundColor(0xF5DEB3);
        }
        .width('40%')
        .height('18%')
        .key('List_SpaceChange01')

        ListItem() {
          Text('2').width('100%').height('100%').backgroundColor(0xD2B48C);
        }
        .width('40%')
        .height('18%')
        .key('List_SpaceChange02')

        ListItem() {
          Text('3').width('100%').height('100%').backgroundColor(0xF5DEB3);
        }
        .width('40%')
        .height('18%')
        .key('List_SpaceChange03')

        ListItem() {
          Text('4').width('100%').height('100%').backgroundColor(0xD2B48C);
        }
        .width('40%')
        .height('18%')
        .key('List_SpaceChange04')
      }
      .width('40%')
      .height('40%')
      .listDirection(Axis.Vertical)
      .edgeEffect(EdgeEffect.Spring)
      .scrollBar(BarState.On)
      .backgroundColor(0xAFEEEE)
      .key('List_SpaceChange_Container01')
    }
    .width('100%')
    .height('100%')
  }
}