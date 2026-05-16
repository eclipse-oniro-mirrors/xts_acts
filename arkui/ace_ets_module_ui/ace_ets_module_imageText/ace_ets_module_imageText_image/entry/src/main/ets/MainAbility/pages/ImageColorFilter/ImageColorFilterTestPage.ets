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

import { drawing, common2D } from '@kit.ArkGraphics2D';

@Entry
@Component
struct ImageColorFilterTestPage {
  private color: common2D.Color = {
    alpha: 255,
    red: 255,
    green: 0,
    blue: 0
  };
  @State drawingColorFilter: ColorFilter | undefined = undefined;
  private colorFilterMatrix: number[] = [1, 0, 0, 0, 0.5,
    0, 1, 0, 0, 0,
    0, 0, 1, 0, 0,
    0, 0, 0, 1, 0];

  aboutToAppear(): void {
    try {
      this.drawingColorFilter = drawing.ColorFilter.createBlendModeColorFilter(this.color, drawing.BlendMode.SRC_IN);
    } catch (e) {
      console.error('Failed to create DrawingColorFilter: ' + e);
    }
  }

  build() {
    Scroll() {
      Column() {
        Text('Image colorFilter Test - Default')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        Image($r('app.media.icon'))
          .id('imageColorFilterDefaultId')
          .width(100)
          .height(100)

        Text('Image colorFilter Test - ColorFilter Matrix')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        Image($r('app.media.icon'))
          .id('imageColorFilterMatrixId')
          .width(100)
          .height(100)
          .colorFilter(new ColorFilter(this.colorFilterMatrix))

        Text('Image colorFilter Test - DrawingColorFilter')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        Image($r('app.media.icon'))
          .id('imageColorFilterDrawingId')
          .width(100)
          .height(100)
          .colorFilter(this.drawingColorFilter)

        Text('Image colorFilter Test - ResourceColor Number')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        Image($r('app.media.icon'))
          .id('imageColorFilterColorNumberId')
          .width(100)
          .height(100)
          .colorFilter(0xFF0000FF)

        Text('Image colorFilter Test - ResourceColor String')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        Image($r('app.media.icon'))
          .id('imageColorFilterColorStringId')
          .width(100)
          .height(100)
          .colorFilter('#FF0000')

        Text('Image colorFilter Test - ResourceColor Resource')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        Image($r('app.media.icon'))
          .id('imageColorFilterColorResourceId')
          .width(100)
          .height(100)
          .colorFilter($r('sys.color.ohos_id_color_primary'))

        Text('Image colorFilter Test - Empty String')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        Image($r('app.media.icon'))
          .id('imageColorFilterEmptyStringId')
          .width(100)
          .height(100)
          .colorFilter('')

        Text('Image colorFilter Test - Undefined')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        Image($r('app.media.icon'))
          .id('imageColorFilterUndefinedId')
          .width(100)
          .height(100)
          .colorFilter(undefined)

        Text('Image colorFilter Test - Null')
          .fontSize(16)
          .margin({ top: 10, bottom: 5 })
        Image($r('app.media.icon'))
          .id('imageColorFilterNullId')
          .width(100)
          .height(100)
          .colorFilter(null)
      }
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .height('100%')
  }
}
