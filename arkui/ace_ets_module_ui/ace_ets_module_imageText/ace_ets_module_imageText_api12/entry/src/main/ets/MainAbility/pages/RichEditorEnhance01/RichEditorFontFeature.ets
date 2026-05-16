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
struct RichEditorFontFeature {
  controller: RichEditorController = new RichEditorController();
  controller1: RichEditorController = new RichEditorController();
  @State content: string = ""

  build() {
    Column() {
      RichEditor({ controller: this.controller })
        .onReady(() => {
          this.controller.addTextSpan("H2O, difficult \n", {
            style: {
              fontColor: Color.Pink,
              fontFeature: "\"sups\" on",
              fontSize:10
            }
          })
        })
        .width("90%")
        .height('15%')
        .border({ width: 1, radius: 5 })
        .draggable(false)
        .clip(false)
        .margin({top:20})
      RichEditor({ controller: this.controller1 })
        .onReady(() => {
          this.controller1.addTextSpan("H2O, difficult \n", {
            style: {
              fontColor: Color.Pink,
              fontSize:10
            }
          })
        })
        .width("90%")
        .height('15%')
        .border({ width: 1, radius: 5 })
        .draggable(false)
        .clip(false)
      Row(){
        Text("getSpansAPI").id("RichEditorFontFeatureValue_" + this.content).fontColor(Color.Green).fontSize(10)
        Text("获取FontFeature值为：" + this.content).fontColor(Color.Green).fontSize(10)
      }
      Column({ space: 10 }) {
        Button("更新fontFeather为：'subs' 1")
          .height('5%')
          .id("RichEditorFontFeature_UpdateBtn1")
          .onClick(() => {
            this.controller.updateSpanStyle({
              start: -1,
              end: -1,
              textStyle:
              {
                fontFeature: "\"subs\" 1"
              }
            })
          })
        Button("更新fontFeather为：'subs' 1, 'liga' 0")
          .height('5%')
          .id("RichEditorFontFeature_UpdateBtn2")
          .onClick(() => {
            this.controller.updateSpanStyle({
              start: -1,
              end: -1,
              textStyle:
              {
                fontFeature: "\"subs\" 1, \"liga\" 0"
              }
            })
          })
        Row(){
          Button("getSpans")
            .height('5%')
            .id("RichEditorFontFeature_GetSpansBtn")
            .onClick(() => {
              this.controller.getSpans({
                start: -1,
                end: -1
              }).forEach(item => {
                if(typeof(item as RichEditorImageSpanResult)['textStyle'] != 'undefined'){
                  this.content=""
                  this.content += (item as RichEditorTextSpanResult).textStyle.fontFeature;
                  console.info("sddd"+ JSON.stringify((item as RichEditorTextSpanResult).textStyle.fontFeature))
                }
              })
            })
        }
      }
    }.height('100%')
  }
}