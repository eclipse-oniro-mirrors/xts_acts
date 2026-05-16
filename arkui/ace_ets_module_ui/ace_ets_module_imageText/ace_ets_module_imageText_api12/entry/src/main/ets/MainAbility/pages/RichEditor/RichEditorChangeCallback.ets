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
struct RichEditorChangeCallback {
  controller: RichEditorController = new RichEditorController()
  @State text: string = ''
  @State text2: string = ''

  build() {
    Column({space:10}) {
      RichEditor({ controller: this.controller })
        .height('100vp')
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('300vp')
        .onReady(() => {
          this.controller.addTextSpan('test')
        })
        .onWillChange((value: RichEditorChangeValue)=>{
          console.log('onWillChange: '+JSON.stringify(value))
          this.text = 'onWillChange'
          this.text2 = value.replacedSpans[0].value

          value.replacedSpans.forEach((item: RichEditorTextSpanResult) => {
            console.log("spanPosition:" + JSON.stringify(item.spanPosition))
            console.log("value:" + item.value)
            console.log("textStyle:" + JSON.stringify(item.textStyle))
            console.log("offsetInSpan:" + item.offsetInSpan)
            console.log("valueResource:" + item.valueResource)
            console.log("symbolSpanStyle:" +JSON.stringify( item.symbolSpanStyle))
            console.log("paragraphStyle:" + JSON.stringify(item.paragraphStyle))
          })
          return true
        })
        .onDidChange(()=>{
          this.text = this.text + 'onDidChange'
        })

      Text(this.text).id('RichEditorChangeCallback_text')
      Text(this.text2).id('RichEditorChangeCallback_text2')

    }
  }
}