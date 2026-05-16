/*
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
struct RichEditorApi1 {
  controller: RichEditorController = new RichEditorController()
  @State controllerIsEditing: boolean = false
  @Builder

  build() {
    Column() {
      Text('' + this.controllerIsEditing)
        .width('100%')
        .padding(5)
        .fontColor(Color.Orange)
        .fontSize(20)
        .id('RichEditorApi1_text1')

      RichEditor({ controller: this.controller })
        .onEditingChange((isEditing: boolean) => {
          this.controllerIsEditing = this.controller.isEditing()
        })
        .key('RichEditorApi1_1')
        .height(400)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width("100%")
    }
  }
}