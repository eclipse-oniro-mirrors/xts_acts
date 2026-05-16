/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct CommonApiNullUndefined {
  build() {
    Column({ space: 3 }) {
      Row({space:5}){
        Image(null)
          .id('ImageCommonApiNull')
          .linearGradientBlur(null,null)
          .useShadowBatching(false)
          .colorBlend('')
          .hueRotate('')
          .width(80)
          .height(50)
          .background(Color.Blue)
        Image(null)
          .id('ImageCommonApiUndefined')
          .linearGradientBlur(undefined,undefined)
          .width(80)
          .height(50)
          .background(Color.Blue)
      }
      Row({space:5}){
        Row()
          .id('CommonApiNull')
          .borderRadius(null,null)
          .borderImage(null)
          .outlineStyle(null)
          .animation(null)
          .colorBlend(null)
          .hueRotate(null)
          .useShadowBatching(null)
          .width(80)
          .height(50)
          .background(Color.Blue)
        Row()
          .id('CommonApiUndefined')
          .borderRadius(undefined,undefined)
          .borderImage(undefined)
          .outlineStyle(undefined)
          .animation(undefined)
          .colorBlend(undefined)
          .hueRotate(undefined)
          .useShadowBatching(undefined)
          .width(80)
          .height(50)
          .background(Color.Blue)
      }

    }
    .width('100%')
    .height('100%')
  }
}