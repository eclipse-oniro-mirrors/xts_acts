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
  Text,ContentCoverOptions,CheckBoxShape,
  Row,Color,Builder,FlexAlign,$$,Checkbox,
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
struct CheckboxExample {
  @State checkboxselect1: boolean = true
  @State checkboxselect2: boolean = false

  build() {
    Column() {
      Text(`checkboxselect1: ${this.checkboxselect1}`).id('twoCheckboxText').height('5%')
      Text(`checkboxselect2: ${this.checkboxselect2}`).id('twoCheckboxText1').height('5%')
      Checkbox({ name: 'checkbox1', group: 'checkboxGroup' }).height('5%')
        .select(true)
        .selectedColor(0xed6f21)
        .shape(CheckBoxShape.CIRCLE)
        .onChange((value: boolean) => {
          console.info('Checkbox1 change is' + value)
        })
      Checkbox({ name: 'checkbox2', group: 'checkboxGroup' }).height('5%')
        .select($$(this.checkboxselect1))
        .selectedColor(0x39a2db)
        .shape(CheckBoxShape.ROUNDED_SQUARE)
        .id('twoCheckbox1')
        .onChange((value: boolean) => {
          console.info('Checkbox2 change is' + value)
        })
        .onClick(():void => {
          console.info('Checkbox2=' + this.checkboxselect1)
        })
      Checkbox({ name: 'checkbox3', group: 'checkboxGroup' }).height('5%')
        .select($$(this.checkboxselect2))
        .selectedColor(0x39a2db)
        .shape(CheckBoxShape.ROUNDED_SQUARE)
        .id('twoCheckbox2')
        .onChange((value: boolean) => {
          console.info('Checkbox3 change is' + value)
        })
        .onClick(():void => {
          console.info('checkbox3=' + this.checkboxselect2)
        })
    }
  }
}