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

class ModelArr {
  public value: number;
  constructor(value: number) {
    this.value = value;
  }
}

class ClassA1 {
  public value: string;
  public data: ModelArr;
  constructor(value: string, num: ModelArr) {
    this.value = value;
    this.data = num;
  }
}

@Entry
@Component
struct propArray {
  @State title: ModelArr[] = [new ModelArr(1), new ModelArr(2), new ModelArr(3)]
  @State ClassA1: ClassA1 = new ClassA1('Hello', new ModelArr(6))


  build() {
    Column() {
      Text('title：' + JSON.stringify(this.title)).fontSize(9)
      .key('initial_Array').height('5%')
      Button('父组件Prop: change array').fontSize(9)
        .height('5%')
        .key('parent_Array')
        .onClick(() => {
          // 改变某一个Array值
          this.title[0] = new ModelArr(8)
        })

      ChildArrProp({ subTitle: this.title })

    }.width('100%')
  }
}

@Component
struct ChildArrProp {
  @Prop subTitle: ModelArr[] =[ new ModelArr(1)]

  build() {
    Column() {
      Text('@Prop 单向的 内部修改不会改变父组件').fontSize(9).height('5%')

      Button('子组件Prop:' + JSON.stringify(this.subTitle)).fontSize(9)
        .height('5%')
        .key('sub_prop')
        .onClick(() => {
        this.subTitle[0] = new ModelArr(7)
      })
    }.width('100%')
  }
}
