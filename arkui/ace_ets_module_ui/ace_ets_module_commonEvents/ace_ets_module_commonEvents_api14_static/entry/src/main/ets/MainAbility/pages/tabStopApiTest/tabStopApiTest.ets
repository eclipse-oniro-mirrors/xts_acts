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
import { IntentionCode } from '@ohos.multimodalInput.intentionCode';
import { State,AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import {LengthMetrics,Row,RowOptions,KeyEvent,KeySource,KeyType,Color,HorizontalAlign,Padding,GestureEvent,ColumnOptions,Entry,Column,Text,Button,ClickEvent,Component,Margin,SourceTool} from '@ohos.arkui.component'
import { ColorMetrics } from '@ohos.arkui.node';
@Entry
@Component
struct tabStopApiTest {
  build() {
    Column({ space: 20 } as ColumnOptions) {
      Column({ space: 20 } as ColumnOptions) {
        Column({ space: 20 } as ColumnOptions) {
          Row({ space: 5 } as RowOptions) {
            Button('button 1')
              .width(200).height(70).fontColor(Color.White)
              .focusBox({
                margin: LengthMetrics.px(20),
                strokeColor: ColorMetrics.rgba(255, 0, 0),
                strokeWidth: LengthMetrics.px(10)
              })
          }
          Row({ space: 5 } as RowOptions) {
            Button('button 2')
              .width(200).height(70).fontColor(Color.White)
              .focusBox({
                margin: LengthMetrics.px(20),
                strokeColor: ColorMetrics.rgba(255, 0, 0),
                strokeWidth: LengthMetrics.px(10)
              })
          }
        }.width('80%').margin({ top: 30 } as Margin).borderColor(Color.Black)
      }.width('95%').margin({ top: 60 } as Margin).borderColor(Color.Black)
      Column({ space: 20 } as ColumnOptions) {
        Column({ space: 20 } as ColumnOptions) {
          Row({ space: 5 } as RowOptions) {
            Button('button 3')
              .width(200)
              .height('70%')
              .fontColor(Color.White)
              .focusBox({
                margin: LengthMetrics.px(20),
                strokeColor: ColorMetrics.rgba(255, 0, 0),
                strokeWidth: LengthMetrics.px(10)
              })
              .margin({ top: 15 } as Margin)
          }
        }
        .id('button 3')
        .width('80%')
        .height('120')
        .borderColor(Color.Black)
        .margin({ top: 10 } as Margin)
        .tabStop(true)
        .focusBox({
          margin: LengthMetrics.px(20),
          strokeColor: ColorMetrics.rgba(255, 0, 0),
          strokeWidth: LengthMetrics.px(10)
        })
        .borderWidth(1)
      }.width('95%').margin({ top: 50 } as Margin).borderColor(Color.Black)
    }
  }
}