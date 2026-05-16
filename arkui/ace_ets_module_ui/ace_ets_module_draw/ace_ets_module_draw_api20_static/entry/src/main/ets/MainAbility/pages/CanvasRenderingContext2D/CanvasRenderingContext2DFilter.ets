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
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct CanvasRenderingContext2DFilter {
  private settingsGrayscale: RenderingContextSettings = new RenderingContextSettings(true);
  private contextGrayscale: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settingsGrayscale);

  private settingsContrast: RenderingContextSettings = new RenderingContextSettings(true);
  private contextContrast: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settingsContrast);
  @State filterResult: string = 'not set';

  build() {
    Column() {
      Canvas(this.contextGrayscale)
        .id('canvas_filter_grayscale')
        .width(100)
        .height(50)
        .backgroundColor('#FFFF0000')
        .onReady((): void => {
          this.contextGrayscale.fillStyle = 'rgb(255,0,0)';
          this.contextGrayscale.fillRect(20, 20, 50, 50);
          this.contextGrayscale.filter = 'grayscale(50%)';
        })

      Column() {
        Canvas(this.contextContrast)
          .id('canvas_filter_contrast')
          .width(100)
          .height(50)
          .backgroundColor('#FFFF0000')
          .onReady((): void => {
            this.contextContrast.fillStyle = 'rgb(0,0,255)';
            this.contextContrast.fillRect(20, 20, 50, 50);
          })
        Button('Set filter to contrast(200%)')
          .id('button_filter_contrast')
          .height(20)
          .onClick(() => {
            this.contextContrast.filter = 'contrast(200%)';
            this.filterResult = this.contextContrast.filter;
          })
        Text(`Result: ${this.filterResult}`)
          .id('text_filter_result')
          .height(30)
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}