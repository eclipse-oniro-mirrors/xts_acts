/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { ColorMetrics } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct AddColorStopErrorCode {
  @State str : string = '0'
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);

  build() {
    Column({ space:5 }) {
      Text(this.str).height(30).width(70).id('AddColorStopErrorCode')
      Canvas(this.context)
        .width('100%')
        .height('100%')
        .onReady(() => {
          try {
            let gradSRGB = this.context.createLinearGradient(85, 10, 160, 110)
            gradSRGB.addColorStop(0.0, ColorMetrics.colorWithSpace(ColorSpace.SRGB, 1.0, 0.0, 0.0, 1.0))
            gradSRGB.addColorStop(0.5, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1.0, 1.0, 1.0, 1.0))
            gradSRGB.addColorStop(1.0, ColorMetrics.colorWithSpace(ColorSpace.SRGB, 0.0, 1.0, 0.0, 1.0))
            this.context.fillStyle = gradSRGB
            this.context.fillRect(10, 10, 150, 150)

            let gradP3 = this.context.createLinearGradient(245, 10, 320, 110)
            gradP3.addColorStop(0.0, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1.0, 0.0, 0.0, 1.0))
            gradP3.addColorStop(0.5, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 1.0, 1.0, 1.0, 1.0))
            gradP3.addColorStop(1.0, ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0.0, 1.0, 0.0, 1.0))
            this.context.fillStyle = gradP3
            this.context.fillRect(170, 10, 150, 150)
          } catch(e) {
            let error = e as BusinessError;
            if(typeof(e as BusinessError)){
              this.str = error.code.toString()
            } else{
              console.info('error code is error');
            }
          }
          if(this.str == '103701'){
            this.str = 'hello'
          } else {
            console.info('error code is error');
          }
        })
    }
    .width('100%')
  }
}