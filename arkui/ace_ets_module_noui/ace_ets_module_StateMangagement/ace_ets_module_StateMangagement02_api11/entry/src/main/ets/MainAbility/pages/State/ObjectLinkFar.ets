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

@Observed class ClassAAA {
  public numA: number
  public classB: ClassBBB

  constructor(cValue: ClassBBB, aValue: number = 0) {
    this.classB = cValue;
    this.numA = aValue;
  }
}

@Observed
class ClassBBB {
  public numB: number

  constructor(aValue: number = 0) {
    this.numB = aValue;
  }
}
// 第一层变量的状态变化可以用@State监听，二层及以下变量的状态变化则需要使用@Observed/@ObjectLink监听
//@State无法监听到类嵌套类的属性，@ObjectLink可以监听到类嵌套@Observed修饰的类的属性
//修改值，只会导致 @ObjectLink 装饰的变量所在的组件被刷新，当前组件不会刷新
@Entry
@Component
struct ObjectLinkFarClassAAA {
  @State classA: ClassAAA = new ClassAAA(new ClassBBB(5));

  build() {
    Column() {
      Button("Reset").id("ObjectLinkFarClassAAA_reset")
        .height('5%')
        .onClick(() => {
          this.classA = new ClassAAA(new ClassBBB(5))
        })
      Text('父组件').fontSize(9).height('5%')
      Text('父组件会刷新').fontSize(9).fontColor('#FF0000').height('5%')
      Text(`ClassAAA的numA值: ${this.classA.numA}`).key("farClassAAA")
        .height('5%')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          this.classA.numA += 1
        })

      Text('父组件不会刷新').fontSize(9).fontColor('#FF0000').height('5%')
      Text(`ClassAAA的classBBB: ${this.classA.classB.numB}`).key("farClassBBB")
        .height('5%')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          this.classA.classB.numB += 1
        })

      Text('子组件').fontSize(9).height('5%')

      ObjectLinkSonClassBBB({ classB: this.classA.classB })
    }
    .width('100%')
    .height('100%')
  }
}

@Component
struct ObjectLinkSonClassBBB {
  @ObjectLink  classB: ClassBBB

  build() {
    Column() {

      Text(`ClassBBB的numB值: ${this.classB.numB}`).key("sonClassBBB")
        .height('5%')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          // 修改值，只会导致 @ObjectLink 装饰的变量所在的组件被刷新
          this.classB.numB += 1
        })

    }.width('100%')
    .height('100%')
  }
}