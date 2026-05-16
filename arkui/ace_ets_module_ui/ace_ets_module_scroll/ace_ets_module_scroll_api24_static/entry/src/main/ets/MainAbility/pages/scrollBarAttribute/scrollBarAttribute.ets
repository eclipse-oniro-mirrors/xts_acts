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

import { Column, ColumnOptions, Text, Scroll, ScrollBar, Scroller, Entry, Component, BarState } from '@ohos.arkui.component';
import { ColorMetrics, ColorSpace } from '@kit.ArkUI';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct ScrollBarAttrTestPage {
  scroller: Scroller = new Scroller();

  aboutToAppear(): void {
    AppStorage.setOrCreate<boolean>('sbAttr_ready', true);
  }

  build() {
    Column({ space: 8 } as ColumnOptions) {
      Text('scrollBar ScrollBarAttribute.scrollBarColor')
        .fontSize(11)
        .width('100%')
        .height('9%')
        .id('sbAttr_title');
      Scroll(this.scroller) {
        Text('s').fontSize(9).height('5%');
      }
      .scrollBar(BarState.Off)
      .height('12%')
      .width('100%')
      .id('sbAttr_scroll');
      ScrollBar({ scroller: this.scroller, state: BarState.Auto })
        .scrollBarColor(ColorMetrics.colorWithSpace(ColorSpace.DISPLAY_P3, 0, 0, 0, 1))
        .height('6%')
        .width('100%')
        .id('sbAttr_bar');
    }
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' });
  }
}
