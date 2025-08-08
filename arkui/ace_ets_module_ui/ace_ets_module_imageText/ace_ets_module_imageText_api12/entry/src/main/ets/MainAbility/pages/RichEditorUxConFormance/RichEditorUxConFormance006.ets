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
struct RichEditorUxConFormance006 {
  controller: RichEditorController = new RichEditorController();
  @State paragraphStyleInfo: string = '';
  build() {

    Column() {
      Text('paragraphStyleInfo:' + this.paragraphStyleInfo).id('paragraphStyleInfo')

      Button('getParagraphStyle').onClick(() => {
        this.paragraphStyleInfo = JSON.stringify(this.controller.getParagraphs({ start: -1, end: -1 }));
      }).id('getParagraphStyle')

      RichEditor({ controller: this.controller })
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady(() => {
          this.controller.addTextSpan('abc',
            {})
        })
        .id('RichEditorUxConFormance006')

    }
  }
}