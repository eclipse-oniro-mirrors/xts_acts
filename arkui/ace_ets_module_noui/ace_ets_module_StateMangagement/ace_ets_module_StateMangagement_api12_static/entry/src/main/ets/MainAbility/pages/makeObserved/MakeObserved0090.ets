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
  ListItem,
  Color,Scroller,Divider,Flex,ChildrenMainSize,ListScroller,
  FlexAlign,ComponentV2,HorizontalAlign
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,Local,Trace,Track,PropRef,Monitor,Computed,Param,Require,IMonitor,
  StorageLink,LocalStorage,UIUtils,Observed,ObservedV2
} from '@ohos.arkui.stateManagement'

@ObservedV2
class ClassMakeObserved0090 {
  @Track
  private _name: string

  public set name(value: string) {
    this._name = value
  }

  public get name(): string {
    return this._name
  }

  constructor(name: string) {
    this._name = name
  }

}

@Entry
@ComponentV2
struct MakeObserved0090 {
  private dataClass: ClassMakeObserved0090 = UIUtils.makeObserved(new ClassMakeObserved0090('Tom'))

  build() {
    Column() {
      Text(this.dataClass.name)
        .id('tvMakeObserved0090')
        .fontSize(9)
      Button('Click Me')
        .id('btnMakeObserved0090')
        .onClick(():void=>{
          this.dataClass.name = 'Jerry'
        })
    }
  }
}