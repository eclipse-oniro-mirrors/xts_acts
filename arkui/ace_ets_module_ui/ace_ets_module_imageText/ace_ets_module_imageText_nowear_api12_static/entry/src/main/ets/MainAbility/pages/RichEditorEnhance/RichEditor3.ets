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
import { Entry, Column, Component, RichEditor, Button, Row, Text, Margin, RichEditorController, ClickEvent, RichEditorImageSpanResult,
  RichEditorDeleteValue, RichEditorTextSpanResult, RichEditorSelection, RichEditorOptions, TextAlign, $r} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct RichEditor3 {
  controller: RichEditorController = new RichEditorController();
  @State layoutStyleBorderRadius:string = '';
  @State layoutStyleMargin:string = '';
  @State paragraphStyleTextAlign:string = '';
  @State paragraphStyleLeadingMargin:string = '';
  @State layoutStyleBorderRadiusDelete:string = '';
  @State layoutStyleMarginDelete:string = '';
  @State paragraphStyleTextAlignDelete:string = '';
  @State paragraphStyleLeadingMarginDelete:string = '';
  build() {
    Column() {
      Column(){
        Button('getSPans').onClick((e: ClickEvent) => {
          this.layoutStyleBorderRadius = '';
          this.layoutStyleMargin = '';
          this.paragraphStyleTextAlign = '';
          this.paragraphStyleLeadingMargin = '';
          this.controller.getSpans({ start: -1, end: -1 })!.forEach((item,index) => {
            if(item instanceof RichEditorImageSpanResult){
              this.layoutStyleBorderRadius += JSON.stringify(index + ':' + (item as RichEditorImageSpanResult).imageStyle?.layoutStyle?.borderRadius)
              this.layoutStyleMargin += JSON.stringify(index + ':' + (item as RichEditorImageSpanResult).imageStyle.layoutStyle?.margin)
            } else {
              this.paragraphStyleTextAlign += JSON.stringify(index + ':' + (item as RichEditorTextSpanResult).paragraphStyle?.textAlign)
              this.paragraphStyleLeadingMargin += JSON.stringify(index + ':' + (item as RichEditorTextSpanResult).paragraphStyle?.leadingMargin)
            }
          })
        }).id('getSPans').height('5%').width('30%')
        Button('getSelection').onClick((e: ClickEvent) => {
          this.layoutStyleBorderRadius = '';
          this.layoutStyleMargin = '';
          this.paragraphStyleTextAlign = '';
          this.paragraphStyleLeadingMargin = '';
          let selection = this.controller.getSelection()!.spans;
          selection.forEach((item,index) => {
            if(item instanceof RichEditorImageSpanResult){
              this.layoutStyleBorderRadius += JSON.stringify(index + ':' + (item as RichEditorImageSpanResult).imageStyle.layoutStyle?.borderRadius)
              this.layoutStyleMargin += JSON.stringify(index + ':' + (item as RichEditorImageSpanResult).imageStyle.layoutStyle?.margin)
            } else {
              this.paragraphStyleTextAlign += JSON.stringify(index + ':' + (item as RichEditorTextSpanResult).paragraphStyle?.textAlign)
              this.paragraphStyleLeadingMargin += JSON.stringify(index + ':' + (item as RichEditorTextSpanResult).paragraphStyle?.leadingMargin)
            }
          })
        }).id('getSelection').height('5%').width('30%')
        Button('setContent').onClick((e: ClickEvent) => {
          this.controller.addTextSpan('测试文字测试文字测试文字测试文字', {
            paragraphStyle: {
              textAlign: TextAlign.Start,
              leadingMargin: 32
            }
          })
          this.controller.addImageSpan($r('app.media.app_icon'), {
            imageStyle: {
              size: ['80px', '80px'],
              layoutStyle: {
                borderRadius: 20,
                margin: 20
              }
            }
          })
        }).id('setContent').height('5%').width('30%')
      }
      RichEditor({ controller: this.controller } as RichEditorOptions)
        .id('RichEditorGetAttribute')
        .width('100%')
        .border({ width: 1, radius: 5 })
        .aboutToDelete((value: RichEditorDeleteValue): boolean => {
          this.layoutStyleBorderRadius = '';
          this.layoutStyleMargin = '';
          this.paragraphStyleTextAlign = '';
          this.paragraphStyleLeadingMargin = '';
          value.richEditorDeleteSpans.forEach((item, index) => {
            console.log("=============================item " )
            if(item instanceof RichEditorImageSpanResult){
              this.layoutStyleBorderRadiusDelete = '';
              this.layoutStyleMarginDelete = '';
              console.log("=============================item test RichEditorImageSpanResult " )
              this.layoutStyleBorderRadiusDelete += JSON.stringify(index + ':' + (item as RichEditorImageSpanResult).imageStyle.layoutStyle?.borderRadius)
              this.layoutStyleMarginDelete += JSON.stringify(index + ':' + (item as RichEditorImageSpanResult).imageStyle.layoutStyle?.margin)
            }else{
              console.log("=============================item test RichEditorTextSpanResult " )
              this.paragraphStyleTextAlignDelete = '';
              this.paragraphStyleLeadingMarginDelete = '';
              this.paragraphStyleTextAlignDelete += JSON.stringify(index + ':' + (item as RichEditorTextSpanResult).paragraphStyle?.textAlign)
              this.paragraphStyleLeadingMarginDelete += JSON.stringify(index + ':' + (item as RichEditorTextSpanResult).paragraphStyle?.leadingMargin)
            }
          })
          return true;
        })
        .onSelect((value: RichEditorSelection): void => {
          this.layoutStyleBorderRadius = 'onSelect-';
          this.layoutStyleMargin = 'onSelect-';
          this.paragraphStyleTextAlign = 'onSelect-';
          this.paragraphStyleLeadingMargin = 'onSelect-';
          let selection = value.spans;
          selection.forEach((item,index) => {
            if(item instanceof RichEditorImageSpanResult){
              this.layoutStyleBorderRadius += JSON.stringify(index + ':' + (item as RichEditorImageSpanResult).imageStyle.layoutStyle?.borderRadius)
              this.layoutStyleMargin += JSON.stringify(index + ':' + (item as RichEditorImageSpanResult).imageStyle.layoutStyle?.margin)
            } else {
              this.paragraphStyleTextAlign += JSON.stringify(index + ':' + (item as RichEditorTextSpanResult).paragraphStyle?.textAlign)
              this.paragraphStyleLeadingMargin += JSON.stringify(index + ':' + (item as RichEditorTextSpanResult).paragraphStyle?.leadingMargin)
            }
          })
        })
        .onIMEInputComplete((value: RichEditorTextSpanResult): void =>{
          this.layoutStyleBorderRadius = '';
          this.layoutStyleMargin = '';
          this.paragraphStyleTextAlign = '';
          this.paragraphStyleLeadingMargin = '';
          this.paragraphStyleTextAlign += JSON.stringify((value as RichEditorTextSpanResult).paragraphStyle?.textAlign)
          this.paragraphStyleLeadingMargin += JSON.stringify((value as RichEditorTextSpanResult).paragraphStyle?.leadingMargin)
        })
      Row(){
        Text('PSTextAlign:').fontSize(10)
        Text(this.paragraphStyleTextAlign + this.paragraphStyleTextAlignDelete).id('PSTextAlign').fontSize(10)
      }.width('100%')
      Row(){
        Text('PSLeadingMargin:').fontSize(10)
        Text(this.paragraphStyleLeadingMargin + this.paragraphStyleLeadingMarginDelete).id('PSLeadingMargin').fontSize(10)
      }.width('100%')
      Row(){
        Text('LSBorderRadius:').fontSize(10)
        Text(this.layoutStyleBorderRadius + this.layoutStyleBorderRadiusDelete).id('LSBorderRadius').fontSize(10)
      }.width('100%')
      Row(){
        Text('LSMargin:').fontSize(10)
        Text(this.layoutStyleMargin + this.layoutStyleMarginDelete).id('LSMargin').fontSize(10)
      }.width('100%')
    }
    .width('100%')
    .height('100%')
  }
}