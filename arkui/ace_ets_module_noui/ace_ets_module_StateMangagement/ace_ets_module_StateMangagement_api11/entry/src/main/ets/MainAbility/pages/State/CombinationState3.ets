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
class SubClass4 {
  public value: number;

  constructor(value: number) {
    this.value = value;
  }
}

@Observed
class ClassA3 {
  public value: number;
  public sum: SubClass4;
  constructor(value: number, sum: SubClass4) {
    this.value = value;
    this.sum = sum;
  }
}


@Component
struct ChildPropState33 {
  @State counterVal: ClassA3 = new ClassA3(3, new SubClass4(8));

  build() {
    Column() {
      Text(`子组件ChildPropState1: ${this.counterVal.value}`).fontSize(18).margin(2)
        .key("ChildPropState1").height(30)
      Text(`子组件ChildPropState2: ${this.counterVal.sum.value}`).fontSize(18).margin(2)
        .key("ChildPropState2").height(30)
    }.width('100%')
  }
}


@Component
struct ChildProvide {
  @Provide counterVal: ClassA3 = new ClassA3(3, new SubClass4(8));

  build() {
    Column() {
      Text(`子组件ChildProvide1: ${this.counterVal.value}`).fontSize(18).margin(2)
        .key("ChildProvide1").height(20)
      Text(`子组件ChildProvide2: ${this.counterVal.sum.value}`).fontSize(18).margin(2)
        .key("ChildProvide2").height(20)
    }.width('100%')
  }
}


@Component
struct ChildLink3 {
  @Link counterVal: ClassA3;

  build() {
    Column() {
      Text(`子组件ChildLink1: ${this.counterVal.value}`).fontSize(18).margin(5)
        .key("ChildLink1").height(20)
      Text(`子组件ChildLink2: ${this.counterVal.sum.value}`).fontSize(18).margin(5)
        .key("ChildLink2").height(20)
    }.width('100%')
  }
}


@Component
struct ChildProp {
  @Prop counterVal: ClassA3 = new ClassA3(3, new SubClass4(8));

  build() {
    Column() {
      Text(`子组件ChildProp1: ${this.counterVal.value}`).fontSize(18).margin(5)
        .key("ChildProp1").height(20)
      Text(`子组件ChildProp2: ${this.counterVal.sum.value}`).fontSize(18).margin(5)
        .key("ChildProp2").height(20)
    }.width('100%')
  }
}

@Component
struct PropObjectLink3 {
  @ObjectLink class_A: ClassA3;

  build() {
    Column() {
      Text('@ObjectLink支持初始化@State修饰的数据')
      Text("@State能接收来自@ObjectLink的一层属性值")
      Text("@State不能接收来自@ObjectLink的二层属性值")
      ChildPropState33({counterVal: this.class_A})

      Text('@ObjectLink支持初始化@Provide修饰的数据')
      Text("@Provide能接收来自@ObjectLink的一层属性值")
      Text("@Provide不能接收来自@ObjectLink的二层属性值")
      ChildProvide({counterVal: this.class_A})
    }
  }
}

@Component
struct ObjectLinkLink {
  @ObjectLink class_A: ClassA3;

  build() {
    Column() {
      Text("@Link能接收来自@ObjectLink的一层属性值")
      Text("@Link能接收来自@ObjectLink的二层属性值")
      ChildLink3({counterVal: this.class_A})
    }
  }
}

@Component
struct PropObjectLinkProp {
  @ObjectLink class_A: ClassA3;

  build() {
    Column() {
      Text("@Prop能接收来自@ObjectLink的一层属性值")
      Text("@Prop能接收来自@ObjectLink的二层属性值")
      ChildProp({counterVal: this.class_A})
    }
  }
}

@Entry
@Component
struct CombinationState4 {
  @State class_A: ClassA3 = new ClassA3(1, new SubClass4(5))

  build() {
    Column({ space: 10 }) {
      Button('Click to change ClassA').width("100%").margin(5)
        .key("change_ClassA")
        .onClick(() => {
          this.class_A = new ClassA3(2, new SubClass4(6))
        })

      PropObjectLink3({class_A: this.class_A})

      Text('@ObjectLink支持初始化@Link修饰的数据')
      ObjectLinkLink({class_A: this.class_A})

      Text('@ObjectLink支持初始化@Prop修饰的数据')
      PropObjectLinkProp({class_A: this.class_A})
    }
  }
}