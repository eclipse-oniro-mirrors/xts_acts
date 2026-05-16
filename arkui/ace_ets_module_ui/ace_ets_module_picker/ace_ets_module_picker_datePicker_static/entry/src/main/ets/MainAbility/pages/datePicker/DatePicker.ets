/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static'

import { Column, Button, Entry, Component } from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct DatePickerPage {
  // 测试DatePickerDialog的canLoop属性
  selectedDate: Date = new Date('2024-01-01');

  aboutToAppear(): void {
    const routerInstance = this.getUIContext().getRouter();
    AppStorage.setOrCreate<Router>('router', routerInstance);
    const snapshot = `datePickerCanLoop=true`;
    AppStorage.setOrCreate<string>('DatePickerPageState', snapshot);
  }

  build() {
    Column() {
      // 测试DatePickerDialog.canLoop属性
      Button('显示DatePickerDialog (canLoop=true)')
        .onClick((event) => {
          this.getUIContext().showDatePickerDialog({
            start: new Date('2020-01-01'),
            end: new Date('2030-12-31'),
            selected: this.selectedDate,
            canLoop: true
          });
        })
        .id('datePickerCanLoopCase')
        .key('datePickerCanLoopCase')

    }.width('100%').height('100%').padding(20)
  }
}