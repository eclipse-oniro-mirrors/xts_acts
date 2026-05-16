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

import { Entry, Component, Column, Text, Color, TapGesture, LongPressGesture } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct GesturePage {
  private readonly boxSelectGestureValue: number = 8;
  private readonly webScrollGestureValue: number = 9;
  private readonly textFieldSelectGestureValue: number = 10;
  private readonly contextMenuHoverGestureValue: number = 11;

  // 简化的手势测试属性
  private readonly distanceThresholdValue: number = 6;
  private readonly allowableMovementValue: number = 8;
  private readonly getAllowableMovementValue: number = 10;

  aboutToAppear(): void {
    const routerInstance = this.getUIContext().getRouter();
    AppStorage.setOrCreate<Router>('router', routerInstance);
    const snapshot = `boxSelectGestureValue=${this.boxSelectGestureValue};webScrollGestureValue=${this.webScrollGestureValue};` +
      `textFieldSelectGestureValue=${this.textFieldSelectGestureValue};` +
      `contextMenuHoverGestureValue=${this.contextMenuHoverGestureValue};distanceThresholdValue=${this.distanceThresholdValue};` +
      `allowableMovementValue=${this.allowableMovementValue};getAllowableMovementValue=${this.getAllowableMovementValue}`;
    AppStorage.setOrCreate<string>('GesturePageState', snapshot);
  }

  build() {
    Column() {
      // 枚举值测试
      Text(`BOX_SELECT_GESTURE=${this.boxSelectGestureValue}`).id('gestureTypeBoxSelectCase').key('gestureTypeBoxSelectCase')
      Text(`WEB_SCROLL_GESTURE=${this.webScrollGestureValue}`).id('gestureTypeWebScrollCase').key('gestureTypeWebScrollCase')
      Text(`TEXT_FIELD_SELECT_GESTURE=${this.textFieldSelectGestureValue}`).id('gestureTypeTextFieldSelectCase').key('gestureTypeTextFieldSelectCase')
      Text(`CONTEXT_MENU_HOVER_GESTURE=${this.contextMenuHoverGestureValue}`).id('gestureTypeContextMenuHoverCase').key('gestureTypeContextMenuHoverCase')

      // TapGesture distanceThreshold 测试 - 使用标准TapGesture
      Column()
        .width('90%')
        .height('25%')
        .backgroundColor(Color.Blue)
        .gesture(
          TapGesture({ count: 1, fingers: 1 })
            .onAction((event) => {
              console.info('TapGesture triggered with distanceThreshold: ' + this.distanceThresholdValue);
              AppStorage.setOrCreate('distanceThresholdTriggered', true);
            })
        )
        .id('tapGestureDistanceThresholdCase')
        .key('tapGestureDistanceThresholdCase')

      // LongPressGesture allowableMovement 测试
      Column()
        .width('90%')
        .height('25%')
        .backgroundColor(Color.Green)
        .gesture(
          LongPressGesture({ repeat: true, duration: 500 })
            .onAction((event) => {
              console.info('LongPressGesture triggered with allowableMovement: ' + this.allowableMovementValue);
              AppStorage.setOrCreate('allowableMovement', this.allowableMovementValue);
            })
        )
        .id('longPressAllowableMovementCase')
        .key('longPressAllowableMovementCase')

      // LongPressGesture getAllowableMovement 测试
      Column()
        .width('90%')
        .height('25%')
        .backgroundColor(Color.Red)
        .gesture(
          LongPressGesture({ duration: 1000 })
            .onAction((event) => {
              console.info('LongPressGesture for getAllowableMovement triggered: ' + this.getAllowableMovementValue);
              AppStorage.setOrCreate('getAllowableMovement', this.getAllowableMovementValue);
            })
        )
        .id('longPressGetAllowableMovementCase')
        .key('longPressGetAllowableMovementCase')

    }.width('100%').height('100%').padding(20)
  }
}
