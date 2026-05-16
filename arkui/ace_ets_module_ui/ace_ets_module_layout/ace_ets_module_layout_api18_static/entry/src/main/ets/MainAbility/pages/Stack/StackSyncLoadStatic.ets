'use static'

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
  Text,
  Stack,
  Column,
  Component,
  Button,
  Alignment,
  ClickEvent,
  LengthMetricsUnit,
  ColumnOptions,
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct StackSyncLoadStatic {
  build() {
    Column({space:2} as ColumnOptions) {
      Stack({ alignContent: Alignment.Bottom } ) {
        Text('show in bottom').width(180).height(37).backgroundColor(0xd2cab3).align(Alignment.Top)
        Text('show in top').width(160).height(20).backgroundColor(0xc1cbac).align(Alignment.Top)
      }
      .id('StackSyncLoadStatic1')
      .syncLoad(true)
      Stack({ alignContent: Alignment.Bottom }) {
        Text('show in bottom').width(180).height(37).backgroundColor(0xd2cab3).align(Alignment.Top)
        Text('show in top').width(160).height(20).backgroundColor(0xc1cbac).align(Alignment.Top)
      }
      .id('StackSyncLoadStatic2')
      .syncLoad(false)
    }
    .height('100%')
    .width('100%')
  }
}