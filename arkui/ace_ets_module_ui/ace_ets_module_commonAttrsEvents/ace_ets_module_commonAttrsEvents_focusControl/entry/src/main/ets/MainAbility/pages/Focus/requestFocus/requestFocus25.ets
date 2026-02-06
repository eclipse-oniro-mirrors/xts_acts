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
struct requestFocus25 {
  @State currentIndex: number = 0
  @State text1:string = ''
  @State text2:string = 'TextInput'
  build() {
    Column() {
      Grid(){
        GridItem(){
          Column(){
            Text('' + this.text1).id('requestFocus25_text1')
            Button('Focus-textInput1').onClick(() => {
              try{
                this.getUIContext().getFocusController().requestFocus('requestFocus25_textInput1')
              }catch (error){
                this.text1 = '' + error.code
              }
            }).id('requestFocus25_btn1')
          }
        }
        GridItem(){
          TextInput({text:this.text2})
            .id('requestFocus25_textInput1')
            .onFocus(() => {
              this.text2 = 'TextInput_1'
            })
            .onBlur(() => {
              this.text2 = 'TextInput'
            })
        }
      }
    }.width('100%')
  }
}