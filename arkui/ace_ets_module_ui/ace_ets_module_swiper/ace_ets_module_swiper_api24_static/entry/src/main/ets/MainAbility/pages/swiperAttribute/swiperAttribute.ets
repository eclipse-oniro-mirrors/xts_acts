/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';

import { Column, ColumnOptions, Text, Swiper, SwiperController, Entry, Component, ScrollState } from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct SwiperAttrTestPage {
  swiperController: SwiperController = new SwiperController();

  aboutToAppear(): void {
    AppStorage.setOrCreate<boolean>('swiperAttr_ready', true);
  }

  build() {
    Column({ space: 8 } as ColumnOptions) {
      Text('swiper cachedCount(isShown,independent) + onScrollStateChanged + maintainVisibleContentPosition')
        .fontSize(11)
        .width('100%')
        .height('12%')
        .id('swiperAttr_title');
      Swiper(this.swiperController) {
        Text('p0').fontSize(9).height('6%');
        Text('p1').fontSize(9).height('6%');
      }
      .cachedCount(2, { isShown: true, independent: true })
      .onScrollStateChanged((_: ScrollState) => {})
      .maintainVisibleContentPosition(true)
      .height('16%')
      .width('100%')
      .id('swiperAttr_body');
    }
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' });
  }
}
