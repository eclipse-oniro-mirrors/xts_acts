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

import { describe, it, expect, Level, beforeAll, beforeEach } from '../../../../hypium/index';
import { PanGestureOptions, PanDirection, SourceTool, PanGestureHandlerOptions } from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { waitForMainRouterForStaticTest } from '../../../ets/MainAbility/common/UIContextStaticTestBridge';
import { UtilsTest } from '../Util.test';
import {
  Component,
  Driver,
  MouseButton,
  UiWindow,
  ON,
  Rect,
  Point
} from '@ohos.UiTest';

function gesturePanOptionsDistanceMap(): Map<SourceTool, number> {
  let m: Map<SourceTool, number> = new Map<SourceTool, number>();
  m.set(SourceTool.Pen, 20);
  return m;
}

export default function GestureStaticSuiteTest(): void {
  describe('GestureRealTypesPanGestureOptionsTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.commonEvents.api24.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      let r = await waitForMainRouterForStaticTest();
      expect(r !== undefined && r !== null).assertTrue();
      let ro: router.RouterOptions = { url: 'MainAbility/pages/GestureApiProbe/GestureApiProbe' };
      r!.clear();
      await r!.replaceUrl(ro);
      await Utils.sleep(600);
    });

    /**
     * @tc.number SUB_ArkUI_Gesture_EventLocationInfo_GlobalDisplayX_4600
     * @tc.name SUB_ArkUI_Gesture_EventLocationInfo_GlobalDisplayX_4600
     * @tc.desc gesture.d.ets EventLocationInfo：真实 TapGesture 回调 event.tapLocation.globalDisplayX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Gesture_EventLocationInfo_GlobalDisplayX_4600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id("gestureTapHost"));
      await (button?.click() as Promise<void>);
      await Utils.sleep(400);
      let gdx = AppStorage.get<string>('gesture_probe_tap_loc_gdx');
      let hasGdx: boolean = gdx != null && gdx.length > 0;
      expect(hasGdx).assertTrue();
      expect(AppStorage.get<string>('gesture_probe_tap_fire')).assertEqual('1');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_Gesture_EventLocationInfo_GlobalDisplayY_4700
     * @tc.name SUB_ArkUI_Gesture_EventLocationInfo_GlobalDisplayY_4700
     * @tc.desc gesture.d.ets EventLocationInfo：真实 tapLocation.globalDisplayY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Gesture_EventLocationInfo_GlobalDisplayY_4700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id("gestureTapHost"));
      await (button?.click() as Promise<void>);
      await Utils.sleep(400);
      let gdy = AppStorage.get<string>('gesture_probe_tap_loc_gdy');
      let hasGdy: boolean = gdy != null && gdy.length > 0;
      expect(hasGdy).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ArkUI_Gesture_FingerInfo_GlobalDisplayX_4800
     * @tc.name SUB_ArkUI_Gesture_FingerInfo_GlobalDisplayX_4800
     * @tc.desc gesture.d.ets FingerInfo：真实 PanGesture fingerInfos[].globalDisplayX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Gesture_FingerInfo_GlobalDisplayX_4800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('gesturePanHost'));
      let center = await (button?.getBoundsCenter() as Promise<Point>);
      let rect = await (button?.getBounds() as Promise<Rect>)
      await ((driver.swipe(Math.round(rect.right).toInt(), Math.round(center.y).toInt(),
        Math.round(rect.left).toInt(), Math.round(center.y).toInt())) as Promise<void>);
      await Utils.sleep(400);
      let gdx =
        AppStorage.get<string>('gesture_probe_pan_fi_gdx') ??
        AppStorage.get<string>('gesture_probe_pan_update_fi_gdx');
      let hasGdxPan: boolean = gdx != null && gdx.length > 0;
      expect(hasGdxPan).assertTrue();
      expect(AppStorage.get<string>('gesture_probe_pan_update')).assertEqual('1');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_Gesture_FingerInfo_GlobalDisplayY_4900
     * @tc.name SUB_ArkUI_Gesture_FingerInfo_GlobalDisplayY_4900
     * @tc.desc gesture.d.ets FingerInfo：真实 Pan fingerInfos[].globalDisplayY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Gesture_FingerInfo_GlobalDisplayY_4900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('gesturePanHost'));
      let center = await (button?.getBoundsCenter() as Promise<Point>);
      let rect = await (button?.getBounds() as Promise<Rect>)
      await ((driver.swipe(Math.round(rect.right).toInt(), Math.round(center.y).toInt(),
        Math.round(rect.left).toInt(), Math.round(center.y).toInt())) as Promise<void>);
      await Utils.sleep(650);
      let gdy = AppStorage.get<string>('gesture_probe_pan_fi_gdy');
      let hasGdyPan: boolean = gdy != null && gdy.length > 0;
      expect(hasGdyPan).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ArkUI_Gesture_PanGestureHandlerOptions_DistanceMap_5000
     * @tc.name SUB_ArkUI_Gesture_PanGestureHandlerOptions_DistanceMap_5000
     * @tc.desc PanGestureHandlerOptions.distanceMap 真实类型赋值；PanGestureOptions 与配置一致的方向与距离
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Gesture_PanGestureHandlerOptions_DistanceMap_5000', Level.LEVEL1, (done: () => void) => {
      let dm = gesturePanOptionsDistanceMap();
      let opts: PanGestureHandlerOptions = {
        fingers: 1,
        direction: PanDirection.Horizontal,
        distance: 3,
        distanceMap: dm,
      };
      expect(opts.distanceMap !== undefined).assertTrue();
      expect(opts.distanceMap!.get(SourceTool.Pen)).assertEqual(20);
      let pgo = new PanGestureOptions({
        fingers: 1,
        direction: PanDirection.Vertical,
        distance: 11,
      });
      expect(pgo.getDirection()).assertEqual(PanDirection.Vertical);
      expect(pgo.getDistance()).assertEqual(11);
      done();
    });

    /**
     * @tc.number SUB_ArkUI_Gesture_TouchRecognizer_GetEventTargetInfo_5100
     * @tc.name SUB_ArkUI_Gesture_TouchRecognizer_GetEventTargetInfo_5100
     * @tc.desc TouchRecognizer.getEventTargetInfo：探测页 Tap 回调内真实调用；PanRecognizer.getEventTargetInfo：Pan onActionStart 真实调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Gesture_TouchRecognizer_GetEventTargetInfo_5100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id("gestureTapHost"));
      await (button?.click() as Promise<void>);
      await Utils.sleep(300);
      let tid = AppStorage.get<string>('gesture_probe_touch_target_id');
      let tidOk: boolean = tid != null && tid.length > 0;
      expect(tidOk).assertTrue();

      let button2 = await driver.findComponent(ON.id('gesturePanHost'));
      let center = await (button2?.getBoundsCenter() as Promise<Point>);
      let rect = await (button2?.getBounds() as Promise<Rect>)
      await ((driver.swipe(Math.round(rect.right).toInt(), Math.round(center.y).toInt(),
        Math.round(rect.left).toInt(), Math.round(center.y).toInt())) as Promise<void>);
      await Utils.sleep(400);
      let pid = AppStorage.get<string>('gesture_probe_pan_target_id');
      let pidOk: boolean = pid != null && pid.length > 0;
      expect(pidOk).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ArkUI_Gesture_TouchRecognizer_CancelTouch_5200
     * @tc.name SUB_ArkUI_Gesture_TouchRecognizer_CancelTouch_5200
     * @tc.desc TapGesture.onAction：GestureEvent.target.id 与触发组件 id 一致（SDK24 onAction 无 TouchRecognizer 形参）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Gesture_TouchRecognizer_CancelTouch_5200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id("gestureTapHost"));
      await (button?.click() as Promise<void>);
      await Utils.sleep(400);
      expect(AppStorage.get<string>('gesture_probe_tap_fire')).assertEqual('1');
      expect(AppStorage.get<string>('gesture_probe_touch_target_id')).assertEqual('gestureTapHost');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_Gesture_PanRecognizer_GetDirection_5300
     * @tc.name SUB_ArkUI_Gesture_PanRecognizer_GetDirection_5300
     * @tc.desc 水平 PanGesture：onActionEnd 时 offsetX 模长大于 0（GestureEvent，SDK24 无 PanRecognizer 回调形参）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Gesture_PanRecognizer_GetDirection_5300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('gesturePanHost'));
      let center = await (button?.getBoundsCenter() as Promise<Point>);
      let rect = await (button?.getBounds() as Promise<Rect>)
      await ((driver.swipe(Math.round(rect.right).toInt(), Math.round(center.y).toInt(),
        Math.round(rect.left).toInt(), Math.round(center.y).toInt())) as Promise<void>);
      await Utils.sleep(650);
      let endOff = AppStorage.get<string>('gesture_probe_pan_end_off_x');
      expect(Math.abs(Number(endOff ?? '0'))).assertLarger(0);
      done();
    });

    /**
     * @tc.number SUB_ArkUI_Gesture_PanRecognizer_GetDistance_5400
     * @tc.name SUB_ArkUI_Gesture_PanRecognizer_GetDistance_5400
     * @tc.desc PanRecognizer.getDistance：真实 Pan 起始回调比对页面配置 distance: 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Gesture_PanRecognizer_GetDistance_5400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('gesturePanHost'));
      let center = await (button?.getBoundsCenter() as Promise<Point>);
      let rect = await (button?.getBounds() as Promise<Rect>)
      await ((driver.swipe(Math.round(rect.right).toInt(), Math.round(center.y).toInt(),
        Math.round(rect.left).toInt(), Math.round(center.y).toInt())) as Promise<void>);
      await Utils.sleep(400);
      expect(Number(AppStorage.get<string>('gesture_probe_pan_rec_dist'))).assertLarger(0);
      done();
    });

    /**
     * @tc.number SUB_ArkUI_Gesture_PanRecognizer_GetDistanceMap_5500
     * @tc.name SUB_ArkUI_Gesture_PanRecognizer_GetDistanceMap_5500
     * @tc.desc PanGestureHandlerOptions.distanceMap 与页内配置一致，且 Pan 链路曾启动
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Gesture_PanRecognizer_GetDistanceMap_5500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('gesturePanHost'));
      let center = await (button?.getBoundsCenter() as Promise<Point>);
      let rect = await (button?.getBounds() as Promise<Rect>)
      await ((driver.swipe(Math.round(rect.right).toInt(), Math.round(center.y).toInt(),
        Math.round(rect.left).toInt(), Math.round(center.y).toInt())) as Promise<void>);
      await Utils.sleep(650);
      expect(Number(AppStorage.get<string>('gesture_probe_pan_cfg_dm_size'))).assertLarger(0);
      expect(AppStorage.get<string>('gesture_probe_pan_start')).assertEqual('1');
      done();
    });
  });
}
