'use static';
/**
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
import { Entry, Component, Column, ItemAlign, FlexAlign, FlexDirection,Text, Flex, Button } from '@ohos.arkui.component'
import { State, AppStorage,StoragePropRef } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct Index {
  @StoragePropRef('flexDirection') flexDirection: FlexDirection = FlexDirection.Column
  build() {
    Flex({ direction: this.flexDirection, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text('Hello World')
        .fontSize(60)
        .fontWeight(500)
      Button('Next')
        .fontSize(40)
        .fontWeight(500)
        .width(280)
        .height(60)
    }
    .key('direction')
    .width('100%')
    .height('100%')
  }
}