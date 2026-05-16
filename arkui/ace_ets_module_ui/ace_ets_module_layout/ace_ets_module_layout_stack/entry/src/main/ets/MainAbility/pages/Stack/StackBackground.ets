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

import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct BackgroundIgnoresLayoutSafeAreaEdges {
  @State layoutSafeArea : LayoutSafeAreaEdge|null|undefined = LayoutSafeAreaEdge.TOP
  @State str : string = '0'
  @Builder
  build() {
    Column({space: 5}) {
      Stack() {
        Column()
          .id('ColumnLayoutSafeAreaEdge')
          .width(50)
          .height(50)
          .border({ width: 1, color: Color.Red })
          .background(
            Color.Red,
            { align: Alignment.Center , ignoresLayoutSafeAreaEdges: [ this.layoutSafeArea ] }
          )
      }
      .id('StackLayoutSafeAreaEdge')
      .width(100)
      .height(100)
      .backgroundColor(Color.Blue)
      .safeAreaPadding(LengthMetrics.vp(50))
      Row({space:5}){
        Button('null').onClick(() => {
           this.layoutSafeArea = null
          }).width(55).height(25).id('LayoutSafeAreaEdgeNUll')
        Button('undefined').onClick(() => {
          this.layoutSafeArea = undefined
        }).width(80).height(25).id('LayoutSafeAreaEdgeUndefined')
        Button('TOP').onClick(() => {
          this.layoutSafeArea = LayoutSafeAreaEdge.TOP
          this.str = LayoutSafeAreaEdge.TOP.toString()
        }).width(55).height(25).id('LayoutSafeAreaEdgeTop')
      }
      Row({space:5}){
        Button('START').onClick(() => {
          this.layoutSafeArea =  LayoutSafeAreaEdge.START
          this.str = LayoutSafeAreaEdge.START.toString()
        }).width(60).height(25).id('LayoutSafeAreaEdgeStart')
        Button('BOTTOM').onClick(() => {
          this.layoutSafeArea = LayoutSafeAreaEdge.BOTTOM
          this.str = LayoutSafeAreaEdge.BOTTOM.toString()
        }).width(80).height(25).id('LayoutSafeAreaEdgeBottom')
        Button('END').onClick(() => {
          this.layoutSafeArea = LayoutSafeAreaEdge.END
          this.str = LayoutSafeAreaEdge.END.toString()
        }).width(55).height(25).id('LayoutSafeAreaEdgeEnd')
      }
      Row({space:1}){
        Button('VERTICAL').onClick(() => {
          this.layoutSafeArea =  LayoutSafeAreaEdge.VERTICAL
          this.str = LayoutSafeAreaEdge.VERTICAL.toString()
        }).width(70).height(25).id('LayoutSafeAreaEdgeVertical')
        Button('HORIZONTAL').onClick(() => {
          this.layoutSafeArea = LayoutSafeAreaEdge.HORIZONTAL
          this.str = LayoutSafeAreaEdge.HORIZONTAL.toString()
        }).width(80).height(25).id('LayoutSafeAreaEdgeHorizontal')
        Button('ALL').onClick(() => {
          this.layoutSafeArea = LayoutSafeAreaEdge.ALL
          this.str = LayoutSafeAreaEdge.ALL.toString()
        }).width(50).height(25).id('LayoutSafeAreaEdgeAll')
        Text(this.str).width(10).height(25).id('BackgroundLayoutSafeAreaEdge')
      }
    }.width('100%')
  }
}