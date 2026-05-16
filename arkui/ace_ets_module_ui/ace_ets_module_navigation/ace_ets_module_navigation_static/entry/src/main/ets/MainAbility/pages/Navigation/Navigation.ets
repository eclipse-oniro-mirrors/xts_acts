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
  Navigation
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct NavigationPage {
  @State dividerColorValue: string = '#ff0000';
  @State dividerStartMarginValue: number = 8;
  @State dividerEndMarginValue: number = 12;
  private readonly stateKey: string = 'NavigationPageState';

  aboutToAppear(): void {
    this.syncStateToStorage();
  }

  private syncStateToStorage(): void {
    const snapshot = `dividerColorValue=${this.dividerColorValue};dividerStartMarginValue=${this.dividerStartMarginValue};` +
      `dividerEndMarginValue=${this.dividerEndMarginValue}`;
    AppStorage.setOrCreate<string>(this.stateKey, snapshot);
  }

  build() {
    Column() {
      Button('toggleDividerColor')
        .id('toggleDividerColorBtn')
        .key('toggleDividerColorBtn')
        .onClick(() => {
          this.dividerColorValue = this.dividerColorValue === '#ff0000' ? '#00ff00' : '#ff0000';
          this.syncStateToStorage();
        })
      Text(`navigation.divider.color=${this.dividerColorValue}`)
        .id('navigationDividerColorValue')
        .key('navigationDividerColorValue')

      Button('toggleDividerStartMargin')
        .id('toggleDividerStartMarginBtn')
        .key('toggleDividerStartMarginBtn')
        .onClick(() => {
          this.dividerStartMarginValue = this.dividerStartMarginValue === 8 ? 20 : 8;
          this.syncStateToStorage();
        })
      Text(`navigation.divider.startMargin=${this.dividerStartMarginValue}`)
        .id('navigationDividerStartMarginValue')
        .key('navigationDividerStartMarginValue')

      Button('toggleDividerEndMargin')
        .id('toggleDividerEndMarginBtn')
        .key('toggleDividerEndMarginBtn')
        .onClick(() => {
          this.dividerEndMarginValue = this.dividerEndMarginValue === 12 ? 24 : 12;
          this.syncStateToStorage();
        })
      Text(`navigation.divider.endMargin=${this.dividerEndMarginValue}`)
        .id('navigationDividerEndMarginValue')
        .key('navigationDividerEndMarginValue')

      Navigation() {
        Column() {
          Text('navigation divider case')
        }
      }
      .id('navigationDividerCase')
      .key('navigationDividerCase')
      .width('100%')
      .height('60%')
    }.width('100%').height('100%')
  }
}
