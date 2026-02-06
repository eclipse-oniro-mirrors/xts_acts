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
struct RichEditorAttributeStrings002 {

  @State styledString: string = '';
  fontStyle1: TextStyle = new TextStyle({ fontColor: Color.Blue });
  mutableStyledString: MutableStyledString = new MutableStyledString('abcd',
    [{
      start: 0,
      length: 4,
      styledKey: StyledStringKey.FONT,
      styledValue: this.fontStyle1
    }]);
  fontStyle2: TextStyle = new TextStyle({ fontColor: Color.Red });
  mutableStyledString1: MutableStyledString = new MutableStyledString('hello',
    [{
      start: 0,
      length: 5,
      styledKey: StyledStringKey.FONT,
      styledValue: this.fontStyle2
    }]);
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller };

  controller1: RichEditorStyledStringController = new RichEditorStyledStringController();
  options1: RichEditorStyledStringOptions = { controller: this.controller1 };


  build() {
    Column() {

      Button('getStyles')
        .onClick(() => {
          let richEditorStyledString = this.controller.getStyledString();
          this.styledString = richEditorStyledString.getString();
        })
        .id('getStyles')

      Button('getOtherStyles')
        .onClick(() => {
          let richEditorStyledString = this.controller1.getStyledString();
          this.styledString = richEditorStyledString.getString();
        })
        .id('getOtherStyles')

      Text('StyledString:' + this.styledString).id('StyledString')

      RichEditor(this.options)
        .onReady(() => {
          this.controller.setStyledString(this.mutableStyledString);
        })
        .height(100)
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black)
        .id('RichEditorAttributeStrings002')

      RichEditor(this.options1)
        .onReady(() => {
          this.controller1.setStyledString(this.mutableStyledString1);
        })
        .height(100)
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black)
        .id('RichEditorAttributeStrings002_1')
    }
  }
}