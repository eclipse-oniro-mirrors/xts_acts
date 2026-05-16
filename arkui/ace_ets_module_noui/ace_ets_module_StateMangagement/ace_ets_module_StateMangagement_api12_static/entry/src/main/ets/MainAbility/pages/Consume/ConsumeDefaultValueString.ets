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

import { Entry, Component, Column, Text, Button, ClickEvent } from '@ohos.arkui.component';
import { Consume } from '@ohos.arkui.stateManagement';

@Component
struct Child {
  @Consume message: string = 'Hello, World!';

  build() {
    Column() {
      Button('Child change message')
        .id('ChangeMessageButton')
        .onClick((e: ClickEvent) => {
          this.message += 'a';
        })
      Text(`Child message ${this.message}`)
        .id('ChildMessageText');
    }
  }
}

@Entry
@Component
struct ConsumeDefaultValueString {
  build() {
    Column() {
      Child()
    }
  }
}
