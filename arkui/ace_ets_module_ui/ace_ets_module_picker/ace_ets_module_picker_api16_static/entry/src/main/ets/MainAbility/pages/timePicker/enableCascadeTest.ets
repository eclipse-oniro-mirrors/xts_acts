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
import {MessageManager,Callback,Message} from '../../common/MessageManager';
import {
  Entry, Component, Builder,NodeContainer, CheckBoxShape,
  Column, ColumnOptions, ImageAnalyzerType, CheckboxGroup, Checkbox, TimePicker, TimePickerResult,
  Flex, FlexDirection, ItemAlign, FlexAlign, ImageAIOptions,  ImageAnalyzerController, ImageBitmap,  ImageAnalyzerConfig,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row, RenderingContextSettings, CanvasRenderingContext2D, Canvas,
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct TimePickerPage {
  @State isMilitaryTime: boolean = false
  private selectedTime: Date = new Date('2022-07-22T10:00:00')
  @State hour: number = 10
  @State minute: number = 0
  @State mode: boolean = true
  messageManager: MessageManager= new MessageManager()
  @State enableCascade: boolean | undefined = true

  onPageShow() {
    console.info('TimePicker onPageShow')
    AppStorage.setOrCreate<MessageManager>('messageManager', this.messageManager )
  }

  build() {
    Column() {
      Row() {
        Button('切换12小时制')
          .width('5%')
          .height('5%')
          .margin({ top: 5 } as Margin)
          .id('12hour')
          .onClick((e:ClickEvent) => {
            this.selectedTime = new Date('2022-07-22T10:00:00')
            this.isMilitaryTime = false
            this.hour = 10
          })

        Button('切换24小时制')
          .width('5%')
          .height('5%')
          .margin({ top: 5 } as Margin)
          .id('24hour')
          .onClick((e:ClickEvent) => {
            this.selectedTime = new Date('2022-07-22T10:00:00')
            this.isMilitaryTime = true
            this.hour = 10
          })
      }

      Row() {
        Button('切换enableCascade值-true')
          .width('5%')
          .height('5%')
          .margin({ top: 5 } as Margin)
          .id('timePicker-true')
          .onClick((e:ClickEvent) => {
            this.enableCascade = true

          })

        Button('切换enableCascade值-false')
          .width('5%')
          .height('5%')
          .margin({ top: 5 } as Margin)
          .id('timePicker-false')
          .onClick((e:ClickEvent) => {
            this.enableCascade = false

          })
      }

      Row() {
        Button('切换enableCascade值-undefined')
          .width('5%')
          .height('5%')
          .margin({ top: 5 } as Margin)
          .id('timePicker-null')
          .onClick((e:ClickEvent) => {
            this.enableCascade = undefined

          })

        Button('切换enableCascade值-undefined')
          .width('5%')
          .height('5%')
          .margin({ top: 5 } as Margin)
          .id('timePicker-undefined')
          .onClick((e:ClickEvent) => {
            this.enableCascade = undefined

          })
      }

      TimePicker({
        selected: this.selectedTime,
      })
        .key('timePicker')
        .width('100%')
        .height('50%')
        .enableCascade(this.enableCascade)
        .useMilitaryTime(this.isMilitaryTime)
        .onChange((value: TimePickerResult) => {
          this.hour = value.hour
          this.minute = value.minute
          this.selectedTime.setHours(value.hour, value.minute)
          console.info('select current date is: ' + JSON.stringify(value))
        })
      Text('hour:' + this.hour).fontSize(20).margin(10).key('hour')
      Text('minute:' + this.minute).fontSize(20).margin(10).key('minute')
      Text('24hour:false')
    }
    .width('100%')
    .height('50%')
  }
}
