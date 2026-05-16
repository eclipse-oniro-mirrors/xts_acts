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

import { MessageManager, Callback, Message } from '../../../../common/MessageManager';
import { Entry, Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent, Image,ImageFit, Scroller,
  Scroll,
  ForEach,
  Search,
  SafeAreaType,
  ScrollDirection,
  BarState,
  Color,
  Flex,FlexOptions,Margin,FlexWrap,ItemAlign,FlexDirection,HorizontalAlign,Visibility
} from '@ohos.arkui.component'

import {
  State,
  

  AppStorage
} from '@ohos.arkui.stateManagement'
import { Router } from '@ohos.arkui.UIContext';
@Entry
@Component
struct FlexVisibility_Baseline {
  @State testVisibility: Visibility = Visibility.Visible;
  messageManager: MessageManager<Visibility> = new MessageManager<Visibility>();
  private content: string = 'FlexVisibility_Baseline Page';

  onPageShow() {
    console.info('FlexVisibility_Baseline onPageShow');
    AppStorage.setOrCreate<MessageManager<Visibility>>("messageManager",  this.messageManager);
    let callback: Callback<Visibility> = (message: Message<Visibility>) => {
      console.log('message = ' + message.name + '--' + message.value);
      if (message.name == 'visibility') {
        this.testVisibility = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  onBuildDone() {
    console.info('FlexVisibility_Baseline page build done called');
  }

  build() {
    Column() {
      Column() {
        Text('FlexTest10').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({
          direction: FlexDirection.Row,
          alignItems: ItemAlign.Baseline,
          wrap: FlexWrap.NoWrap,
        } as FlexOptions) {
          Text('1')
            .width(150)
            .height(50)
            .backgroundColor(0xF5DEB3)
            .visibility(this.testVisibility)
            .key('ItemAlign_Baseline_textVisible01')
          Text('2').width(150).height(100).backgroundColor(0xD2B48C).key('ItemAlign_Baseline_textVisible02')
          Text('3').width(150).height(150).backgroundColor(0xF5DEB3).key('ItemAlign_Baseline_textVisible03')
        }
        .key('ItemAlign_Baseline_flexVisible')
        .height(200)
        .width(500)
        .backgroundColor(0xAFEEEE)
      }.width('100%').alignItems(HorizontalAlign.Start)
    }.width('100%')
  }
}
