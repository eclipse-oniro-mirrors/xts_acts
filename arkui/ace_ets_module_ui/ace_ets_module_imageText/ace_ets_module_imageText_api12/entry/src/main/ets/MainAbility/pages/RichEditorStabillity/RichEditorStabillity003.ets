/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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
struct RichEditorStabillity003 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State pointPosition: number = -1;
  @State style: string = '';

  build() {
    Column() {
        RichEditor(this.options)
          .onReady(() => {
            for (let index = 0; index < 10; index++) {
              this.controller.addTextSpan('abc123456789abc',
                {
                  style:
                  {
                    fontColor: Color.Orange,
                    fontSize: 30
                  }
                })
            }
          })
          .borderWidth(1)
          .borderColor(Color.Green)
          .width('100%')
          .height('30%')
          .id('RichEditorStabillity003')

      Column(){
        Button('get Point Position').onClick(() => {
          this.pointPosition = this.controller.getCaretOffset();
          console.log('this.pointPosition:' + this.pointPosition);
        }).id('getPosition')
        Text('' + this.pointPosition).id('pointPosition')
      }.margin({bottom: 10})
    }
  }
}