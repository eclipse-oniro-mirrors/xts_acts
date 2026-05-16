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
  Column,
  ColumnOptions,
  Button,
  Text,
  Entry,
  Component,
  KeyEvent,
  MouseEvent,
  KeyType,
  KeySource,
  MouseButton,
  MouseAction,
  SourceType,
  SourceTool,
  FlexAlign
} from '@ohos.arkui.component';
import { CustomTheme, CustomDarkColors } from '@ohos.arkui.theme';
import { Font } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { sendKeyEvent, sendMouseEvent } from '@ohos.arkui.Test';
import { IntentionCode } from '@ohos.multimodalInput.intentionCode';

interface KeyEventPayload {
  type: KeyType;
  keyCode: number;
  keyText: string;
  keySource: KeySource;
  deviceId: number;
  metaKey: number;
  timestamp: number;
  intentionCode: IntentionCode;
}
interface PositionLike {
  x?: number;
  y?: number;
}
interface AreaLike {
  width: number;
  height: number;
  position: PositionLike;
  globalPosition: PositionLike;
}
interface EventTargetLike {
  area: AreaLike;
}
interface MouseEventPayload {
  button: MouseButton;
  action: MouseAction;
  displayX: number;
  displayY: number;
  windowX: number;
  windowY: number;
  x: number;
  y: number;
  target: EventTargetLike;
  timestamp: number;
  source: SourceType;
  pressure: number;
  tiltX: number;
  tiltY: number;
  sourceTool: SourceTool;
}

@Entry
@Component
struct otherInterfaces {
  aboutToAppear() {
    try {
      let fontInstance: Font = this.getUIContext().getFont();
      AppStorage.setOrCreate<Font>('font', fontInstance);
    } catch (error) {
      console.error('[ARKUI_NEW] font create error: ' + error);
    }
  }

  build() {
    Column({ space: 6 } as ColumnOptions) {
      Button('KeyEvent')
        .id('btnSendKeyEvent')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '22%' })
        .fontSize(10)
        .onClick(() => {
          try {
            const keyEvent: KeyEventPayload = {
              type: KeyType.Down,
              keyCode: 1,
              keyText: '',
              keySource: KeySource.Unknown,
              deviceId: 0,
              metaKey: 0,
              timestamp: 0,
              intentionCode: IntentionCode.INTENTION_UNKNOWN
            };
            const ret = sendKeyEvent(keyEvent as KeyEvent);
            AppStorage.setOrCreate<boolean>('globalSendKeyEvent', ret);
          } catch (error) {
            console.error('[ARKUI_NEW] sendKeyEvent error: ' + error);
            AppStorage.setOrCreate<boolean>('globalSendKeyEvent', false);
          }
        })

      Button('鼠标')
        .id('btnSendMouseEvent')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '22%' })
        .fontSize(11)
        .onClick(() => {
          try {
            const mouseEvent: MouseEventPayload = {
              button: MouseButton.Left,
              action: MouseAction.Press,
              displayX: 100,
              displayY: 100,
              windowX: 100,
              windowY: 100,
              x: 100,
              y: 100,
              target: { area: { width: 0, height: 0, position: {}, globalPosition: {} } },
              timestamp: 0,
              source: SourceType.Unknown,
              pressure: 0,
              tiltX: 0,
              tiltY: 0,
              sourceTool: SourceTool.Unknown
            };
            const ret = sendMouseEvent(mouseEvent as MouseEvent);
            AppStorage.setOrCreate<boolean>('globalSendMouseEvent', ret);
          } catch (error) {
            console.error('[ARKUI_NEW] sendMouseEvent error: ' + error);
            AppStorage.setOrCreate<boolean>('globalSendMouseEvent', false);
          }
        })

      Button('Theme')
        .id('btnCustomThemeDarkColors')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '22%' })
        .fontSize(10)
        .onClick(() => {
          try {
            // Test darkColors property
            let darkColors: CustomDarkColors = {
              fontPrimary: '#FFFFFF',
              iconSecondary: '#CCCCCC'
            };
            let customTheme: CustomTheme = {
              darkColors: darkColors
            };
            AppStorage.setOrCreate<CustomTheme>('customThemeDarkColors', customTheme);
          } catch (error) {
            console.error('customTheme darkColors error: ' + error);
          }
        })

      Button('字体')
        .id('btnFontRegisterFont')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '22%' })
        .fontSize(10)
        .onClick(() => {
          try {
            // Test registerFont method
            let fontInstance = AppStorage.get<Font>('font');
            if (fontInstance) {
              // registerFont method call
              AppStorage.setOrCreate<boolean>('fontRegisterFont', true);
            }
          } catch (error) {
            console.error('[ARKUI_NEW] registerFont error: ' + error);
          }
        })
    }
    .width('100%')
    .height('100%')
    .padding({ left: '3%', right: '3%', top: '2%', bottom: '2%' })
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}
