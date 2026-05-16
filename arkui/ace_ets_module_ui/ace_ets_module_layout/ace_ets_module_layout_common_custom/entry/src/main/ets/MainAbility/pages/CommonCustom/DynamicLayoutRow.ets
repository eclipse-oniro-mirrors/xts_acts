/*
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
  LengthMetrics,
  RowLayoutAlgorithm,
  DynamicLayout, DynamicLayoutAttribute} from '@kit.ArkUI';

@Entry
@ComponentV2
struct DynamicLayoutRow {
  @Local algorithm: RowLayoutAlgorithm = new RowLayoutAlgorithm({
    space: LengthMetrics.vp(0),
    alignItems: VerticalAlign.Center,
    justifyContent: FlexAlign.Start,
    isReverse: false
  });
  @Local rowSpace: number = 0
  @Local rowAlignItems: VerticalAlign | undefined = VerticalAlign.Center
  @Local rowJustifyContent: FlexAlign | undefined= FlexAlign.Start
  @Local rowIsReverse: boolean | undefined  = false;

  public uiContext: UIContext | undefined = undefined;
  public rowAlignItemsArr: VerticalAlign [] = [VerticalAlign.Center, VerticalAlign.Top, VerticalAlign.Bottom]
  public rowAlignItemsIndex: number = 0
  public rowJustifyContentArr: FlexAlign[] = [FlexAlign.Start, FlexAlign.Center, FlexAlign.End,
    FlexAlign.SpaceBetween, FlexAlign.SpaceAround, FlexAlign.SpaceEvenly]
  public rowJustifyContentIndex: number = 0
  public flag: boolean = false

  build() {
    Column({space:2}) {
      Row({space: 2}) {
        DynamicLayout(new RowLayoutAlgorithm(this.algorithm)) {
          Row()
            .id('RowLayoutAlgorithm1')
            .backgroundColor(Color.Blue)
            .width(40)
            .height(25)
          Row()
            .id('RowLayoutAlgorithm2')
            .backgroundColor(Color.Red)
            .width(50)
            .height(25)
        }
        .id('DynamicLayoutRow')
        .backgroundColor(Color.Yellow)
        .width(150)
        .height(70)
      }

      Row() {
        Button(`Space++ ${this.rowSpace}`)
          .onClick(()=>{
            this.rowSpace += 2
            this.algorithm.space = LengthMetrics.vp(this.rowSpace)
          })
          .id('RowLayoutAlgorithmSpace++')
          .width(90)
          .height(20)

        Button(`Space-- ${this.rowSpace}`)
          .onClick(()=>{
            this.rowSpace -= 2
            this.algorithm.space = LengthMetrics.vp(this.rowSpace)
          })
          .id('RowLayoutAlgorithmSpace--')
          .width(90)
          .height(20)
      }
      Row(){
        Button(`AlignItems: ${JSON.stringify(this.rowAlignItems)}`)
          .onClick(()=>{
            this.rowAlignItemsIndex += 1
            if (this.rowAlignItemsIndex == 3) {
              this.rowAlignItemsIndex = 0
            }
            this.rowAlignItems = this.rowAlignItemsArr[this.rowAlignItemsIndex]
            this.algorithm.alignItems = this.rowAlignItemsArr[this.rowAlignItemsIndex]
          })
          .id('RowLayoutAlgorithmAlignItems')
          .width(90)
          .height(20)

        Button(`justifyContent ${JSON.stringify(this.rowJustifyContent)}`)
          .onClick(()=>{
            this.rowJustifyContentIndex += 1
            if (this.rowJustifyContentIndex == 6) {
              this.rowJustifyContentIndex = 0
            }
            this.rowJustifyContent= this.rowJustifyContentArr[this.rowJustifyContentIndex]
            this.algorithm.justifyContent = this.rowJustifyContent
          })
          .id('RowLayoutAlgorithmJustifyContent')
          .width(100)
          .height(20)
      }
      Row(){
        Button(`isReverse: ${JSON.stringify(this.rowIsReverse)}`)
          .onClick(()=>{
            this.rowIsReverse = !this.rowIsReverse
            this.algorithm.isReverse = this.rowIsReverse
          })
          .id('RowLayoutAlgorithmIsReverse')
          .width(100)
          .height(20)
        Button('get')
          .onClick(()=>{
            let strJson1 = getInspectorByKey('DynamicLayoutRow');
            console.info('hello:'+JSON.parse(strJson1).$attrs.space);
            console.info('hello:'+JSON.parse(strJson1).$attrs.alignItems);
            console.info('hello:'+JSON.parse(strJson1).$attrs.justifyContent);
          })
          .width(100)
          .height(20)
      }
      Row(){
        Button('undefined')
          .onClick(()=>{
            this.algorithm.space = undefined
            this.algorithm.alignItems = undefined
            this.algorithm.justifyContent = undefined
            this.algorithm.isReverse = undefined
          })
          .id('RowLayoutAlgorithmUndefined')
          .width(80)
          .height(20)
      }

    }
    .width('100%')
    .width('100%')
  }
}