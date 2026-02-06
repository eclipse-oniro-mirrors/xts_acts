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
import { Entry,Column,Component,Button,Video,VideoController,Text,
  ColumnOptions,ImageFit,Row,ClickEvent,SeekMode,Color,Blank,Scroll,  Padding } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { LengthMetrics } from '@ohos.arkui.node'

@Entry
@Component
struct SafeAreaPadding_01 {
  @State column_safeArea_top: number = 0;
  @State column_safeArea_bottom: number = 0;
  @State column_safeArea_left: number = 0;
  @State column_safeArea_right: number = 0;

  build() {
    Column({ space: 20 } as ColumnOptions) {
      Column() {
        Row()
          .backgroundColor(Color.Gray)
          .width(150)
          .height('50%')
          .id('safeAreaPadding_001')
          .safeAreaPadding({
            top: 0,
            bottom:0,
            left: 0,
            right: 0
          } as Padding)
      }
      .id('safeAreaPadding_002')
      .backgroundColor(Color.Pink)
      .width(200)
      .height('40%')
      
      .safeAreaPadding({
        top: this.column_safeArea_top,
        bottom: this.column_safeArea_bottom,
        left: this.column_safeArea_left,
        right: this.column_safeArea_right
      } as Padding)

      Blank()
      Scroll() {
        Column({space: 10} as ColumnOptions) {
            Text('Column Setting')
            Row() {
              Button('safeArea-top+,' + this.column_safeArea_top).onClick((event: ClickEvent) => {
                this.column_safeArea_top += 5
              })
              .id('SafeArea_button1')
              Button('safeArea-top-,' + this.column_safeArea_top).onClick((event: ClickEvent) => {
                this.column_safeArea_top -= 5
              })
            }
            Row() {
              Button('safeArea-bottom+,' + this.column_safeArea_bottom).onClick((event: ClickEvent) => {
                this.column_safeArea_bottom += 5
              })
              Button('safeArea-bottom-,' + this.column_safeArea_bottom).onClick((event: ClickEvent) => {
                this.column_safeArea_bottom -= 5
              })
            }

            Row() {
              Button('safeArea-left+,' + this.column_safeArea_left).onClick((event: ClickEvent) => {
                this.column_safeArea_left += 5
              })
              Button('safeArea-left-,' + this.column_safeArea_left).onClick((event: ClickEvent) => {
                this.column_safeArea_left -= 5
              })
            }

            Row() {
              Button('safeArea-right+,' + this.column_safeArea_right).onClick((event: ClickEvent) => {
                this.column_safeArea_right += 5
              })
              Button('safeArea-right-,' + this.column_safeArea_right).onClick((event: ClickEvent) => {
                this.column_safeArea_right -= 5
              })
        }
      }.height('40%')
    }
    }.width('100%').height('100%')
  }
}