/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
@Entry
@Component
struct SearchMaxLength2 {
  @State submitValue: string = ''
  @State text: string = ''
  @State maxLength: number = 6
  build() {
    Column() {
      Search({ value: this.text, placeholder: 'Type to search...' })
        .searchButton('SEARCH')
        .width('90%')
        .height(40)
        .margin(20)
        .maxLength(this.maxLength)
        .key('SearchMaxLength2')
        .onChange((value: string) => {
          this.text = value
        })
      Row(){
        Button('maxLength:9').key('SearchMaxLength9')
          .onClick(() => {
            this.maxLength = 9
          })
        Button('maxLength:5').key('SearchMaxLength5')
          .onClick(() => {
            this.maxLength = 6
            this.maxLength -= 1
          })
      }
      Row(){
        Button('123456789').key('setText')
          .onClick(() => {
            this.text = '123456789'
          })
      }.margin(20)
    }.width('100%')
  }
}