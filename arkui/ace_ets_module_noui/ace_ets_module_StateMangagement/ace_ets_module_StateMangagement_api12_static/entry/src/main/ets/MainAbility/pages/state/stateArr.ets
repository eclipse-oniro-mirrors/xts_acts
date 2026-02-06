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
  List,
  ListItem
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  StorageLink,
  UIUtils
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
class Param1 {
  param: int
}
@Entry
@Component
struct StateArr0010 {
  @State arr: (int | boolean | Param1)[] = [] as (int | boolean | Param1)[]

  aboutToAppear(): void {
    this.arr.push(0, false)
  }

  build() {
    Column() {
      //Hello
      Text('Hello' + JSON.stringify(Array.from(this.arr))).id('tvStateArr0010Title')
      Button('push')
        .id('btnStateArr0010Set')
        .onClick((e: ClickEvent) => {
          this.arr.push({ 'param': 47 } as Param1)
        })
      Button('Delete')
        .id('btnStateArr0010Delete')
        .onClick((e: ClickEvent) => {
          this.arr.pop()
        })
      Button('Clear')
        .id('btnStateArr0010Clear')
        .onClick((e: ClickEvent) => {
          this.arr = []
        })
    }
  }
}