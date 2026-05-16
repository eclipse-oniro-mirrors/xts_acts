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
  StorageLink
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
@Entry
@Component
struct StateSet0010 {
  @State set: Set<string> = new Set<string>(['World'])
  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('StateSet0010', router);
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }
  build() {
    Column() {
      Text('Hello'+String(Array.from(this.set.values()))).id('tvStateSet0010Title')
      Button('Add')
        .id('btnStateSet0010Set')
        .onClick((e: ClickEvent)=>{
          this.set.add('ARKUI')
        })
      Button('Delete')
        .id('btnStateSet0010Delete')
        .onClick((e: ClickEvent)=>{
          this.set.delete('ARKUI')
        })
      Button('Clear')
        .id('btnStateSet0010Clear')
        .onClick((e: ClickEvent)=>{
          this.set.clear()
        })
    }
  }
}