/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
        Button('getSPans').onClick(() => {
          this.layoutStyleBorderRadius = '';
          this.layoutStyleMargin = '';
          this.paragraphStyleTextAlign = '';
          this.paragraphStyleLeadingMargin = '';
          this.controller.getSpans({ start: -1, end: -1 }).forEach((item,index) => {
            if(typeof(item as RichEditorImageSpanResult)['imageStyle'] != 'undefined'){
              this.layoutStyleBorderRadius += JSON.stringify(index + ':' + (item as RichEditorImageSpanResult).imageStyle?.layoutStyle?.borderRadius)
              this.layoutStyleMargin += JSON.stringify(index + ':' + (item as RichEditorImageSpanResult).imageStyle.layoutStyle?.margin)
            } else {
              if(typeof(item as RichEditorTextSpanResult)['symbolSpanStyle'] != 'undefined') {
                console.log('跳过')
              }else {
                this.paragraphStyleTextAlign += JSON.stringify(index + ':' + (item as RichEditorTextSpanResult).paragraphStyle?.textAlign)
                this.paragraphStyleLeadingMargin += JSON.stringify(index + ':' + (item as RichEditorTextSpanResult).paragraphStyle?.leadingMargin)
              }
            }
          })
        }).id('getSPans').height('5%').width('30%')
        Button('getSelection').onClick(() => {
          this.layoutStyleBorderRadius = '';
          this.layoutStyleMargin = '';
          this.paragraphStyleTextAlign = '';
          this.paragraphStyleLeadingMargin = '';
          let selection = this.controller.getSelection().spans;
          selection.forEach((item,index) => {
            if(typeof(item as RichEditorImageSpanResult)['imageStyle'] != 'undefined'){
              this.layoutStyleBorderRadius += JSON.stringify(index + ':' + (item as RichEditorImageSpanResult).imageStyle.layoutStyle?.borderRadius)
              this.layoutStyleMargin += JSON.stringify(index + ':' + (item as RichEditorImageSpanResult).imageStyle.layoutStyle?.margin)
            } else {
              if(typeof(item as RichEditorTextSpanResult)['symbolSpanStyle'] != 'undefined') {
                console.log('跳过')
              }else {
                this.paragraphStyleTextAlign += JSON.stringify(index + ':' + (item as RichEditorTextSpanResult).paragraphStyle?.textAlign)
                this.paragraphStyleLeadingMargin += JSON.stringify(index + ':' + (item as RichEditorTextSpanResult).paragraphStyle?.leadingMargin)
              }
            }
          })
        }).id('getSelection').height('5%').width('30%')
        Button('setContent').onClick(() => {
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
      RichEditor({ controller: this.controller })
        .id('RichEditorGetAttribute')
        .width('100%')
        .border({ width: 1, radius: 5 })
        .aboutToDelete((value: RichEditorDeleteValue) => {
          this.layoutStyleBorderRadius = '';
          this.layoutStyleMargin = '';
          this.paragraphStyleTextAlign = '';
          this.paragraphStyleLeadingMargin = '';
          value.richEditorDeleteSpans.forEach((item,index) => {
            if(typeof(item as RichEditorImageSpanResult)['imageStyle'] != 'undefined'){
              this.layoutStyleBorderRadiusDelete = '';
              this.layoutStyleMarginDelete = '';
              this.layoutStyleBorderRadiusDelete += JSON.stringify(index + ':' + (item as RichEditorImageSpanResult).imageStyle.layoutStyle?.borderRadius)
              this.layoutStyleMarginDelete += JSON.stringify(index + ':' + (item as RichEditorImageSpanResult).imageStyle.layoutStyle?.margin)
            } else {
              if(typeof(item as RichEditorTextSpanResult)['symbolSpanStyle'] != 'undefined') {
                console.log('跳过')
              }else {
                this.paragraphStyleTextAlignDelete = '';
                this.paragraphStyleLeadingMarginDelete = '';
                this.paragraphStyleTextAlignDelete += JSON.stringify(index + ':' + (item as RichEditorTextSpanResult).paragraphStyle?.textAlign)
                this.paragraphStyleLeadingMarginDelete += JSON.stringify(index + ':' + (item as RichEditorTextSpanResult).paragraphStyle?.leadingMargin)
              }
            }
          })
          return true;
        })
        .onSelect((value: RichEditorSelection) => {
          this.layoutStyleBorderRadius = 'onSelect-';
          this.layoutStyleMargin = 'onSelect-';
          this.paragraphStyleTextAlign = 'onSelect-';
          this.paragraphStyleLeadingMargin = 'onSelect-';
          let selection = value.spans;
          selection.forEach((item,index) => {
            if(typeof(item as RichEditorImageSpanResult)['imageStyle'] != 'undefined'){
              this.layoutStyleBorderRadius += JSON.stringify(index + ':' + (item as RichEditorImageSpanResult).imageStyle.layoutStyle?.borderRadius)
              this.layoutStyleMargin += JSON.stringify(index + ':' + (item as RichEditorImageSpanResult).imageStyle.layoutStyle?.margin)
            } else {
              if(typeof(item as RichEditorTextSpanResult)['symbolSpanStyle'] != 'undefined') {
                console.log('跳过')
              }else {
                this.paragraphStyleTextAlign += JSON.stringify(index + ':' + (item as RichEditorTextSpanResult).paragraphStyle?.textAlign)
                this.paragraphStyleLeadingMargin += JSON.stringify(index + ':' + (item as RichEditorTextSpanResult).paragraphStyle?.leadingMargin)
              }
            }
          })
        })
        .onIMEInputComplete((value: RichEditorTextSpanResult)=>{
          this.layoutStyleBorderRadius = '';
          this.layoutStyleMargin = '';
          this.paragraphStyleTextAlign = '';
          this.paragraphStyleLeadingMargin = '';
          if(typeof(value as RichEditorTextSpanResult)['symbolSpanStyle'] != 'undefined') {
            console.log('跳过')
          }else {
            this.paragraphStyleTextAlign += JSON.stringify((value as RichEditorTextSpanResult).paragraphStyle?.textAlign)
            this.paragraphStyleLeadingMargin += JSON.stringify((value as RichEditorTextSpanResult).paragraphStyle?.leadingMargin)
          }
        })
        .height('15%')
      Row(){
        Text('PSTextAlign:').fontSize(10)
        Text(this.paragraphStyleTextAlign + this.paragraphStyleTextAlignDelete).id('PSTextAlign').fontSize(10)
      }.width('100%').height('5%')
      Row(){
        Text('PSLeadingMargin:').fontSize(10)
        Text(this.paragraphStyleLeadingMargin + this.paragraphStyleLeadingMarginDelete).id('PSLeadingMargin').fontSize(10)
      }.width('100%').height('5%')
      Row(){
        Text('LSBorderRadius:').fontSize(10)
        Text(this.layoutStyleBorderRadius + this.layoutStyleBorderRadiusDelete).id('LSBorderRadius').fontSize(10)
      }.width('100%').height('5%')
      Row(){
        Text('LSMargin:').fontSize(10)
        Text(this.layoutStyleMargin + this.layoutStyleMarginDelete).id('LSMargin').fontSize(10)
      }.width('100%').height('5%')
    }
    .width('100%')
    .height('90%')
  }
}