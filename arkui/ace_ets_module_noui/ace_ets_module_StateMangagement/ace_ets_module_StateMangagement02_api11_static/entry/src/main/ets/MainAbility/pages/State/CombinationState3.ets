'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  ForEach,
  Text
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  Provide,
  PropRef,
  ObjectLink,
  Observed
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
class SubClass4 {
  public value: number;

  constructor(value: number) {
    this.value = value;
  }
}

@Observed
class ClassA3 {
  public value: number;
  public sum: SubClass4 = new SubClass4(1) ;
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
      Text(`子组件ChildPropState1: ${this.counterVal.value}`).fontSize(9)
        .key("ChildPropState1").height('3%')
      Text(`子组件ChildPropState2: ${this.counterVal.sum.value}`).fontSize(9)
        .key("ChildPropState2").height('3%')
    }.width('100%')
  }
}


@Component
struct ChildProvide {
  @Provide counterVal: ClassA3 = new ClassA3(3, new SubClass4(8));

  build() {
    Column() {
      Text(`子组件ChildProvide1: ${this.counterVal.value}`).fontSize(9)
        .key("ChildProvide1").height('3%')
      Text(`子组件ChildProvide2: ${this.counterVal.sum.value}`).fontSize(9)
        .key("ChildProvide2").height('3%')
    }.width('100%')
  }
}


@Component
struct ChildLink3 {
  @Link counterVal: ClassA3 = new ClassA3(3, new SubClass4(8)) ;

  build() {
    Column() {
      Text(`子组件ChildLink1: ${this.counterVal.value}`).fontSize(9)
        .key("ChildLink1").height('5%')
      Text(`子组件ChildLink2: ${this.counterVal.sum.value}`).fontSize(9)
        .key("ChildLink2").height('5%')
    }.width('100%')
  }
}


@Component
struct ChildProp {
  @PropRef counterVal: ClassA3 = new ClassA3(3, new SubClass4(8));

  build() {
    Column() {
      Text(`子组件ChildProp1: ${this.counterVal.value}`).fontSize(9)
        .key("ChildProp1").height('5%')
      Text(`子组件ChildProp2: ${this.counterVal.sum.value}`).fontSize(9)
        .key("ChildProp2").height('5%')
    }.width('100%')
  }
}

@Component
struct PropObjectLink3 {
  @ObjectLink class_A: ClassA3 = new ClassA3(3, new SubClass4(8));

  build() {
    Column() {
      Text('@ObjectLink支持初始化@State修饰的数据').height('3%')
      Text("@State能接收来自@ObjectLink的一层属性值").height('3%')
      Text("@State不能接收来自@ObjectLink的二层属性值").height('3%')
      ChildPropState33({counterVal: this.class_A})

      Text('@ObjectLink支持初始化@Provide修饰的数据').height('3%')
      Text("@Provide能接收来自@ObjectLink的一层属性值").height('3%')
      Text("@Provide不能接收来自@ObjectLink的二层属性值").height('3%')
      ChildProvide({counterVal: this.class_A})
    }
  }
}

@Component
struct ObjectLinkLink {
  @ObjectLink class_A: ClassA3 = new ClassA3(3, new SubClass4(8));

  build() {
    Column() {
      Text("@Link能接收来自@ObjectLink的一层属性值").height('3%')
      Text("@Link能接收来自@ObjectLink的二层属性值").height('3%')
      ChildLink3({counterVal: this.class_A})
    }
  }
}

@Component
struct PropObjectLinkProp {
  @ObjectLink class_A: ClassA3 = new ClassA3(3, new SubClass4(8));

  build() {
    Column() {
      Text("@Prop能接收来自@ObjectLink的一层属性值").height('3%')
      Text("@Prop能接收来自@ObjectLink的二层属性值").height('3%')
      ChildProp({counterVal: this.class_A})
    }
  }
}

@Entry
@Component
struct CombinationState4 {
  @State class_A: ClassA3 = new ClassA3(1, new SubClass4(5))
  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('CombinationState3', router);
    } catch (error) {
      console.log('error ' + error);
    }
  }
  build() {
    Column() {
      Button('Click to change ClassA').width("100%")
        .key("change_ClassA")
        .height('3%')
        .onClick((e: ClickEvent) => {
          this.class_A = new ClassA3(2, new SubClass4(6))
        })

      PropObjectLink3({class_A: this.class_A})

      Text('@ObjectLink支持初始化@Link修饰的数据').height('3%')
      ObjectLinkLink({class_A: this.class_A})

      Text('@ObjectLink支持初始化@Prop修饰的数据').height('3%')
      PropObjectLinkProp({class_A: this.class_A})
    }
  }
}