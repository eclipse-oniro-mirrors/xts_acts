/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct LinearGradientBlurTest {
  private_resource1: Resource = $r('app.media.icon')
  @State image_src: Resource = this.private_resource1

  build() {
    Column() {
      Flex({justifyContent: FlexAlign.Center , alignItems: ItemAlign.Center }) {
        Column({ space: 5 }) {
          Image(this.image_src).height('10%').id('imageId1').brightness(0)
            .linearGradientBlur(-1,
              { fractionStops: [[0, 0], [0, 0.33], [1, 0.66], [1, 1]], direction: GradientDirection.Bottom })
          Image(this.image_src).height('10%').id('imageId2').brightness(-1)
            .linearGradientBlur(0,
              { fractionStops: [[0, 0], [0, 0.33], [1, 0.66], [1, 1]], direction: GradientDirection.Bottom })
          Image(this.image_src).height('10%').id('imageId3')
            .linearGradientBlur(1000,
              { fractionStops: [[0, 0], [0, 0.33], [1, 0.66], [1, 1]], direction: GradientDirection.Bottom })
          Image(this.image_src).height('10%').id('imageId4')
            .linearGradientBlur(1001,
              { fractionStops: [[0, 0], [0, 0.33], [1, 0.66], [1, 1]], direction: GradientDirection.Bottom })
        }
      }
    }
  }
}