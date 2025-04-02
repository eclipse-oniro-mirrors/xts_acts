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
struct RichEditorChangeValueTest1 {
  controller: RichEditorController = new RichEditorController()
  @State text1:string = '6'
  build() {
    Column({space:10}) {
      RichEditor({ controller: this.controller })
        .height(150)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width("90%")
        .onReady(() => {
          this.controller.addImageSpan($r("app.media.icon"),
            {
              imageStyle:
              {
                size: ["50px", "50px"]
              }
            })
        })
        .onWillChange((value: RichEditorChangeValue)=>{
          console.log('测试log1：onWillChange'+JSON.stringify(value))
          value.replacedImageSpans.forEach((item: RichEditorImageSpanResult) => {
            console.log("testTag testTag spanPosition:" + JSON.stringify(item.spanPosition))
            console.log("testTag valuePixelMap:" + JSON.stringify(item.valuePixelMap))
            console.log("testTag valueResourceStr:" + item.valueResourceStr)
            console.log("testTag imageStyle:" +JSON.stringify( item.imageStyle))
            console.log("testTag offsetInSpan:" + JSON.stringify(item.offsetInSpan))
            this.text1 = item.spanPosition.spanIndex + ''
          })

          value.replacedSymbolSpans.forEach((item: RichEditorTextSpanResult) => {
            console.log("spanPosition:" + JSON.stringify(item.spanPosition))
            console.log("value:" + item.value)
            console.log("textStyle:" + JSON.stringify(item.textStyle))
            console.log("offsetInSpan:" + JSON.stringify(item.offsetInSpan))
            console.log("valueResource:" + item.valueResource)
            console.log("symbolSpanStyle:" +JSON.stringify( item.symbolSpanStyle))
            console.log("paragraphStyle:" + JSON.stringify(item.paragraphStyle))
          })

          return true
        })

      Text(this.text1).id('RichEditorChangeValueTest1_text1')


    }.width('100%')
  }
}