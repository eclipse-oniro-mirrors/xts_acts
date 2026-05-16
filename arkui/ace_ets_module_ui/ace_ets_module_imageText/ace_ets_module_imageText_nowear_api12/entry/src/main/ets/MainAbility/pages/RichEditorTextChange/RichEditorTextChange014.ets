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
struct RichEditorTextChange014 {
  controller: RichEditorController = new RichEditorController();
  @State isEditingFlag: boolean = false;

  build() {
    Column() {
      Text('isEditingFlag:' + this.isEditingFlag).id('isEditingFlag')
      TextArea({text:'我是TextArea'}).draggable(true).width(100).height(50).id('TextArea');
      RichEditor({ controller: this.controller })
        .height(100)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width(100)
        .onReady(() => {
          this.controller.addTextSpan('012345',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 30
              }
            })
        })
        .draggable(true)
        .onEditingChange((isEditing: boolean) => {
          this.isEditingFlag = isEditing;
          console.log('RichEditorController Editing Status:' + isEditing);
        })
        .id('RichEditorTextChange014')
    }
  }
}