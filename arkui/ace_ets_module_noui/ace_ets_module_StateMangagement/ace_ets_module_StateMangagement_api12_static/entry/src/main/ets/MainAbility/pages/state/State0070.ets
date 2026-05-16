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
  UIUtils,
  StorageLink
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
@Entry
@Component
struct State0070 {
  @State private strArr: string[] = ['red', 'green', 'yellow']

  build() {
    Column() {
      Text(`${this.strArr}`)
        .id('tvState0070')
      Text(this.strArr[1])
      Button('Add gray')
        .id('btnAddState0070')
        .onClick((e: ClickEvent)=>{
          console.log(`ww: ${this.strArr.length}`)
          this.strArr.push('gray')
        })
      Button('Update red to white')
        .id('btnUpdateState0070')
        .onClick((e: ClickEvent)=>{
          this.strArr[0] = 'white'
          console.log("===================================arr: " + `${Array.from(this.strArr)}`);
        })
      Button('Delete green')
        .id('btnDelState0070')
        .onClick((e: ClickEvent)=>{
          this.strArr.splice(1, 1)
        })
    }
  }
}