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
struct onSelectionChange1 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State text1: number = 0
  @State text2: string = ''
  @State text3: string = ''

  build() {
    Column() {
      RichEditor(this.options)
        .onSelectionChange((event:RichEditorRange) => {
          this.text1 += 1
          this.text2 = event?.start !== undefined ? String(event.start) : ''
          this.text3 = event?.end !== undefined ? String(event.end) : ''
        })
        .id('onSelectionChange_RichEditor')
        .width('100%')
        .height('10%')
      Text('' + this.text1).key("onSelectionChange1_text1")
      Text('' + this.text2).key("onSelectionChange1_text2")
      Text('' + this.text3).key("onSelectionChange1_text3")

      Button('addSpan').onClick((event: ClickEvent) => {
        this.controller.addTextSpan("012345")
      }).id('onSelectionChange1_btn1')
      Button('addImageSpan').onClick((event: ClickEvent) => {
        this.controller.addImageSpan($r("app.media.icon"),
          {
            imageStyle:
            {
              size: ["57px", "57px"]
            }
          })
      }).id('onSelectionChange1_btn2')
      Button('addSymbolSpan').onClick(() =>{
        this.controller.addSymbolSpan($r("sys.symbol.ohos_trash"),
          {
            style:
            {
              fontSize: 30
            }
          })
      }).id('onSelectionChange1_btn3')
    }
    .borderWidth(1)
    .borderColor(Color.Red)
    .width("100%")
    .height("100%")

  }
}