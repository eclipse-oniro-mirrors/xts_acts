'use static'
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

import {
  Entry,
  Component,
  Column,
  Canvas,
  CanvasRenderingContext2D,
  RenderingContextSettings,
  Button,
  Text
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct CanvasRenderingContext2DImageSmoothingQuality {
  private settingsLow: RenderingContextSettings = new RenderingContextSettings(true);
  private contextLow: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settingsLow);

  private settingsHigh: RenderingContextSettings = new RenderingContextSettings(true);
  private contextHigh: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settingsHigh);
  @State smoothingQualityResult: string = 'not set';

  build() {
    Column() {
      Canvas(this.contextLow)
        .id('canvas_imageSmoothingQuality_low')
        .width(100)
        .height(50)
        .backgroundColor('#FFFF0000')
        .onReady((): void => {
          this.contextLow.imageSmoothingEnabled = true;
          this.contextLow.imageSmoothingQuality = 'low';
          this.contextLow.fillStyle = 'rgb(255,128,0)';
          this.contextLow.fillRect(20, 20, 50, 50);
        })

      Column() {
        Canvas(this.contextHigh)
          .id('canvas_imageSmoothingQuality_high')
          .width(100)
          .height(50)
          .backgroundColor('#FFFF0000')
          .onReady((): void => {
            this.contextHigh.imageSmoothingEnabled = true;
            this.contextHigh.fillStyle = 'rgb(255,128,0)';
            this.contextHigh.fillRect(20, 20, 50, 50);
          })
        Button('Set to high')
          .id('button_imageSmoothingQuality_high')
          .height(20)
          .onClick(() => {
            this.contextHigh.imageSmoothingQuality = 'high';
            this.smoothingQualityResult = this.contextHigh.imageSmoothingQuality;
          })
        Text(`Result: ${this.smoothingQualityResult}`)
          .id('text_imageSmoothingQuality_result')
          .height(30)
      }

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}