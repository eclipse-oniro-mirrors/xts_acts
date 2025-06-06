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
struct RichEditorPreventDefault007 {
  controller: RichEditorController = new RichEditorController();
  @State callOnClick: boolean = false;
  @State richEditorCallOnClick: boolean = false;
  build() {

    Column() {
      RichEditor({ controller: this.controller })
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onClick(() => {
          this.richEditorCallOnClick = true;
          console.log('RichEditorController click event');
        })
        .onReady(() => {
          this.controller.addTextSpan('a', {
            style:
            {
              fontColor: Color.Orange,
              fontSize: 50
            },
            gesture:
            {
              onClick: (event?: ClickEvent) => {
                console.log('RichEditorController text span click event');
                this.callOnClick = true;
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
                onClick: (event?: ClickEvent) => {
                  console.log('RichEditorController image span click event');
                  this.callOnClick = true;
                }
              }
            })
        })
        .id('RichEditorPreventDefault007')

      Column(){
        Text('callOnClick:' + this.callOnClick).fontSize(20).fontColor(Color.Black).id('callOnClick')
        Text('richEditorCallOnClick:' + this.richEditorCallOnClick).fontSize(20).fontColor(Color.Black).id('richEditorCallOnClick')
      }.margin({bottom: 10})
    }
  }
}