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
  Row,
  List,
  ListItem,
  Color,
  FlexAlign,
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  StorageLink,LocalStorage
} from '@ohos.arkui.stateManagement'

@Entry
@Component
struct getSharedLocalStorageA {
  @State localStorage: LocalStorage | undefined = this.getUIContext().getSharedLocalStorage()
  @State mes: number | undefined=0

  build() {
    Row() {
      Column() {
        Text('propAM:' + this.mes).id('getSharedLocalStorage_1')
        Button("Change Local Storage to 47")
          .id('getSharedLocalStorage_2')
          .onClick(():void => {
            console.log("============================ setOrCreate(\"propAM\", 47)" + this.localStorage)
            const res = this.localStorage?.setOrCreate<double>("propAM", 47)
            console.log("============================ setOrCreate(\"propAM\", 47)" + res)
          })
        Button("Get Local Storage")
          .id('getSharedLocalStorage_3')
          .onClick(():void => {
            this.mes = this.localStorage?.get<double>("propAM")
            console.log("============================ get(\"propAM\")" + this.mes)
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}