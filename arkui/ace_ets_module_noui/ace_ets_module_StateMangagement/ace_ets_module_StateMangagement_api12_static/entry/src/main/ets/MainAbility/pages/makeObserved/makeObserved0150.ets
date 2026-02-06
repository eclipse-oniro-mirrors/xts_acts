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
  Row,CommonAttribute,TextAttribute,
  List,AttributeModifier,ButtonAttribute,BorderStyle,
  ListItem,GridLayoutOptions,Grid,GridItem,BarState,TextAlign,
  Color,Scroller,Divider,Flex,ChildrenMainSize,ListScroller,
  FlexAlign,ComponentV2,HorizontalAlign
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,Local,Trace,Track,PropRef,Monitor,Computed,Param,Require,IMonitor,
  StorageLink,LocalStorage,UIUtils,Observed,ObservedV2
} from '@ohos.arkui.stateManagement'
import { CommonModifier, TextModifier } from '@ohos.arkui.modifier'

@ObservedV2
class Info {
  @Trace id: number = 0;
  @Trace age: number = 0;

  constructor(id: number) {
    this.id = id;
  }
}

class A {
}
@ObservedV2
class Info2 {
  @Trace
  id: number = 0;
  @Trace
  age: number = 0;
  @Trace
  a: A | null = new A()

  constructor(id: number) {
    this.id = id;
    this.a = null;
  }
}

@Entry
@ComponentV2
struct makeObserved0150Page {
  info: Info = new Info(1);
  info2: Info2 = UIUtils.makeObserved(new Info2(1));
  test: A|undefined = UIUtils.makeObserved(new Info2(10).a ?? undefined);

  build() {
    Column() {
      Text(`Trace: ${this.info.id}`).fontSize(9).onClick(():void => {
        this.info.id++;
      }).id('makeObserved150Text1')
      Text(`makeObserved: ${this.info2.id}`).fontSize(9).onClick(():void => {
        this.info2.id++;
      }).id('makeObserved150Text2')
    }
  }
}