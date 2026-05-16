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
import { Entry, Component, GridCol,Column,GridColColumnOption,Color, Flex,GridColOptions,TextAlign, Button, Row, Margin, ClickEvent, FlexDirection, ItemAlign, FlexAlign, Text, Scroll, ColumnOptions, FontWeight } from '@ohos.arkui.component'
import { State,AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct gridContainer {
  @State active: boolean = false
  private content: string = "GridContainer Page"

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text(`${this.content}`)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Scroll() {
        Column({ space: 5 } as ColumnOptions) {
          GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } as GridColColumnOption} as GridColOptions) {
            Row() {
              Text('1')
              Text('2')
                .height(50).backgroundColor(Color.Red).textAlign(TextAlign.Center)
              Text('3')
                .height(50).backgroundColor(Color.Green).textAlign(TextAlign.Center)
            }
          }.key('gridContainer')
          .width('90%')
          Text('Click Simulate to change the device width').fontSize(9).width('90%').fontColor(Color.Red)
          Row() {
            Button('XS')
              .onClick(() => {
              }).backgroundColor(Color.Red)
            Button('SM')
              .onClick(() => {
              }).backgroundColor(Color.Red)
            Button('MD')
              .onClick(() => {
              }).backgroundColor(Color.Red)
            Button('LG')
              .onClick(() => {
              }).backgroundColor(Color.Red)
          }

          GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } as GridColColumnOption} as GridColOptions) {
            Row() {
              Text('1')
              Text('2')

                .height(50).backgroundColor(Color.Red).textAlign(TextAlign.Center)
              Text('3')

                .height(50).backgroundColor(Color.Red).textAlign(TextAlign.Center)
            }
          }.key('gridContainer1')
          .width('90%')
          GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } as GridColColumnOption} as GridColOptions) {
            Row() {
              Text('1')

              Text('2')

                .height(50).backgroundColor(Color.Red).textAlign(TextAlign.Center)
              Text('3')

                .height(50).backgroundColor(Color.Red).textAlign(TextAlign.Center)
            }
          }.key('gridContainer2')
          .width('90%')

          GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } as GridColColumnOption} as GridColOptions) {
            Row() {
              Text('1')
              Text('2')

                .height(50).backgroundColor(Color.Red).textAlign(TextAlign.Center)
              Text('3')

                .height(50).backgroundColor(Color.Red).textAlign(TextAlign.Center)
            }
          }.key('gridContainer3')
          .width('90%')
          GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } as GridColColumnOption} as GridColOptions) {
            Row() {
              Text('1')

              Text('2')

                .height(50).backgroundColor(Color.Red).textAlign(TextAlign.Center)
              Text('3')

                .height(50).backgroundColor(Color.Red).textAlign(TextAlign.Center)
            }
          }.key('gridContainer4')
          .width('90%')

        }.width('100%').margin({ top: 5 } as Margin)
      }
    }
    .key('flex')
    .width('100%')
    .height('100%')
  }
}
