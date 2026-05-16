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

import { Column, ColumnOptions, Button, Text, Entry, Component } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

const TAG = '[UICtxStatic]';

@Entry
@Component
struct UIContextStaticMethods {
  build() {
    Column({ space: 6 } as ColumnOptions) {
      Text('UIContext static + getPageRootNode')
        .fontSize(11)
        .width('100%')
        .height('9%')
        .id('uiCtxSt_title');
      Button('invoke static')
        .id('uiCtxSt_btn')
        .fontSize(10)
        .width('100%')
        .height('8%')
        .onClick(() => {
          try {
            const a: UIContext[] = UIContext.getAllUIContexts();
            const c: UIContext | undefined = UIContext.getCallingScopeUIContext();
            const f: UIContext | undefined = UIContext.getLastFocusedUIContext();
            const g: UIContext | undefined = UIContext.getLastForegroundUIContext();
            const root = this.getUIContext().getPageRootNode();
            AppStorage.setOrCreate<string>('uiCtxSt_result',
              `all:${a.length}|call:${c !== undefined}|lastF:${f !== undefined}|lastFg:${g !== undefined}|root:${root !== null}`);
          } catch (e) {
            console.error(`${TAG} ${e}`);
            AppStorage.setOrCreate<string>('uiCtxSt_result', 'err');
          }
        });
    }
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' });
  }
}
