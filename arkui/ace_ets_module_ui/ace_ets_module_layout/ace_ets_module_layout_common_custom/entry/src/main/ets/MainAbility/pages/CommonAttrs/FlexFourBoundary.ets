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
struct FlexFourBoundary {
  build() {
    Column({ space: 5 }) {
      Flex() {
        Text('flexGrow(0)')
          .id('oneBoundaryText')
          .flexGrow(0)
          .height(70)
          .backgroundColor(0xF5DEB3)
          .textAlign(TextAlign.Center)
          .borderWidth(5)
          .borderColor(0xAFEEEE)
          .borderRadius(0)
        Text('flexGrow(-1)')
          .id('twoBoundaryText')
          .flexGrow(-1)
          .height(70)
          .backgroundColor(0xD2B48C)
          .textAlign(TextAlign.Center)
          .borderWidth(5)
          .borderColor(0xAFEEEE)
          .borderRadius(-1)
          .aspectRatio(-1)
      }.width(200).height(90).backgroundColor(0xAFEEEE)
      Flex({ direction: FlexDirection.Row }) {
        Text('flexShrink(0)')
          .id('threeBoundaryText')
          .flexShrink(0)
          .width('50%')
          .height(70)
          .backgroundColor(0xF5DEB3)
          .textAlign(TextAlign.Center)
          .aspectRatio(0)
        Text('flexShrink(-1)')
          .id('fourBoundaryText')
          .flexShrink(-1)
          .width('40%')
          .height(70)
          .backgroundColor(0xD2B48C)
          .textAlign(TextAlign.Center)
          .aspectRatio(1)
      }.width(200).height(90).backgroundColor(0xAFEEEE)
    }.width('100%').height('100%')
  }
}