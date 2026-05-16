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
  ForEach,Flex,
  Text,ContentCoverOptions,Menu,FontWeight,MenuItem,FlexOptions,FlexDirection,
  Row,Color,Builder,FlexAlign,$$,MenuItem,MenuItemOptions,ItemAlign,Radio
} from '@ohos.arkui.component'
import {
  State,
  Watch,PropRef,ObjectLink,
  Link,LocalStoragePropRef,LocalStorageLink,Consume,Provide,
  StorageLink,Observed,Track,LocalStorage
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';


@Entry
@Component
struct RadioExample {
  @State check:boolean = false
  build() {
    Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center } as FlexOptions) {
      Column() {
        Text(`Radio1 is checked: ${this.check}`).id('V1BindText').height('5%')
        Radio({ value: 'Radio1', group: 'radioGroup' }).checked($$(this.check))
          .radioStyle({
            checkedBackgroundColor: Color.Pink
          })
          .height('3%')
          .width(50)
          .onChange((isChecked: boolean) => {
            console.log('Radio1 status is ' + isChecked)
          }).id('radio')
      }

    }
  }
}