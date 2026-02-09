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

@Observed class ClassAN {
  public numA: number
  public classB: ClassBN

  constructor(cValue: ClassBN, aValue: number = 0) {
    this.classB = cValue;
    this.numA = aValue;
  }
}

@Observed
class ClassBN {
  public numB: number

  constructor(aValue: number = 0) {
    this.numB = aValue;
  }
}
// 第一层变量的状态变化可以用@State监听，二层及以下变量的状态变化则需要使用@Observed/@ObjectLink监听
//对数值进行赋值操作，会打断@ObjectLink数据同步
@Entry
@Component
struct ObjectLinkFar2 {
  @State classA: ClassAN = new ClassAN(new ClassBN(5));
  @State count: number = 5

  build() {
    Column() {
      Button("Reset").id("ObjectLinkFar2_reset")
        .height('5%')
        .onClick(() => {
          this.classA = new ClassAN(new ClassBN(5))
          this.count = 5
        })
      // 注意：@State无法监听到类嵌套类的属性，@ObjectLink可以监听到类嵌套@Observed修饰的类的属性
      Text('父组件').fontSize(9).height('5%')
      Text(`ClassBN + 1: ${this.classA.classB.numB}`).key("farClassBN")
        .height('5%')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          this.classA.classB.numB += 1
        })
      Text(`ClassBN 赋值3: ${this.classA.classB.numB}`).key("farClassBN3")
        .height('5%')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          this.classA.classB.numB = 3
        })

      Text('子组件').fontSize(9).height('5%')

      ObjectLinkSon2({ classB: this.classA.classB })
    }
    .width('100%')
    .height('100%')
  }
}

@Component
struct ObjectLinkSon2 {
  @ObjectLink  classB: ClassBN

  build() {
    Column() {
      Text(`ClassBN的numB值: ${this.classB.numB}`).key("sonClassBN")
        .height('5%')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          this.classB.numB += 1
        })

    }.width('100%')
    .height('100%')
  }
}