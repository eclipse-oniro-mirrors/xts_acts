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

@Component
struct ChildProvideConsume0030 {
  @Consume numberValue: number

  build() {
    Column() {
      Text(this.numberValue.toString()).id('tvProvideConsume0030Child')
        .height('3%')
        .fontSize(9)

    }
  }
}

@Entry
@Component
struct ProvideConsume0030 {
  @Provide numberValue: number = 0

  build() {
    Column() {
      Text(this.numberValue.toString()).id('tvProvideConsume0030Parent')
        .height('3%')
        .fontSize(9)
      ChildProvideConsume0030()
      Button('+1')
        .width('10%')
        .height('3%')
        .fontSize(9)
        .id('btnProvideConsume0030Add')
        .onClick(() => {
          this.numberValue += 1
        })
    }
  }
}