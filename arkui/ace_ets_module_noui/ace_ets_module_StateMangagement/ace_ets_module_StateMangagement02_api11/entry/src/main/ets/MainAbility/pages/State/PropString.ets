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
struct PropString {
  @State stringA: string = "Hello"

  build() {
    Column() {
      Text('@Prop 支持数据类型：string').fontSize(9).height('5%')
      Text('Father State: ' + this.stringA).width("100%").height('5%')
        .id("PropString_A")
        .onClick(() => {
          this.stringA = "Hi"
        })

      ChildPropString({ stringB: this.stringA })
    }.width('100%')
    
  }
}

@Component
struct ChildPropString {
  @Prop stringB: string = '';

  build() {
    Column() {
      Text('@Prop 单向的 内部修改不会改变父组件').fontSize(9).height('5%')
      Text('Child Prop: ' + this.stringB).width("100%").height('5%')
        .id("ChildPropString_A")
        .onClick(() => {
          this.stringB = "World"
        })
    }.width('100%')
    
  }
}
