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
import{TimePickerModifier} from '@ohos.arkui.modifier'  // SDK未找到
import {
  Entry, Component, Builder,NodeContainer, CheckBoxShape,
  Column, ColumnOptions, ImageAnalyzerType, CheckboxGroup, Checkbox, TimePicker,TimePickerResult,
  Flex, FlexDirection, ItemAlign, FlexAlign, ImageAIOptions,  ImageAnalyzerController, ImageBitmap,  ImageAnalyzerConfig,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row, RenderingContextSettings, CanvasRenderingContext2D, Canvas,
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct TimePickerPage {
  @State isMilitaryTime: boolean = false
  private selectedTime: Date = new Date('2022-07-22T10:00:00')
  @State hour: int = 10
  @State minute: int = 0
  @State onChangeOff: string = 'false'
  messageManager: MessageManager = new MessageManager()
  @State enableCascade: boolean | undefined | null = true
  @State modifier :TimePickerModifier = new TimePickerModifier().onChange((value: TimePickerResult) => {
    if (value.hour >= 0) {
      this.onChangeOff = 'true'
      console.info('check005 TimePickerModifier OnChange select current date is: ' + JSON.stringify(value))
    }
  })
  onPageShow() {
    console.info('TimePicker onPageShow')
    AppStorage.setOrCreate<MessageManager>('messageManager', this.messageManager )
    // let callback: Callback = (message: Message ) => {
    //   console.error('message = ' + message.name + '--' + message.value)
    //   if (message.name == 'isMilitaryTime') {
    //     this.isMilitaryTime = message.value as boolean
    //   }
    //   if (message.name == 'selectedTime') {
    //     this.selectedTime = message.value as Date
    //   }
    //   if (message.name == 'hour') {
    //     this.hour = message.value as int
    //   }
    //   if (message.name == 'minute') {
    //     this.minute = message.value as int
    //   }
    // }
    // this.messageManager.registerCallback(callback)
  }

  build() {
    Column() {
      Row() {
        Button('切换12小时制')
          .margin({ top: 5 } as Margin)
          .id('12hour')
          .onClick((e:ClickEvent) => {
            this.selectedTime = new Date('2022-07-22T10:00:00')
            this.isMilitaryTime = false
            this.hour = 10
          })

        Button('切换24小时制')
          .margin({ top: 5 } as Margin)
          .id('24hour')
          .onClick((e:ClickEvent) => {
            this.selectedTime = new Date('2022-07-22T10:00:00')
            this.isMilitaryTime = true
            this.hour = 10
          })
      }

      TimePicker({
        selected: this.selectedTime,
      })
        .id('timePicker')
        .width('100%')
        .height('50%')
        .useMilitaryTime(this.isMilitaryTime)
        .attributeModifier(this.modifier as TimePickerModifier)

      Text(this.onChangeOff.toString()).key('onChangeOff')
    }
  }
}
