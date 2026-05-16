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
  Color,
  DatePicker
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
import hilog from "@ohos.hilog";
import common from '@ohos.app.ability.common';

@Observed
class scoClassA {
  @Track public value: string;

  constructor(value: string) {
    this.value = value;
  }
}

@Observed
class scoModel {
  @Track public value: string = '';
  @Track public name: scoClassA = new scoClassA('');
  constructor(value: string, name: scoClassA) {
    this.value = value;
    this.name = name;
  }
}

@Entry
@Component
struct StateClassObject {
  @State title: scoModel = new scoModel('Hello', new scoClassA('World'));

  build() {
    Row() {
      Column() {
        Text(`${ this.title.value}`).fontSize(9).height('5%')
          .id("text_Object")
        Button(`Click to change Object1`).height('5%')
          .id("state_Object1")
          .onClick((e: ClickEvent) => {
            // 动态修改Class类型赋值
            // @State变量的更新将触发上面的Text组件内容更新
            this.title = new scoModel('Hi', new scoClassA('ArkUI'));
          })
        Button(`Click to change Object2`).height('5%')
          .id("state_Object2")
          .onClick((e: ClickEvent) => {
            // 动态修改Class父组件属性值
            // @State变量的更新将触发上面的Text组件内容更新
            this.title.value = "Hello ArkUI"
        })

        Text(`${ this.title.name.value}`).fontSize(9).height('5%')
          .id("text_Class")
        Button(`Click to change Class`).height('5%')
          .id("state_Class")
          .onClick((e: ClickEvent) => {
            // 动态修改Class自组件属性值
            // @State变量的更新将触发该Text的内容更新
            this.title.name = new scoClassA('Harmony');
          })
      }
    }
  }
}