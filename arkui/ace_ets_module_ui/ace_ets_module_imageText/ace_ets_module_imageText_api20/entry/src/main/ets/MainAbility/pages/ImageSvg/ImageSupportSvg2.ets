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

@Entry
@Component
struct SvgPage {
  build() {
    Column() {
      Flex({ wrap: FlexWrap.Wrap }) {
        Image($r('app.media.svg1'))
          .width('30%')
          .margin(5)
          .supportSvg2(true)
          .key('image1')

        Image($r('app.media.svg1'))
          .width('30%')
          .margin(5)
          .key('image2')
          .supportSvg2(false)

        Image($r('app.media.svg1'))
          .width('30%')
          .margin(5)
          .key('image3')
          .supportSvg2(null)
        Image($r('app.media.svg1'))
          .width('30%')
          .margin(5)
          .key('image4')
          .supportSvg2(undefined)
        Image($r('app.media.svg1'))
          .width('30%')
          .margin(5)
          .key('image5')
      }.width('95%')
    }.width('100%').margin({ top: 30 })
  }
}