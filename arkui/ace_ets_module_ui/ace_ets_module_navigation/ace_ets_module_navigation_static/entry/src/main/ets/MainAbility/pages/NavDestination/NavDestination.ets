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

import {
  Entry,
  Component,
  Column,
  Text,
  Button,
  VisibilityChangeReason
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct NavDestinationPage {
  @State currentReason: VisibilityChangeReason = VisibilityChangeReason.TRANSITION;
  private readonly stateKey: string = 'NavDestinationPageState';

  aboutToAppear(): void {
    this.syncStateToStorage();
  }

  private syncStateToStorage(): void {
    const snapshot = `currentReason=${this.currentReason}`;
    AppStorage.setOrCreate<string>(this.stateKey, snapshot);
  }

  build() {
    Column() {
      Button('setTransition')
        .id('setTransitionBtn')
        .key('setTransitionBtn')
        .onClick(() => {
          this.currentReason = VisibilityChangeReason.TRANSITION;
          this.syncStateToStorage();
        })
      Button('setContentCover')
        .id('setContentCoverBtn')
        .key('setContentCoverBtn')
        .onClick(() => {
          this.currentReason = VisibilityChangeReason.CONTENT_COVER;
          this.syncStateToStorage();
        })
      Button('setAppState')
        .id('setAppStateBtn')
        .key('setAppStateBtn')
        .onClick(() => {
          this.currentReason = VisibilityChangeReason.APP_STATE;
          this.syncStateToStorage();
        })

      Text(`currentReason=${this.currentReason}`)
        .id('visibilityChangeReasonCurrentValue')
        .key('visibilityChangeReasonCurrentValue')

      Text(`TRANSITION=${VisibilityChangeReason.TRANSITION}`)
        .id('visibilityChangeReasonTransitionCase')
        .key('visibilityChangeReasonTransitionCase')
      Text(`CONTENT_COVER=${VisibilityChangeReason.CONTENT_COVER}`)
        .id('visibilityChangeReasonContentCoverCase')
        .key('visibilityChangeReasonContentCoverCase')
      Text(`APP_STATE=${VisibilityChangeReason.APP_STATE}`)
        .id('visibilityChangeReasonAppStateCase')
        .key('visibilityChangeReasonAppStateCase')
    }.width('100%').height('100%')
  }
}
