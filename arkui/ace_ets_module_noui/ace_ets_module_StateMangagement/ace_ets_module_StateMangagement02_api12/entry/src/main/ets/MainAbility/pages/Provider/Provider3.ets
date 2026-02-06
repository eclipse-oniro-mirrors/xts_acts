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
@ComponentV2
struct Provider3 {
  @Provider() val: number = 10

  build() {
    Column() {
      AComp()
    }

  }
}

@ComponentV2
struct AComp {
  @Consumer() val: number = 0

  build() {
    Column() {
      Text(`${this.val}`)
        .height('3%')
        .fontSize(9)
        .onClick(() => {
        this.val++
      }).id('text1')
      A1Comp({ val: this.val })
    }.border({ width: 2, color: Color.Green })
  }
}

@ComponentV2
struct A1Comp {
  @Param val: number = 0

  build() {
    Column() {
      Text(`${this.val}`)
        .height('3%')
        .fontSize(9)
        .id('text2')
    }.border({ width: 2, color: Color.Pink })
  }
}