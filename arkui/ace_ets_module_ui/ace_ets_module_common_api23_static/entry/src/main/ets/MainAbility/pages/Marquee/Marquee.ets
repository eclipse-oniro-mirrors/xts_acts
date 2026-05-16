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
  FontWeight
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct MarqueePage {
  @State spacingValue: Int = 8;
  @State delayValue: Int = 1000;
  @State fontWeightValue: Int = 400;
  private readonly stateKey: string = 'MarqueePageState';

  aboutToAppear(): void {
    this.syncStateToStorage();
  }

  private syncStateToStorage(): void {
    const snapshot = `spacingValue=${this.spacingValue};delayValue=${this.delayValue};fontWeightValue=${this.fontWeightValue}`;
    AppStorage.setOrCreate<string>(this.stateKey, snapshot);
  }

  build() {
    Column() {
      Button('toggleMarqueeSpacing')
        .id('toggleMarqueeSpacingBtn')
        .key('toggleMarqueeSpacingBtn')
        .onClick(() => {
          this.spacingValue = this.spacingValue === 8 ? 16 : 8;
          this.syncStateToStorage();
        })
      Text(`marquee.spacing=${this.spacingValue}`)
        .id('marqueeSpacingValue')
        .key('marqueeSpacingValue')

      Button('toggleMarqueeDelay')
        .id('toggleMarqueeDelayBtn')
        .key('toggleMarqueeDelayBtn')
        .onClick(() => {
          this.delayValue = this.delayValue === 1000 ? 2000 : 1000;
          this.syncStateToStorage();
        })
      Text(`marquee.delay=${this.delayValue}`)
        .id('marqueeDelayValue')
        .key('marqueeDelayValue')

      Button('toggleMarqueeFontWeight')
        .id('toggleMarqueeFontWeightBtn')
        .key('toggleMarqueeFontWeightBtn')
        .onClick(() => {
          this.fontWeightValue = this.fontWeightValue === 400 ? 700 : 400;
          this.syncStateToStorage();
        })
      Text(`marquee.fontWeight=${this.fontWeightValue}`)
        .id('marqueeFontWeightValue')
        .key('marqueeFontWeightValue')

      Text('Marquee test content - dynamic int')
        .fontWeight(this.fontWeightValue)
        .id('marqueeCase')
        .key('marqueeCase')
        .width('100%')

      Text('fontWeight FontWeight.Bold')
        .fontWeight(FontWeight.Bold)
        .id('mFwBold')
        .key('mFwBold')
      Text('fontWeight FontWeight.Normal')
        .fontWeight(FontWeight.Normal)
        .id('mFwNormal')
        .key('mFwNormal')
      Text('fontWeight FontWeight.Lighter')
        .fontWeight(FontWeight.Lighter)
        .id('mFwLighter')
        .key('mFwLighter')
      Text('fontWeight FontWeight.Regular')
        .fontWeight(FontWeight.Regular)
        .id('mFwRegular')
        .key('mFwRegular')
      Text('fontWeight FontWeight.Medium')
        .fontWeight(FontWeight.Medium)
        .id('mFwMedium')
        .key('mFwMedium')
      Text('fontWeight FontWeight.Bolder')
        .fontWeight(FontWeight.Bolder)
        .id('mFwBolder')
        .key('mFwBolder')
      Text('fontWeight string 900')
        .fontWeight('900')
        .id('mFwStr')
        .key('mFwStr')
      Text('fontWeight undefined')
        .fontWeight(undefined)
        .id('mFwUndef')
        .key('mFwUndef')
    }.width('100%').height('100%')
  }
}
