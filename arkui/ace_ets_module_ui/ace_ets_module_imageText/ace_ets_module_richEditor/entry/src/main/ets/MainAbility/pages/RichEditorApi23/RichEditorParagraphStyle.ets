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
import { LengthMetrics } from '@kit.ArkUI'

@Entry
@Component
struct RichEditorParagraphStyle23 {
  @State text: string = 'Init'
  @State strokeWidthIndex: number = 0;
  @State paragraphStyle: RichEditorParagraphStyle = { textDirection: TextDirection.LTR }
  @State srcColor: ResourceColor[] = ['#FFFF0000', 0xFFFFFF, Color.Green, $r('app.color.start_window_background')];
  @State strokeWidthValue: (LengthMetrics | undefined)[] = [LengthMetrics.vp(10) ,LengthMetrics.px(10),
    LengthMetrics.fp(10), LengthMetrics.percent(10), LengthMetrics.lpx(10), undefined];
  private richEditorTextStyle: RichEditorTextStyle = {
    strokeWidth: this.strokeWidthValue[this.strokeWidthIndex],
    strokeColor: this.srcColor[this.strokeWidthIndex]
  }
  controller: RichEditorController = new RichEditorController()
  options: RichEditorOptions = { controller: this.controller }
  ssController: RichEditorStyledStringController = new RichEditorStyledStringController()
  ssOptions: RichEditorStyledStringOptions = { controller: this.ssController }
  contentChangedListener: StyledStringChangedListener = {
    onWillChange: (value: StyledStringChangeValue) => {
      let range = '[ ' + value.range.start + ' , ' + value.range.end + ' ]';
      let replaceString = value.replacementString.getString();
      console.info('styledString, onWillChange, range=' + range);
      console.info('styledString, onWillChange, replaceString=' + replaceString);
      let styles: Array<SpanStyle> = []
      if (replaceString.length != 0) {
        styles = value.replacementString.getStyles(0, replaceString.length, StyledStringKey.PARAGRAPH_STYLE)
      }
      styles.forEach((style) => {
        let value = style.styledValue
        let paraStyle: ParagraphStyle = value as ParagraphStyle
        if (paraStyle != undefined) {
          AppStorage.setOrCreate('textDirection', '' + JSON.stringify(paraStyle.textDirection));
          console.info('styledString, onWillChange, textDirection=' + JSON.stringify(paraStyle.textDirection));
        }
      })
      return true;
    }
  }

  onPageShow(): void {
    this.controller.setTypingStyle(this.richEditorTextStyle)
    this.controller.setTypingParagraphStyle(this.paragraphStyle)
    this.ssController.setTypingParagraphStyle(this.paragraphStyle)
  }

  build() {
    Column() {
      Text('RichEditorParagraphStyle')
      // 清除预设段落样式
      Button('clearParaStyle').onClick(() => {
        this.controller.setTypingParagraphStyle(undefined)
        this.ssController.setTypingParagraphStyle(undefined)
      })

      Row() {
        Column() {
          RichEditor(this.options)
            .height('5%')
            .width('100%')
            .id('RichEditorTextStyleResult_1')
            .border({ width: 1, color: Color.Blue })
            .onWillChange((value: RichEditorChangeValue) => {
              console.log('controller, onWillChange, rangeBefore=' + JSON.stringify(value.rangeBefore))
              value.replacedSpans.forEach((item: RichEditorTextSpanResult) => {
                let richEditorTextStyleResult: RichEditorTextStyleResult = item.textStyle
                let strokeWidthValue = '' + JSON.stringify(richEditorTextStyleResult.strokeWidth)
                let strokeColorValue = '' + JSON.stringify(richEditorTextStyleResult.strokeColor)
                console.log('controller, onWillChange, strokeWidth=' + strokeWidthValue)
                AppStorage.setOrCreate('RichEditorTextStyleResult_strokeWidth', strokeWidthValue)
                console.log('controller, onWillChange, strokeColor=' + strokeColorValue)
                AppStorage.setOrCreate('RichEditorTextStyleResult_strokeColor', strokeColorValue)
              })
              return true
            })
          RichEditor(this.ssOptions)
            .id('RichEditorParagraphStyle_1')
            .height('5%')
            .width('100%')
            .onReady(() => {
              this.ssController.onContentChanged(this.contentChangedListener);
            })

          Button('get textDirection:' + this.text)
            .id('RichEditorParagraphStyle_get_textDirection')
            .onClick(() => {
              this.text = '' + AppStorage.get('textDirection')
            })
        }
      }
    }
  }
}