'use static';
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
import matrix4 from '@ohos.matrix4'
import {
  Entry,
  Component,
  Column,
  ColumnOptions,
  Text,
  Rating,
  Margin,
  Row,
  ClickEvent,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  Color,
  $r,
  Button,
  Image
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct dstIndex {
  private matrix1: matrix4.PolyToPolyOptions = {
    src: [ { x: 0, y: 0 }, { x: 100, y: 0 }, { x: 0, y: 100 }, { x: 100, y: 100 } ],
    dst: [ { x: 0, y: 0 }, { x: 200, y: 0 }, { x: 0, y: 200 }, { x: 200, y: 200 } ],
    pointCount:4,
  } as matrix4.PolyToPolyOptions
  private matrix2: matrix4.PolyToPolyOptions = {
    src: [ { x: 0, y: 0 }, { x: 150, y: 0 }, { x: 0, y: 150 }, { x: 150, y: 150 } ],
    dst: [ { x: 100, y: 150 }, { x: 0, y: 0 }, { x: 100, y: 0 }, { x: 0, y: 100 }, { x: 100, y: 100 } ],
    pointCount:4,
    dstIndex: 1
  } as matrix4.PolyToPolyOptions
  @State matrixArray: Array<matrix4.PolyToPolyOptions> = [ this.matrix1, this.matrix2 ]
  @State index: number = 0;


  build() {
    Row() {
      Column({ space: 100 } as ColumnOptions) {
        Button('点击变换矩阵').onClick((event: ClickEvent) => {
          this.index = (this.index + 1) % 2
        })
          .id('btn')
          .margin(60)
        Image($r('app.media.icon'))
          .transform(matrix4.identity().setPolyToPoly(this.matrixArray[this.index as int]))
          .size({ width: 100, height: 100 })
          .id('img')
      }.width('100%')
    }.height('100%')
  }
}