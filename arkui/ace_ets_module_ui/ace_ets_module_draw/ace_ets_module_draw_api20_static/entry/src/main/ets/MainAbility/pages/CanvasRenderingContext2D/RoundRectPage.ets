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
  Flex, FlexDirection, ItemAlign, FlexAlign, ImageAIOptions,
  Column,
  Component,
  RenderingContextSettings,
  CanvasRenderingContext2D,
  Canvas,ColumnOptions
} from '@ohos.arkui.component';

@Entry
@Component
struct RoundRectPage {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Canvas(this.context)
        .id('RoundRectPage_Canvas')
        .width('100%')
        .height('100%')
        .backgroundColor('#ffff00')
        .onReady(() => {
          this.context.beginPath();
          this.context.roundRect(15, 0, 50, 30);
          this.context.stroke();

          this.context.roundRect(75, 0, 50, 30, 10);
          this.context.stroke();

          this.context.roundRect(135, 0, 50, 30, [10]);
          this.context.stroke();

          this.context.roundRect(15, 40, 50, 30, [10, 5]);
          this.context.stroke();

          this.context.roundRect(75, 40, 50, 30, [10, 5, 10]);
          this.context.stroke();

          this.context.roundRect(135, 40, 50, 30, [10, 5, 10, 5]);
          this.context.stroke();

          this.context.roundRect(15, 80, 50, 30,);
          this.context.stroke();

          this.context.roundRect(75, 200, -50, 30, 10);
          this.context.stroke();

          this.context.roundRect(135, 200, 50, -30, 10);
          this.context.stroke();
        })
    }
    .width('100%')
    .height('100%')
  }
}

