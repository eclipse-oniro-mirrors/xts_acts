'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { Entry, Image, $r, Color, Scroll, ColorFilter, Text, Column, Component, Button, ClickEvent, FlexAlign, HorizontalAlign } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

import { resourceManager } from '@kit.LocalizationKit';
import { common2D, drawing } from '@kit.ArkGraphics2D';

const color : common2D.Color = { alpha: 100, red: 255, green: 0, blue: 0 };
let drawingColorFilter = drawing.ColorFilter.createBlendModeColorFilter(color, drawing.BlendMode.SRC_ATOP);

@Entry
@Component
struct ImageColorFilterTestPage {

  build() {
    Scroll() {
      Column(undefined) {
        // Image colorFilter Test - 枚举值
        Image($r('app.media.startIcon'))
          .id('imageColorFilterEnumColor')
          .colorFilter(Color.Red)
          .width(100)

        // Image colorFilter Test - ResourceColor Numbernum
        Image($r('app.media.startIcon'))
          .id('imageColorFilterNumColor')
          .colorFilter(0xccaabb)
          .width(100)

        // Image colorFilter Test - ResourceColor String
        Image($r('app.media.startIcon'))
          .id('imageColorFilterStringColor')
          .colorFilter('#559988')
          .width(100)

        // Image colorFilter Test - ColorFilter Matrix
        Image($r('app.media.startIcon'))
          .id('imageColorFilterMatrixColor')
          .colorFilter(new ColorFilter(
            [1, 1, 0, 0, 0,
              0, 1, 0, 0, 0,
              0, 0, 1, 0, 0,
              0, 0, 0, 1, 0]))
          .width(100)

        // Image colorFilter Test - DrawingColorFilter
        Image($r('app.media.startIcon'))
          .id('imageColorFilterDrawingColor') 
          .colorFilter(drawingColorFilter)
          .width(100)

        // Image colorFilter Test - ResourceColor Resource
        Image($r('app.media.startIcon'))
          .id('imageColorFilterResourceColor') 
          .colorFilter($r('sys.color.ohos_id_color_primary'))
          .width(100)
      }
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .height('100%')
  }
}
