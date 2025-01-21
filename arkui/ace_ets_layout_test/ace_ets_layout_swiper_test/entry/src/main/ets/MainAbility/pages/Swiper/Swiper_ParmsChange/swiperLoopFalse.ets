/*
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

import { MessageManager, Callback } from '../../../common/MessageManager';

@Entry
@Component
struct SwiperLoopFalseTest {
  messageManager: MessageManager<number> = new MessageManager();

  onPageShow() {
    console.info('SwiperLoop onPageShow');
  }

  build() {
    Column({ space: 5 }) {
      Swiper() {
        Column() {
          Text('1')
        }.width('100%').height('100%').backgroundColor(0xF5DEB3).key('loopFalse01')

        Column() {
          Text('2')
        }.width('100%').height('100%').backgroundColor(0xD2B48C).key('loopFalse02')

        Column() {
          Text('3')
        }.width('100%').height('100%').backgroundColor(0xF5DEB3).key('loopFalse03')

        Column() {
          Text('4')
        }.width('100%').height('100%').backgroundColor(0xD2B48C).key('loopFalse04')

        Column() {
          Text('5')
        }.width('100%').height('100%').backgroundColor(0xF5DEB3).key('loopFalse05')

        Column() {
          Text('6')
        }.width('100%').height('100%').backgroundColor(0xD2B48C).key('loopFalse06')
      }
      .key('loopFalse')
      .height(300)
      .width(300)
      .index(5)
      .autoPlay(true)
      .indicator(true)
      .loop(false)
      .itemSpace(0)
      .displayCount(1)
    }.margin({ top: 5 })
  }
}