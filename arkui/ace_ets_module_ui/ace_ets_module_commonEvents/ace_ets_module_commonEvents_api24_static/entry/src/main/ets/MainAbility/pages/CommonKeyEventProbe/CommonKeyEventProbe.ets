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

import {
  Column,
  TextInput,
  Component,
  Entry,
  KeyEvent,
  FlexAlign,
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct CommonKeyEventProbe {
  @State keyText: string = '';

  aboutToAppear(): void {
    AppStorage.setOrCreate<string>('common_key_probe', '1');
  }

  build() {
    Column() {
      TextInput({ text: this.keyText, placeholder: 'key probe' })
        .fontSize(20)
        .width('80%')
        .id('commonKeyHost')
        .key('commonKeyHost')
        .defaultFocus(true)
        .onKeyEvent((e: KeyEvent): boolean => {
          AppStorage.setOrCreate<string>('ke_any', '1');
          AppStorage.setOrCreate<string>('ke_code', String(e.keyCode));
          AppStorage.setOrCreate<string>('ke_numlock', e.isNumLockOn === true ? '1' : '0');
          AppStorage.setOrCreate<string>('ke_capslock', e.isCapsLockOn === true ? '1' : '0');
          AppStorage.setOrCreate<string>('ke_scrolllock', e.isScrollLockOn === true ? '1' : '0');
          return false;
        });
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center);
  }
}
