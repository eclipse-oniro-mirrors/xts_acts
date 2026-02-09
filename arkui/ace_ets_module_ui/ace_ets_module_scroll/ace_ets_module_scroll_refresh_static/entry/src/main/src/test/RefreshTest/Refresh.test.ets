/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static'

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import { UIAbility, Want } from '@kit.AbilityKit';
import { abilityDelegatorRegistry, Driver, ON, MouseButton, MatchPattern, UiDirection } from '@kit.TestKit';
import inspector from '@ohos.arkui.inspector';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
import CommonFunc from '../../../ets/MainAbility/common/Common';

let want: Want;
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function refreshTest() {
  describe('ActsRefreshTest', () => {
    beforeAll(() => {
      console.info("TextLineSpacingTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.refresh.static", "EntryAbility");
    })
    beforeEach(() => {
      console.info("TextLineSpacingTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Refresh/refresh',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextLineSpacingTest state pages: " + JSON.stringify(pages));
        if (!("TextLineSpacing" == pages.name)) {
          console.info("get TextLineSpacingTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error("push TextLineSpacingTest page error: " + err);
        expect().assertFail();
      }
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number test_pullUpToCancelRefresh_001
     * @tc.name   test_pullUpToCancelRefresh_001
     * @tc.desc   Set the value to true and return true.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_pullUpToCancelRefresh_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let oriBtn = await driver.findComponent(ON.id('valueTrue'));
      await (oriBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      expect(JSON.parseJsonElement(inspector.getInspectorByKey('noRefresh'))
        .getElement('$attrs')
        .getBoolean('pullUpToCancelRefresh')).assertEqual(true);
      done();
    })

    /**
     * @tc.number test_pullUpToCancelRefresh_002
     * @tc.name   test_pullUpToCancelRefresh_002
     * @tc.desc   Set the value to false and return false.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_pullUpToCancelRefresh_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let oriBtn = await driver.findComponent(ON.id('valueFalse'));
      await (oriBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      expect(JSON.parseJsonElement(inspector.getInspectorByKey('noRefresh'))
        .getElement('$attrs')
        .getBoolean('pullUpToCancelRefresh')).assertEqual(false);
      done();
    });

    /**
     * @tc.number test_pullUpToCancelRefresh_003
     * @tc.name   test_pullUpToCancelRefresh_003
     * @tc.desc   Set the value to undefined and return true.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_pullUpToCancelRefresh_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let oriBtn = await driver.findComponent(ON.id('valueUnde'));
      await (oriBtn?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      expect(JSON.parseJsonElement(inspector.getInspectorByKey('noRefresh'))
        .getElement('$attrs')
        .getBoolean('pullUpToCancelRefresh')).assertEqual(true);
      done();
    });

    /**
     * @tc.number test_pullUpToCancelRefreshModifier_004
     * @tc.name   test_pullUpToCancelRefreshModifier_004
     * @tc.desc   Set the value to true and return true.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_pullUpToCancelRefreshModifier_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let oriBt = await driver.findComponent(ON.id('modifier'));
      await (oriBt?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let oriBtn = await driver.findComponent(ON.id('valueTrue'));
      await (oriBtn?.click() as Promise<void>);
      expect(JSON.parseJsonElement(inspector.getInspectorByKey('noRefresh'))
        .getElement('$attrs')
        .getBoolean('pullToRefresh')).assertEqual(true);
      done();
    })

    /**
     * @tc.number test_pullUpToCancelRefreshModifier_005
     * @tc.name   test_pullUpToCancelRefreshModifier_005
     * @tc.desc   Set the value to undefined and return true.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_pullUpToCancelRefreshModifier_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      let oriBt = await driver.findComponent(ON.id('modifier'));
      await (oriBt?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let oriBtn = await driver.findComponent(ON.id('valueUnde'));
      await (oriBtn?.click() as Promise<void>);
      expect(JSON.parseJsonElement(inspector.getInspectorByKey('noRefresh'))
        .getElement('$attrs')
        .getBoolean('pullToRefresh')).assertEqual(true);
      done();
    })
  })
}