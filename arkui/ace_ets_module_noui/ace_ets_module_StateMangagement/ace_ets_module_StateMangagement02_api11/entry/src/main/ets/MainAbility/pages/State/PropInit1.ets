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
class ClassA30 {
  public value: number;

  constructor(value: number) {
    this.value = value;
  }
}


@Component
struct ChildPropObject {
  @Prop subValue: number = 0

  build() {
    Column() {
      Text('@Prop 单向的 内部修改不会改变父组件').fontSize(9).height('5%')
      Text('子组件Prop:' + this.subValue).fontSize(9).height('5%')
        .key("sub_prop1_S")
        .onClick(() => {
          this.subValue = 888
        })
    }.width('100%')
    
  }
}

@Entry
@Component
struct PropInit1 {
  @State title: ClassA30 = new ClassA30(666);

  build() {
    Row() {
      Column() {
        Text('@Prop本地初始化不和父组件同步').fontSize(9).height('5%')
        Text('Change father: ' + this.title.value).height('5%')
          .id("prop_Object1_A")
          .onClick(() => {
            // 动态修改Class类型赋值
            this.title.value = 111;
          })

        ChildPropObject({subValue: this.title.value})
      }
    }
  }
}