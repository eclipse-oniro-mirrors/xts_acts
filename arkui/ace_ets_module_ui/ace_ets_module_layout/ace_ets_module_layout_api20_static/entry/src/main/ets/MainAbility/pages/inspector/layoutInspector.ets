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
import fs from '@ohos.file.fs';
import common from '@ohos.app.ability.common';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';

import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  Scroll,
  Image,
  ColumnOptions,
  ClickEvent,
  $r
} from '@ohos.arkui.component';

@Component
struct ChildComponent {
  build() {
    Column() {
      Button(`Hello World`).onClick((e: ClickEvent) => {
        console.log('layoutinspector Hello World')
      })
      Image($r('app.media.icon')).height(20).focusable(true)
    }
  }
}

@Entry
@Component
struct ComponentPage {
  

  loopConsole(testStr: string, i: string) {
    console.log(`layoutinspector ${i}| type: ${JSON.parseJsonElement(testStr)
      .getElement("$type")}, ID: ${JSON.parseJsonElement(testStr).getElement("$ID")}`)

    if (JSON.parseJsonElement(testStr).getElement("$children")) {
      i += '-'
      for (let index = 0; index < JSON.parseJsonElement(testStr).getElement("$children").getDouble("length"); index++) {
        this.loopConsole(JSON.stringify(JSON.parseJsonElement(testStr).getArray("$children")[index]), i)
      }
    }
  }

  onPageShow(): void {
    
    let UIContext: UIContext = this.getUIContext()
    AppStorage.setOrCreate<UIContext>("UIContext", UIContext);
  }

  @State str: string = ''

  build() {
    Scroll() {
      Column({ space: 5 } as ColumnOptions) {
        Text('Hello World').fontSize(20).fontColor(Color.Black)
        ChildComponent()
      }
      .id('Test_Column')
      .width('100%')
    }
    .height('100%')
  }
}

