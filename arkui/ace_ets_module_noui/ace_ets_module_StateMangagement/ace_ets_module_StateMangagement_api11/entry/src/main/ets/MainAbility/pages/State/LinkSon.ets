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
struct ParentLink {
  @State str: string = "before"
  @State num: number = 0

  build() {
    Column({ space: 2 }) {
      Button("Reset").id("ParentLink_reset")
        .onClick(() => {
          this.str = "before"
          this.num = 0
        })
      Text('父组件').fontSize(24).margin({ top: 5 })
      Text('Parent str: ' + this.str).key("str_parText")
      Button(`change parStr`)
        .key("str_parLink")
        .onClick(() => {
          this.str = 'Link Parent';
        })
      Text('Parent num: ' + this.num).key("num_parText")
      Button(`change parNum1`)
        .key("num_parLink")
        .onClick(() => {
          this.num += 3;
        })

      SonLink1({str1: $str, num1: $num})


    }.width('100%')
  }
}

@Component
struct SonLink1 {
  @Link str1: string
  @Link num1: number

  build() {
    Column({ space: 2 }) {
      Text('子组件Son1').fontSize(24).margin({ top: 5 })
      Text('@Link str1: ' + this.str1).key("str1_tSon1")
      Button(`change sonStr1`)
        .key("str_son1")
        .onClick(() => {
          this.str1 = 'Link Son1';
        })
      Text('@Link num1: ' + this.num1).key("num1_tSon1")
      Button(`change sonNum1`)
        .key("num_son1")
        .onClick(() => {
          this.num1 += 2;
        })

      SonLink2({str2: $str1, num2: $num1})

    }.margin({ top: 5 })
  }
}

@Component
struct SonLink2 {
  @Link str2: string
  @Link num2: number

  build() {
    Column({ space: 2 }) {
      Text('子组件Son2').fontSize(24).margin({ top: 5 })

      Text('@Link str2: ' + this.str2).key("str2_tSon2")
      Button(`change sonStr2`)
        .key("str_son2")
        .onClick(() => {
          this.str2 = 'Link Son2';
        })
      Text('@Link num2: ' + this.num2).key("num2_tSon2")
      Button(`change sonNum2`)
        .key("num_son2")
        .onClick(() => {
          this.num2 += 1;
        })

    }.margin({ top: 5 })
  }
}