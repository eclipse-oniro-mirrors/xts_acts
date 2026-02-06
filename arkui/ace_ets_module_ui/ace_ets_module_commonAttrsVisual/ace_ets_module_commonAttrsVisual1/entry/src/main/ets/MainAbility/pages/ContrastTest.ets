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
struct ContrastTest {
  private_resource1: Resource = $r('app.media.icon')
  @State image_src: Resource = this.private_resource1

  build() {
    Column() {
      Flex({justifyContent: FlexAlign.Center , alignItems: ItemAlign.Center }) {
        Column({ space: 5 }) {
          Image(this.image_src).height('10%').id('imageContrastId1')
            .contrast(0).grayscale(0).saturate(0).sepia(0).sphericalEffect(0).lightUpEffect(0)
          Image(this.image_src).height('10%').id('imageContrastId2')
            .contrast(-1).grayscale(-1).saturate(-1).sepia(-1).sphericalEffect(-1).lightUpEffect(-1)
          Image(this.image_src).height('10%').id('imageContrastId3')
            .contrast(10).grayscale(1).saturate(50).sepia(undefined).sphericalEffect(2).lightUpEffect(2)
          Image(this.image_src).height('10%').id('imageContrastId4')
            .contrast(9).grayscale(2).saturate(49).sphericalEffect(undefined).lightUpEffect(undefined)
          Image(this.image_src).height('10%').id('imageContrastId5')
            .contrast(11).grayscale(undefined).saturate(undefined)
        }
      }
    }
  }
}