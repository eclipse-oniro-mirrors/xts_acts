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

import {
  Column,
  ColumnOptions,
  Text,
  Badge,
  Entry,
  Component,
  BadgeStyle,
  BadgeParamWithNumber,
} from '@ohos.arkui.component';
import { LengthMetrics } from '@ohos.arkui.node';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Builder
function badgeOuterAvoidHost() {
  Text('host')
    .fontSize(10)
    .width('100%')
    .height('6%');
}

@Entry
@Component
struct BadgeOuterStylePage {
  aboutToAppear(): void {
    AppStorage.setOrCreate<boolean>('bdgOut_ready', true);
  }

  build() {
    Column({ space: 6 } as ColumnOptions) {
      Text('BadgeStyle outerBorder outer width autoAvoid')
        .fontSize(11)
        .width('100%')
        .height('9%')
        .id('bdgOut_title');
      Badge({
        count: 2,
        style: {
          outerBorderColor: '#FFFF0000',
          outerBorderWidth: LengthMetrics.vp(2),
          enableAutoAvoidance: true,
        } as BadgeStyle,
      } as BadgeParamWithNumber, badgeOuterAvoidHost)
        .width('100%')
        .height('12%')
        .id('bdgOut_host');
    }
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' });
  }
}
