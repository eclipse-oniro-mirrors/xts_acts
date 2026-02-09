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
  Track
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';

@Observed
class ClassA2 {
  @Track public value: string = '';

  constructor(value: string) {
    this.value = value;
  }
}

@Component
struct ChildPropObjectS {
  @PropRef subClass: ClassA2 = new ClassA2('Hello');

  build() {
    Column() {
      Text('@PropRef 单向的 内部修改不会改变父组件').fontSize(9).height('5%')
      Text('子组件Prop:' + this.subClass.value).fontSize(9).height('5%')
        .key("sub_prop_AA")
      Button('子组件Prop:').fontSize(9).height('5%')
        .key("sub_prop_A")
        .onClick((e: ClickEvent) => {
          this.subClass.value = "World"
        })
    }.width('100%')
  }
}

@Entry
@Component
struct PropObject {
  @State title: ClassA2 = new ClassA2('Hello');
  build() {
    Row() {
      Column() {
        Text('@PropRef 支持多数据类型Object、Class').fontSize(9).height('5%')
        Text('Click to change Class or Object: ' + this.title.value)
          .id("prop_Object_AA").height('5%')
        Button('Click to change Class or Object: ' )
          .height('5%')
          .id("prop_Object_A")
          .onClick((e: ClickEvent) => {
            // 动态修改Class类型赋值
            this.title = new ClassA2('Hi');
          })
        ChildPropObjectS({subClass: this.title})
      }
    }
  }
}