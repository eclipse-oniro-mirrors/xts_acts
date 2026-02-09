'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { MeasureUtils, UIContext } from '@ohos.arkui.UIContext';
import MeasureText  from '@ohos.measure';
import { Entry, Component, Column, Row, Text, Button, ClickEvent, Margin, Color, SizeOptions,$r } from '@ohos.arkui.component'
import { State,AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
@Entry
@Component
struct TextCommonTextComputing0050 {
  @State measure: MeasureUtils | undefined = undefined;
  @State message: string = 'this message is test for measure measureTextSize';
  @State textComputing0050_1: number = MeasureText.measureText({
    textContent: this.message,
    maxLines: 2
  })
  @State textComputing0050_2: SizeOptions = MeasureText.measureTextSize({
    textContent: this.message,
    maxLines: 2
  })
  @State textComputing0050_12: number = 0
  @State textComputing0050_22: SizeOptions = {width:0,height:0} as SizeOptions
  onPageShow(){
    this.measure = this.getUIContext().getMeasureUtils()
    this.textComputing0050_12 = this.getUIContext().getMeasureUtils().measureText({
      textContent: this.message,
      maxLines: 2
    })
    this.textComputing0050_22 = this.getUIContext().getMeasureUtils().measureTextSize({
      textContent: this.message,
      maxLines: 2
    })
  }
  build() {
    Row() {
      Column() {
        Column() {
          Text(this.message)
            .maxLines(5)
            .key('textComputing0050_tx')
            .margin(15)
            .fontSize(20)
            .fontColor(Color.Blue)
          Text('width: ' + this.textComputing0050_1).key('textComputing0050_1')
          Text('width: ' + this.textComputing0050_12).key('textComputing0050_12')
          Text('width: ' + this.textComputing0050_2.width).key('textComputing0050_2')
          Text('width: ' + this.textComputing0050_22.width).key('textComputing0050_22')
        }.width('95%').borderWidth(3)

        Row() {
          Button('conWidth_200vp')
            .id('conWidth_200vp').margin(20)
            .onClick((e:ClickEvent) => {
              let context = AppStorage.get<UIContext>('uiContext')!.getHostContext()
              this.message = 'this message is test for measure constraintWidth 200vp';
              let size = context?.resourceManager.getDouble($r('app.float.text_con_width').id);
              console.log('size = ' + size);
              this.textComputing0050_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                constraintWidth: context?.resourceManager.getDouble($r('app.float.text_con_width').id)
              })
              this.textComputing0050_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                constraintWidth: context?.resourceManager.getDouble($r('app.float.text_con_width').id)
              })
              this.textComputing0050_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                constraintWidth: context?.resourceManager.getDouble($r('app.float.text_con_width').id)
              })
              this.textComputing0050_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                constraintWidth: context?.resourceManager.getDouble($r('app.float.text_con_width').id)
              })
            })
          Button('conWidth_calc')
            .id('conWidth_calc').margin(20)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure constraintWidth calc(20%-50px)';
              this.textComputing0050_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                constraintWidth: 'calc(20%-50px)'
              })
              this.textComputing0050_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                constraintWidth: 'calc(20%-50px)'
              })
              this.textComputing0050_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                constraintWidth: 'calc(20%-50px)'
              })
              this.textComputing0050_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                constraintWidth: 'calc(20%-50px)'
              })
            })
        }.width('100%')

        Row() {
          Button('conWidth_90abc')
            .id('conWidth_90abc').margin({ left: 20 } as Margin)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure constraintWidth 90abc';
              this.textComputing0050_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                constraintWidth: '90abc'
              })
              this.textComputing0050_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                constraintWidth: '90abc'
              })
              this.textComputing0050_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                constraintWidth: '90abc'
              })
              this.textComputing0050_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                constraintWidth: '90abc'
              })
            })
          Button('conWidth_50%')
            .id('conWidth_50').margin({ left: 20 }  as Margin)
            .onClick((e:ClickEvent) => {
              this.message = 'this message is test for measure constraintWidth 50%';
              this.textComputing0050_1 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                constraintWidth: '50%'
              })
              this.textComputing0050_2 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                constraintWidth: '50%'
              })
              this.textComputing0050_12 = this.measure!.measureText({
                textContent: this.message,
                maxLines: 2,
                constraintWidth: '50%'
              })
              this.textComputing0050_22 = this.measure!.measureTextSize({
                textContent: this.message,
                maxLines: 2,
                constraintWidth: '50%'
              })
            })
        }.width('100%')
      }
      .height('100%')
      .width('100%')
    }
    .height('100%')
  }
}