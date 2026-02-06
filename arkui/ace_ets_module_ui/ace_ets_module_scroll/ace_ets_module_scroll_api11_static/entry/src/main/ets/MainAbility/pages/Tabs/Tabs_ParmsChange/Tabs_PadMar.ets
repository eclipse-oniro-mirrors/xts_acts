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
import {
  Entry,
  Component,
  Margin,
  TabsController,
  Builder,
  Column,
  Text,
  Tabs,
  HorizontalAlign,
  TabContent
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { MessageManager, Callback, Message } from '../../../common/MessageManager';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct Tabs_PadMar {
  @State fontColor: string = '#182431';
  @State selectedFontColor: string = '#007DFF';
  @State testPadding: number = 0;
  @State testMargin: number = 0;
  @State currentIndex: int = 0;
  private controller: TabsController = new TabsController();
  messageManager: MessageManager<number> = new MessageManager<number>();

  onPageShow() {
    console.info('Tabs_PadMar onPageShow');
    AppStorage.setOrCreate<MessageManager<number>>('messageManager', this.messageManager);
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'padding') {
        this.testPadding = message.value;
      }
      if (message.name == 'margin') {
        this.testMargin = message.value;
      }
      if (message.name == 'index') {
        this.currentIndex = message.value.toInt();
      }
    };
    this.messageManager.registerCallback(callback);
  }

  @Builder
  TabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? 500 : 400)
        .lineHeight(22)
    }.width('100%').height('100%').key('Tabs_PadMar_' + name)
  }

  build() {
    Column() {
      Tabs({ index: this.currentIndex }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#00CB87').key("Tabs_PadMar_001");
        } .tabBar(() => {this.TabBuilder(0, 'Green')}).key("Tabs_PadMar_011")

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#007DFF').key("Tabs_PadMar_002");
        } .tabBar(() => {this.TabBuilder(1, 'Blue')}).key("Tabs_PadMar_012")

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#FFBF00').key("Tabs_PadMar_003");
        } .tabBar(() => {this.TabBuilder(2, 'Yellow')}).key("Tabs_PadMar_013")
      }
      .key("Tabs_PadMar_01")
      .vertical(false)
      .animationDuration(400)
      .onChange((index: int): void => {
        this.currentIndex = index
      })
      .width('90%')
      .height('80%')
      .padding(this.testPadding)
      .margin(this.testMargin)
      .backgroundColor('#F1F3F5')
    }.alignItems(HorizontalAlign.Start).width('100%').key("Tabs_PadMar_Column_01")
  }
}