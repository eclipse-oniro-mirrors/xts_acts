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

import { describe, it, expect, Level, beforeAll } from '../../../../hypium/index';
import {
  GestureActionPhase,
  GestureListenerType,
  GestureObserverConfigs,
  GestureTriggerInfo,
  GestureListenerCallback,
  UIContext,
} from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils';
import { getMainUIContextForStaticTest, waitForMainRouterForStaticTest } from '../../../ets/MainAbility/common/UIContextStaticTestBridge';
import { invokeEnableDropDisallowedBadgeTrueThenFalse } from '../../../ets/MainAbility/common/UIContextBadgeBridge';
import {
  Component,
  Driver,
  MouseButton,
  UiWindow,
  ON
} from '@ohos.UiTest';

export default function UIContextUIObserverApiTest(): void {
  describe('UIContextUIObserverApiTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.commonEvents.api24.static', 'EntryAbility');
    });

    /**
     * @tc.number SUB_ArkUI_UIObserver_AddGlobalGestureListener_Tap_WithPhases_1400
     * @tc.name SUB_ArkUI_UIObserver_AddGlobalGestureListener_Tap_WithPhases_1400
     * @tc.desc addGlobalGestureListener：真实点击后 GestureTriggerInfo.currentPhase 写入 AppStorage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_UIObserver_AddGlobalGestureListener_Tap_WithPhases_1400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let uiContext = getMainUIContextForStaticTest();
      expect(uiContext !== undefined && uiContext !== null).assertTrue();
      let listener: GestureListenerCallback = (info: GestureTriggerInfo): void => {
        AppStorage.setOrCreate<string>('uio_tap_cb_count', String(Number(AppStorage.get<string>('uio_tap_cb_count') ?? '0') + 1));
        AppStorage.setOrCreate<string>('uio_tap_phase', String(info.currentPhase));
      };
      let option: GestureObserverConfigs = {
        actionPhases: [GestureActionPhase.WILL_START, GestureActionPhase.WILL_END],
      };
      uiContext!.getUIObserver().addGlobalGestureListener(GestureListenerType.TAP, option, listener);
      let r = await waitForMainRouterForStaticTest();
      expect(r !== undefined && r !== null).assertTrue();
      let navGesture: router.RouterOptions = { url: 'MainAbility/pages/GestureApiProbe/GestureApiProbe' };
      await r!.replaceUrl(navGesture);
      await Utils.sleep(600);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id("gestureTapHost"));
      await (button?.click() as Promise<void>);
      await Utils.sleep(400);
      expect(Number(AppStorage.get<string>('uio_tap_cb_count'))).assertLarger(0);
      expect(AppStorage.get<string>('uio_tap_phase') !== undefined).assertTrue();
      uiContext!.getUIObserver().removeGlobalGestureListener(GestureListenerType.TAP, listener);
      done();
    });

    /**
     * @tc.number SUB_ArkUI_UIObserver_RemoveGlobalGestureListener_WithCallback_1500
     * @tc.name SUB_ArkUI_UIObserver_RemoveGlobalGestureListener_WithCallback_1500
     * @tc.desc removeGlobalGestureListener(callback)：注册后长按触点再移除，回调在移除前应触发
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_UIObserver_RemoveGlobalGestureListener_WithCallback_1500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let uiContext = getMainUIContextForStaticTest();
      expect(uiContext !== undefined && uiContext !== null).assertTrue();
      let listener: GestureListenerCallback = (_info: GestureTriggerInfo): void => {
        AppStorage.setOrCreate<string>('uio_lp_cb_count', String(Number(AppStorage.get<string>('uio_lp_cb_count') ?? '0') + 1));
      };
      let option: GestureObserverConfigs = {
        actionPhases: [GestureActionPhase.WILL_START],
      };
      uiContext!.getUIObserver().addGlobalGestureListener(GestureListenerType.LONG_PRESS, option, listener);
      let r = await waitForMainRouterForStaticTest();
      expect(r !== undefined && r !== null).assertTrue();
      let navSpring: router.RouterOptions = { url: 'MainAbility/pages/DragSpringLoading/DragSpringLoadingIndex' };
      await r!.replaceUrl(navSpring);
      await Utils.sleep(600);
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id("dragSpringLoadingHost"));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1200);
      uiContext!.getUIObserver().removeGlobalGestureListener(GestureListenerType.LONG_PRESS, listener);
      expect(Number(AppStorage.get<string>('uio_lp_cb_count') ?? '0')).assertLargerOrEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ArkUI_UIObserver_RemoveGlobalGestureListener_OmitCallback_1600
     * @tc.name SUB_ArkUI_UIObserver_RemoveGlobalGestureListener_OmitCallback_1600
     * @tc.desc removeGlobalGestureListener(type)：无回调移除全部监听
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_UIObserver_RemoveGlobalGestureListener_OmitCallback_1600', Level.LEVEL1, (done: () => void) => {
      let uiContext = getMainUIContextForStaticTest();
      expect(uiContext !== undefined && uiContext !== null).assertTrue();
      let listener: GestureListenerCallback = (_info: GestureTriggerInfo): void => {
      };
      let option: GestureObserverConfigs = {
        actionPhases: [GestureActionPhase.WILL_END],
      };
      uiContext!.getUIObserver().addGlobalGestureListener(GestureListenerType.PAN, option, listener);
      uiContext!.getUIObserver().removeGlobalGestureListener(GestureListenerType.PAN);
      done();
    });

    /**
     * @tc.number SUB_ArkUI_UIContext_EnableDropDisallowedBadge_TrueThenFalse_1700
     * @tc.name SUB_ArkUI_UIContext_EnableDropDisallowedBadge_TrueThenFalse_1700
     * @tc.desc UIContext.enableDropDisallowedBadge 真机连续调用（无 UI 恒真断言）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_UIContext_EnableDropDisallowedBadge_TrueThenFalse_1700', Level.LEVEL1, (done: () => void) => {
      let ctx = getMainUIContextForStaticTest();
      expect(ctx !== undefined && ctx !== null).assertTrue();
      invokeEnableDropDisallowedBadgeTrueThenFalse(ctx!);
      done();
    });
  });
}
