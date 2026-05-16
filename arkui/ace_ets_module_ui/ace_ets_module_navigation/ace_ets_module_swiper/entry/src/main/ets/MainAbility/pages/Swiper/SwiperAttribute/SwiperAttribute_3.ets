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
struct SwiperAttribute_3 {
  onPageShow() {
    console.info('SwiperAttribute_0070 onPageShow');
  }

  build() {
    Swiper() {
      Column() {
        Text('1')
      }.width(150).height(150).backgroundColor(0xF5DEB3).id('swiperAttribute_301')

      Column() {
        Text('2')
      }.width(150).height(150).backgroundColor(0xD2B48C).id('swiperAttribute_302')

      Column() {
        Text('3')
      }.width(150).height(150).backgroundColor(0xF5DEB3).id('swiperAttribute_303')

      Column() {
        Text('4')
      }.width(150).height(150).backgroundColor(0xD2B48C).id('swiperAttribute_304')

      Column() {
        Text('5')
      }.width(150).height(150).backgroundColor(0xF5DEB3).id('swiperAttribute_305')

      Column() {
        Text('6')
      }.width(150).height(150).backgroundColor(0xD2B48C).id('swiperAttribute_306')
    }
    .id('swiperAttribute_3')
    .loop(true)
    .displayCount(1)
    .indicator(true)
    .width(300)
    .height(300)
    .backgroundColor(Color.Red)
  }
}