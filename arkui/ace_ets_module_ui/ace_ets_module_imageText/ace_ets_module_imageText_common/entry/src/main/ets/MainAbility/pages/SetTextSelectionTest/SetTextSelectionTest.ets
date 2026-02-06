/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct SetTextSelection {
  @State text: string = 'undefined!'
  @State text1: string = 'helloWorld!'
  @State text2: string = 'helloWorld!'

  @State selectedText1: string = ''
  @State selectedText2: string = ''
  controller: TextController = new TextController
  controller1: TextController = new TextController
  controller2: TextController = new TextController

  build() {
    Column(){
      Text('undefined') .id('selectedText').height('5%')
      Text(this.text,{controller:this.controller})
        .height('5%')
        .copyOption(CopyOptions.InApp)
        .onTextSelectionChange((selectionStart: number|undefined, selectionEnd: number|undefined) => {
          console.info('文本选中区域变化回调,selectionStart:' + selectionStart+'selectionEnd: '+ selectionEnd)
        })
      Button('TextSelection')
        .height('5%')
        .id('selectedTest')
        .onClick(() => {
          this.controller.setTextSelection(undefined,undefined,{menuPolicy:MenuPolicy.HIDE})
        })

      Text(this.selectedText1) .id('selectedText1').height('5%')
      Text(this.text1, { controller: this.controller1 }) {
        Span(this.text1)
        Span('In Line')
      }
      .height('5%')
      .copyOption(CopyOptions.InApp)
      .onTextSelectionChange((selectionStart: number, selectionEnd: number) => {
        if (selectionStart !== -1 && selectionEnd !== -1) {
          this.selectedText1 = this.text1.substring(selectionStart,selectionEnd)
        }
      })
      Button('SpanSelection')
        .id('selectedTest1')
        .onClick(() => {
          this.controller1.setTextSelection(2,4,{menuPolicy:MenuPolicy.SHOW})
        })
        .height('5%')
      Text(this.selectedText2) .id('selectedText2').height('5%')
      Text(this.text2, { controller: this.controller2 }) {
        Span(this.text2)
        ImageSpan($r('app.media.icon'))
          .width('20')
          .height('20')
      }
      .height('5%')
      .copyOption(CopyOptions.InApp)
      .onTextSelectionChange((selectionStart: number, selectionEnd: number) => {
        if (selectionStart !== -1 && selectionEnd !== -1) {
          this.selectedText2 = this.text2.substring(selectionStart,selectionEnd)
        }
      })
      Button('ImageSpan')
        .height('5%')
        .id('selectedTest2')
        .onClick(() => {
          this.controller2.setTextSelection(5,8,{menuPolicy:MenuPolicy.DEFAULT})
        })
    }
    .width('100%')
    .height('100%')
  }
}