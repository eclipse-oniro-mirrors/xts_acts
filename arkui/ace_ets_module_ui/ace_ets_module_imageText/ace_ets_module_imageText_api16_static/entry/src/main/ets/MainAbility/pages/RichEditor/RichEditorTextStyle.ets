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
import { Entry, Column, Component, Flex, FlexDirection, ItemAlign, FlexAlign, Text, Button, FontWeight, ButtonType, ClickEvent, Margin, RichEditorController,
  RichEditorTextStyle, TextAlign, RichEditor, RichEditorTextSpanResult,Row,RichEditorImageSpanResult,Color,RichEditorOptions,
  FontStyle,TextDecorationType,RichEditorUpdateTextSpanStyleOptions
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { Callback } from '../../common/MessageManager'

@Entry
@Component
struct RichEditorTextStyleDemo {
  controller: RichEditorController = new RichEditorController();
  @State str:string = ''
  private richEditorTextStyle: RichEditorTextStyle = {} as RichEditorTextStyle
  @State content: string = ''
  build() {
    Column() {
      Text(this.str).id('RichEditor_Text').height('5%').textAlign(TextAlign.Center)
      Text(this.content).id('RichEditor_Text2').height('5%').textAlign(TextAlign.Center)
      RichEditor({controller:this.controller} as RichEditorOptions)
        .onReady((): void =>{
          this.controller.addTextSpan('测试文本')
        })
        .height('20%')
        .id('RichEditor')
      Row(){
        Button('updateSpanStyle1')
          .fontSize(10).width('30%').id('updateSpanStyle1')
          .onClick((e:ClickEvent) => {
            this.controller.updateSpanStyle({
              start: -1,
              end: -1,
              textStyle:
              {
                fontWeight: FontWeight.Bolder,
                halfLeading: true
              }
            } as RichEditorUpdateTextSpanStyleOptions)
          })
        Button('updateSpanStyle2')
          .fontSize(10).width('30%').id('updateSpanStyle2')
          .onClick((e:ClickEvent) => {
            this.controller.updateSpanStyle({
              start: -1,
              end: -1,
              textStyle:
              {
                fontWeight: FontWeight.Bolder,
                halfLeading: false
              }
            } as RichEditorUpdateTextSpanStyleOptions)
          })
        Button('updateSpanStyle3')
          .fontSize(10).width('30%').id('updateSpanStyle3')
          .onClick((e:ClickEvent) => {
            this.controller.updateSpanStyle({
              start: -1,
              end: -1,
              textStyle:
              {
                fontWeight: FontWeight.Bolder,
                halfLeading: undefined
              }
            } as RichEditorUpdateTextSpanStyleOptions)
          })
      }.height('5%')

      Button('获取选择内容').onClick((e:ClickEvent) : void=> {
        this.controller.getSpans({
          start: -1,
          end: -1
        })!.forEach(item => {
          if(item instanceof RichEditorImageSpanResult){
            if(((item as RichEditorImageSpanResult).imageStyle)){
              this.content += (item as RichEditorImageSpanResult).valueResourceStr;
              this.content += '\n'
            }
          } else {
            if(((item as RichEditorTextSpanResult).symbolSpanStyle)) {
              this.content += (item as RichEditorTextSpanResult).symbolSpanStyle?.fontSize;
              this.content += '\n'
            }else {
              this.content = '' + (item as RichEditorTextSpanResult).textStyle.halfLeading;
            }
          }
        })
      }).fontSize(10).height('5%').id('getSpans')

      Button('getTypingStyle').onClick((e:ClickEvent) => {
        this.richEditorTextStyle = this.controller.getTypingStyle()!
        this.str = JSON.stringify(this.richEditorTextStyle.halfLeading)
      }).height('5%').fontSize(10).id('getTypingStyle')
      Row(){
        Button('setTypingStyle1')
          .fontSize(10).width('30%').id('setTypingStyle1')
          .onClick((e:ClickEvent) => {
            this.controller.setTypingStyle(
              {
                fontWeight: 'medium',
                fontFamily: 'MiSans-Bold',
                fontColor: Color.Blue,
                fontSize: 50,
                fontStyle: FontStyle.Italic,
                decoration: { type: TextDecorationType.Underline, color: Color.Green },
                halfLeading: true
              })
          })
        Button('setTypingStyle2')
          .fontSize(10).width('30%').id('setTypingStyle2')
          .onClick((e:ClickEvent) => {
            this.controller.setTypingStyle(
              {
                fontWeight: 'medium',
                fontFamily: 'MiSans-Bold',
                fontColor: Color.Blue,
                fontSize: 50,
                fontStyle: FontStyle.Italic,
                decoration: { type: TextDecorationType.Underline, color: Color.Green },
                halfLeading: false
              })
          })
        Button('setTypingStyle3')
          .fontSize(10).width('30%').id('setTypingStyle3')
          .onClick((e:ClickEvent) => {
            this.controller.setTypingStyle(
              {
                fontWeight: 'medium',
                fontFamily: 'MiSans-Bold',
                fontColor: Color.Blue,
                fontSize: 50,
                fontStyle: FontStyle.Italic,
                decoration: { type: TextDecorationType.Underline, color: Color.Green },
                halfLeading: undefined
              })
          })
      }.height('5%')
    }
    .width('100%')
    .height('100%')
  }
}