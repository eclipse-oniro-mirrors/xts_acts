/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
struct StateNumber {
  @State title: string = 'hello';
  @State count: number = 0;
  @State flag: Boolean = true;
  @State color: Color = Color.Blue;
  @State text: string = 'true';

  build() {
    Column() {
      Text('@State 支持 string 类型').fontSize(9).height('5%')
      Button('string: ' + this.title).fontSize(9).height('5%')
        .key('state_string')
        .onClick(() => {
          this.title = 'world'
        })

      Text('@State 支持 number 类型').fontSize(9).height('5%')
      Button('number: ' + this.count).fontSize(9).height('5%')
        .key('state_number')
        .onClick(() => {
          this.count = 8
          console.info('num: ' + this.count.toString())
        })

      Text('@State 支持 Boolean 类型').fontSize(9).height('5%')
      Button('Boolean: ' + this.flag).fontSize(9).height('5%')
        .key('state_Boolean')
        .onClick(() => {
          this.flag = !this.flag
        })

      Text('@State 支持 enum 类型').fontSize(9).height('5%')
      Button('enum: ' + this.color).fontSize(9).height('5%')
        .key('state_enum')
        .onClick(() => {
          this.color = Color.Red
        })
    }.width('100%')
  }
}