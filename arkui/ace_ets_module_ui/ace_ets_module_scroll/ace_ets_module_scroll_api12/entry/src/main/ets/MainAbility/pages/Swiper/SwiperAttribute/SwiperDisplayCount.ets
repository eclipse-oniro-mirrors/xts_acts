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

@Entry
@Component
struct SwiperDisplayCount {
  onPageShow() {
    console.info('SwiperDisplayCount onPageShow');
  }

  build() {
    Swiper() {
      Column() {
        Text('1')
      }.width('100%').height('100%').backgroundColor(0xF5DEB3).id('swiperDisplayCount01')

      Column() {
        Text('2')
      }.width('100%').height('100%').backgroundColor(0xD2B48C).id('swiperDisplayCount02')

      Column() {
        Text('3')
      }.width('100%').height('100%').backgroundColor(0xF5DEB3).id('swiperDisplayCount03')

      Column() {
        Text('4')
      }.width('100%').height('100%').backgroundColor(0xD2B48C).id('swiperDisplayCount04')

      Column() {
        Text('5')
      }.width('100%').height('100%').backgroundColor(0xF5DEB3).id('swiperDisplayCount05')

      Column() {
        Text('6')
      }.width('100%').height('100%').backgroundColor(0xD2B48C).id('swiperDisplayCount06')
    }
    .id('swiperDisplayCount')
    .loop(true)
    .autoPlay(true)
  }
}