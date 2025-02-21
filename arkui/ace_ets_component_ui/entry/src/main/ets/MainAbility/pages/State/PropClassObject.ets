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
class ClassA2 {
  public value: string;

  constructor(value: string) {
    this.value = value;
  }
}


@Component
struct ChildPropObjectS {
  @Prop subClass: ClassA2 = new ClassA2('Hello');

  build() {
    Column() {
      Text('@Prop 单向的 内部修改不会改变父组件').fontSize(18)
      Text('子组件Prop:' + this.subClass.value).fontSize(18)
        .key("sub_prop_AA")
      Button('子组件Prop:').fontSize(18)
        .key("sub_prop_A")
        .onClick(() => {
          this.subClass.value = "World"
        })
    }.width('100%')
    .margin({ top: 50 })
  }
}

@Entry
@Component
struct PropObject {
  @State title: ClassA2 = new ClassA2('Hello');

  build() {
    Row() {
      Column({ space: 20 }) {
        Text('@Prop 支持多数据类型Object、Class').fontSize(18).margin(5)
        Text('Click to change Class or Object: ' + this.title.value).margin(5)
          .id("prop_Object_AA")
        Button('Click to change Class or Object: ' ).margin(5)
          .id("prop_Object_A")
          .onClick(() => {
            // 动态修改Class类型赋值
            this.title = new ClassA2('Hi');
          })
        ChildPropObjectS({subClass: this.title})
      }
    }
  }
}