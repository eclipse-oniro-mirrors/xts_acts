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
struct RichEditorPreventDefault002 {
  controller: RichEditorController = new RichEditorController();
  @State callNum: number = 0;
  build() {

    Column() {
      Button('setSelect').onClick(() => {
        this.controller.setSelection(0, 2);
      }).id('setSelect')
      RichEditor({ controller: this.controller })
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady(() => {
          this.controller.addTextSpan('a', {
            style:
            {
              fontColor: Color.Orange,
              fontSize: 50
            },
            gesture:
            {
              onClick: (event: ClickEvent) => {
                if (event != undefined && event.preventDefault) {
                  event.preventDefault();
                }
                this.callNum += 1;
              }
            }
          })

          this.controller.addImageSpan($r('app.media.icon'),
            {
              imageStyle:
              {
                size: ['50px', '50px'],
                layoutStyle: {
                  margin: 5,
                  borderRadius: 15
                }
              },
              gesture:
              {
                onClick: (event: ClickEvent) => {
                  if (event != undefined && event.preventDefault) {
                    event.preventDefault();
                  }
                  this.callNum += 1;
                }
              }
            })
        })
        .id('RichEditorPreventDefault002')

      Column(){
        Text('callNum:' + this.callNum).fontSize(20).fontColor(Color.Black).id('callNum')
      }.margin({bottom: 10})
    }
  }
}