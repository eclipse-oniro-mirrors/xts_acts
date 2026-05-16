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
struct CanvasRenderingContext2DImageSmoothingEnabled {
  private settingsTrue: RenderingContextSettings = new RenderingContextSettings(true);
  private contextTrue: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settingsTrue);

  private settingsFalse: RenderingContextSettings = new RenderingContextSettings(true);
  private contextFalse: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settingsFalse);
  @State smoothingEnabledResult: string = 'not set';

  build() {
    Column() {
      Canvas(this.contextTrue)
        .id('canvas_imageSmoothingEnabled_true')
        .width(100)
        .height(50)
        .backgroundColor('#F5F5F5')
        .onReady((): void => {
          this.contextTrue.imageSmoothingEnabled = true;
          this.contextTrue.fillStyle = 'rgb(0,255,0)';
          this.contextTrue.fillRect(20, 20, 50, 50);
        })

      Column() {
        Canvas(this.contextFalse)
          .id('canvas_imageSmoothingEnabled_false')
          .width(100)
          .height(50)
          .backgroundColor('#F5F5F5')
          .onReady((): void => {
            this.contextFalse.imageSmoothingEnabled = true;
            this.contextFalse.fillStyle = 'rgb(0,255,0)';
            this.contextFalse.fillRect(20, 20, 50, 50);
          })
        Button('Set to false')
          .id('button_imageSmoothingEnabled_false')
          .height(20)
          .onClick(() => {
            this.contextFalse.imageSmoothingEnabled = false;
            this.smoothingEnabledResult = this.contextFalse.imageSmoothingEnabled.toString();
          })
        Text(`Result: ${this.smoothingEnabledResult}`)
          .id('text_imageSmoothingEnabled_result')
          .height(30)
      }

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}