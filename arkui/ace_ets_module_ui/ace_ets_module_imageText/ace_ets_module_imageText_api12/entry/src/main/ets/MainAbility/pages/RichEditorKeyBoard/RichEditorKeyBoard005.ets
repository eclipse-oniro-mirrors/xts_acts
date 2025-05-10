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
struct RichEditorKeyBoard005 {
  controller: RichEditorController = new RichEditorController();
  @State onSubmitCallBack: boolean = false;
  @State isEditingFlag: boolean = false;
  build() {

    Column() {
      Text('onSubmitCallBack:' + this.onSubmitCallBack).id('onSubmitCallBack')
      Text('isEditingFlag:' + this.isEditingFlag).id('isEditingFlag')

      RichEditor({ controller: this.controller })
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
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
        .onEditingChange((isEditing: boolean) => {
          this.isEditingFlag = isEditing;
          console.log('RichEditorController Editing Status:' + isEditing);
        })
        .enterKeyType(EnterKeyType.Go)
        .onSubmit((enterKey: EnterKeyType, event: SubmitEvent) => {
          this.onSubmitCallBack = true;
          console.log('RichEditorController trigger richeditor onsubmit' + enterKey);
          this.controller.addTextSpan(' type['+ enterKey +'] triggerred')
        })
        .id('RichEditorKeyBoard005')

    }
  }
}