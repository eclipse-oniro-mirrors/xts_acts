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
  ColumnLayoutAlgorithm,
  DynamicLayout, DynamicLayoutAttribute} from '@kit.ArkUI';

@Entry
@ComponentV2
struct DynamicLayoutColumn {
  algorithm: ColumnLayoutAlgorithm = new ColumnLayoutAlgorithm({
    space: LengthMetrics.vp(0),
    alignItems: HorizontalAlign.Center,
    justifyContent: FlexAlign.Start,
    isReverse: false
  });
  @Local columnSpace: number = 0
  @Local columnAlignItems: HorizontalAlign | undefined = HorizontalAlign.Center
  @Local columnJustifyContent: FlexAlign | undefined= FlexAlign.Start
  @Local columnIsReverse: boolean | undefined  = false;

  uiContext: UIContext | undefined = undefined;
  columnAlignItemsArr: HorizontalAlign [] = [HorizontalAlign.Center, HorizontalAlign.Start, HorizontalAlign.End]
  columnAlignItemsIndex: number = 0
  columnJustifyContentArr: FlexAlign[] = [FlexAlign.Start, FlexAlign.Center, FlexAlign.End,
    FlexAlign.SpaceBetween, FlexAlign.SpaceAround, FlexAlign.SpaceEvenly]
  columnJustifyContentIndex: number = 0
  flag: boolean = false

  build() {
    Column({space:2}) {
      Row({space: 2}) {
        DynamicLayout(this.algorithm) {
          Column()
            .id('ColumnLayoutAlgorithm1')
            .backgroundColor(Color.Blue)
            .width(40)
            .height(25)
          Column()
            .id('ColumnLayoutAlgorithm2')
            .backgroundColor(Color.Red)
            .width(50)
            .height(25)
        }
        .id('DynamicLayoutColumn')
        .backgroundColor(Color.Yellow)
        .width(150)
        .height(70)
      }

      Row() {
        Button(`Space++ ${this.columnSpace}`)
          .onClick(()=>{
            this.columnSpace += 2
            this.algorithm.space = LengthMetrics.vp(this.columnSpace)

          })
          .id('ColumnLayoutAlgorithmSpace++')
          .width(90)
          .height(20)

        Button(`Space-- ${this.columnSpace}`)
          .onClick(()=>{
            this.columnSpace -= 2
            this.algorithm.space = LengthMetrics.vp(this.columnSpace)
          })
          .id('ColumnLayoutAlgorithmSpace--')
          .width(90)
          .height(20)
      }
      Row(){
        Button(`AlignItems: ${JSON.stringify(this.columnAlignItems)}`)
          .onClick(()=>{
            this.columnAlignItemsIndex += 1
            if (this.columnAlignItemsIndex == 3) {
              this.columnAlignItemsIndex = 0
            }
            this.columnAlignItems = this.columnAlignItemsArr[this.columnAlignItemsIndex]
            this.algorithm.alignItems = this.columnAlignItemsArr[this.columnAlignItemsIndex]
          })
          .id('ColumnLayoutAlgorithmAlignItems')
          .width(90)
          .height(20)

        Button(`justifyContent ${JSON.stringify(this.columnJustifyContent)}`)
          .onClick(()=>{
            this.columnJustifyContentIndex += 1
            if (this.columnJustifyContentIndex == 6) {
              this.columnJustifyContentIndex = 0
            }
            this.columnJustifyContent= this.columnJustifyContentArr[this.columnJustifyContentIndex]
            this.algorithm.justifyContent = this.columnJustifyContent
          })
          .id('ColumnLayoutAlgorithmJustifyContent')
          .width(100)
          .height(20)
      }
      Row(){
        Button(`isReverse: ${JSON.stringify(this.columnIsReverse)}`)
          .onClick(()=>{
            this.columnIsReverse = !this.columnIsReverse
            this.algorithm.isReverse = this.columnIsReverse
          })
          .id('ColumnLayoutAlgorithmIsReverse')
          .width(100)
          .height(20)
        Button('get')
          .onClick(()=>{
            let strJson1 = getInspectorByKey('DynamicLayoutColumn');
            console.info('hello:'+JSON.parse(strJson1).$attrs.space);
            console.info('hello:'+JSON.parse(strJson1).$attrs.alignItems);
            console.info('hello:'+JSON.parse(strJson1).$attrs.justifyContent);
          })
          .width(80)
          .height(20)
      }
      Row() {
        Button('undefined')
          .onClick(() => {
            this.algorithm.space = undefined
            this.algorithm.alignItems = undefined
            this.algorithm.justifyContent = undefined
            this.algorithm.isReverse = undefined
          })
          .id('ColumnLayoutAlgorithmUndefined')
          .width(80)
          .height(20)
      }

    }
    .width('100%')
    .width('100%')
  }
}