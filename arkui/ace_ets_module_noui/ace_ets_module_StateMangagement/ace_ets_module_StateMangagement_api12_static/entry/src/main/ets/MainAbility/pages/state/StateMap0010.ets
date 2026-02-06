'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
struct StateMap0010 {
  @State map: Map<string, string> = new Map<string, string>()

  aboutToAppear(): void {
    this.map.set('map1', 'World')
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('StateMap0010', router);
    } catch (error) {
      console.log('error ' + error);
    }
  }

  build() {
    Column() {
      Text('Hello'+String(Array.from(this.map.values()))).id('tvStateMap0010Title')
      Button('Set')
        .id('btnStateMap0010Set')
        .onClick((e: ClickEvent)=>{
          this.map.set('map2', 'ARKUI')
        })
      Button('Delete')
        .id('btnStateMap0010Delete')
        .onClick((e: ClickEvent)=>{
          this.map.delete('map2')
        })
      Button('Clear')
        .id('btnStateMap0010Clear')
        .onClick((e: ClickEvent)=>{
          this.map.clear()
        })
    }
  }
}