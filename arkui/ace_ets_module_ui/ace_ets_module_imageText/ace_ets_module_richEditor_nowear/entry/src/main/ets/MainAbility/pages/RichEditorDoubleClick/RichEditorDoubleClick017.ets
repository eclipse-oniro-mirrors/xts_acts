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
struct RichEditorDoubleClick017 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State endPosition: number | undefined = -1;

  build() {
    Column() {

      Column() {

        Text('' + this.endPosition).id('endPosition')
        RichEditor(this.options)
          .onReady(() => {
            this.controller.addTextSpan('15000000000\n');
            this.controller.addTextSpan('中国人\n');
            this.controller.addTextSpan('XX省XX市XX区XXXX');
          })
          .onSelectionChange((value: RichEditorRange) => {
            console.log('RichEditorController value:' + JSON.stringify(value));
            this.endPosition = value.start;
          })
          .enableDataDetector(true)
          .caretColor(Color.Red)
          .height(90)
          .selectedBackgroundColor(Color.Green)
          .borderWidth(1)
          .borderColor(Color.Green)
          .id('RichEditorDoubleClick017')
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      .height('70%')
    }
  }
}