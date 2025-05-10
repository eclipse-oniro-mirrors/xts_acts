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
struct RichEditorOnWillChange002 {
  controller: RichEditorController = new RichEditorController();
  @State onWillChangeCallback: boolean = false;
  @State replacedSpansCallback: boolean = false;
  @State onDidChangeCallback: boolean = false;
  private myOffset: number | undefined = undefined
  private myBuilder: CustomBuilder = undefined

  @Builder
  placeholderBuilder() {
    Row({ space: 2 }) {
      Image($r('app.media.icon')).width(24).height(24).margin({ left: -5 })
      Text('Custom Popup').fontSize(10)
    }.width(100).height(50).padding(5)
  }

  build() {

    Column() {

      Text('onWillChange_callback:' + this.onWillChangeCallback).id('onWillChange_callback')
      Text('replacedSpans_callback:' + this.replacedSpansCallback).id('replacedSpans_callback')
      Text('onDidChange_callback:' + this.onDidChangeCallback).id('onDidChange_callback')

      Button('add iamge').onClick(() => {
        this.controller.addImageSpan($r('app.media.icon'),
          {
            imageStyle:
            {
              size: ['57px', '57px']
            }
          })
      }).id('add_image')

      Button('add symbol').onClick(() => {
        this.controller.addSymbolSpan($r('sys.symbol.ohos_trash'),
          {
            style:
            {
              fontSize: 30
            }
          })
      }).id('add_symbol')

      Button('add builder')
        .onClick(() => {
          let num = this.controller.addBuilderSpan(this.myBuilder, { offset: this.myOffset })
          console.info('addBuilderSpan return ' + num)
        }).id('add_builder')

      Button('int callback status')
        .onClick(() => {
          this.onWillChangeCallback = false;
          this.replacedSpansCallback = false;
          this.onDidChangeCallback = false;
        }).id('int_callback_status')

      Row() {
        Button('builder').onClick(() => {
          this.myBuilder = () => {
            this.placeholderBuilder()
          }
        }).id('builder')
      }


      RichEditor({ controller: this.controller })
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady(() => {

        })
        .onWillChange((value: RichEditorChangeValue) => {
          console.log('RichEditorController：onWillChange')
          this.onWillChangeCallback = true;
          value.replacedSpans.forEach((item: RichEditorTextSpanResult) => {
            console.log('RichEditorController：replacedSpans')
            this.replacedSpansCallback = true;
            console.log('RichEditorController replacedSpans value:' + item.value);
            console.log('RichEditorController replacedSpans value length:' + item.value.length);
          })
          return true;
        })
        .onDidChange((rangeBefore: TextRange, rangeAfter: TextRange) => {
          this.onDidChangeCallback = true;
          console.log('RichEditorController onDidChange rangeBefore:' + JSON.stringify(rangeBefore));
          console.log('RichEditorController onDidChange rangeAfter:' + JSON.stringify(rangeAfter));
        })
        .onCut((event: CutEvent) => {
          event.preventDefault!()
          console.log('RichEditorController：onCut');
        })
        .onCopy((event: CopyEvent) => {
          event.preventDefault!()
          console.log('RichEditorController：onCopy');
        })
        .onPaste(() => {
          console.log('RichEditorController：onPaste');
        })
        .id('rich_struct')

    }
  }
}