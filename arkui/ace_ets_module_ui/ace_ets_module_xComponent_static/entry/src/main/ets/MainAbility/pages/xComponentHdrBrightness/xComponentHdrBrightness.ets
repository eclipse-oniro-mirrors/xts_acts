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
  XComponent,
  XComponentType,
  XComponentController,
  Entry,
  XComponentOptions,
  Component,
  HdrType,
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';

/**
 * 对齐官方 API：hdrBrightness(brightness, type?)，HdrType 由 @ohos.arkui.component 导出（见 D:\aSdk\24\...\xcomponent.d.ets）。
 */
@Entry
@Component
struct XComponentHdrBrightness {
  xcDef: XComponentController = new XComponentController();
  xcAi: XComponentController = new XComponentController();

  aboutToAppear(): void {
    AppStorage.setOrCreate<boolean>('xcHdr_mounted', true);
    AppStorage.setOrCreate<boolean>('xcHdr_hdr_brightness_typed', true);
  }

  build() {
    Column({ space: 8 } as ColumnOptions) {
      Text('xcomponent hdrBrightness(brightness, HdrType.DEFAULT|AIHDR)')
        .fontSize(11)
        .width('100%')
        .height('8%')
        .id('xcHdr_title');
      XComponent({
        // XComponentType 取值 0，与官方枚举默认项一致（见 component/enums.d.ets）
        type: 0 as XComponentType,
        controller: this.xcDef,
      } as XComponentOptions)
      .hdrBrightness(1.0, HdrType.DEFAULT)
      .height('10%')
      .width('100%')
      .id('xcHdr_body');
      XComponent({
        type: 0 as XComponentType,
        controller: this.xcAi,
      } as XComponentOptions)
      .hdrBrightness(1.0, HdrType.AIHDR)
      .height('10%')
      .width('100%')
      .id('xcHdr_body_ai');
    }
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' });
  }
}
