'use static';
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
import {
  Entry,
  Component,
  Column,
  Text,
  Image,
  BlurStyle,
  ThemeColorMode,
  AdaptiveColor,
  $r,
  RenderFit
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct ForegroundBlurStyleDemo {
  build() {
    Column() {
      Text('Thin Material').fontSize(30).fontColor(0xCCCCCC)
      Image($r('app.media.icon'))
        .width(300)
        .height(350)
        .key('commonAdd')
        .foregroundBlurStyle(BlurStyle.Thin,
          { colorMode: ThemeColorMode.LIGHT, adaptiveColor: AdaptiveColor.DEFAULT, scale: 1.0 })
        .mouseResponseRegion(undefined)
        .background(undefined)
        .renderGroup(false)
        .renderFit(RenderFit.BOTTOM)
        .sphericalEffect(0.5)
        .lightUpEffect(0.6)
        .pixelStretchEffect({
          top: 10,
          left: 10,
          right: 10,
          bottom: 10
        })
        .reuseId(undefined)

    }
    .height('100%')
    .width('100%')
    .width('100%')
    // .accessibilityGroup(true)
    // .accessibilityLevel("yes")
    // .accessibilityText("分组")
    // .accessibilityDescription("Column组件可以被选中，播报的内容是“分组”")
  }
}