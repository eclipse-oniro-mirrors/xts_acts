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
struct RichEditor11 {
  controller: RichEditorController = new RichEditorController();
  @State len:number = 0
  build() {
    Column() {
      Text(''+this.len).id('RichEditor11_Text')
      RichEditor({controller:this.controller})
        .onReady(()=>{
          this.controller.addTextSpan('测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试')
        })
        .height(35)
        .id('RichEditor11_double')
      Button('getSelection')
        .onClick(()=>{
          let richEditorSelection = this.controller.getSelection()
          this.len = richEditorSelection.selection[1] - richEditorSelection.selection[0]
        }).margin({
          top:50
        })
    }
    .width('100%')
    .height('100%')
  }
}