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
struct RichEditor5 {
  controller: RichEditorController = new RichEditorController()
  @State onWillChange:string = ""
  @State onDidChange:string = ""
  build() {
    Column() {
      Text(this.onWillChange).id("RichEditor_onWillChange")
      Text(this.onDidChange).id("RichEditor_onDidChange")
      RichEditor({ controller: this.controller })
        .margin({ top:50 })
        .border({ width: 1 })
        .borderWidth(1)
        .borderColor(Color.Red)
        .backgroundColor(Color.Pink)
        .width("100%")
        .id("RichEditor_change")
        .onWillChange((value: RichEditorChangeValue)=>{
          this.onWillChange = "onWillChange"
          return true
        })
        .onDidChange((rangeBefore: TextRange, rangeAfter: TextRange)=>{
          this.onDidChange = "onDidChange"
        })
    }
  }
}