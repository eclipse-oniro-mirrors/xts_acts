/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { MessageManager, Callback, Message } from '../../../common/MessageManager1';

@Entry
@Component
struct Tabs_itemSize {
  @State fontColor: string = '#182431';
  @State selectedFontColor: string = '#007DFF';
  @State dadWeight: number = 200;
  @State dadHeight: number = 200;
  @State currentIndex: number = 0;
  private controller: TabsController = new TabsController();
  messageManager: MessageManager<number> = new MessageManager();

  onPageShow() {
    console.info('Tabs_itemSize onPageShow');
    globalThis.value = {
      name: 'messageManager', message: this.messageManager
    };
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'dadWeight') {
        this.dadWeight = message.value;
      }
      if (message.name == 'dadHeight') {
        this.dadHeight = message.value;
      }
      if (message.name == 'currentIndex') {
        this.currentIndex = message.value;
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
        .lineHeight(40)
    }.width('100%').height('100%').key('Tabs_itemSize_' + name)
  }

  build() {
    Column() {
      Tabs({ index: this.currentIndex }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#00CB87').key("Tabs_itemSize_001")
        }.tabBar(this.TabBuilder(0, 'green')).key("Tabs_itemSize_011").width(this.dadWeight).height(this.dadHeight)

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#007DFF').key("Tabs_itemSize_002")
        }.tabBar(this.TabBuilder(1, 'blue')).key("Tabs_itemSize_012")

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#FFBF00').key("Tabs_itemSize_003")
        }.tabBar(this.TabBuilder(2, 'yellow')).key("Tabs_itemSize_013")
      }
      .key("Tabs_itemSize_01")
      .vertical(false)
      .barWidth(330)
      .barHeight(56)
      .animationDuration(400)
      .onChange((index: number) => {
        this.currentIndex = index
      })
      .width(330)
      .height(300)
      .backgroundColor('#F1F3F5')
    }.width('100%')
  }
}