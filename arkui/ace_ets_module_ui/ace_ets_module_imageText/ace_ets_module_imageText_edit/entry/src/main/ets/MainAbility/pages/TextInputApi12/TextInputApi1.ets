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
struct TextInputApi1 {
  @State text1:string = ''
  @State text2:string = ''

  build() {
    Column() {
      TextInput({ text: "TextInput支持删除回调文本" })
        .height(60)
        .onWillDelete(() => {
          this.text1 = 'before delete'
          return true;
        })
        .onDidDelete(() => {
          this.text2 = 'after delete'
        })
        .id('TextInputApi1_TextInput')

      Text(this.text1).height(30).id('TextInputApi1_Text1')
      Text(this.text2).height(30).id('TextInputApi1_Text2')

    }.width('100%')
  }
}