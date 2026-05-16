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
  ClickEvent,
  GestureEvent,
  GestureRecognizer,
} from '@ohos.arkui.component';
import { UIObserver } from '@ohos.arkui.UIContext';
import uiObserver from '@ohos.arkui.observer';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Callback } from '@ohos.base';

@Entry
@Component
struct UiObsGestBp {
  aboutToAppear(): void {
    AppStorage.setOrCreate<boolean>('uiObs_page_mounted', true);
    console.info('[ARKUI_NEW][UIObsGestBp] aboutToAppear');
  }

  build() {
    Column({ space: 6 } as ColumnOptions) {
      Text('UIObserver breakpoint / click / tap / pan')
        .fontSize(11)
        .width('100%')
        .height('9%')
        .id('uiObs_title');

      Button('register')
        .id('uiObs_reg')
        .fontSize(10)
        .width('100%')
        .height('8%')
        .onClick(() => {
          try {
            const obs: UIObserver = this.getUIContext().getUIObserver();
            const hWinBp: Callback<uiObserver.WindowSizeLayoutBreakpointInfo> =
              (info: uiObserver.WindowSizeLayoutBreakpointInfo): void => {
                AppStorage.setOrCreate<string>('uiObs_break',
                  `${info.widthBreakpoint}_${info.heightBreakpoint}`);
              };
            const hWillClick = (e: ClickEvent): void => {};
            const hDidClick = (e: ClickEvent): void => {};
            const hWillTap = (e: GestureEvent): void => {};
            const hDidTap = (e: GestureEvent): void => {};
            const panH = (_e: GestureEvent, _r: GestureRecognizer): void => {};
            obs.onWindowSizeLayoutBreakpointChange(hWinBp);
            obs.onWillClick(hWillClick);
            obs.onDidClick(hDidClick);
            obs.onWillTap(hWillTap);
            obs.onDidTap(hDidTap);
            obs.onBeforePanStart(panH);
            obs.onBeforePanEnd(panH);
            obs.onAfterPanStart(panH);
            obs.onAfterPanEnd(panH);
            AppStorage.setOrCreate<boolean>('uiObs_reg_ok', true);
          } catch (e) {
            console.error('[uiObsGestBp] register ' + e);
            AppStorage.setOrCreate<boolean>('uiObs_reg_ok', false);
          }
        });

      Button('off all')
        .id('uiObs_off')
        .fontSize(10)
        .width('100%')
        .height('8%')
        .onClick(() => {
          try {
            const obs: UIObserver = this.getUIContext().getUIObserver();
            obs.offWindowSizeLayoutBreakpointChange();
            obs.offWillClick();
            obs.offDidClick();
            obs.offWillTap();
            obs.offDidTap();
            obs.offBeforePanStart();
            obs.offBeforePanEnd();
            obs.offAfterPanStart();
            obs.offAfterPanEnd();
            AppStorage.setOrCreate<boolean>('uiObs_off_ok', true);
          } catch (e) {
            console.error('[uiObsGestBp] off ' + e);
            AppStorage.setOrCreate<boolean>('uiObs_off_ok', false);
          }
        });
    }
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' });
  }
}
