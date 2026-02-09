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
import { State, Provide, Consume, AppStorage,  } from '@ohos.arkui.stateManagement'
import { Entry, Component, Column, ColumnOptions, Text, Margin, FontWeight, } from '@ohos.arkui.component'
@Entry
@Component
struct RouterPage2 {
  @State message: string = 'routerPage2';

  build() {
    Column({space: '20vp'} as ColumnOptions) {
      Text(this.message)
        .id('RouterPage2Id')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
    }.margin({top: '20vp'} as Margin)
    .height('100%')
    .width('100%')
  }
}