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
struct SXsymbolSpanStyle {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State text1: string = '';
  @State text2: string = '';

  build() {
    Column({space:20}) {
      RichEditor(this.options)
        .onReady(() => {
          this.controller.addSymbolSpan($r("sys.symbol.ohos_trash"),
            {
              style:
              {
                fontSize: 30,
              }
            })
        })
        .borderWidth(1)
        .width('100%')
        .height(200)
      Button('get').key('SXsymbolSpanStyleButton')
        .onClick(() => {
          this.controller.getSpans({ start: 0, end: 6 }).forEach((item) => {
            this.text2  +=  (item as RichEditorTextSpanResult).symbolSpanStyle?.fontSize
          })
        }).height(100)
      Text(this.text2).key('SXsymbolSpanStyleText')
    }.margin(20)
  }

}

