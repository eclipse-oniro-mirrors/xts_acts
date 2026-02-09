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
import {
  Entry,
  Component,
  Column,
  RichEditor,
  RichEditorController,
  ClickEvent,
  RichEditorTextSpanResult,
  Button,
  Color,
  ShadowOptions,
  RichEditorTextSpanResult,
  RichEditorImageSpanResult,
  RichEditorTextStyle,
  RichEditorOptions,
  Row,
  ShadowType,
  RichEditorUpdateTextSpanStyleOptions,
  Resource,
  ColoringStrategy
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct textShadowTest {
  controller: RichEditorController = new RichEditorController();
  @State richEditorTextStyle1: RichEditorTextStyle = {
    textShadow: [{
      radius: 5,
      offsetX: -1,
      offsetY: -1,
      fill: true
    }, {
      radius: 0,
      offsetX: undefined,
      offsetY: undefined,
      type: ShadowType.BLUR
    }]
  } as RichEditorTextStyle
  @State richEditorTextStyle2: RichEditorTextStyle = {
    textShadow: {
      radius: 5,
      offsetX: 2,
      offsetY: 2,
      fill: false,
      type: undefined
    }
  } as RichEditorTextStyle
  @State richEditorTextStyle3: RichEditorTextStyle = {
    textShadow: {
      radius: 0,
      offsetX: undefined,
      offsetY: undefined,
      type: ShadowType.BLUR
    }
  } as RichEditorTextStyle
  @State richEditorTextStyle4: RichEditorTextStyle = {
    textShadow: {
      radius: 5,
      offsetX: 0,
      type: ShadowType.COLOR,
      color: Color.Red
    }
  } as RichEditorTextStyle
  @State richEditorTextStyle5: RichEditorTextStyle = {
    textShadow: {
      radius: -1,
      offsetX: 2,
      color: Color.Red,
      type: ShadowType.BLUR,
      fill: true
    }
  } as RichEditorTextStyle
  @State richEditorTextStyle6: RichEditorTextStyle = {
    textShadow: {
      radius: 5,
      offsetX: -1,
      offsetY: -1,
      fill: true
    }
  } as RichEditorTextStyle
  @State shadowOptionsArr: ShadowOptions[] | undefined = undefined

  build() {
    Column() {
      RichEditor({ controller: this.controller } as RichEditorOptions)
        .onReady((): void => {
          this.controller.addTextSpan('测试文本')
        })
        .height('20%')
        .id('RichEditor')
      Row() {
        Button('updateSpanStyle1')
          .fontSize(10).width('30%').id('updateSpanStyle1')
          .onClick((e: ClickEvent) => {
            this.controller.updateSpanStyle({
              start: -1,
              end: -1,
              textStyle: this.richEditorTextStyle1
            } as RichEditorUpdateTextSpanStyleOptions)
          })
        Button('updateSpanStyle2')
          .fontSize(10).width('30%').id('updateSpanStyle2')
          .onClick((e: ClickEvent) => {
            this.controller.updateSpanStyle({
              start: -1,
              end: -1,
              textStyle: this.richEditorTextStyle2
            } as RichEditorUpdateTextSpanStyleOptions)
          })
        Button('updateSpanStyle3')
          .fontSize(10).width('30%').id('updateSpanStyle3')
          .onClick((e: ClickEvent) => {
            this.controller.updateSpanStyle({
              start: -1,
              end: -1,
              textStyle: this.richEditorTextStyle3
            } as RichEditorUpdateTextSpanStyleOptions)
          })
      }.height('5%')

      Row() {
        Button('updateSpanStyle4')
          .fontSize(10).width('30%').id('updateSpanStyle4')
          .onClick((e: ClickEvent) => {
            this.controller.updateSpanStyle({
              start: -1,
              end: -1,
              textStyle: this.richEditorTextStyle4
            } as RichEditorUpdateTextSpanStyleOptions)
          })
        Button('updateSpanStyle5')
          .fontSize(10).width('30%').id('updateSpanStyle5')
          .onClick((e: ClickEvent) => {
            this.controller.updateSpanStyle({
              start: -1,
              end: -1,
              textStyle: this.richEditorTextStyle5
            } as RichEditorUpdateTextSpanStyleOptions)
          })
        Button('updateSpanStyle6')
          .fontSize(10).width('30%').id('updateSpanStyle6')
          .onClick((e: ClickEvent) => {
            this.controller.updateSpanStyle({
              start: -1,
              end: -1,
              textStyle: this.richEditorTextStyle6
            } as RichEditorUpdateTextSpanStyleOptions)
          })
      }.height('5%')

      Button('获取选择内容').onClick((e: ClickEvent) => {
        this.controller.getSpans({
          start: -1,
          end: -1
        })!.forEach(item => {
          if (item instanceof RichEditorImageSpanResult && item.imageStyle !== undefined) {
          } else {
            if (item instanceof RichEditorTextSpanResult && item.symbolSpanStyle !== undefined) {
            } else {
              this.shadowOptionsArr = (item as RichEditorTextSpanResult).textStyle.textShadow
              this.shadowOptionsArr?.forEach((shadowItem:ShadowOptions, index:Int) => {
                AppStorage.setOrCreate<number|Resource|undefined>('shadowRadius' + index, shadowItem.radius)
                AppStorage.setOrCreate<undefined|Color|String|Resource|ColoringStrategy>('shadowColor' + index, shadowItem.color)
                AppStorage.setOrCreate<number|Resource|undefined>('shadowOffsetX' + index, shadowItem.offsetX)
                AppStorage.setOrCreate<number|Resource|undefined>('shadowOffsetY' + index, shadowItem.offsetY)
              })
            }
          }
        })
      }).fontSize(10).height('5%').id('getSpans')
    }
    .width('100%')
    .height('100%')
  }
}