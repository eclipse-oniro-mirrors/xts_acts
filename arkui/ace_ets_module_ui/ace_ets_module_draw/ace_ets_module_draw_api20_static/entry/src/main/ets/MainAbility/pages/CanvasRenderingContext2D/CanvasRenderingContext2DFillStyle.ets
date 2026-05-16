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
  CanvasPattern,
  CanvasGradient,
  Color,
  Button,
  Text
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct CanvasRenderingContext2DFillStyle {
  private settingsBlue: RenderingContextSettings = new RenderingContextSettings(true);
  private contextBlue: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settingsBlue);

  private settingsRed: RenderingContextSettings = new RenderingContextSettings(true);
  private contextRed: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settingsRed);
  @State fillStyleResult: String|Color|Int|CanvasGradient|CanvasPattern = 'not set';

  build() {
    Column() {
      Canvas(this.contextBlue)
        .id('canvas_fillStyle_blue')
        .width(100)
        .height(50)
        .backgroundColor('#FFFF0000')
        .onReady((): void => {
          this.contextBlue.fillStyle = '#0000ff';
          this.contextBlue.fillRect(20, 20, 150, 100);
        })

      Column() {
        Canvas(this.contextRed)
          .id('canvas_fillStyle_red')
          .width(100)
          .height(50)
          .backgroundColor('#FFFF0000')
          .onReady((): void => {
            this.contextRed.fillRect(20, 20, 150, 100);
          })
        Button('Set fillStyle to #FFFF0000')
          .id('button_fillStyle_red')
          .height(20)
          .onClick(() => {
            this.contextRed.fillStyle = '#FFFF0000';
            this.fillStyleResult = this.contextRed.fillStyle;
          })
        Text(`Result: ${this.fillStyleResult}`)
          .id('text_fillStyle_result')
          .height(30)
      }

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}