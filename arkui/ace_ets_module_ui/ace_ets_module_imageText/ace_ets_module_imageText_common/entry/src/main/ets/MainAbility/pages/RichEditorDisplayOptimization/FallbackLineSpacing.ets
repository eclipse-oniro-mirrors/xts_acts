/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
struct FallbackLineSpacing {
  rEController: RichEditorController = new RichEditorController();
  rEOptions: RichEditorOptions = { controller: this.rEController };

  rEController2: RichEditorController = new RichEditorController();
  rEOptions2: RichEditorOptions = { controller: this.rEController2 };

  rEController3: RichEditorController = new RichEditorController();
  rEOptions3: RichEditorOptions = { controller: this.rEController3 };

  rEController4: RichEditorController = new RichEditorController();
  rEOptions4: RichEditorOptions = { controller: this.rEController4 };

  @State fallbackLineSpacing: (boolean | undefined | null) = false;

  build() {
    Row(){
      Column(){
        RichEditor(this.rEOptions)
          .id('richEditor')
          .width('80%')
          .height('10%')
          .border({ width: 1, color: Color.Black })
          .onReady(() => {
            this.rEController.addTextSpan('ཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉི', {
              style: {
                fontSize: 32,
                fontColor: Color.Black,
                lineHeight: 16
              }
            });
          })
          .fallbackLineSpacing(false)

        RichEditor(this.rEOptions2)
          .id('richEditor2')
          .width('80%')
          .height('10%')
          .border({ width: 1, color: Color.Black })
          .onReady(() => {
            this.rEController2.addTextSpan('ཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉི', {
              style: {
                fontSize: 32,
                fontColor: Color.Black,
                lineHeight: 16
              }
            });
          })
          .fallbackLineSpacing(true)

        RichEditor(this.rEOptions3)
          .id('richEditor3')
          .width('80%')
          .height('10%')
          .border({ width: 1, color: Color.Black })
          .onReady(() => {
            this.rEController3.addTextSpan('ཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉི', {
              style: {
                fontSize: 32,
                fontColor: Color.Black,
                lineHeight: 16
              }
            });
          })
          .fallbackLineSpacing(undefined)

        RichEditor(this.rEOptions4)
          .id('richEditor4')
          .width('80%')
          .height('10%')
          .border({ width: 1, color: Color.Black })
          .onReady(() => {
            this.rEController4.addTextSpan('ཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉིཉི', {
              style: {
                fontSize: 32,
                fontColor: Color.Black,
                lineHeight: 16
              }
            });
          })
          .fallbackLineSpacing(null)
      }
      .width('100%')
    }
    .height('100%')
  }
}
