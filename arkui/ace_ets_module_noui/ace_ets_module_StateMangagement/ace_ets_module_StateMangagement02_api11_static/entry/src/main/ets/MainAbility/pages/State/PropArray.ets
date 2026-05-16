'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Builder,
  NavPathStack,
  FontWeight,
  Navigation,
  NavDestination,
  NavigationMode,
  ButtonType,
  Color
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  Provide,
  PropRef,
  ObjectLink,
  Observed,
  Consume,
  StoragePropRef,
  StorageLink,
  LocalStorage,
  LocalStoragePropRef,
  LocalStorageLink,
  Observed,
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
class ModelArr {
  public value: number = 1;
  constructor(value: number) {
    this.value = value;
  }
}

class ClassA1 {
  public value: string = '';
  public data: ModelArr = new ModelArr(1);
  constructor(value: string, num: ModelArr) {
    this.value = value;
    this.data = num;
  }
}

@Entry
@Component
struct propArray {
  @State title: ModelArr[] = [new ModelArr(1), new ModelArr(2), new ModelArr(3)]
  @State ClassA1: ClassA1 = new ClassA1("Hello", new ModelArr(6))
  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('PropArray', router);
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }

  build() {
    Column() {
      Text('title：' + JSON.stringify(this.title)).fontSize(9)
      .key("initial_Array").height('5%')
      Button('父组件Prop: change array').fontSize(9)
        .height('5%')
        .key("parent_Array")
        .onClick((e: ClickEvent) => {
          // 改变某一个Array值
          this.title[0] = new ModelArr(8)
        })

      ChildArrProp({ subTitle: this.title })

    }.width('100%')
  }
}

@Component
struct ChildArrProp {
  @PropRef subTitle: ModelArr[] =[ new ModelArr(1)]

  build() {
    Column() {
      Text('@PropRef 单向的 内部修改不会改变父组件').fontSize(9).height('5%')

      Button('子组件Prop:' + JSON.stringify(this.subTitle)).fontSize(9)
        .height('5%')
        .key("sub_prop")
        .onClick((e: ClickEvent) => {
        this.subTitle[0] = new ModelArr(7)
      })
    }.width('100%')
  }
}
