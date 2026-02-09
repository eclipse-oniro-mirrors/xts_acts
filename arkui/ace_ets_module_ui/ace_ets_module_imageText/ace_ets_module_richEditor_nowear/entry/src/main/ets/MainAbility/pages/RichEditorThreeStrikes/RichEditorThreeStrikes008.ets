/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct RichEditorThreeStrikes008 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State message: string = '';

  build() {
    Column() {

      Column() {

        Text('message:' + this.message).id('message')

        RichEditor(this.options)
          .onReady(() => {
            for (let index = 0; index < 70; index++) {
              this.controller.addTextSpan('0123456789',
                {
                  style:
                  {
                    fontColor: Color.Orange,
                    fontSize: 30
                  }
                })
            }
          })
          .onSelectionChange((value: RichEditorRange) => {
            console.log('RichEditorController value:' + JSON.stringify(value));
            this.message = JSON.stringify(value);
          })
          .height(300)
          .width('100%')
          .borderWidth(1)
          .borderColor(Color.Green)
          .id('RichEditorThreeStrikes008')
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      .height('70%')
    }
  }
}