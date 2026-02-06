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
import { Entry, Component, Column,RichEditor,
  MutableStyledString,TextInputController,RichEditorController,RichEditorStyledStringController,RichEditorOptions,Row,
  Button,ClickEvent,RichEditorTextStyle,RichEditorImageSpanResult,RichEditorTextSpanResult,Color,$r,RichEditorUpdateTextSpanStyleOptions
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';


@Entry
@Component
struct textBackgroundStyleTest {
  controller: RichEditorController = new RichEditorController();
  @State richEditorTextStyle1: RichEditorTextStyle =
    { textBackgroundStyle: { color: undefined } } as RichEditorTextStyle
  @State richEditorTextStyle2: RichEditorTextStyle =
    { textBackgroundStyle: { color: Color.Red, radius: 5 } } as RichEditorTextStyle
  @State richEditorTextStyle3: RichEditorTextStyle = { textBackgroundStyle: { radius: '5vp' } } as RichEditorTextStyle
  @State richEditorTextStyle4: RichEditorTextStyle = {
    textBackgroundStyle: {
      color: Color.Red,
      radius: {
        topLeft: 10,
        topRight: 5,
        bottomLeft: 20,
        bottomRight: 15
      }
    }
  } as RichEditorTextStyle
  @State richEditorTextStyle5: RichEditorTextStyle =
    { textBackgroundStyle: { color: '#e0dbeb', radius: '-1vp' } } as RichEditorTextStyle
  @State richEditorTextStyle6: RichEditorTextStyle =
    { textBackgroundStyle: { color: $r('app.color.red'), radius: undefined } } as RichEditorTextStyle

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
          console.log('---------xxxxx----------')
          if (item instanceof RichEditorImageSpanResult) {
            console.log('---------RichEditorImageSpanResult----------')
            item as RichEditorImageSpanResult
          } else {
            console.log('---------RichEditorTextSpanResult----------')
            item as RichEditorTextSpanResult
            if (typeof (item.symbolSpanStyle) != 'undefined') {
              console.log('---------undefined----------')
            } else {
              console.log('---------AppStorage.setOrCreate----------' + JSON.stringify(item.textStyle))
              console.log('---------AppStorage.setOrCreate----------' + item.textStyle.textBackgroundStyle?.color)
              console.log('---------AppStorage.setOrCreate----------' +
              JSON.stringify(item.textStyle.textBackgroundStyle?.radius))
              AppStorage.setOrCreate('RichEditorTextBackgroundStyleColor',
                item.textStyle.textBackgroundStyle?.color)
              AppStorage.setOrCreate('RichEditorTextBackgroundStyleRadius',
                JSON.stringify(item.textStyle.textBackgroundStyle?.radius))
            }
          }
        })
      }).fontSize(10).height('5%').id('getSpans')
    }
    .width('100%')
    .height('100%')
  }
}
