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

import { Column, ColumnOptions, Button, Text, wrapBuilder, Entry, Component } from '@ohos.arkui.component';
import { ComponentContent } from '@ohos.arkui.node';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Builder
function ccApiBuilder() {
  Text('cc').fontSize(9).height('5%');
}

@Entry
@Component
struct ComponentContentApi {
  build() {
    Column({ space: 8 } as ColumnOptions) {
      Text('arkui ComponentContent')
        .fontSize(11)
        .width('100%')
        .height('8%')
        .id('ccApi_title');
      Button('create ComponentContent')
        .id('ccApi_btn')
        .fontSize(10)
        .width('100%')
        .height('8%')
        .onClick(() => {
          try {
            const cc = new ComponentContent(this.getUIContext(), wrapBuilder(ccApiBuilder));
            AppStorage.setOrCreate<boolean>('ccApi_created', true);
            cc.dispose();
            AppStorage.setOrCreate<boolean>('ccApi_disposed', true);
          } catch (e) {
            AppStorage.setOrCreate<boolean>('ccApi_created', false);
            AppStorage.setOrCreate<boolean>('ccApi_disposed', false);
          }
        });
    }
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' });
  }
}
