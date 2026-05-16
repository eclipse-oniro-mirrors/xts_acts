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

'use static';

import { Column, ColumnOptions, Text, Refresh, Entry, Component } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct RefreshAttrTestPage {
  @State refreshing: boolean = false;

  aboutToAppear(): void {
    AppStorage.setOrCreate<boolean>('refreshAttr_ready', true);
  }

  build() {
    Column({ space: 8 } as ColumnOptions) {
      Text('refresh RefreshAttribute.maxPullDownDistance')
        .fontSize(11)
        .width('100%')
        .height('9%')
        .id('refreshAttr_title');
      Refresh({ refreshing: this.refreshing }) {
        Text('pull').fontSize(9).height('5%');
      }
      .maxPullDownDistance(120)
      .height('16%')
      .width('100%')
      .id('refreshAttr_body');
    }
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' });
  }
}
