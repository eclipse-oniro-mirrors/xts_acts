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

'use static';

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import { Curve } from '@ohos.arkui.component';

const SLEEP_TIME = 1000;

export default function TabsTest() {
  describe('TabsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TabsTest beforeAll start");
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.tabs.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("TabsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/TabsIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("TabsTest state pages: " + JSON.stringify(pages));
        if (pages.name !== "TabsIndex") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("TabsTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info("TabsTest after each called");
    });

    // ============================================================
    // TabsAttribute.animationCurve - enum coverage start
    // ============================================================

    // ============================================================
    // TabsAttribute.animationCurve
    // ============================================================

    /**
     * @tc.number TabsTest_003
     * @tc.name tabsAnimCurveLinear
     * @tc.desc Test TabsAttribute.animationCurve with Curve.Linear
     */
    it('tabsAnimCurveLinear', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TabsTest execute: tabsAnimCurveLinear START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        // Verify Curve.Linear enum value
        expect(Curve.Linear).assertEqual(0);
        // Verify Tabs component renders with animationCurve(Curve.Linear)
        const driver = Driver.create();
        const comp = await driver.findComponent(ON.id('tabsAnimCurveLinear'));
        expect(!!comp).assertEqual(true);
        // Verify attribute is accessible via inspector
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('tabsAnimCurveLinear'));
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        console.info('TabsTest execute: tabsAnimCurveLinear END');
        done();
      } catch (error) {
        console.error('TabsTest execute: tabsAnimCurveLinear error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TabsTest_004
     * @tc.name tabsAnimCurveEase
     * @tc.desc Test TabsAttribute.animationCurve with Curve.Ease
     */
    it('tabsAnimCurveEase', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TabsTest execute: tabsAnimCurveEase START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(Curve.Ease).assertEqual(1);
        const driver = Driver.create();
        const comp = await driver.findComponent(ON.id('tabsAnimCurveEase'));
        expect(!!comp).assertEqual(true);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('tabsAnimCurveEase'));
        expect(node != null).assertTrue();
        console.info('TabsTest execute: tabsAnimCurveEase END');
        done();
      } catch (error) {
        console.error('TabsTest execute: tabsAnimCurveEase error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TabsTest_005
     * @tc.name tabsAnimCurveEaseIn
     * @tc.desc Test TabsAttribute.animationCurve with Curve.EaseIn
     */
    it('tabsAnimCurveEaseIn', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TabsTest execute: tabsAnimCurveEaseIn START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(Curve.EaseIn).assertEqual(2);
        const driver = Driver.create();
        const comp = await driver.findComponent(ON.id('tabsAnimCurveEaseIn'));
        expect(!!comp).assertEqual(true);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('tabsAnimCurveEaseIn'));
        expect(node != null).assertTrue();
        console.info('TabsTest execute: tabsAnimCurveEaseIn END');
        done();
      } catch (error) {
        console.error('TabsTest execute: tabsAnimCurveEaseIn error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TabsTest_006
     * @tc.name tabsAnimCurveEaseOut
     * @tc.desc Test Curve.EaseOut enum value
     */
    it('tabsAnimCurveEaseOut', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TabsTest execute: tabsAnimCurveEaseOut START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(Curve.EaseOut).assertEqual(3);
        console.info('TabsTest execute: tabsAnimCurveEaseOut END');
        done();
      } catch (error) {
        console.error('TabsTest execute: tabsAnimCurveEaseOut error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TabsTest_007
     * @tc.name tabsAnimCurveUndefined
     * @tc.desc Test TabsAttribute.animationCurve with undefined (resets to default)
     */
    it('tabsAnimCurveUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TabsTest execute: tabsAnimCurveUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const comp = await driver.findComponent(ON.id('tabsAnimCurveUndefined'));
        expect(!!comp).assertEqual(true);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('tabsAnimCurveUndefined'));
        expect(node != null).assertTrue();
        console.info('TabsTest execute: tabsAnimCurveUndefined END');
        done();
      } catch (error) {
        console.error('TabsTest execute: tabsAnimCurveUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    // ============================================================
    // TabsAttribute.onContentDidScroll
    // ============================================================

    /**
     * @tc.number TabsTest_008
     * @tc.name tabsOnContentDidScrollCallback
     * @tc.desc Test TabsAttribute.onContentDidScroll with a callback function
     */
    it('tabsOnContentDidScrollCallback', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TabsTest execute: tabsOnContentDidScrollCallback START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        const comp = await driver.findComponent(ON.id('tabsOnContentDidScroll'));
        expect(!!comp).assertEqual(true);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('tabsOnContentDidScroll'));
        expect(node != null).assertTrue();
        console.info('TabsTest execute: tabsOnContentDidScrollCallback END');
        done();
      } catch (error) {
        console.error('TabsTest execute: tabsOnContentDidScrollCallback error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TabsTest_009
     * @tc.name tabsOnContentDidScrollUndefined
     * @tc.desc Test TabsAttribute.onContentDidScroll with undefined (unbinds callback)
     */
    it('tabsOnContentDidScrollUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TabsTest execute: tabsOnContentDidScrollUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        const driver = Driver.create();
        let comp = await driver.findComponent(ON.id('tabsOnContentDidScrollUndefined'));
        for (let i: number = 0; !comp && i < 4; i++) {
          // Scroll down page to bring bottom Tabs into viewport.
          await Utils.drag(360, 1100, 360, 350, 12);
          await CommonFunc.sleep(300);
          comp = await driver.findComponent(ON.id('tabsOnContentDidScrollUndefined'));
        }
        expect(!!comp).assertEqual(true);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('tabsOnContentDidScrollUndefined'));
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        console.info('TabsTest execute: tabsOnContentDidScrollUndefined END');
        done();
      } catch (error) {
        console.error('TabsTest execute: tabsOnContentDidScrollUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
