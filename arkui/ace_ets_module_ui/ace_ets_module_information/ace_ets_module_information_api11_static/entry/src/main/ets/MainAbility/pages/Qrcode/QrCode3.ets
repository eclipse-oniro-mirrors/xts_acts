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

import events_emitter from '@ohos.events.emitter';
import { Entry, Component, Column, Flex,Color, Text, QRCode, FlexDirection, ItemAlign, FlexAlign, FontWeight, ColumnOptions, Margin,ResourceColor } from '@ohos.arkui.component'
import { State, StoragePropRef, AppStorage } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct QrCode3 {
  @StoragePropRef('qrCodeBackgroundColor') qrCodeBackgroundColor: 	ResourceColor = "#FF008000";
  @StoragePropRef('qrCodeColor') qrCodeColor: ResourceColor = "#FF0000FF";
  @State qrCodeValue: string = 'qrCodeValue';
build() {
  Column({ space: 5 } as ColumnOptions) {
    Text('QRCodeColor')
    .fontSize(40)
    .fontWeight(FontWeight.Bold)
    .width('90%')
    .fontColor(Color.White)
    QRCode(`${this.qrCodeValue}`)
    .backgroundColor(`${this.qrCodeBackgroundColor}`)
    .color(`${this.qrCodeColor}`)
    .width(198)
    .height(198)
    .key("QrCodeColor")
    Text('QRCodeBackgroundColor')
    .fontSize(40)
    .fontWeight(FontWeight.Bold)
    .width('90%')
    .fontColor(Color.White)
    QRCode(`${this.qrCodeValue}`)
    .backgroundColor(`${this.qrCodeBackgroundColor}`)
    .color(`${this.qrCodeColor}`)
    .width(197)
    .height(197)
    .key("QrCodeBackgroundColor")
    QRCode(`${this.qrCodeValue}`)
      .color(0xFF000000.toInt())
      .backgroundColor(0xFFFFFFFF.toInt())
      .width(197)
      .height(197)
      .key("QrCodeDefault")
  }
  .width('100%')
  .height('100%')
  .margin({ top: 5 } as Margin)
}
}