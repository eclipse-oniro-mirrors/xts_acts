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
struct RichEditorSetTypingParagraphStyle {
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
          );
        }
      })
      return true;
    }
  }

  build() {
    Column() {
      Row() {
        Text('ParaStyle')
        // 设置预设段落样式为居中对齐
        Button('setStyle1').onClick(() => {
          let paragraphStyle: RichEditorParagraphStyle = {
            textAlign: TextAlign.Center
          }
          this.controller.setTypingParagraphStyle(paragraphStyle)
          this.ssController.setTypingParagraphStyle(paragraphStyle)
        })
        // 设置预设段落样式为左对齐、带有缩进
        Button('setStyle2').onClick(() => {
          let paragraphStyle: RichEditorParagraphStyle = {
            textAlign: TextAlign.Start,
            leadingMargin: 80
          }
          this.controller.setTypingParagraphStyle(paragraphStyle)
          this.ssController.setTypingParagraphStyle(paragraphStyle)
        })
        // 清除预设段落样式
        Button('clearParaStyle').onClick(() => {
          this.controller.setTypingParagraphStyle(undefined)
          this.ssController.setTypingParagraphStyle(undefined)
        })
      }

      Row() {
        Column() {
          RichEditor(this.options)
            .height('25%')
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
            .height('25%')
            .width('100%')
            .onReady(() => {
              this.ssController.onContentChanged(this.contentChangedListener);
            })
        }
      }
    }
  }
}