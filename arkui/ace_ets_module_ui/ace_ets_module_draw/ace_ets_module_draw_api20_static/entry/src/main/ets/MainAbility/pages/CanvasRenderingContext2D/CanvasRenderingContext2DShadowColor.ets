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
struct CanvasRenderingContext2DShadowColor {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  @State shadowColorResult: string = 'not set';

  build() {
    Column() {
      Column() {
        Canvas(this.context)
          .id('canvas_shadowColor')
          .width(200)
          .height(70)
          .backgroundColor('#FFFF0000')
          .onReady((): void => {
            this.context.shadowBlur = 15;
          })
        Button('Set to blue')
          .id('button_shadowColor')
          .height(20)
          .onClick(() => {
            this.context.shadowColor = 'rgb(0,0,255)';
            this.context.fillStyle = 'rgb(255,0,0)';
            this.context.fillRect(50, 10, 100, 30);
            this.shadowColorResult = 'shadowColor set to blue';
          })
        Text(`Result: ${this.shadowColorResult}`)
          .height(30)
          .id('text_shadowColor_result')
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}