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
struct CanvasRenderingContext2DGlobalAlpha {
  // 测试1: globalAlpha 设置为半透明 0.4
  private settingsAlpha04: RenderingContextSettings = new RenderingContextSettings(true);
  private contextAlpha04: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settingsAlpha04);

  // 测试2: 通过Button click回调设置globalAlpha
  private settingsAlpha06: RenderingContextSettings = new RenderingContextSettings(true);
  private contextAlpha06: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settingsAlpha06);
  @State globalAlphaClickResult: string = 'not set';

  build() {
    Column() {
      // 测试1: globalAlpha 设置为 0.4（半透明）
      Canvas(this.contextAlpha04)
        .id('canvas_globalAlpha_04')
        .width(200)
        .height(50)
        .backgroundColor('#F5F5F5')
        .onReady((): void => {
          this.contextAlpha04.fillStyle = 'rgb(0,0,255)';
          this.contextAlpha04.fillRect(0, 0, 50, 50);
          this.contextAlpha04.fillStyle = 'rgb(0,0,255)';
          this.contextAlpha04.fillRect(50, 50, 50, 50);
          this.contextAlpha04.globalAlpha = 0.4;
        })

      // 测试2: 通过Button click回调设置globalAlpha为0.6
      Column() {
        Canvas(this.contextAlpha06)
          .id('canvas_globalAlpha_06')
          .width(200)
          .height(50)
          .backgroundColor('#F5F5F5')
          .onReady((): void => {
            this.contextAlpha06.fillStyle = 'rgb(255,0,0)';
            this.contextAlpha06.fillRect(0, 0, 50, 50);
          })
        Button('Set globalAlpha to 0.6')
          .id('button_globalAlpha_06')
          .height(20)
          .onClick(() => {
            this.contextAlpha06.globalAlpha = 0.6;
            this.globalAlphaClickResult = 'globalAlpha set to 0.6';
          })
        Text(`Result: ${this.globalAlphaClickResult}`)
          .height(30)
          .id('text_globalAlpha_06_result')
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}