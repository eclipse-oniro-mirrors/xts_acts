/**
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
import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct RichEditorBaseControllerSetStyledPlaceholder {
  controller1: RichEditorController = new RichEditorController();
  controller2: RichEditorController = new RichEditorController();
  controller3: RichEditorController = new RichEditorController();
  controller4: RichEditorController = new RichEditorController();
  controller5: RichEditorController = new RichEditorController();
  controller6: RichEditorController = new RichEditorController();
  controller7: RichEditorController = new RichEditorController();

  build() {
    Column({ space: 1 }) {
      // setStyledPlaceholder with StyledString test
      RichEditor({ controller: this.controller1 })
        .id('richEditor_base_setStyledPlaceholder_styledString')
        .onReady(() => {
          let styledString: MutableStyledString = new MutableStyledString('placeholder text',
            [
              {
                start: 0,
                length: 6,
                styledKey: StyledStringKey.FONT,
                styledValue: new TextStyle({
                  fontColor: Color.Orange,
                  fontSize: LengthMetrics.fp(24)
                })
              }
            ]
          );
          this.controller1.setStyledPlaceholder(styledString);
        })
        .height('3%')

      // setStyledPlaceholder with empty string StyledString test
      RichEditor({ controller: this.controller2 })
        .id('richEditor_base_setStyledPlaceholder_emptyString')
        .onReady(() => {
          let styledString: MutableStyledString = new MutableStyledString('');
          this.controller2.setStyledPlaceholder(styledString);
        })
        .height('3%')

      // setStyledPlaceholder with null parameter
      RichEditor({ controller: this.controller3 })
        .id('richEditor_base_setStyledPlaceholder_null')
        .onReady(() => {
          this.controller3.setStyledPlaceholder(null);
        })
        .height('3%')

      // setStyledPlaceholder with undefined parameter
      RichEditor({ controller: this.controller4 })
        .id('richEditor_base_setStyledPlaceholder_undefined')
        .onReady(() => {
          this.controller4.setStyledPlaceholder(undefined);
        })
        .height('3%')

      // setStyledPlaceholder with normal StyledString - fontColor test
      RichEditor({ controller: this.controller5 })
        .id('richEditor_base_setStyledPlaceholder_fontColor')
        .onReady(() => {
          let styledString: MutableStyledString = new MutableStyledString('test fontColor',
            [
              {
                start: 0,
                length: 10,
                styledKey: StyledStringKey.FONT,
                styledValue: new TextStyle({
                  fontColor: '#FFFF0000',
                  fontSize: LengthMetrics.fp(16)
                })
              }
            ]
          );
          this.controller5.setStyledPlaceholder(styledString);
        })
        .height('3%')

      // setStyledPlaceholder with StyledString - fontSize test
      RichEditor({ controller: this.controller6 })
        .id('richEditor_base_setStyledPlaceholder_fontSize')
        .onReady(() => {
          let styledString: MutableStyledString = new MutableStyledString('test fontSize',
            [
              {
                start: 0,
                length: 10,
                styledKey: StyledStringKey.FONT,
                styledValue: new TextStyle({
                  fontColor: Color.Gray,
                  fontSize: LengthMetrics.fp(20)
                })
              }
            ]
          );
          this.controller6.setStyledPlaceholder(styledString);
        })
        .height('3%')

      // setStyledPlaceholder with normal text StyledString
      RichEditor({ controller: this.controller7 })
        .id('richEditor_base_setStyledPlaceholder_normal')
        .onReady(() => {
          let styledString: MutableStyledString = new MutableStyledString('normal placeholder',
            [
              {
                start: 0,
                length: 7,
                styledKey: StyledStringKey.FONT,
                styledValue: new TextStyle({
                  fontColor: Color.Blue,
                  fontSize: LengthMetrics.fp(18)
                })
              }
            ]
          );
          this.controller7.setStyledPlaceholder(styledString);
        })
        .height('3%')
    }
    .width('100%')
    .height('100%')
  }
}
