'use static';
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
  Entry,
  Component,
  Column,
  ColumnOptions,
  Row,
  Text,
  Button,
  Scroll,
  WaterFlow,
  LazyVGridLayout,
  LazyForEach,
  FontWeight,
  ClickEvent,
  $r,
  Margin,
  Color,
  TextAlign,
  FlexAlign
} from '@ohos.arkui.component'
import { State, AppStorage, Consume, Provide } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { LengthMetrics } from '@ohos.arkui.node'
import { MyDataSource } from './MyDataSource'

@Entry
@Component
struct onVisibleIndexesChangeLazyVGridLayout {
  private arr1:MyDataSource<number> = new MyDataSource<number>();
  private arr2:MyDataSource<number> = new MyDataSource<number>();
  @State visibleStart: number = -1
  @State visibleEnd: number = -1

  build() {
    Scroll() {
      Column() {
        Text('LazyVGridLayout onVisibleIndexesChange Test')
        Row() {
          Text('Start: ' + this.visibleStart)
            .id('text_visible_start')

          Text('End: ' + this.visibleEnd)
            .id('text_visible_end')
        }
        .width('100%')
        .justifyContent(FlexAlign.Center)
        .margin({ bottom: 5 } as Margin)

        WaterFlow() {
          LazyVGridLayout() {
            LazyForEach(this.arr1, (item:number)=>{
              Text('item' + item.toString())
                .height('10%')
                .width('100%')
                .borderRadius(5)
                .backgroundColor(Color.White)
                .textAlign(TextAlign.Center)
            })
          }
          .id('lazyVGridLayout_on1')
          .columnsTemplate('1fr')
          .onVisibleIndexesChange((start: int, end: int) => {
            console.info('visible indexes: start= ' + start,' , end= ' + end);
          })

          LazyVGridLayout() {
            LazyForEach(this.arr2, (item:number)=>{
              Text('item2_' + item.toString())
                .id('item2_' + item)
                .height('20%')
                .width('100%')
                .borderRadius(5)
                .backgroundColor(Color.White)
                .textAlign(TextAlign.Center)
            })
          }
          .columnsTemplate('1fr 1fr')
          .rowsGap(LengthMetrics.vp(10))
          .columnsGap(LengthMetrics.vp(10))
          .onVisibleIndexesChange(undefined)
        }
        .padding(10)
        .rowsGap(10)
      }
      .width('100%')
      .height('70%')
      .backgroundColor('#DCDCDC')
    }
  }

  aboutToAppear(): void {
    for (let i = 0; i < 6; i++) {
      this.arr1.pushData(i);
    }
    for (let i = 0; i < 30; i++) {
      this.arr2.pushData(i);
    }
  }
}