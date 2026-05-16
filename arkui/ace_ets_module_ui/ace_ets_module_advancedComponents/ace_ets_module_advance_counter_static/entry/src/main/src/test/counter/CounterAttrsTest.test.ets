'use static';
/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import Utils from '../../../ets/MainAbility/common/Utils';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function CounterAttrsTest() {
  describe('CounterAttrsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("CounterAttrsTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.animation20.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("CounterAttrsTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/counter/CounterAttrsPage",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CounterAttrsTest state pages:" + JSON.stringify(pages));
        if (!("CounterAttrsPage" == pages.name)) {
          console.info("get CounterAttrsTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push CounterAttrsTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CounterAttrsTest page error:" + err);
      }
      console.info("CounterAttrsTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("CounterAttrsTest after each called");
    });
     
    /**
     * @tc.number   CounterAttrsTest_static_001
     * @tc.name     CounterAttrsTest_static_001
     * @tc.desc     test direction Direction.Rtl
     * @tc.level    Level.LEVEL0
     */
    it('CounterAttrsTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[CounterAttrsTest_static_001] START');
      await CommonFunc.sleep(1000);

      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      .getArray("$children")[0]
      .getArray('$children')[0]
      .getArray('$children')[0]

      console.info("[CounterAttrsTest_static_001] component btn0.attrs.direction is: " + JSON.stringify(btn0.getElement('$attrs').getString('direction')));
      expect(btn0.getElement('$attrs').getString('direction')).assertEqual('Direction.Rtl');
      await CommonFunc.sleep(1000);
      console.info('[CounterAttrsTest_static_001] END');
      done();
    });

    /**
     * @tc.number   CounterAttrsTest_static_002
     * @tc.name     CounterAttrsTest_static_002
     * @tc.desc     test direction Direction.Ltr
     * @tc.level    Level.LEVEL0
     */
    it('CounterAttrsTest_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[CounterAttrsTest_static_002] START');
      await CommonFunc.sleep(1000);

      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      .getArray("$children")[0]
      .getArray('$children')[1]
      .getArray('$children')[0]
      .getArray('$children')[0]

      console.info("[CounterAttrsTest_static_002] component btn0.attrs.direction is: " + JSON.stringify(btn0.getElement('$attrs').getString('direction')));
      expect(btn0.getElement('$attrs').getString('direction')).assertEqual('Direction.Ltr');
      await CommonFunc.sleep(1000);
      console.info('[CounterAttrsTest_static_002] END');
      done();
    });

    /**
     * @tc.number   CounterAttrsTest_static_003
     * @tc.name     CounterAttrsTest_static_003
     * @tc.desc     test direction Direction.Auto
     * @tc.level    Level.LEVEL0
     */
    it('CounterAttrsTest_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[CounterAttrsTest_static_003] START');
      await CommonFunc.sleep(1000);

      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      .getArray("$children")[0]
      .getArray('$children')[2]
      .getArray('$children')[0]

      console.info("[CounterAttrsTest_static_003] component btn0.attrs.direction is: " + JSON.stringify(btn0.getElement('$attrs').getString('direction')));
      expect(btn0.getElement('$attrs').getString('direction')).assertEqual('Direction.Auto');
      await CommonFunc.sleep(1000);
      console.info('[CounterAttrsTest_static_003] END');
      done();
    });

    /**
     * @tc.number   CounterAttrsTest_static_004
     * @tc.name     CounterAttrsTest_static_004
     * @tc.desc     test direction undefined
     * @tc.level    Level.LEVEL0
     */
    it('CounterAttrsTest_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[CounterAttrsTest_static_004] START');
      await CommonFunc.sleep(1000);

      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      .getArray("$children")[0]
      .getArray('$children')[3]
      .getArray('$children')[0]

      console.info("[CounterAttrsTest_static_004] component btn0.attrs.direction is: " + JSON.stringify(btn0.getElement('$attrs').getString('direction')));
      expect(btn0.getElement('$attrs').getString('direction')).assertEqual('Direction.Auto');
      await CommonFunc.sleep(1000);
      console.info('[CounterAttrsTest_static_004] END');
      done();
    });

    /**
     * @tc.number   CounterAttrsTest_static_005
     * @tc.name     CounterAttrsTest_static_005
     * @tc.desc     test year month day undefined
     * @tc.level    Level.LEVEL0
     */
    it('CounterAttrsTest_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[CounterAttrsTest_static_005] START');
      await CommonFunc.sleep(1000);
      //[n2] 0001年 [n0]
      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      .getArray("$children")[0]
      .getArray('$children')[4]
      .getArray('$children')[0]
      .getArray('$children')[0]
      .getArray('$children')[0]
      //[n2] 一月 [n0]
      let btn1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      .getArray("$children")[0]
      .getArray('$children')[4]
      .getArray('$children')[0]
      .getArray('$children')[0]
      .getArray('$children')[2]
      //[n2] 一日 [n0]
      let btn2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      .getArray("$children")[0]
      .getArray('$children')[4]
      .getArray('$children')[0]
      .getArray('$children')[0]
      .getArray('$children')[4]

      console.info("[CounterAttrsTest_static_005] component btn0.attrs.year is: " + JSON.stringify(btn0.getElement('$attrs').getString('accessibilityText')));
      expect(btn0.getElement('$attrs').getString('accessibilityText')).assertContain('0001年');

      console.info("[CounterAttrsTest_static_005] component btn1.attrs.month is: " + JSON.stringify(btn1.getElement('$attrs').getString('accessibilityText')));
      expect(btn1.getElement('$attrs').getString('accessibilityText')).assertContain('一月');

      console.info("[CounterAttrsTest_static_005] component btn2.attrs.day is: " + JSON.stringify(btn2.getElement('$attrs').getString('accessibilityText')));
      expect(btn2.getElement('$attrs').getString('accessibilityText')).assertContain('一日');
      await CommonFunc.sleep(1000);
      console.info('[CounterAttrsTest_static_005] END');
      done();
    });

    /**
     * @tc.number   CounterAttrsTest_static_006
     * @tc.name     CounterAttrsTest_static_006
     * @tc.desc     test year month day 2024/03/18
     * @tc.level    Level.LEVEL0
     */
    it('CounterAttrsTest_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[CounterAttrsTest_static_006] START');
      await CommonFunc.sleep(1000);
      //[n2] 2025年 [n0]
      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      .getArray("$children")[0]
      .getArray('$children')[3]
      .getArray('$children')[0]
      .getArray('$children')[0]
      .getArray('$children')[0]
      //[n2] 三月 [n0]
      let btn1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      .getArray("$children")[0]
      .getArray('$children')[3]
      .getArray('$children')[0]
      .getArray('$children')[0]
      .getArray('$children')[2]
      //[n2] 十八日 [n0]
      let btn2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      .getArray("$children")[0]
      .getArray('$children')[3]
      .getArray('$children')[0]
      .getArray('$children')[0]
      .getArray('$children')[4]

      console.info("[CounterAttrsTest_static_006] component btn0.attrs.year is: " + JSON.stringify(btn0.getElement('$attrs').getString('accessibilityText')));
      expect(btn0.getElement('$attrs').getString('accessibilityText')).assertContain('2025年');

      console.info("[CounterAttrsTest_static_006] component btn1.attrs.month is: " + JSON.stringify(btn1.getElement('$attrs').getString('accessibilityText')));
      expect(btn1.getElement('$attrs').getString('accessibilityText')).assertContain('三月');

      console.info("[CounterAttrsTest_static_006] component btn2.attrs.day is: " + JSON.stringify(btn2.getElement('$attrs').getString('accessibilityText')));
      expect(btn2.getElement('$attrs').getString('accessibilityText')).assertContain('十八日');
      await CommonFunc.sleep(1000);
      console.info('[CounterAttrsTest_static_006] END');
      done();
    });

    /**
     * @tc.number   CounterAttrsTest_static_007
     * @tc.name     CounterAttrsTest_static_007
     * @tc.desc     test focusable true
     * @tc.level    Level.LEVEL0
     */
    it('CounterAttrsTest_static_007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[CounterAttrsTest_static_007] START');
      await CommonFunc.sleep(1000);

      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      .getArray("$children")[0]
      .getArray('$children')[0]
      .getArray('$children')[0]

      console.info("[CounterAttrsTest_static_007] component btn0.attrs.focusable is: " + JSON.stringify(btn0.getElement('$attrs').getBoolean('focusable')));
      expect(btn0.getElement('$attrs').getBoolean('focusable')).assertEqual(true);
      await CommonFunc.sleep(1000);
      console.info('[CounterAttrsTest_static_007] END');
      done();
    });

    /**
     * @tc.number   CounterAttrsTest_static_008
     * @tc.name     CounterAttrsTest_static_008
     * @tc.desc     test focusable false
     * @tc.level    Level.LEVEL0
     */
    it('CounterAttrsTest_static_008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[CounterAttrsTest_static_008] START');
      await CommonFunc.sleep(1000);

      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      .getArray("$children")[0]
      .getArray('$children')[5]
      .getArray('$children')[0]

      console.info("[CounterAttrsTest_static_008] component btn0.attrs.focusable is: " + JSON.stringify(btn0.getElement('$attrs').getBoolean('focusable')));
      expect(btn0.getElement('$attrs').getBoolean('focusable')).assertEqual(false);
      await CommonFunc.sleep(1000);
      console.info('[CounterAttrsTest_static_008] END');
      done();
    });

    /**
     * @tc.number   CounterAttrsTest_static_009
     * @tc.name     CounterAttrsTest_static_009
     * @tc.desc     test focusable undefined
     * @tc.level    Level.LEVEL0
     */
    it('CounterAttrsTest_static_009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[CounterAttrsTest_static_009] START');
      await CommonFunc.sleep(1000);

      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      .getArray("$children")[0]
      .getArray('$children')[6]
      .getArray('$children')[0]

      console.info("[CounterAttrsTest_static_009] component btn0.attrs.focusable is: " + JSON.stringify(btn0.getElement('$attrs').getBoolean('focusable')));
      expect(btn0.getElement('$attrs').getBoolean('focusable')).assertEqual(true);
      await CommonFunc.sleep(1000);
      console.info('[CounterAttrsTest_static_009] END');
      done();
    });

  })
}