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
struct RichEditorGetLayoutManagerTest1 {
  controller: RichEditorController = new RichEditorController()
  @State text1:string = ''
  build() {
    Column({space:10}) {
      RichEditor({ controller: this.controller })
        .height(150)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width("90%")
        .onReady(() => {
          this.controller.addTextSpan("123",
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 16
              }
            })
        })

      Button('get')
        .onClick(()=>{
          this.text1 = String(this.controller.getLayoutManager().getLineCount())
        })
        .id('RichEditorGetLayoutManagerTest1_btn')

      Text(this.text1).id('RichEditorGetLayoutManagerTest1_text1')


    }.width('100%')
  }
}