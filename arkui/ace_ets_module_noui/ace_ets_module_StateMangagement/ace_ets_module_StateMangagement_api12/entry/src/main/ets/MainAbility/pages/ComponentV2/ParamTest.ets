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
@ObservedV2
class ClassA {
  @Trace count: number

  constructor(count: number) {
    this.count = count
  }
}

enum Constants {
  ZERO = 0,
  ONE = 1
}

@ComponentV2
struct ChildRequire {
  @Param @Require childRequireMsg: string

  build() {
    Row({ space: 3 }) {
      Text(this.childRequireMsg).id('tvChildRequireMsg')
    }
  }
}

@ComponentV2
struct ChildOnce {
  @Param @Once childOnceMsg: string = 'child'
  @Once @Param childOnceCount: number = 0
  @Param @Once childClassA: ClassA = new ClassA(0)

  build() {
    Row({ space: 3 }) {
      Text(this.childOnceMsg).id('tvChildOnceMsg')
      Text(this.childOnceCount.toString()).id('tvChildCount')
      Text(this.childClassA.count.toString()).id('tvChildClassACount')
    }
    .alignItems(VerticalAlign.Top)
    .justifyContent(FlexAlign.Start)
  }
}

@ComponentV2
struct ChildParam {
  @Param childConstants: Constants = Constants.ZERO
  @Param childMsg: string = ''
  @Param isChildState: boolean = true
  @Param noOut: string = 'noOut'

  build() {
    Column({ space: 3 }) {
      Row({ space: 3 }) {
        Text(this.childConstants.toString()).id('tvChildSingleCount')
        Text(this.childMsg).id('tvChildMsg')
        Text(this.isChildState.toString()).id('tvIsChildState')
        Text(this.noOut).id('tvChildNoOut')
      }
      Row({ space: 3 }) {
        Text(this.childMsg).id('tvNestChild')
        ChildRequire({childRequireMsg: this.childMsg})
      }
    }
  }
}


@Entry
@ComponentV2
export struct ParamTest {
  @Local message: string = 'message'
  @Local count: number = 1
  @Local classA: ClassA = new ClassA(0)
  constants: Constants = Constants.ONE
  isState: boolean = false

  build() {
    Scroll() {
      Column({ space: 5 }) {
        Column({ space: 3 }) {
          Button('ChangeOnce')
            .id('btnChangeOnce')
            .onClick(() => {
              this.message = 'ARKUI'
              this.count = 10
            })
          ChildOnce({ childOnceMsg: this.message, childOnceCount: this.count })
        }
        Column({ space: 3 }) {
          Text(this.classA.count.toString())
            .id('tvClassACount')
            .onClick(() => {
              this.classA.count = 10
            })
          ChildOnce({ childClassA: this.classA })
        }
        Column({ space: 3 }) {
          Text(this.message)
            .id('tvRequireMsg')
            .onClick(() => {
              this.message = 'tvRequireMsg'
            })
          ChildRequire({ childRequireMsg: this.message })
        }
        Column({ space: 3 }) {
          Button('ChangeParam')
            .id('btnChangeParam')
            .onClick(() => {
              this.message = 'tvParamMsg'
              this.constants = Constants.ZERO
              this.isState = true
            })
          ChildParam({childConstants: this.constants, childMsg: this.message, isChildState: this.isState})
        }
      }
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.Start)
    }
    .width('100%')
    .scrollBar(BarState.Off)
  }
}