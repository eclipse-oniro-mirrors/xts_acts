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
struct textInputApi1 {
  @State value: string = ''
  @State text1: string = ''
  @State TextError: string = ''
  build() {
    Column() {
      TextInput({ placeholder: '请输入用户名', text: this.text1 })
        .id('textInputApi1')
        .showUnderline(true)
        .width(380)
        .showError(this.TextError)
        .enterKeyType(EnterKeyType.PREVIOUS)
        .onSubmit((enter: EnterKeyType) => {
          this.value = EnterKeyType[enter]
        })


      Text( this.value ).height('60%').width('100%') .key('textInputApi1_text')
    }
  }
}