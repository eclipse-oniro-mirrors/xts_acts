'use static';

/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  Entry,
  Column,
  Component,
  RenderingContextSettings,
  CanvasRenderingContext2D,
  Canvas,ColumnOptions
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { LengthMetricsUnit } from '@kit.ArkUI';

@Entry
@Component
struct CanvasWidthHeightCanvas {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)

  build() {
    Column({ space:3} as ColumnOptions) {
      Canvas(this.context)
        .id('CanvasWidthHeightCanvas')
        .width(150)
        .height(100)
        .backgroundColor('#ffff00')
        .onReady(() => {
          let ret:double = Math.floor(this.context.width)
          this.context.fillRect(0, 0, ret / 2, 180)
          let ret1:double = Math.floor(this.context.height)
          this.context.fillRect(0, 0, 180, ret1/ 2)
          console.info('get result:' + ret);
          console.info('get result1:' + ret1);
          AppStorage.setOrCreate<double>('CanvasWidth', ret);
          AppStorage.setOrCreate<double>('CanvasHeight', ret1);
          console.info('get result:' + AppStorage.get<double>('CanvasWidth'));
          console.info('get result1:' + AppStorage.get<double>('CanvasHeight'));
        })
    }
    .width('100%')
    .height('100%')
  }
}

