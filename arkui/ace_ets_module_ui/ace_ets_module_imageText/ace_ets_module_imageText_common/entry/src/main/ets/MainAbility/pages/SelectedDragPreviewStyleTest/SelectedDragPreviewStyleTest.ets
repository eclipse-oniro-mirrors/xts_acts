/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct RichEditorExample {
  @State text: string = 'As the sun begins to set, casting a warm golden hue across the sky'
  controller: RichEditorController = new RichEditorController();
  option: RichEditorOptions = { controller: this.controller };

  build() {
    Column() {
      RichEditor({ controller: this.controller })
        .id('selectedDragPreviewStyle')
        .onReady(() => {
          this.controller.addTextSpan(this.text,
            {
              style:
              {
                fontColor: Color.Blue,
              },
              paragraphStyle: {
                textAlign: TextAlign.Center
              },

            })
        })
        .height('5%')
        .backgroundColor('rgb(240,250,255)')
        .draggable(true)
        .selectedDragPreviewStyle({ color: Color.Pink })
    }
    .width('100%')
    .height('100%')
  }
}