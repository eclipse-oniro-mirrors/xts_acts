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
class StateClass0080 {
  private _value: string = ''

  public set value(value: string) {
    this._value = value
  }

  public get value(): string {
    return this._value
  }

  constructor(value: string) {
    this._value = value
  }
}

@Entry
@Component
struct State0080 {
  @State private classArr: StateClass0080[] = new Array<StateClass0080>(new StateClass0080('Hello'))
  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('State0080', router);
    } catch (error) {
      console.log('error ' + error);
    }
  }
  build() {
    Column() {
      Text(this.classArr[0].value)
        .id('tvState00801')
        .onClick((e: ClickEvent)=>{
          this.classArr[0].value = 'Hello,World'
        })
    }
  }
}