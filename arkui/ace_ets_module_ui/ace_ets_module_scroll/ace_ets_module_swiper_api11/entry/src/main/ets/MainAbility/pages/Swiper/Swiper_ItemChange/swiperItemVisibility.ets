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
struct SwiperItemVisibilityTest {
  @State testVisibility1: number = Visibility.Visible;
  @State testVisibility2: number = Visibility.Visible;
  @State testVisibility3: number = Visibility.Visible;
  @State testIndex: number = 0;
  messageManager: MessageManager<number> = new MessageManager();

  onPageShow() {
    console.info('SwiperItemVisibility onPageShow');
    globalThis.value = {
      name: 'messageManager', message: this.messageManager
    };
    let callback: Callback<number> = (message: Message<number>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'visibility1') {
        this.testVisibility1 = message.value;
      }
      if (message.name == 'visibility2') {
        this.testVisibility2 = message.value;
      }
      if (message.name == 'visibility3') {
        this.testVisibility3 = message.value;
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
        }
        .width('100%')
        .height('100%')
        .backgroundColor(0xF5DEB3)
        .key('visiblekey01')
        .visibility(this.testVisibility1)

        Column() {
          Text('2')
        }.width('100%').height('100%').backgroundColor(0xD2B48C).key('visiblekey02')

        Column() {
          Text('3')
        }
        .width('100%')
        .height('100%')
        .backgroundColor(0xF5DEB3)
        .key('visiblekey03')
        .visibility(this.testVisibility2)

        Column() {
          Text('4')
        }.width('100%').height('100%').backgroundColor(0xD2B48C).key('visiblekey04')

        Column() {
          Text('5')
        }
        .width('100%')
        .height('100%')
        .backgroundColor(0xF5DEB3)
        .key('visiblekey05')
        .visibility(this.testVisibility3)

        Column() {
          Text('6')
        }.width('100%').height('100%').backgroundColor(0xD2B48C).key('visiblekey06')
      }
      .index(this.testIndex)
      .key('visiblekey')
      .height('60%')
      .width('90%')
      .indicator(true)
      .loop(true)
      .displayCount(1)
    }
    .margin({ top: 5 })
    .alignItems(HorizontalAlign.Start)
  }
}