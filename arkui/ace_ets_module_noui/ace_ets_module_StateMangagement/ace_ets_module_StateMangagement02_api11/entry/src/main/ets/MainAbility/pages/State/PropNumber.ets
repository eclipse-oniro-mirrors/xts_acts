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
struct PropNumber {
  @State numA: number = 10

  build() {
    Column() {
      Text('@Prop 支持数据类型：number').fontSize(9).height('5%')
      Text('Father State:'+ this.numA).width("100%").height('5%')
        .key("PropNumber_A")
        .onClick(() => {
          this.numA += 1
        })
      Text('父组件: ' + this.numA).fontSize(9).height('5%')
      ChildPropNumber({ numB: this.numA })
    }.width('100%')
    
  }
}

@Component
struct ChildPropNumber {
  @Prop numB: number = 0;

  build() {
    Column() {
      Text('@Prop 单向的 内部修改不会改变父组件').fontSize(9).height('5%')
      Text('Child Prop:' + this.numB).width("100%").height('5%')
        .key("ChildPropNumber_A")
        .onClick(() => {
          this.numB += 1
        })
      Text('子组件: ' + this.numB).fontSize(9).height('5%')

    }.width('100%')
    
  }
}
