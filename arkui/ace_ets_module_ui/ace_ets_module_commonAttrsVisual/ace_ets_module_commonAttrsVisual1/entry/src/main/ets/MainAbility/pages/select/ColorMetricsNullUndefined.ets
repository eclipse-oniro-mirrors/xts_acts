/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { ColorMetrics } from '@kit.ArkUI';

@Entry
@Component
struct ColorMetricsNullUndefinedSample {
  build() {
    Scroll(){
      Column(){

        Text('ColorMetricsRgbaNull')
          .backgroundColor(ColorMetrics.rgba(null,null,null,null))
          .id('ColorMetricsRgbaNull')
        Text('ColorMetricsRgbaUndefined')
          .backgroundColor(ColorMetrics.rgba(undefined,undefined,undefined,undefined))
          .id('ColorMetricsRgbaUndefined')
        Text('ColorMetricsColorWithSpaceNull')
          .backgroundColor(ColorMetrics.colorWithSpace(null,null,null,null,null))
          .id('ColorMetricsColorWithSpaceNull')
        Text('ColorMetricsColorWithSpaceUndefined')
          .backgroundColor(ColorMetrics.colorWithSpace(undefined,undefined,undefined,undefined,undefined))
          .id('ColorMetricsColorWithSpaceUndefined')
        Button('ColorMetricsResourceBlendColorNull').onClick(()=>{
          try {
            ColorMetrics.resourceColor(null).blendColor(null)
            AppStorage.setOrCreate('ColorMetricsResourceBlendColorNull',false)
          }catch {
            AppStorage.setOrCreate('ColorMetricsResourceBlendColorNull',true)
          }
        }).id('ColorMetricsResourceBlendColorNull')
        Button('ColorMetricsResourceBlendColorUndefined').onClick(()=>{
          try {
            ColorMetrics.resourceColor(undefined).blendColor(undefined)
            AppStorage.setOrCreate('ColorMetricsResourceBlendColorUndefined',false)
          }catch {
            AppStorage.setOrCreate('ColorMetricsResourceBlendColorUndefined',true)
          }
        }).id('ColorMetricsResourceBlendColorUndefined')
      }
    }
    .width('100%')
    .height('100%')
  }
}