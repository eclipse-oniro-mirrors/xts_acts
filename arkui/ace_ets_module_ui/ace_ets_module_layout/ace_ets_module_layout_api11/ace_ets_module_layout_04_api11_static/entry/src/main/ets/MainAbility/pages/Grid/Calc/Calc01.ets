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
import { Entry, Component, Column, ColumnOptions, Button, HorizontalAlign, Color, Text, Margin, $r } from '@ohos.arkui.component'
@Entry
@Component
struct Calc01 {
  build() {
    Column({ space: 10 } as ColumnOptions) {
      Column() {
        Button('faskfhsajkfhjkasfh').key('calc01key2')
          .fontSize(15)
          .backgroundColor(Color.Grey)
          .width('calc(45% + 45%)')
      }.width(300).alignItems(HorizontalAlign.Start).backgroundColor(Color.Pink)

      Column() {
        Text('faskfhsajkfhjkas')
          .key('calc01key3')
          .fontSize(15)
          .backgroundColor(Color.Grey)
          .constraintSize({ maxHeight: 'calc(15% + 15%)' })
          .height('90%')
      }.width(300).height(60).alignItems(HorizontalAlign.Start).backgroundColor(Color.Pink)

      Column() {
        Text('faskfhsajkfhjkas')
          .key('calc01key4')
          .fontSize(15)
          .backgroundColor(Color.Grey)
          .constraintSize({ maxWidth: 'calc(15% + 15%)' })
          .width('90%')
      }.width(300).height(60).alignItems(HorizontalAlign.Start).backgroundColor(Color.Pink)

      Column() {
        Text('faskfhsajkfhjkas')
          .key('calc01key5')
          .fontSize(15)
          .backgroundColor(Color.Grey)
          .constraintSize({ minHeight: 'calc(15% + 15%)' })
          .height('10%')
      }.width(300).height(60).alignItems(HorizontalAlign.Start).backgroundColor(Color.Pink)

      Column() {
        Text('faskfhsajkfhjkas')
          .key('calc01key6')
          .fontSize(15)
          .backgroundColor(Color.Grey)
          .constraintSize({ minWidth: 'calc(15% + 15%)' })
          .width('10%')
      }.width(300).height(60).alignItems(HorizontalAlign.Start).backgroundColor(Color.Pink)

      Column() {
        Text('faskfhsajkfhjkas').key('calc01key7')
          .fontSize(15)
          .backgroundColor(Color.Grey)
          .size({ width: 'calc(45% + 45%)', height: 30 })
      }.width(300).height(60).alignItems(HorizontalAlign.Start).backgroundColor(Color.Pink)

      Column() {
        Text('faskfhsajkfhjkas').key('calc01key8')
          .fontSize(15)
          .backgroundColor(Color.Grey)
          .width('calc(calc(90%))')
      }.width(300).height(60).alignItems(HorizontalAlign.Start).backgroundColor(Color.Pink)

      Column() {
        Text('faskfhsajkfhjkas111').key('calc01key9')
          .fontSize(15)
          .backgroundColor(Color.Grey)
          .width($r('app.string.calc'))
      }.width(300).height(60).alignItems(HorizontalAlign.Start).backgroundColor(Color.Pink)

      Column() {
        Column().key('calc01key10').backgroundColor(Color.Grey).width(300).height('calc(45% + 45%)')
      }.width(300).height(60).alignItems(HorizontalAlign.Start).backgroundColor(Color.Pink)
    }.margin({ top: 30, left: 10 } as Margin)
  }
}