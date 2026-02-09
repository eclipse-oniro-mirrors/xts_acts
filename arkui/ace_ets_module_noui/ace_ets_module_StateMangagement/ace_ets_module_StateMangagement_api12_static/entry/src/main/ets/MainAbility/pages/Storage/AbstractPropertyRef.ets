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
  ListItem,
  Color,
  FlexAlign
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  StorageLink,
  AbstractProperty
} from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
// AppStorage.setAndRef('AbstractPropertyRefTest', 52)

@Entry
@Component
struct AbstractPropertyRef {
  @State refA1Value?: AbstractProperty<number> = AppStorage.ref('AbstractPropertyRefTest') as AbstractProperty<number>
  static { AppStorage.setOrCreate('AbstractPropertyRefTest', 52.0) }
  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('AbstractPropertyRef', router);
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }
  build() {
    Column() {
      Text(this.refA1Value?.info() + ':' + String(this.refA1Value?.get()))
        .id('tvRefA1Value')
        .height('5%')

      Button('Click')
        .id('btnSetAPTest')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.refA1Value?.set(10)
        })
      Button('Click')
        .id('btnClearAPTest')
        .height('5%')
        .onClick((e: ClickEvent) => {
          let isClear = AppStorage.clear()
          console.info('AbstractPropertyRef clear is ' + String(isClear))
        })
    }
  }
}