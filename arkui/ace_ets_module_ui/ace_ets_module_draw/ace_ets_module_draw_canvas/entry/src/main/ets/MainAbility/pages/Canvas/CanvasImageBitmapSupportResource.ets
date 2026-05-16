/*
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

import { LengthMetricsUnit } from '@kit.ArkUI';

@Entry
@Component
struct CanvasImageBitmapSupportResource {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  private context1: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  private context2: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  private img1_png: ImageBitmap = new ImageBitmap($r('app.media.icon'), LengthMetricsUnit.DEFAULT);
  private img2_png: ImageBitmap = new ImageBitmap($rawfile('test.png'), LengthMetricsUnit.DEFAULT);
  private img3_png: ImageBitmap = new ImageBitmap('', LengthMetricsUnit.DEFAULT);

  build() {
    Column({space:5}) {
      Canvas(this.context)
        .width(150)
        .height(50)
        .backgroundColor(Color.Yellow)
        .onReady(() => {
          this.context.drawImage(this.img1_png, 0, 0, 1.6*118, 118, 0, 0, 1.6*150, 150)
          this.img1_png.close()
        })
        .id('CanvasImageBitmapSupportResource')
      Canvas(this.context1)
        .width(150)
        .height(50)
        .backgroundColor(Color.Yellow)
        .onReady(() => {
          this.context1.drawImage(this.img2_png, 0, 0, 1.6*118, 118, 0, 0, 1.6*150, 150)
          this.img2_png.close()
        })
        .id('CanvasImageBitmapSupportResource1')
      Canvas(this.context2)
        .width(150)
        .height(50)
        .backgroundColor(Color.Yellow)
        .onReady(() => {
          this.context1.drawImage(this.img3_png, 0, 0, 1.6*118, 118, 0, 0, 1.6*150, 150)
          this.img2_png.close()
        })
        .id('CanvasImageBitmapSupportResource2')
    }.width('100%').height('100%')
  }
}