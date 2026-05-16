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
struct RichEditor016 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State pointPosition: number = -1;

  build() {
    Column() {
      Row() {
        Button('光标定位 emoji前').onClick(() => {
          this.controller.setCaretOffset(this.controller.getCaretOffset() - 2);
        }).id('back').width('30%')
        Button('光标定位emoji后').onClick(() => {
          this.controller.setCaretOffset(this.controller.getCaretOffset() + 2);
        }).id('after').width('30%')
        Button('get Point Position').onClick(() => {
          this.pointPosition = this.controller.getCaretOffset();
          console.log('this.point_position:' + this.pointPosition);
        }).id('get_position').width('30%')
      }.height('5%')
      Text('' + this.pointPosition).id('position_text').height('5%').clip(true)
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      Column() {
        RichEditor(this.options)
          .onReady(() => {
            this.controller.addTextSpan('\uD83D\uDE00',
              {
                style:
                {
                  fontColor: Color.Orange,
                  fontSize: 30
                }
              })
          })
          .borderWidth(1)
          .borderColor(Color.Green)
          .width('100%')
          .height('30%')
          .id('rich_struct')
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      .height('70%')
    }
  }
}