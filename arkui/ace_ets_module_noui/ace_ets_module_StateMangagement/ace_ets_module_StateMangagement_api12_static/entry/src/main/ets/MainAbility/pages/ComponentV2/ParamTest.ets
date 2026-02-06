'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
  Text,
  Row,
  List,
  ListItem,BarState,
  Color,Scroll,VerticalAlign,HorizontalAlign,
  FlexAlign,ComponentV2,TabsController,Tabs
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,Local,Once,Require,
  StorageLink,ObservedV2,Trace,Param,Event
} from '@ohos.arkui.stateManagement'
@ObservedV2
class ClassA {
  @Trace count: number

  constructor(count: number) {
    this.count = count
  }
}

enum Constants {
  ZERO = 0,
  ONE = 1
}

@ComponentV2
struct ChildRequire {
  @Param @Require childRequireMsg: string

  build() {
    Row() {
      Text(this.childRequireMsg).id('tvChildRequireMsg')
    }
  }
}

@ComponentV2
struct ChildOnce {
  @Param @Once childOnceMsg: string = 'child'
  @Once @Param childOnceCount: number = 0
  @Param @Once childClassA: ClassA = new ClassA(0)

  build() {
    Row() {
      Text(this.childOnceMsg).id('tvChildOnceMsg')
      Text(this.childOnceCount.toString()).id('tvChildCount')
      Text(this.childClassA.count.toString()).id('tvChildClassACount')
    }
    .alignItems(VerticalAlign.Top)
    .justifyContent(FlexAlign.Start)
  }
}

@ComponentV2
struct ChildParam {
  @Param childConstants: Constants = Constants.ZERO
  @Param childMsg: string = ''
  @Param isChildState: boolean = true
  @Param noOut: string = 'noOut'

  build() {
    Column() {
      Row() {
        Text(this.childConstants.toString()).id('tvChildSingleCount')
        Text(this.childMsg).id('tvChildMsg')
        Text(this.isChildState.toString()).id('tvIsChildState')
        Text(this.noOut).id('tvChildNoOut')
      }
      Row() {
        Text(this.childMsg).id('tvNestChild')
        ChildRequire({childRequireMsg: this.childMsg})
      }
    }
  }
}


@Entry
@ComponentV2
export struct ParamTest {
  @Local message: string = 'message'
  @Local count: number = 1
  @Local classA: ClassA = new ClassA(0)
  constants: Constants = Constants.ONE
  isState: boolean = false

  build() {
    Scroll() {
      Column() {
        Column() {
          Button('ChangeOnce')
            .id('btnChangeOnce')
            .onClick(():void => {
              this.message = 'ARKUI'
              this.count = 10
            })
          ChildOnce({ childOnceMsg: this.message, childOnceCount: this.count })
        }
        Column() {
          Text(this.classA.count.toString())
            .id('tvClassACount')
            .onClick(():void => {
              this.classA.count = 10
            })
          ChildOnce({ childClassA: this.classA })
        }
        Column() {
          Text(this.message)
            .id('tvRequireMsg')
            .onClick(():void => {
              this.message = 'tvRequireMsg'
            })
          ChildRequire({ childRequireMsg: this.message })
        }
        Column() {
          Button('ChangeParam')
            .id('btnChangeParam')
            .onClick(():void => {
              this.message = 'tvParamMsg'
              this.constants = Constants.ZERO
              this.isState = true
            })
          ChildParam({childConstants: this.constants, childMsg: this.message, isChildState: this.isState})
        }
      }
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.Start)
    }
    .width('100%')
    .scrollBar(BarState.Off)
  }
}