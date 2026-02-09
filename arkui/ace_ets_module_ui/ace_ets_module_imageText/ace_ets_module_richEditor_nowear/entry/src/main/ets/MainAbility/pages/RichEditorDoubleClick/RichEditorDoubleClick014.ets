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

import Utils from '../../common/Utils'

@Entry
@Component
struct RichEditorDoubleClick014 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  controller1: RichEditorController = new RichEditorController();
  options1: RichEditorOptions = { controller: this.controller1 };
  @State message: string = '';

  build() {
    Column() {

      Column() {

        Text('message:' + this.message).id('message')

        RichEditor(this.options)
          .onReady(() => {
            this.controller.addTextSpan('test_rich_editor1', {
              style: {
                fontWeight: 'medium',
                fontFamily: Utils.FONT_FAMILY,
                fontSize: 40,
                fontStyle: FontStyle.Italic,
                decoration: { type: TextDecorationType.Underline, color: Color.Green }
              }
            })
            this.controller.addTextSpan('aaa')
            this.controller.addTextSpan('bbb')
            this.controller.addTextSpan('ccc')
          })
          .onSelectionChange((value: RichEditorRange) => {
            console.log('RichEditorController value:' + JSON.stringify(value));
            this.message = JSON.stringify(value);
          })
          .height(80)
          .caretColor(Color.Red)
          .selectedBackgroundColor(Color.Green)
          .borderWidth(1)
          .borderColor(Color.Green)
          .id('RichEditorDoubleClick014')

        RichEditor(this.options1)
          .onReady(() => {
            this.controller1.addTextSpan('test_rich_editor2', {
              style: {
                fontWeight: 'medium',
                fontFamily: Utils.FONT_FAMILY,
                fontSize: 40,
                fontStyle: FontStyle.Italic,
                decoration: { type: TextDecorationType.Underline, color: Color.Red}
              }
            })
            this.controller1.addTextSpan('bbb')
            this.controller1.addTextSpan('ccc')
            this.controller1.addTextSpan('ddd')
          })
          .onSelectionChange((value: RichEditorRange) => {
            console.log('RichEditorController value:' + JSON.stringify(value));
            this.message = JSON.stringify(value);
          })
          .height(80)
          .caretColor(Color.Red)
          .selectedBackgroundColor(Color.Green)
          .borderWidth(1)
          .borderColor(Color.Green)
          .id('RichEditorDoubleClick014_1')
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      .height('70%')
    }
  }
}