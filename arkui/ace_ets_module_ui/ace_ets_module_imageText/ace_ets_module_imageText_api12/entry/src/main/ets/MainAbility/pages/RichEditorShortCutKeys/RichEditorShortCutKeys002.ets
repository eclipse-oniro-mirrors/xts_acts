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
struct RichEditorShortCutKeys002 {
  controller: RichEditorController = new RichEditorController();
  @State positionNum: number = -1;
  build() {

    Column() {
      Text('positionNum:' + this.positionNum).id('positionNum')

      Button('get position')
        .id('get_position')
        .margin(15)
        .backgroundColor(Color.Blue)
        .onClick(() => {
          this.positionNum = this.controller.getCaretOffset();
        })

      RichEditor({ controller: this.controller })
        .height(100)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady(() => {
          this.controller.addTextSpan('abcd',
            {
              style:
              {
                fontColor: Color.Red,
                fontSize: 20
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
        .id('RichEditorShortCutKeys002')

    }
  }
}