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
  Button,
  Text,
  Entry,
  Component,
  Axis,
} from '@ohos.arkui.component';
import { UIObserver } from '@ohos.arkui.UIContext';
import observer from '@ohos.arkui.observer';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct ArkuiObserverScrollEvent {
  aboutToAppear(): void {
    AppStorage.setOrCreate<boolean>('obsScroll_page_mounted', true);
  }

  build() {
    Column({ space: 6 } as ColumnOptions) {
      Text('@ohos.arkui.observer ScrollEventInfo / onScrollEvent')
        .fontSize(11)
        .width('100%')
        .height('9%')
        .id('obsScroll_title');

      Column({ space: 0 } as ColumnOptions) {
        Text('host').fontSize(10).height('6%');
      }
      .height('12%')
      .width('100%')
      .id('obsScroll_host');

      Button('onScrollEvent+axis')
        .id('obsScroll_btn')
        .fontSize(10)
        .width('100%')
        .height('8%')
        .onClick(() => {
          const sample: observer.ScrollEventInfo = {
            id: 's',
            uniqueId: 1,
            scrollEvent: observer.ScrollEventType.SCROLL_START,
            offset: 0,
            axis: Axis.Vertical,
          };
          AppStorage.setOrCreate<string>('obsScroll_axis', `${sample.axis}`);
          const obs: UIObserver = this.getUIContext().getUIObserver();
          obs.onScrollEvent({ id: 'obsScroll_host' }, (info: observer.ScrollEventInfo) => {
            AppStorage.setOrCreate<string>('obsScroll_axis_cb', `${info.axis}`);
          });
        });
    }
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' });
  }
}
