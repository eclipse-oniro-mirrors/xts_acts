/*
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

import { drawing } from '@kit.ArkGraphics2D';

@Entry
@Component
struct SpanExample {
  @State applyColorFilter: boolean = false;
  private colorFilterMatrix: number[] = [0.239, 0, 0, 0, 0, 0, 0.616, 0, 0, 0, 0, 0, 0.706, 0, 0, 0, 0, 0, 1, 0];
  @State drawingColorFilterFirst: ColorFilter | undefined = new ColorFilter(this.colorFilterMatrix);
  controller: TextController = new TextController();
  @State support: boolean = false;
  @State supportSvg2Multiple: (boolean | null | undefined)[] = [true, false, null, undefined];
  @State supportSvg2MultipleIndex: number = 0;

  build() {
    Row() {
      Column({ space: 10 }) {
        Button(this.applyColorFilter ? 'ImageSpan' : 'ImageSpan')
          .id('ImageSpanId')
          .onClick(() => {
            this.applyColorFilter = !this.applyColorFilter;
          })

        Text() {
          ImageSpan($r('app.media.strokeFile'))
            .width('60vp')
            .height('60vp')
            .supportSvg2(this.supportSvg2Multiple[this.supportSvg2MultipleIndex])
            .colorFilter(this.applyColorFilter ?
            drawing.ColorFilter.createBlendModeColorFilter(
              drawing.Tool.makeColorFromResourceColor(Color.Red),
              drawing.BlendMode.SRC_IN
            ) :
              undefined
            )
        }
        .id('id')

        Row({ space: 10 }) {
          Button('true')
            .onClick(() => {
              this.supportSvg2MultipleIndex = 0;
            })
            .id('supportSvg2True')
          Button('false')
            .onClick(() => {
              this.supportSvg2MultipleIndex = 1;
            })
            .id('supportSvg2False')
          Button('null')
            .onClick(() => {
              this.supportSvg2MultipleIndex = 2;
            })
            .id('supportSvg2Null')
          Button('undefined')
            .onClick(() => {
              this.supportSvg2MultipleIndex = 3;
            })
            .id('supportSvg2Undefined')
        }
        .margin({ top: 20 })

      }
      .width('100%')
    }
    .height('100%')
  }
}