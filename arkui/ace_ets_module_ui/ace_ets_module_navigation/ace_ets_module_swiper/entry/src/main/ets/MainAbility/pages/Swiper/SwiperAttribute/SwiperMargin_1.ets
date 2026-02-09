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
struct SwiperMargin_1 {
  onPageShow() {
    console.info('SwiperMargin_1 onPageShow');
  }

  build() {
    Swiper() {
      Column() {
        Text('1')
      }.width(350).height(350).backgroundColor(0xF5DEB3).id('swiperMargin_1Column01')

      Column() {
        Text('2')
      }.width(350).height(350).backgroundColor(0xD2B48C).id('swiperMargin_1Column02')
    }
    .id('swiperMargin_1')
    .displayMode(SwiperDisplayMode.STRETCH)
    .loop(false)
    .prevMargin(10, false)
    .nextMargin(20, false)
  }
}