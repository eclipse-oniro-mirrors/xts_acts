/**
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
struct TextDeleteDirectionTest {
  @State text:string = '这是测试删除回调文本'
  controller: TextAreaController = new TextAreaController()
  build() {
    Row() {
      Column() {
        Row(){
          Button('set caretPosition 0').onClick(()=>{
            this.controller.caretPosition(0)
          })
            .id('caretPosition0')
          Button('set caretPosition 6').onClick(()=>{
            this.controller.caretPosition(6)
          })
            .id('caretPosition6')
        }
        TextArea({ text:this.text,controller:this.controller })
          .id('TextAreaDeleteDirection')
          .width(300)
          .height('30%')
          .onDidDelete((deleteInfo:DeleteValue) => {
            console.log('deleteValue'+deleteInfo.deleteValue)
            console.log('deleteOffset'+deleteInfo.deleteOffset)
            console.log('direction'+deleteInfo.direction)
            AppStorage.setOrCreate('deleteValue',deleteInfo.deleteValue)
            AppStorage.setOrCreate('deleteOffset',deleteInfo.deleteOffset)
            AppStorage.setOrCreate('direction',deleteInfo.direction)
          })
      }.width('100%')
    }
    .height('100%')
  }
}