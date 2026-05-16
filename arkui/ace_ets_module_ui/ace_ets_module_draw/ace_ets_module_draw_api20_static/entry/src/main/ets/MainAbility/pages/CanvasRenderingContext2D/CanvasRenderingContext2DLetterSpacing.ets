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
import { LengthMetrics, LengthUnit } from '@ohos.arkui.node'

@Entry
@Component
struct CanvasRenderingContext2DLetterSpacing {
  private settingsSpacing10: RenderingContextSettings = new RenderingContextSettings(true);
  private contextSpacing10: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settingsSpacing10);

  private settingsSpacing15: RenderingContextSettings = new RenderingContextSettings(true);
  private contextSpacing15: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settingsSpacing15);
  @State letterSpacingClickResult: string = 'not set';

  build() {
    Column() {
      Canvas(this.contextSpacing10)
        .id('canvas_letterSpacing_10vp')
        .width(100)
        .height(50)
        .backgroundColor('#FFFF0000')
        .onReady((): void => {
          this.contextSpacing10.font = '30vp';
          this.contextSpacing10.letterSpacing = '10vp';
          this.contextSpacing10.fillText('hello world', 30, 50);
        })

      Column() {
        Canvas(this.contextSpacing15)
          .id('canvas_letterSpacing_15vp')
          .width(100)
          .height(50)
          .backgroundColor('#FFFF0000')
          .onReady((): void => {
            this.contextSpacing15.font = '30vp';
            this.contextSpacing15.fillText('hello world', 30, 50);
          })
        Button('Set to 15vp')
          .id('button_letterSpacing_15vp')
          .height(20)
          .onClick(() => {
            this.contextSpacing15.letterSpacing = new LengthMetrics(15, LengthUnit.VP);
            this.letterSpacingClickResult = 'letterSpacing set to 15vp';
          })
        Text(`Result: ${this.letterSpacingClickResult}`)
          .id('text_letterSpacing_15vp_result')
          .height(30)
      }

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}