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
import { Entry, Component, Swiper, Column, Text } from '@ohos.arkui.component'

@Entry
@Component
struct SwiperAttribute_1 {
  onPageShow() {
    console.info('SwiperAttribute_0080 onPageShow');
  }

  build() {
    Swiper() {
      Column() {
        Text('1')
      }.width(350).height(350).backgroundColor(0xF5DEB3).id('swiperAttributeColumn_101')

      Column() {
        Text('2')
      }.width(350).height(350).backgroundColor(0xD2B48C).id('swiperAttributeColumn_102')

      Column() {
        Text('3')
      }.width(350).height(350).backgroundColor(0xF5DEB3).id('swiperAttributeColumn_103')

      Column() {
        Text('4')
      }.width(350).height(350).backgroundColor(0xD2B48C).id('swiperAttributeColumn_104')

      Column() {
        Text('5')
      }.width(350).height(350).backgroundColor(0xF5DEB3).id('swiperAttributeColumn_105')

      Column() {
        Text('6')
      }.width(350).height(350).backgroundColor(0xD2B48C).id('swiperAttributeColumn_106')
    }
    .id('swiperAttribute_1')
    .loop(true)
    .displayCount(1)
    .indicator(true)
    .width(300)
    .height(300)
  }
}