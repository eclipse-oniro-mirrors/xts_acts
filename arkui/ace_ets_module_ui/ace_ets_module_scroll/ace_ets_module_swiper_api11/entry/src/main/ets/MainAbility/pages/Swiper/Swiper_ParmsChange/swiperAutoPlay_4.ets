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

import { MessageManager, Callback } from '../../../common/MessageManager1';

@Entry
@Component
struct SwiperAutoPlay_4Test {
  messageManager: MessageManager<number> = new MessageManager();

  onPageShow() {
    console.info('SwiperAutoPlay onPageShow');
  }

  build() {
    Column({ space: 5 }) {
      Swiper() {
        Column() {
          Text('1')
        }.width('100%').height('100%').backgroundColor(0xF5DEB3).key('autoPlay04_1')

        Column() {
          Text('2')
        }.width('100%').height('100%').backgroundColor(0xD2B48C).key('autoPlay04_2')

        Column() {
          Text('3')
        }.width('100%').height('100%').backgroundColor(0xF5DEB3).key('autoPlay04_3')

        Column() {
          Text('4')
        }.width('100%').height('100%').backgroundColor(0xD2B48C).key('autoPlay04_4')

        Column() {
          Text('5')
        }.width('100%').height('100%').backgroundColor(0xF5DEB3).key('autoPlay04_5')

        Column() {
          Text('6')
        }.width('100%').height('100%').backgroundColor(0xD2B48C).key('autoPlay04_6')
      }
      .key('autoPlay04')
      .height(300)
      .width(300)
      .index(0)
      .autoPlay(true)
      .indicator(true)
      .loop(true)
      .interval(-1000)
      .itemSpace(0)
      .displayCount(1)
    }.margin({ top: 5 })
  }
}