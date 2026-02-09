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
import { ColorMetrics} from '@kit.ArkUI';
import { JSON } from '@kit.ArkTS';

@Entry
@Component
struct Index{
  @State p3Green: ColorMetrics = ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0, 1 ,0);

  build() {
    Column(){
      Row(){
        Text('P3').width('25%').textAlign(TextAlign.Center).fontSize(10).borderWidth({left:0.5,top:1,bottom:1,right:0.5})
        Text('SweepGradient_P3').width('25%').textAlign(TextAlign.Center).fontSize(10).borderWidth({left:0.5,top:1,bottom:1,right:0})

      }.margin({bottom:20})
      Row(){
        Column(){
          Row(){
            Text('bgColor').id('P3backgroundColor').width('20%').aspectRatio(1).backgroundColor(this.p3Green)
            Text('SweepGradient' ) .id('P3SweepGradient').width('20%').aspectRatio(1)
              .sweepGradient({
                center: [50, 50],
                start: 0,
                end: 359,
                metricsColors: [[this.p3Green, 0.0], [this.p3Green, 0.5], [this.p3Green, 1.0]],
                colors: []
              })
          }
        }
      }
    }
  }
}