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
struct SXsymbolStyle {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State text1: string = '';
  @State text2: string = '';

  build() {
    Column({space:0}) {
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
        .height('50%')
      Button("更新样式:加粗").onClick(() => {
        this.controller.updateSpanStyle({
          start: 0,
          end: 5,
          symbolStyle:
          {
            fontWeight: FontWeight.Bolder,
            fontSize: 16
          }
        })
      }).key('SXsymbolStylesymbolStyleButton').height('10%')
      Button('get').key('SXsymbolStyleButton')
        .onClick(() => {
          this.controller.getSpans({ start: 0, end: 6 }).forEach((item) => {
            this.text2  +=  (item as RichEditorTextSpanResult).symbolSpanStyle?.fontSize
          })
        }).height('10%')
      Text(this.text2).key('SXsymbolStyleText').height('10%').textAlign(TextAlign.Center)
    }.margin(20).height('100%')
  }

}