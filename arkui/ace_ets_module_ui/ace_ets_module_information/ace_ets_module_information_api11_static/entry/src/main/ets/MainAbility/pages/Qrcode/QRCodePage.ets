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
import {MessageManager,Callback, Message} from '../../common/MessageManager';
import { Entry, Component, Column, Flex, Text, QRCode,ResourceColor, FlexDirection, ResourceStr,ItemAlign, FlexAlign, FontWeight, ColumnOptions, Margin, ClickEvent, Color} from '@ohos.arkui.component'
import { State, StoragePropRef, AppStorage } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct QRCodePage {
  @StoragePropRef('QRvalue') QRvalue: string = 'normal'
  @StoragePropRef('QRCodeColor') QRCodeColor : Color|int = Color.Black
  @StoragePropRef('backColor') backColor : string|Color = Color.White
  @State text : string = 'unclick'

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text(this.text).fontSize(20).key('text')
      Text('normal').fontSize(9).width('90%').fontColor(0xCCCCCC).fontSize(30)
      QRCode(this.QRvalue).width(200).height(200).key('qr')
        .onClick((event: ClickEvent) => {
          this.text = 'click succ'
          console.info('Click succ, event: ' + this.text)
        })

      // 设置二维码颜色
      Text('color').fontSize(9).width('90%').fontColor(0xCCCCCC).fontSize(30)
      QRCode(this.QRvalue).color(this.QRCodeColor).width(200).height(200).key('qr1')

      // 设置二维码背景色
      Text('backgroundColor').fontSize(9).width('90%').fontColor(0xCCCCCC).fontSize(30)
      QRCode(this.QRvalue).width(200).height(200).backgroundColor(this.backColor).key('qr2')

      QRCode(this.QRvalue).width(200).height(200)
        .color(0xFF000000.toInt())
        .backgroundColor(0xFFFFFFFF.toInt())
        .key('qrDefault')
    }.width('100%').margin({ top: 5 } as Margin)
  }
}