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

class Link0100Class {
  age: number = 0
}

@Component
struct ChildLink0100 {
  @Link value: Link0100Class

  build() {
    Text(this.value.age.toString()).id('tvLink0100Child')
  }
}

@Entry
@Component
struct Link0100 {
  @State value: Link0100Class = new Link0100Class()

  build() {
    Column() {
      Text(this.value.age.toString()).id('tvLink0100Parent')
      Button('ChangeValue')
        .id('btnLink0100Add')
        .onClick(() => {
          this.value.age += 1
        })
      ChildLink0100({ value: this.value })
    }
  }
}