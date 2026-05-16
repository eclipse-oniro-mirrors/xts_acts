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
struct RichEditorApi7 {
  @State rangeBefore: string = "";
  controller:RichEditorController = new RichEditorController()

  build() {
    Column() {
      Text(this.rangeBefore).width("100%")

      RichEditor({ controller: this.controller })
        .onReady(() => {
          this.controller.addTextSpan('testWord',{
            style:{
              fontColor:Color.Orange,
              fontSize:30
            }
          })
          this.controller.deleteSpans({
            start:0,
            end:1
          })
        })
        .height("20%")
        .width("100%")
        .borderWidth(1)
        .borderColor(Color.Black)
        .onWillChange((value:RichEditorChangeValue) => {
          this.rangeBefore =  value.rangeBefore.start + ',' + value.rangeBefore.end ;
          return true
        })
      Text(this.rangeBefore).id('RichEditorApi7_text1')
    }
  }
}