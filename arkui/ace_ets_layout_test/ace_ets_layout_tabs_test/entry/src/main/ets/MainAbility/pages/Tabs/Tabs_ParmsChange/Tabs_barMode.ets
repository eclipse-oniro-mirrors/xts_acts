/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

@Entry
@Component
struct Tabs_barMode {
  @State fontColor: string = '#182431';
  @State selectedFontColor: string = '#007DFF';
  @State currentIndex: number = 0;
  @State changeBarMode: number = BarMode.Fixed;
  private controller: TabsController = new TabsController();
  messageManager: MessageManager<number> = new MessageManager();

  onPageShow() {
    console.info('Tabs_barMode onPageShow');
    globalThis.value = {
      name: 'messageManager', message: this.messageManager
    };
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'currentIndex') {
        this.currentIndex = message.value;
      }
      if (message.name == 'changeBarMode') {
        this.changeBarMode = message.value;
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
    }.width('100%').height('100%').key('Tabs_barMode_' + name)
  }

  build() {
    Column() {
      Tabs({ index: this.currentIndex, controller: this.controller }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#00CB87').key("Tabs_barMode_001")
        }.tabBar(this.TabBuilder(0, 'green')).key("Tabs_barMode_011")

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#007DFF').key("Tabs_barMode_002")
        }.tabBar(this.TabBuilder(1, 'blue')).key("Tabs_barMode_012")

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#FFBF00').key("Tabs_barMode_003")
        }.tabBar(this.TabBuilder(2, 'yellow')).key("Tabs_barMode_013")
      }
      .key("Tabs_barMode_01")
      .vertical(false)
      .barWidth(330)
      .barHeight(56)
      .barMode(this.changeBarMode)
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