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
struct RichEditor_TextStyle {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State start: number = -1;
  @State end: number = -1;
  @State LH:number = 50
  @State LS:number = 20
  @State content_H: string = ""
  @State content_L: string = ""

  build() {
    Column() {
      Scroll(){
        Column(){
          Row() {
            Button("行高+50")
              .id("addLineHeightBut")
              .onClick(()=>{
                this.LH = this.LH + 50
                this.controller.updateSpanStyle({
                  start: this.start,
                  end: this.end,
                  textStyle:
                  {
                    lineHeight: this.LH
                  }
                })
              }).width('25%')
            Button("行高-50").onClick(()=>{
              this.LH = this.LH - 50
              this.controller.updateSpanStyle({
                start: this.start,
                end: this.end,
                textStyle:
                {
                  lineHeight: this.LH
                }
              })
            }).width('25%')
            Button("字符间距+20")
              .id("addLetterSpacing")
              .onClick(()=>{
                this.LS = this.LS + 20
                this.controller.updateSpanStyle({
                  start: this.start,
                  end: this.end,
                  textStyle:
                  {
                    letterSpacing: this.LS
                  }
                })
              }).width('25%')
            Button("字符间距-20").onClick(()=>{
              this.LS = this.LS - 20
              this.controller.updateSpanStyle({
                start: this.start,
                end: this.end,
                textStyle:
                {
                  letterSpacing: this.LS
                }
              })
            }).width('25%')
          }.height('50%')
          Row(){
            Button("getSpans")
              .id("RichEditorTextStyle_GetSpansBtn")
              .onClick(() => {
                this.controller.getSpans({
                  start: this.start,
                  end: this.end
                }).forEach(item => {
                  if(typeof(item as RichEditorImageSpanResult)['textStyle'] != 'undefined'){
                    this.content_H=""
                    this.content_L=""
                    this.content_H = "LineHeight_" +(item as RichEditorTextSpanResult).textStyle.lineHeight;
                    this.content_L = "LetterSpacing_" +(item as RichEditorTextSpanResult).textStyle.letterSpacing;
                  }
                })
              })
          }.height('50%')
        }
      }.borderWidth(1)
      .borderColor(Color.Red)
      .width("100%")
      .height("20%")

      Scroll(){
        Column({space: 10}) {
          Row(){
            Text("getSpans获取到的行高为：")
            Text(this.content_H).id("StyleLineHeight_" + this.content_H).fontSize(15).fontColor(Color.Green)
          }
          Row(){
            Text("getSpans获取到的字符间距为：")
            Text(this.content_L).id("StyleLetterSpacing_" + this.content_L).fontSize(15).fontColor(Color.Green)
          }
          Row(){
            Text("LineHeight:" + this.LH).width("100%")
          }
          Row(){
            Text("LetterSpacing:" + this.LS).width("100%")
          }
        }
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width("100%")
      .height("20%")

      Column() {
        RichEditor(this.options).clip(true).padding(10)
          .onReady(() => {
            this.controller.addTextSpan("0123456789",
              {
                style:
                {
                  fontColor: Color.Orange,
                  fontSize: 32,
                  lineHeight: this.LH,
                  letterSpacing: this.LS
                }
              })
          })
          .borderWidth(1)
          .borderColor(Color.Green)
          .width(400)
          .height(400)
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width("100%")
      .height("60%")
    }
  }
}