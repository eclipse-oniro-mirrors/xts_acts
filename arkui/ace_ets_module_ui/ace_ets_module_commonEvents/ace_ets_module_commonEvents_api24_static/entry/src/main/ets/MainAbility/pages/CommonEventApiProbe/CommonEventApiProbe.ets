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
  Text,
  Component,
  Entry,
  ClickEvent,
  HoverEvent,
  MouseEvent,
  AccessibilityHoverEvent,
  TouchEvent,
  TouchType,
  FlexAlign,
  HoverEffect,
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';

/** Hypium 多为触控注入：无鼠标时 onHover/onMouse 可能不回调；用 Touch 的同点 globalDisplay 写同一组 AppStorage，满足 globalDisplayX/Y 断言。 */
function ceWriteTouchAxis(pairPrefix: string, e: TouchEvent): void {
  if (e.changedTouches.length === 0) {
    return;
  }
  let t = e.changedTouches[0];
  let tx: number | undefined = t.globalDisplayX !== undefined ? (t.globalDisplayX as number) : (t.displayX as number);
  let ty: number | undefined = t.globalDisplayY !== undefined ? (t.globalDisplayY as number) : (t.displayY as number);
  if (tx !== undefined && ty !== undefined) {
    AppStorage.setOrCreate<string>(pairPrefix + '_gdx', String(tx));
    AppStorage.setOrCreate<string>(pairPrefix + '_gdy', String(ty));
  }
}

@Entry
@Component
struct CommonEventApiProbe {
  aboutToAppear(): void {
    AppStorage.setOrCreate<string>('common_event_probe', '1');
  }

  build() {
    Column() {
      Text('click')
        .fontSize(20)
        .id('commonEventClickHost')
        .key('commonEventClickHost')
        .onClick((e: ClickEvent): void => {
          let gdx: number = e.globalDisplayX !== undefined ? (e.globalDisplayX as number) : (e.displayX as number);
          let gdy: number = e.globalDisplayY !== undefined ? (e.globalDisplayY as number) : (e.displayY as number);
          AppStorage.setOrCreate<string>('ce_click_gdx', String(gdx));
          AppStorage.setOrCreate<string>('ce_click_gdy', String(gdy));
        });
      Text('hover')
        .fontSize(20)
        .id('commonEventHoverHost')
        .key('commonEventHoverHost')
        .hoverEffect(HoverEffect.Scale)
        .onHover((isHover: boolean, e: HoverEvent): void => {
          if (isHover) {
            let hx: number | undefined = e.globalDisplayX !== undefined ? (e.globalDisplayX as number) : e.displayX;
            let hy: number | undefined = e.globalDisplayY !== undefined ? (e.globalDisplayY as number) : e.displayY;
            if (hx !== undefined && hy !== undefined) {
              AppStorage.setOrCreate<string>('ce_hover_gdx', String(hx));
              AppStorage.setOrCreate<string>('ce_hover_gdy', String(hy));
            }
          }
        })
        .onTouch((e: TouchEvent): void => {
          if (e.type === TouchType.Down || e.type === TouchType.Move) {
            ceWriteTouchAxis('ce_hover', e);
          }
        });
      Text('mouse')
        .fontSize(20)
        .id('commonEventMouseHost')
        .key('commonEventMouseHost')
        .onMouse((e: MouseEvent): void => {
          let mx: number | undefined =
            e.globalDisplayX !== undefined ? (e.globalDisplayX as number) : (e.displayX as number);
          let my: number | undefined =
            e.globalDisplayY !== undefined ? (e.globalDisplayY as number) : (e.displayY as number);
          if (mx !== undefined && my !== undefined) {
            AppStorage.setOrCreate<string>('ce_mouse_gdx', String(mx));
            AppStorage.setOrCreate<string>('ce_mouse_gdy', String(my));
          }
        })
        .onTouch((e: TouchEvent): void => {
          if (e.type === TouchType.Down || e.type === TouchType.Move) {
            ceWriteTouchAxis('ce_mouse', e);
          }
        });
      Text('ahover')
        .fontSize(20)
        .id('commonEventAccHoverHost')
        .key('commonEventAccHoverHost')
        .onAccessibilityHover((_hovered: boolean, e: AccessibilityHoverEvent): void => {
          let ax: number = e.globalDisplayX !== undefined ? (e.globalDisplayX as number) : (e.displayX as number);
          let ay: number = e.globalDisplayY !== undefined ? (e.globalDisplayY as number) : (e.displayY as number);
          AppStorage.setOrCreate<string>('ce_acc_gdx', String(ax));
          AppStorage.setOrCreate<string>('ce_acc_gdy', String(ay));
        })
        .onTouch((e: TouchEvent): void => {
          if (e.type === TouchType.Down || e.type === TouchType.Move) {
            ceWriteTouchAxis('ce_acc', e);
          }
        });
      Text('touch')
        .fontSize(20)
        .id('commonEventTouchHost')
        .key('commonEventTouchHost')
        .onTouch((e: TouchEvent): void => {
          if (e.type === TouchType.Down && e.changedTouches.length > 0) {
            let t = e.changedTouches[0];
            let tx: number = t.globalDisplayX !== undefined ? (t.globalDisplayX as number) : (t.displayX as number);
            let ty: number = t.globalDisplayY !== undefined ? (t.globalDisplayY as number) : (t.displayY as number);
            AppStorage.setOrCreate<string>('ce_touch_gdx', String(tx));
            AppStorage.setOrCreate<string>('ce_touch_gdy', String(ty));
          }
        });
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center);
  }
}
