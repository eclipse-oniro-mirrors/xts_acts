'use static'
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  ColumnOptions,
  Row,
  wrapBuilder,
  AvoidanceMode,
  PopupCommonOptions,
  Scroll,
  Scroller,
  Margin,
  PopupOptions,
  PopupStateChangeParam,
  Placement
} from '@ohos.arkui.component'
import window from '@ohos.window';
import { display } from '@kit.ArkUI';
import { UIContext, PromptAction, TargetInfo } from '@ohos.arkui.UIContext'
import { BusinessError } from '@kit.BasicServicesKit';
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct OpenPopupAvoidTarget {
  @State maxW: Double = 365
  @State maxH: Double = 365
  @State handlePopup: boolean = false;
  @State handlePopup1: boolean = false;
  @State handlePopup2: boolean = false;
  @State handlePopup3: boolean = false;
  @State handlePopup4: boolean = false;
  @State handlePopup5: boolean = false;
  private message: string = '';
  private message1: string = '';
  private message2: string = '';

  private generateRepeatedMessage(text: string, count: number): string {
    let result = '';
    for (let i = 0; i < count; i++) {
      result += text + '\n';
    }
    return result;
  }

  aboutToAppear(): void {
    this.message = this.generateRepeatedMessage('bindPopup_AVOID_AROUND_TARGET', 100);
    this.message1 = this.generateRepeatedMessage('bindPopup_COVER_TARGET', 100);
    this.message2 = this.generateRepeatedMessage('bindPopup_undefined', 100);
  }

  @Builder
  popupBuilder() {
    let textContent: string = '';
    for (let i: Int = 0; i < 100; i++) {
      textContent += 'bindPopup_AVOID_AROUND_TARGET\n';
    }
    Scroll(new Scroller()) {
      Column() {
        Text(textContent)
      }
    }
  }

  @Builder
  popupBuilder1() {
    let textContent: string = '';
    for (let i: Int = 0; i < 100; i++) {
      textContent += 'bindPopup_COVER_TARGET\n';
    }
    Scroll(new Scroller()) {
      Column() {
        Text(textContent)
      }
    }
  }

  @Builder
  popupBuilder2() {
    let textContent: string = '';
    for (let i: Int = 0; i < 100; i++) {
      textContent += 'bindPopup_undefined\n';
    }
    Scroll(new Scroller()) {
      Column() {
        Text(textContent)
      }
    }
  }

  onPageShow(): void {
    const displayInfo = display.getDefaultDisplaySync();
    this.maxW = displayInfo.width / displayInfo.densityPixels;
    this.maxH = displayInfo.height / displayInfo.densityPixels;
    console.log('Display Width:', displayInfo.width, 'Density:', displayInfo.densityPixels);
  }

  build() {
    Column() {
      Row() {
        Button('AVOID_AROUND_TARGET')
          .onClick(() => {
            this.handlePopup = !this.handlePopup;
          })
          .bindPopup(this.handlePopup, {
            message: this.message,
            targetSpace: 1,
            placement: Placement.Bottom,
            avoidTarget: AvoidanceMode.AVOID_AROUND_TARGET,
            onStateChange: (event: PopupStateChangeParam) => {
              if (!event.isVisible) {
                this.handlePopup = false;
              }
            }
          })
          .id('bindPopup_001')
          .margin({ top: '2%' } as Margin)
        Button('builder:AVOID')
          .onClick(() => {
            this.handlePopup3 = !this.handlePopup3;
          })
          .bindPopup(this.handlePopup3, {
            builder: this.popupBuilder,
            targetSpace: 1,
            placement: Placement.Bottom,
            avoidTarget: AvoidanceMode.AVOID_AROUND_TARGET,
            onStateChange: (event: PopupStateChangeParam) => {
              if (!event.isVisible) {
                this.handlePopup3 = false;
              }
            }
          })
          .id('bindPopup_004')
          .margin({ top: '2%' } as Margin)
      }

      Row() {
        Button('COVER_TARGET')
          .onClick(() => {
            this.handlePopup1 = !this.handlePopup1;
          })
          .bindPopup(this.handlePopup1, {
            message: this.message1,
            targetSpace: 1,
            placement: Placement.Bottom,
            avoidTarget: AvoidanceMode.COVER_TARGET,
            onStateChange: (event: PopupStateChangeParam) => {
              if (!event.isVisible) {
                this.handlePopup1 = false;
              }
            }
          })
          .id('bindPopup_002')
          .margin({ top: '2%' } as Margin)
        Button('builder:COVER')
          .onClick(() => {
            this.handlePopup4 = !this.handlePopup4;
          })
          .bindPopup(this.handlePopup4, {
            builder: this.popupBuilder1,
            targetSpace: 1,
            placement: Placement.Bottom,
            avoidTarget: AvoidanceMode.COVER_TARGET,
            onStateChange: (event: PopupStateChangeParam) => {
              if (!event.isVisible) {
                this.handlePopup3 = false;
              }
            }
          })
          .id('bindPopup_005')
          .margin({ top: '2%' } as Margin)
      }

      Row() {
        Button('undefined')
          .onClick(() => {
            this.handlePopup2 = !this.handlePopup2;
          })
          .bindPopup(this.handlePopup2, {
            message: this.message2,
            avoidTarget: undefined,
            targetSpace: 1,
            placement: Placement.Bottom,
            onStateChange: (event: PopupStateChangeParam) => {
              if (!event.isVisible) {
                this.handlePopup2 = false;
              }
            }
          })
          .id('bindPopup_003')
          .margin({ top: '2%' } as Margin)
        Button('builder:undefined')
          .onClick(() => {
            this.handlePopup5 = !this.handlePopup5;
          })
          .bindPopup(this.handlePopup5, {
            builder: this.popupBuilder2,
            avoidTarget: undefined,
            targetSpace: 1,
            placement: Placement.Bottom,
            onStateChange: (event: PopupStateChangeParam) => {
              if (!event.isVisible) {
                this.handlePopup3 = false;
              }
            }
          })
          .id('bindPopup_006')
          .margin({ top: '2%' } as Margin)
      }
    }.width('100%').height('100%')
  }
}