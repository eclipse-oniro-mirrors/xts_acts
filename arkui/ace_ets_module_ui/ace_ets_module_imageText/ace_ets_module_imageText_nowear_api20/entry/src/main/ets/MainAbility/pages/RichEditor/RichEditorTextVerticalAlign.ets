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

@Entry
@Component
struct RichEditorTextVerticalAlign {
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
          console.info('styledString, onWillChange, textAlign=' + JSON.stringify(paraStyle.textAlign)
            + ', textIndent=' + JSON.stringify(paraStyle.textIndent)
            + ', maxLines=' + JSON.stringify(paraStyle.maxLines)
            + ', overflow=' + JSON.stringify(paraStyle.overflow)
            + ', wordBreak=' + JSON.stringify(paraStyle.wordBreak)
            + ', leadingMargin=' + JSON.stringify(paraStyle.leadingMargin)
            + ', paragraphSpacing=' + JSON.stringify(paraStyle.paragraphSpacing)
            + ', textVerticalAlign=' + JSON.stringify(paraStyle.textVerticalAlign)
          );
          if(JSON.stringify(paraStyle.textVerticalAlign) + '' == '0'){
            AppStorage.setOrCreate('RichEditor_TextVerticalAlign_BASELINE', 'TextVerticalAlign.BASELINE')
          }else if(JSON.stringify(paraStyle.textVerticalAlign) + '' == '1'){
            AppStorage.setOrCreate('RichEditor_TextVerticalAlign_BOTTOM', 'TextVerticalAlign.BOTTOM')
          }else if(JSON.stringify(paraStyle.textVerticalAlign) + '' == '2'){
            AppStorage.setOrCreate('RichEditor_TextVerticalAlign_CENTER', 'TextVerticalAlign.CENTER')
          }else if(JSON.stringify(paraStyle.textVerticalAlign) + '' == '3'){
            AppStorage.setOrCreate('RichEditor_TextVerticalAlign_TOP', 'TextVerticalAlign.TOP')
          }
        }
      })
      return true;
    }
  }

  build() {
    Column() {
      Text('RichEditorParagraphStyle').height('5%')

      Button('TextVerticalAlign.BASELINE').height('5%')
        .id('RichEditor_TextVerticalAlign_BASELINE')
        .onClick(() => {
          let paragraphStyle: RichEditorParagraphStyle = {
            textVerticalAlign: TextVerticalAlign.BASELINE
          }
          this.controller.setTypingParagraphStyle(paragraphStyle)
          this.ssController.setTypingParagraphStyle(paragraphStyle)
        })

      Button('TextVerticalAlign.BOTTOM').height('5%')
        .id('RichEditor_TextVerticalAlign_BOTTOM')
        .onClick(() => {
          let paragraphStyle: RichEditorParagraphStyle = {
            textVerticalAlign: TextVerticalAlign.BOTTOM
          }
          this.controller.setTypingParagraphStyle(paragraphStyle)
          this.ssController.setTypingParagraphStyle(paragraphStyle)
        })

      Button('TextVerticalAlign.CENTER').height('5%')
        .id('RichEditor_TextVerticalAlign_CENTER')
        .onClick(() => {
          let paragraphStyle: RichEditorParagraphStyle = {
            textVerticalAlign: TextVerticalAlign.CENTER
          }
          this.controller.setTypingParagraphStyle(paragraphStyle)
          this.ssController.setTypingParagraphStyle(paragraphStyle)
        })

      Button('TextVerticalAlign.TOP').height('5%')
        .id('RichEditor_TextVerticalAlign_TOP')
        .onClick(() => {
          let paragraphStyle: RichEditorParagraphStyle = {
            textVerticalAlign: TextVerticalAlign.TOP
          }
          this.controller.setTypingParagraphStyle(paragraphStyle)
          this.ssController.setTypingParagraphStyle(paragraphStyle)
        })

      Button('TextVerticalAlign: default').height('5%')
        .id('RichEditor_TextVerticalAlign_default')
        .onClick(() => {
          let paragraphStyle: RichEditorParagraphStyle = {
            textAlign: TextAlign.Center
          }
          this.controller.setTypingParagraphStyle(paragraphStyle)
          this.ssController.setTypingParagraphStyle(paragraphStyle)
        })

      Button('TextVerticalAlign: undefined').height('5%')
        .id('RichEditor_TextVerticalAlign_undefined')
        .onClick(() => {
          let paragraphStyle: RichEditorParagraphStyle = {
            textVerticalAlign: undefined
          }
          this.controller.setTypingParagraphStyle(paragraphStyle)
          this.ssController.setTypingParagraphStyle(paragraphStyle)
        })

      Button('clearParaStyle').height('5%')
        .id('setTypingParagraphStyle_undefined')
        .onClick(() => {
          this.controller.setTypingParagraphStyle(undefined)
          this.ssController.setTypingParagraphStyle(undefined)
        })

      Row() {
        Column() {
          RichEditor(this.options)
            .height('5%')
            .width('100%')
            .border({ width: 1, color: Color.Blue })
            .onWillChange((value: RichEditorChangeValue) => {
              console.log('controller, onWillChange, rangeBefore=' + JSON.stringify(value.rangeBefore))
              value.replacedSpans.forEach((item: RichEditorTextSpanResult) => {
                console.log('controller, onWillChange, replacedTextSpans=' + JSON.stringify(item))
              })
              return true
            })

          RichEditor(this.ssOptions)
            .id('RichEditor_input')
            .height('5%')
            .width('100%')
            .border({ width: 1, color: Color.Blue })
            .onReady(() => {
              this.ssController.onContentChanged(this.contentChangedListener);
            })
        }
      }
    }
  }
}