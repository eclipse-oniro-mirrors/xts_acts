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

enum KFC{A11=1,B11=2,C11=3}

@Entry
@Component
struct PropEnum {
  @State enumA: KFC = KFC.A11

  build() {
    Column() {
      Button("Reset").id("PropEnum_reset")
        .height('5%')
        .onClick(() => {
          this.enumA = KFC.A11
        })
      Text('@Prop 支持数据类型：enum').fontSize(9).height('5%')
      Text('Father State: ' + this.enumA).width("100%")
        .height('5%')
        .key("PropEnum").backgroundColor(this.enumA)
        .onClick(() => {
          this.enumA = KFC.B11
        })
      Text('父组件: ' + this.enumA).fontSize(9).height('5%')
      ChildPropEnum({ enumB: this.enumA })
    }.width('100%')
    
  }
}

@Component
struct ChildPropEnum {
  @Prop enumB: KFC = KFC.A11;

  build() {
    Column() {
      Text('@Prop 单向的 内部修改不会改变父组件').fontSize(9).height('5%')

      Text('Child Prop: ' + this.enumB).width("100%").height('5%')
        .key("ChildPropEnum").backgroundColor(this.enumB)
        .onClick(() => {
          this.enumB = KFC.C11
        })
    }.width('100%')
    
  }
}
