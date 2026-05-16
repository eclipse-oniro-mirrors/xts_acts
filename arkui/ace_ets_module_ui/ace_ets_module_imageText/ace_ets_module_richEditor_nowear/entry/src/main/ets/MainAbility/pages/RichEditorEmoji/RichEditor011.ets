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
struct RichEditor011 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State pointPosition: number = -1;

  build() {
    Column() {
      Column() {

        Button('光标定位 emoji 后面').onClick(() => {
          this.controller.setCaretOffset(this.controller.getCaretOffset() - 1);
        }).id('back_emoji')

        Text('' + this.pointPosition).id('position_text');

        Button('get Point Position').onClick(() => {
          this.pointPosition = this.controller.getCaretOffset();
          console.log('this.point_position:' + this.pointPosition);
        }).id('get_position')
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      .height('20%')

      Column() {
        RichEditor(this.options)
          .onReady(() => {
            this.controller.addImageSpan($r('app.media.icon'),
              {
                imageStyle:
                {
                  size: ['57px', '57px']
                }
              })

            this.controller.addTextSpan('\uD83D\uDE00',
              {
                style:
                {
                  fontColor: Color.Orange,
                  fontSize: 30
                }
              })

            this.controller.addImageSpan($r('app.media.icon'),
              {
                imageStyle:
                {
                  size: ['57px', '57px']
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