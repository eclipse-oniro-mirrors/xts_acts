'use static';
/**
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
import {MessageManager,Callback, Message, } from '../../common/MessageManager';
import { Entry, Component, DataPanelType, Position, Column, ColumnOptions, Row, Stack, DataPanel, Text, Margin, } from '@ohos.arkui.component'
import { State, StoragePropRef, AppStorage } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct DataPanelExample {
  public valueArr: Array<Double> = new Array<Double>(10, 10, 10, 10, 10, 10, 10, 10, 10)
  messageManager:MessageManager<Object> = new MessageManager<Object>()

  @StoragePropRef('maxValue') maxValue:number = 0
  @StoragePropRef('dataPanelType') dataPanelType: DataPanelType = 0 as DataPanelType
  @StoragePropRef('values') values: Array<number> = new Array<number>(25,1);


  build() {
    Column({ space: 5 } as ColumnOptions) {
      Row() {
        Stack() {
          DataPanel({ values: this.values, max: this.maxValue, type: this.dataPanelType }).width(168).height(168).key('dp1')

          DataPanel({ values: this.values}).width(168).height(168).key('dp2')
          
          Column() {
            Text('30').fontSize(35).fontColor('#182431')
            Text('1.0.0').fontSize(9.33).lineHeight(12.83).fontWeight(500).opacity(0.6)
          }

          Text('%')
            .fontSize(9.33)
            .lineHeight(12.83)
            .fontWeight(500)
            .opacity(0.6)
            .position({ x: 104.42, y: 78.17 } as Position)
        }.margin({ right: 44 } as Margin)

        Stack() {
          DataPanel({ values: [50, 12, 8, 5], max: 100, type: DataPanelType.Circle }).width(168).height(168).key('dp2')
          Column() {
            Text('75').fontSize(35).fontColor('#182431')
            Text('已使用98GB/128GB').fontSize(8.17).lineHeight(11.08).fontWeight(500).opacity(0.6)
          }

          Text('%')
            .fontSize(9.33)
            .lineHeight(12.83)
            .fontWeight(500)
            .opacity(0.6)
            .position({ x: 104.42, y: 78.17 } as Position)
        }
      }.margin({ bottom: 59 } as Margin)

      DataPanel({ values: this.valueArr, max: 100, type: DataPanelType.Line }).width(300).height(10).key('dp3')
    }.width('100%').margin({ top: 5 } as Margin)
  }
}