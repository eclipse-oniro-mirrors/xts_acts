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
struct Tabs_WidHei {
  @State fontColor: string = '#182431';
  @State selectedFontColor: string = '#007DFF';
  @State testWidth: number = 300;
  @State testHeight: number = 200;
  @State currentIndex: number = 0;
  private controller: TabsController = new TabsController();
  messageManager: MessageManager<number> = new MessageManager();

  onPageShow() {
    console.info('Tabs_WidHei onPageShow');
    globalThis.value = {
      name: 'messageManager', message: this.messageManager
    };
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'width') {
        this.testWidth = message.value;
      }
      if (message.name == 'height') {
        this.testHeight = message.value;
      }
      if (message.name == 'index') {
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
        .lineHeight(22)
    }.width('100%').height('100%').key('Tabs_WidHei_' + name)
  }

  build() {
    Column() {
      Tabs({ index: this.currentIndex }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#00CB87').key("Tabs_WidHei_001");
        }.tabBar(this.TabBuilder(0, 'Green')).key("Tabs_WidHei_011")

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#007DFF').key("Tabs_WidHei_002");
        }.tabBar(this.TabBuilder(1, 'Blue')).key("Tabs_WidHei_012")

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#FFBF00').key("Tabs_WidHei_003");
        }.tabBar(this.TabBuilder(2, 'Yellow')).key("Tabs_WidHei_013")
      }
      .key("Tabs_WidHei_01")
      .vertical(false)
      .animationDuration(400)
      .onChange((index: number) => {
        this.currentIndex = index
      })
      .width(this.testWidth)
      .height(this.testHeight)
      .backgroundColor('#F1F3F5')
    }.width('100%')
  }
}