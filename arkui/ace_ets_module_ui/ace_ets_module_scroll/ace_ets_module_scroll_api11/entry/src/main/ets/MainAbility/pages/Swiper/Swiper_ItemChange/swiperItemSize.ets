/*
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
struct SwiperItemSizeTest {
  @State testHeight: number = 150;
  @State testWidth: number = 150;
  @State testIndex: number = 0;
  messageManager: MessageManager<number> = new MessageManager();

  onPageShow() {
    console.info('SwiperItemSize onPageShow');
    globalThis.value = {
      name: 'messageManager', message: this.messageManager
    };
    let callback: Callback<number> = (message: Message<number>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'height') {
        this.testHeight = message.value;
      }
      if (message.name == 'width') {
        this.testWidth = message.value;
      }
      if (message.name == 'index') {
        this.testIndex = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column({ space: 5 }) {
      Swiper() {
        Column() {
          Text('1')
        }.width(this.testWidth).height(this.testHeight).backgroundColor(0xF5DEB3).key('itemSizekey01')

        Column() {
          Text('2')
        }.width(this.testWidth).height(this.testHeight).backgroundColor(0xD2B48C).key('itemSizekey02')

        Column() {
          Text('3')
        }.width(this.testWidth).height(this.testHeight).backgroundColor(0xF5DEB3).key('itemSizekey03')

        Column() {
          Text('4')
        }.width(this.testWidth).height(this.testHeight).backgroundColor(0xD2B48C)

        Column() {
          Text('5')
        }.width(this.testWidth).height(this.testHeight).backgroundColor(0xF5DEB3)

        Column() {
          Text('6')
        }.width(this.testWidth).height(this.testHeight).backgroundColor(0xD2B48C)
      }
      .key('itemSizekey')
      .height(300)
      .width(300)
      .index(this.testIndex)
      .indicator(true)
      .loop(true)
      .displayCount(1)
    }.margin({ top: 5 })
  }
}