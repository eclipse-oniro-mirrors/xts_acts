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

@Entry
@Component
struct textBackgroundStyleTest {
  controller: RichEditorController = new RichEditorController();
  @State richEditorTextStyle1:RichEditorTextStyle ={textBackgroundStyle:{color:undefined}}
  @State richEditorTextStyle2:RichEditorTextStyle ={textBackgroundStyle:{color:Color.Red,radius:5}}
  @State richEditorTextStyle3:RichEditorTextStyle ={textBackgroundStyle:{radius:'5vp'}}
  @State richEditorTextStyle4:RichEditorTextStyle ={textBackgroundStyle:{color:Color.Red,radius:{topLeft:10,topRight:5,bottomLeft:20,bottomRight:15}}}
  @State richEditorTextStyle5:RichEditorTextStyle ={textBackgroundStyle:{color:'#e0dbeb',radius:'-1vp'}}
  @State richEditorTextStyle6:RichEditorTextStyle ={textBackgroundStyle:{color:$r('app.color.red'), radius:undefined}}
  build() {
    Column() {
      RichEditor({controller:this.controller})
        .onReady(()=>{
          this.controller.addTextSpan('测试文本')
        })
        .height('20%')
        .id('RichEditor_textBackgroundStyle')
      Row(){
        Button('updateSpanStyle1')
          .fontSize(10).width('30%').id('updateSpanStyle1')
          .onClick(() => {
            this.controller.updateSpanStyle({
              start: -1,
              end: -1,
              textStyle:this.richEditorTextStyle1
            })
          })
        Button('updateSpanStyle2')
          .fontSize(10).width('30%').id('updateSpanStyle2')
          .onClick(() => {
            this.controller.updateSpanStyle({
              start: -1,
              end: -1,
              textStyle:this.richEditorTextStyle2
            })
          })
        Button('updateSpanStyle3')
          .fontSize(10).width('30%').id('updateSpanStyle3')
          .onClick(() => {
            this.controller.updateSpanStyle({
              start: -1,
              end: -1,
              textStyle:this.richEditorTextStyle3
            })
          })
      }.height('5%')
      Row(){
        Button('updateSpanStyle4')
          .fontSize(10).width('30%').id('updateSpanStyle4')
          .onClick(() => {
            this.controller.updateSpanStyle({
              start: -1,
              end: -1,
              textStyle:this.richEditorTextStyle4
            })
          })
        Button('updateSpanStyle5')
          .fontSize(10).width('30%').id('updateSpanStyle5')
          .onClick(() => {
            this.controller.updateSpanStyle({
              start: -1,
              end: -1,
              textStyle:this.richEditorTextStyle5
            })
          })
        Button('updateSpanStyle6')
          .fontSize(10).width('30%').id('updateSpanStyle6')
          .onClick(() => {
            this.controller.updateSpanStyle({
              start: -1,
              end: -1,
              textStyle:this.richEditorTextStyle6
            })
          })
      }.height('5%')
      Button('获取选择内容').onClick(() => {
        this.controller.getSpans({
          start: -1,
          end: -1
        }).forEach(item => {
          if(typeof(item as RichEditorImageSpanResult)['imageStyle'] != 'undefined'){
          } else {
            if(typeof(item as RichEditorTextSpanResult)['symbolSpanStyle'] != 'undefined') {
            }else {
              AppStorage.setOrCreate('RichEditorTextBackgroundStyleColor',(item as RichEditorTextSpanResult).textStyle.textBackgroundStyle?.color)
              AppStorage.setOrCreate('RichEditorTextBackgroundStyleRadius',(item as RichEditorTextSpanResult).textStyle.textBackgroundStyle?.radius)
            }
          }
        })
      }).fontSize(10).height('5%').id('getSpans')
    }
    .width('100%')
    .height('100%')
  }
}
