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

@Observed
class ClassConsume0030 {
  private _num: number

  public set num(value: number) {
    this._num = value
  }

  public get num(): number {
    return this._num
  }

  constructor(num: number) {
    this._num = num
  }
}

@Entry
@Component
struct Consume0030 {
  @Consume num: ClassConsume0030 = new ClassConsume0030(10)

  build() {
    Column() {
      Text(`${this.num.num}`)
        .id('tvConsume0030')
        .height('5%')
      Button('ParentClick')
        .id('btnConsume0030')
        .height('5%')
        .onClick(() => {
          this.num.num += 1
        })
      ChildConsume0030({ num: this.num })
    }
  }
}


@Component
struct ChildConsume0030 {
  @ObjectLink num: ClassConsume0030

  build() {
    Column() {
      Text(`${this.num.num}`)
        .id('tvChildConsume0030')
        .height('5%')
      Button('Click0')
        .id('btnChildConsume0030')
        .height('5%')
        .onClick(() => {
          this.num.num += 1
        })
    }
  }
}