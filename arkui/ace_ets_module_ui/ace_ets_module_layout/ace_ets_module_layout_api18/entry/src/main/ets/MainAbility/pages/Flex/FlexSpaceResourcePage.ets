/*
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
import {LengthMetrics} from '@kit.ArkUI';

@Entry
@Component
struct FlexSpaceResourcePage {
  build() {
    Column({ space: 2 }) {
      // 通过资源引用方式设置子元素垂直方向间距
      Flex({ wrap: FlexWrap.Wrap, space: {main: LengthMetrics.resource($r('app.float.flex_float_Space'))} }) {
        Column().width('40%').height('25%').backgroundColor(0xF5DEB3).id('FlexSpaceResource_Column_1_1')
        Column().width('40%').height('25%').backgroundColor(0xD2B48C).id('FlexSpaceResource_Column_1_2')
        Column().width('40%').height('25%').backgroundColor(0xD2B48C).id('FlexSpaceResource_Column_1_3')
      }
      .width('90%')
      .height('30%')
      .backgroundColor(0xAFEEEE)
      .id('FlexSpaceResource_Flex_1')

      Flex({ wrap: FlexWrap.Wrap, space: {cross: LengthMetrics.resource($r('app.integer.flex_space'))} }) {
        Column().width('40%').height('30%').backgroundColor(0xF5DEB3).id('FlexSpaceResource_Column_2_1')
        Column().width('40%').height('30%').backgroundColor(0xD2B48C).id('FlexSpaceResource_Column_2_2')
        Column().width('40%').height('30%').backgroundColor(0xD2B48C).id('FlexSpaceResource_Column_2_3')
      }
      .width('90%')
      .height('30%')
      .backgroundColor(0xAFEEEE)
      .id('FlexSpaceResource_Flex_2')

      Flex({ wrap: FlexWrap.Wrap, space: {main: LengthMetrics.resource($r('app.string.flex_space')), cross: LengthMetrics.resource($r('app.string.flex_space_px'))} }) {
        Column().width('40%').height('30%').backgroundColor(0xF5DEB3).id('FlexSpaceResource_Column_3_1')
        Column().width('40%').height('30%').backgroundColor(0xD2B48C).id('FlexSpaceResource_Column_3_2')
        Column().width('40%').height('30%').backgroundColor(0xD2B48C).id('FlexSpaceResource_Column_3_3')
      }
      .width('90%')
      .height('30%')
      .backgroundColor(0xAFEEEE)
      .id('FlexSpaceResource_Flex_3')

    }.width('100%').height('100%')
  }
}