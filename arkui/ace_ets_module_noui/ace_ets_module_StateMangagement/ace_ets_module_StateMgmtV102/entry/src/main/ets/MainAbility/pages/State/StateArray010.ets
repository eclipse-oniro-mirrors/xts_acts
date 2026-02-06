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

class SArrModel {
  public value: number;
  constructor(value: number) {
    this.value = value;
  }
}

class SArrClassA {
  public value: string;
  public data: SArrModel;
  constructor(value: string, num: SArrModel) {
    this.value = value;
    this.data = num;
  }
}

@Entry
@Component
struct StateArray {
  @State title: SArrModel[] = [new SArrModel(11), new SArrModel(1)]
  @State classA: SArrClassA = new SArrClassA('Hello', new SArrModel(6))

  build() {
    Column() {
      Button('Reset').key('StateArray_reset').height('5%')
        .onClick(() => {
          this.title = [new SArrModel(11), new SArrModel(1)]
          this.classA = new SArrClassA('Hello', new SArrModel(6))
        })
      Text('title：' + JSON.stringify(this.title)).fontSize(9)
        .height('5%')
        .key('text_Array')
      Button('Click to change value to the array').fontSize(9)
        .height('5%')
        .key('change_Array')
        .onClick(() => {
          // 改变某一个Array值
          this.title[0] = new SArrModel(8)
        })

      Button('Click to delete value to the array').fontSize(9)
        .height('5%')
        .key('delete_Array')
        .onClick(() => {
          this.title.pop()
        })

      Button('Click to add value to the array').fontSize(9)
        .height('5%')
        .key('add_Array')
        .onClick(() => {
          this.title.push(new SArrModel(12))
        })

      Text('ClassA：' + JSON.stringify(this.classA)).fontSize(9)
        .height('5%')
        .key('text_ClassA')
      Button('Click to change Parent Component Property Values').fontSize(9)
        .height('5%')
        .key('change_Parent')
        .onClick(() => {
          // 动态修改父组件属性值
          this.classA.value = 'World'
        })

      Button('Click to change self Component Property Values').fontSize(9)
        .height('5%')
        .key('change_Self')
        .onClick(() => {
          // 动态修改自组件属性值
          this.classA.data = new SArrModel(8)
        })
    }.width('100%')
  }
}