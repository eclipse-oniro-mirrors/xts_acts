'use static';
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
import { Entry, Text, Column, Component, Button, Row, Margin } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct Index {
  @State change: boolean = true;

  build() {
    Column() {
      Column() {
        Row() {
          Text('change: ' + this.change + ' ')
          Button('change')
            .onClick(() => {
              this.change = !this.change;
            })
            .margin({ top: 5 } as Margin)
            .id('common_bindTips2')
        }
      }

      Button('show tips')
        .bindTips(this.change ? '111111111111' : undefined)
        .id('common_bindTips')
    }
    .height('100%')
    .width('100%')
  }
}