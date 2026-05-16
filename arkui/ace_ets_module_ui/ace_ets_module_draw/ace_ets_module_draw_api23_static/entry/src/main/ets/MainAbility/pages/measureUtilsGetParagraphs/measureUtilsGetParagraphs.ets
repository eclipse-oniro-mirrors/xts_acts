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

import { Column, ColumnOptions, Button, Text, Entry, Component, MutableStyledString } from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';

const TAG = '[MeasPara]';

@Entry
@Component
struct MeasureUtilsParagraphsPage {
  aboutToAppear(): void {
    AppStorage.setOrCreate<boolean>('muPara_ready', true);
  }

  build() {
    Column({ space: 6 } as ColumnOptions) {
      Text('UIContext.MeasureUtils.getParagraphs')
        .fontSize(11)
        .width('100%')
        .height('9%')
        .id('muPara_title');
      Button('getParagraphs')
        .id('muPara_btn')
        .fontSize(10)
        .width('100%')
        .height('8%')
        .onClick(() => {
          try {
            const ss = new MutableStyledString('lineA\nlineB');
            const paras = this.getUIContext().getMeasureUtils().getParagraphs(ss);
            AppStorage.setOrCreate<number>('muPara_len', paras.length);
            AppStorage.setOrCreate<boolean>('muPara_ok', true);
          } catch (e) {
            console.error(`${TAG} ${e}`);
            AppStorage.setOrCreate<boolean>('muPara_ok', false);
            AppStorage.setOrCreate<number>('muPara_len', -1);
          }
        });
    }
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' });
  }
}
