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
struct RichEditor6 {
  controller: RichEditorController = new RichEditorController()
  @State isEditing: boolean = false
  @State controllerIsEditing: boolean = false

  build() {
    Column() {
      Scroll() {
        Column() {
          Row(){
            Text('OnEditingChange:'+this.isEditing).id("OnEditingChange")
          }.margin({top:10}).width("100%")
          Row(){
            Text('IsEditing:'+this.controllerIsEditing).id("IsEditing")
          }.margin({top:10}).width("100%")

          RichEditor({ controller: this.controller })
            .onEditingChange((isEditing: boolean) => {
              this.isEditing = isEditing
              this.controllerIsEditing = this.controller.isEditing()
              console.log("Juan Current Editing Status:" + isEditing)
              console.log("Juan this.controller.isEditable():" + this.controller.isEditing())
            })
            .height(100)
            .borderWidth(1)
            .borderColor(Color.Red)
            .width("100%")
            .id("RichEditor01")

          Button('stopEditing').onClick(() => {
            this.controller.stopEditing()
          }).padding(5).id("StopEditing")
        }
      }
    }.width('100%')
  }
}