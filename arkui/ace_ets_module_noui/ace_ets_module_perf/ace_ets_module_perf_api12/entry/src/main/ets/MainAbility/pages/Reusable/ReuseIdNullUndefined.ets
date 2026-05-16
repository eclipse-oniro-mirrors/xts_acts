/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

// xxx.ets
@Entry
@Component
struct ReuseIdNullUndefinedTest {
  @State switch: boolean = true;
  private type: string | null | undefined = 'type1';

  build() {
    Column() {
      Row() {
        Button('null')
          .onClick(() => {
            this.type = null
          })
          .width('30%')
          .id('ReuseIdNullUndefinedTest_null')
        Button('undefined')
          .onClick(() => {
            this.type = undefined
          })
          .width('30%')
          .id('ReuseIdNullUndefinedTest_undefined')
        Button('empty string')
          .onClick(() => {
            this.type = ''
          })
          .width('30%')
          .id('ReuseIdNullUndefinedTest_empty')
      }

      Button('Switch')
        .onClick(() => {
          this.switch = !this.switch
        })
        .id('ReuseIdNullUndefinedTest_switch')
      if (this.switch) {
        ReusableChildComponent({ type: this.type })
          .reuseId(this.type)
      }
    }
    .width('100%')
    .height('100%')
  }
}

@Reusable
@Component
struct ReusableChildComponent {
  @State type: string | null | undefined = ''

  aboutToAppear() {
    console.info(`aboutToAppear ${this.type}`)
  }

  aboutToReuse(params: ESObject) {
    console.info(`aboutToReuse ${this.type}`)
    AppStorage.setOrCreate('ReuseIdNullUndefinedTest_aboutToReuse', `aboutToReuse ${this.type}`)
    
    this.type = params.type;
  }

  aboutToRecycle() {
    console.info(`aboutToRecycle`)
  }

  build() {
    Row() {
      Text(this.type)
        .fontSize(20)
        .margin({ left: 10 })
    }.margin({ left: 10, right: 10 })
  }
}