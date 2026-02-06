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
struct ImageSpanSupportSvg2Page {
  build() {
    Column() {
      Text() {
        ImageSpan($r('app.media.svg1'))
          .width('15%')
          .margin(5)
          .supportSvg2(true)
          .key('SupportSvg2_imageSpan1')
        ImageSpan($r('app.media.svg1'))
          .width('15%')
          .margin(5)
          .key('SupportSvg2_imageSpan2')
          .supportSvg2(false)
        ImageSpan($r('app.media.svg1'))
          .width('15%')
          .margin(5)
          .key('SupportSvg2_imageSpan3')
          .supportSvg2(null)
        ImageSpan($r('app.media.svg1'))
          .width('15%')
          .margin(5)
          .key('SupportSvg2_imageSpan4')
          .supportSvg2(undefined)
        ImageSpan($r('app.media.svg1'))
          .width('15%')
          .margin(5)
          .key('SupportSvg2_imageSpan5')
      }.width('95%')
    }.width('100%').margin({ top: 30 })
  }
}