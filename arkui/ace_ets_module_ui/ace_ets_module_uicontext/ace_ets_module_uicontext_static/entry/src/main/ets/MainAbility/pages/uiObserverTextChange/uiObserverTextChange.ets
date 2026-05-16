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

import { Column, ColumnOptions, Button, Text, TextInput, Entry, Component } from '@ohos.arkui.component';
import { UIObserver } from '@ohos.arkui.UIContext';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import uiObserver from '@ohos.arkui.observer';
import { Callback } from '@ohos.base';

const TAG = '[TxtChObs]';
const OBS_ID = 'txtCh_obs_id';

let txtChCbPlain: Callback<uiObserver.TextChangeEventInfo> | undefined = undefined;
let txtChCbIdent: Callback<uiObserver.TextChangeEventInfo> | undefined = undefined;

@Entry
@Component
struct TextChangeObserverPage {
  @State ti: string = 'x';

  aboutToAppear(): void {
    AppStorage.setOrCreate<boolean>('txtCh_ready', true);
  }

  build() {
    Column({ space: 6 } as ColumnOptions) {
      Text('UIObserver onTextChange / offTextChange')
        .fontSize(11)
        .width('100%')
        .height('9%')
        .id('txtCh_title');
      TextInput({ text: this.ti, placeholder: 'edit' })
        .fontSize(10)
        .width('100%')
        .height('8%')
        .id('txtCh_input')
        .onChange((v: string) => {
          this.ti = v;
        });
      Button('on plain')
        .id('txtCh_on_plain')
        .fontSize(9)
        .width('100%')
        .height('7%')
        .onClick(() => {
          try {
            const obs: UIObserver = this.getUIContext().getUIObserver();
            const cb: Callback<uiObserver.TextChangeEventInfo> =
              (info: uiObserver.TextChangeEventInfo): void => {
                AppStorage.setOrCreate<boolean>('txtCh_event', true);
              };
            txtChCbPlain = cb;
            obs.onTextChange(cb);
            AppStorage.setOrCreate<boolean>('txtCh_on_plain_ok', true);
          } catch (e) {
            console.error(`${TAG} on plain ${e}`);
            AppStorage.setOrCreate<boolean>('txtCh_on_plain_ok', false);
          }
        });
      Button('on with ObserverOptions')
        .id('txtCh_on_opt')
        .fontSize(9)
        .width('100%')
        .height('7%')
        .onClick(() => {
          try {
            const obs: UIObserver = this.getUIContext().getUIObserver();
            const opt: uiObserver.ObserverOptions = { id: OBS_ID } as uiObserver.ObserverOptions;
            const cb: Callback<uiObserver.TextChangeEventInfo> =
              (_info: uiObserver.TextChangeEventInfo): void => {
                AppStorage.setOrCreate<boolean>('txtCh_event_opt', true);
              };
            txtChCbIdent = cb;
            obs.onTextChange(opt, cb);
            AppStorage.setOrCreate<boolean>('txtCh_on_opt_ok', true);
          } catch (e) {
            console.error(`${TAG} on opt ${e}`);
            AppStorage.setOrCreate<boolean>('txtCh_on_opt_ok', false);
          }
        });
      Button('off plain (same cb)')
        .id('txtCh_off_plain')
        .fontSize(9)
        .width('100%')
        .height('7%')
        .onClick(() => {
          try {
            const obs: UIObserver = this.getUIContext().getUIObserver();
            if (txtChCbPlain !== undefined) {
              obs.offTextChange(txtChCbPlain);
            } else {
              obs.offTextChange();
            }
            AppStorage.setOrCreate<boolean>('txtCh_off_plain_ok', true);
          } catch (e) {
            console.error(`${TAG} off plain ${e}`);
            AppStorage.setOrCreate<boolean>('txtCh_off_plain_ok', false);
          }
        });
      Button('off opt')
        .id('txtCh_off_opt')
        .fontSize(9)
        .width('100%')
        .height('7%')
        .onClick(() => {
          try {
            const obs: UIObserver = this.getUIContext().getUIObserver();
            const opt: uiObserver.ObserverOptions = { id: OBS_ID } as uiObserver.ObserverOptions;
            if (txtChCbIdent !== undefined) {
              obs.offTextChange(opt, txtChCbIdent);
            } else {
              obs.offTextChange(opt);
            }
            AppStorage.setOrCreate<boolean>('txtCh_off_opt_ok', true);
          } catch (e) {
            console.error(`${TAG} off opt ${e}`);
            AppStorage.setOrCreate<boolean>('txtCh_off_opt_ok', false);
          }
        });
      Button('bump text (programmatic)')
        .id('txtCh_bump')
        .fontSize(9)
        .width('100%')
        .height('7%')
        .onClick(() => {
          this.ti = `${this.ti}1`;
        });
    }
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' });
  }
}
