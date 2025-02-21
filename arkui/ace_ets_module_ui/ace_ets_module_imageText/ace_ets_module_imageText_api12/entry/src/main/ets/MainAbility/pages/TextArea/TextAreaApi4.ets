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
struct TextAreaApi4 {
  @State text1:string = ''
  build() {
    Column(){
      TextArea({text: 'Overline, Red, DOTTED\nsecond line'})
        .border({ width: 1 }).padding(5).margin(5)
        .decoration({type: TextDecorationType.Overline, color: Color.Red, style: TextDecorationStyle.DOUBLE})
        .id('TextAreaApi4_textArea')
      Button('getInspectorByKey').onClick(() => {
        this.text1 = '' + String(JSON.parse(getInspectorByKey('TextAreaApi4_textArea')).$attrs.decoration)
      }).id('TextAreaApi4_btn1')
      Text(this.text1).id('TextAreaApi4_text1')


    }
    .width('90%')
    .margin(10)
  }
}