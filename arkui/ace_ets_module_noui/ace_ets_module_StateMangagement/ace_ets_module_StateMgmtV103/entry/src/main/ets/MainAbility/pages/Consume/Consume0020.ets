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
struct Consume0020 {
  @Consume num: number = 10

  build() {
    Column() {
      Text(`${this.num}`)
        .id('tvConsume0020')
        .height('5%')
      Button('ParentClick')
        .id('btnConsume0020')
        .height('5%')
        .onClick(() => {
          this.num += 1
        })
      ChildConsume0020({ num: this.num })
    }
  }
}

@Component
struct ChildConsume0020 {
  @Link num: number

  build() {
    Column() {
      Text(`${this.num}`)
        .id('tvChildConsume0020')
        .height('5%')
      Button('Click0')
        .id('btnChildConsume0020')
        .height('5%')
        .onClick(() => {
          this.num += 1
        })
    }
  }
}