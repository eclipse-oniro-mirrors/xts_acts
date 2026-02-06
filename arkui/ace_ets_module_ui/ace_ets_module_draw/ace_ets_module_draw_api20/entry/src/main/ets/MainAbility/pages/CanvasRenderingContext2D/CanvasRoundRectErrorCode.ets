/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { BusinessError } from '@kit.BasicServicesKit';
@Entry
@Component
struct CanvasRoundRectErrorCode {
  @State str : string = '0'
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Column({ space: 10 }) {
        Text(this.str).height(30).width(70).id('CanvasRoundRectErrorCode')
        Canvas(this.context)
          .width('100%')
          .height('100%')
          .onReady(() => {
            let ctx = this.context
            try {
              ctx.beginPath();
              ctx.roundRect(10, 150, 150, 100, -40);
              ctx.stroke();
              ctx.roundRect(10, 150, 150, 100, [10,40,70,100,130]);
              ctx.stroke();
              ctx.roundRect(10, 150, 150, 100, [-10,40]);
              ctx.stroke();
              ctx.roundRect(10, 150, 150, 100, []);
              ctx.stroke();
            } catch(e) {
              let error = e as BusinessError;
              console.info(`Failed message: ${error.message}, code: ${error.code}`);
              this.str = error.code.toString()
            }
          })
      }
    }
    .width('100%')
    .height('100%')
  }
}