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

'use static'

import { Entry, Component, Column, Text, Button, Refresh } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct RefreshPage {
  @State refreshingValue: boolean = false;
  @State pullUpToCancelRefreshValue: boolean = true;
  private readonly stateKey: string = 'RefreshPageState';

  aboutToAppear(): void {
    this.syncStateToStorage();
  }

  private syncStateToStorage(): void {
    const snapshot = `refreshingValue=${this.refreshingValue};pullUpToCancelRefreshValue=${this.pullUpToCancelRefreshValue}`;
    AppStorage.setOrCreate<string>(this.stateKey, snapshot);
  }

  build() {
    Column() {
      Button('togglePullUpToCancelRefresh')
        .id('togglePullUpToCancelRefreshBtn')
        .key('togglePullUpToCancelRefreshBtn')
        .onClick(() => {
          this.pullUpToCancelRefreshValue = !this.pullUpToCancelRefreshValue;
          this.syncStateToStorage();
        })
      Text(`refresh.pullUpToCancelRefresh=${this.pullUpToCancelRefreshValue}`)
        .id('refreshPullUpToCancelRefreshValue')
        .key('refreshPullUpToCancelRefreshValue')

      Refresh({ refreshing: this.refreshingValue })
        .pullUpToCancelRefresh(this.pullUpToCancelRefreshValue)
        .id('refreshCase')
        .key('refreshCase')
        .width('100%')
        .height(80)

      Refresh({ refreshing: false })
        .pullUpToCancelRefresh(false)
        .id('refreshPullFalse')
        .key('refreshPullFalse')
        .width('100%')
        .height(60)

      Refresh({ refreshing: false })
        .pullUpToCancelRefresh(undefined)
        .id('refreshPullUndef')
        .key('refreshPullUndef')
        .width('100%')
        .height(60)
    }.width('100%').height('100%')
  }
}
