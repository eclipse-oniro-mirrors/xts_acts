/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
@ObservedV2
class ClassA {
  @Trace age: number
  @Trace name: string

  constructor(age: number, name: string) {
    this.age = age
    this.name = name
  }
}

@ComponentV2
struct HelloComponent {
  @Local messageHello: string = 'messageHello'

  build() {
    Column() {
      Text(this.messageHello).id('tvHelloMsg').onClick(() => {
        this.messageHello = 'ARKUI'
      })
    }
  }
}

@ComponentV2
struct ChildComponent {
  @Param msg: string = 'Param'
  @Event changeMsg: () => void = () => {
  }
  @Event noFun: string = 'Event'

  build() {
    Column() {
      Text(this.msg)
        .id('tvChildMsg')
        .onClick(() => {
          this.changeMsg()
        })
      Text(this.noFun)
        .id('tvChildNoFun')
    }
  }
}

@Entry
@ComponentV2
struct ComponentV2Test {
  @Local message: string = 'message'
  @Local noFun: string = 'NoFun'
  @Local classA: ClassA = new ClassA(10, 'Tom')

  build() {
    Column() {
      Text(this.message).id('tvMsg').onClick(() => {
        this.message = 'ARKUI'
      })
      Text(this.classA.age.toString()).id('tvAge').onClick(() => {
        this.classA.age = 11
      })
      HelloComponent()

      Column() {
        Text(this.message).id('tvParentMsg')
        ChildComponent({ msg: this.message, changeMsg: ()=>{
          this.message = 'changeChildMsg'
        } })
      }

      Column() {
        Text(this.message).id('tvParentNoFun').onClick(()=>{
          this.message = 'tvParentNoFun'
        })
        ChildComponent({ noFun: this.noFun })
      }
    }
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
  }
}