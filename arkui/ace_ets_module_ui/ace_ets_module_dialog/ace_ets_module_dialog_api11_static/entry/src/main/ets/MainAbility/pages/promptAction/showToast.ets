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
import { Entry, Component, $r, Column, ColumnOptions, Button, ClickEvent, } from '@ohos.arkui.component';
import { edgeWidths, LengthMetrics } from '@ohos.arkui.node';
import { State, Link, PropRef, } from '@ohos.arkui.stateManagement';
import { PromptAction } from '@ohos.arkui.UIContext';

@Entry
@Component
struct showToastExample {
  private selectTime: Date = new Date('2020-12-25T08:30:00')

  build() {
    Column() {
      Button("showToast")
        .id('showToast')
        .margin(100)
        .onClick((e: ClickEvent) => {
          this.getUIContext().getPromptAction().showToast({
            message: 'Message Info',
            duration: 2000
          });
        })
    }.width('100%')
  }
}