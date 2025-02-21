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
struct PropBoolean {
  @State BooleanA: boolean = true

  build() {
    Column({space:5}) {
      Text('@Prop 支持数据类型：Boolean').fontSize(18)
      Text('父组件State:' +this.BooleanA).margin(10).width("100%").key('Boolean_Prop')
      Button('父组件State:').margin(10).width("100%")
        .key("PropBoolean")
        .onClick(() => {
          this.BooleanA = false
        })
      Text('父组件: ' + this.BooleanA).fontSize(30)
      ChildPropBoolean({ BooleanB: this.BooleanA })
    }.width('100%')
    .margin({ top: 50 })
  }
}

@Component
struct ChildPropBoolean {
  @Prop BooleanB: boolean = false;

  build() {
    Column({space:5}) {
      Text('@Prop 单向的 内部修改不会改变父组件').fontSize(18)

      Button('子组件Prop: '+this.BooleanB).margin(10).width("100%")
        .key("ChildPropBoolean")
        .onClick(() => {
          this.BooleanB = true
        })
      Text('子组件: ' + this.BooleanB).fontSize(30)

    }.width('100%')
    .margin({ top: 50 })
  }
}
