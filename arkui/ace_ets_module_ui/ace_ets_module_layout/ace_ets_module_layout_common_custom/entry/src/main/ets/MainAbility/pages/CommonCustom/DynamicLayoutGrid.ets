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
  GridLayoutAlgorithm,
  DynamicLayout, DynamicLayoutAttribute} from '@kit.ArkUI';
import { LengthMetrics } from '@ohos.arkui.node';

@Entry
@ComponentV2
struct DynamicLayoutGrid {
  @Local algorithm: GridLayoutAlgorithm = new GridLayoutAlgorithm({
    columnsTemplate:'1fr',
    columnsGap:LengthMetrics.vp(0),
    rowsGap:LengthMetrics.vp(0)
  });

  build() {
    Column({space:2}) {
      Row({space: 2}) {
        DynamicLayout(this.algorithm) {
          Text()
            .backgroundColor(Color.Red)
            .width(50)
            .height(25)
          Text()
            .backgroundColor(Color.Blue)
            .width(50)
            .height(25)
        }
        .id('DynamicLayoutGrid')
        .backgroundColor(Color.Yellow)
        .width(150)
        .height(70)
      }

      Row(){
        Button('vp(-1)')
          .onClick(()=>{
            this.algorithm.columnsGap = LengthMetrics.vp(-1)
            this.algorithm.rowsGap = LengthMetrics.vp(-1)
          })
          .id('GridLayoutAlgorithmVp(-1)')
          .width(80)
          .height(20)
        Button('vp(1)')
          .onClick(()=>{
            this.algorithm.columnsGap = LengthMetrics.vp(1)
            this.algorithm.rowsGap = LengthMetrics.vp(1)
          })
          .id('GridLayoutAlgorithmVp(1)')
          .width(80)
          .height(20)
      }

      Row(){
        Button('nullString')
          .onClick(()=>{
            this.algorithm.columnsTemplate = ''
          })
          .id('GridLayoutAlgorithmNullString')
          .width(80)
          .height(20)
        Button('get')
          .onClick(()=>{
            let strJson1 = getInspectorByKey('DynamicLayoutGrid');
            console.info('hello:'+JSON.parse(strJson1).$attrs.columnsTemplate);
            console.info('hello:'+JSON.parse(strJson1).$attrs.rowsGap);

          })
          .width(80)
          .height(20)
      }
      Row(){
        Button('undefined')
          .onClick(()=>{
            this.algorithm.columnsTemplate = undefined
            this.algorithm.columnsTemplate = undefined
            this.algorithm.rowsGap = undefined
          })
          .id('GridLayoutAlgorithmUndefined')
          .width(80)
          .height(20)
      }

    }
    .width('100%')
    .width('100%')
  }
}