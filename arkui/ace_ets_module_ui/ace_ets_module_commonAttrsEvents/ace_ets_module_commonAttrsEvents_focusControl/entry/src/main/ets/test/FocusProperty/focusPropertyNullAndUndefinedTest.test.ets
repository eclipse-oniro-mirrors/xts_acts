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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function focusPropertyNullAndUndefined() {
  describe('focusPropertyNullAndUndefined', () => {
    beforeAll(async () => {
      console.info("focusPropertyNullAndUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FocusProperty/FocusPropertyNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get focusPropertyNullAndUndefined state success " + JSON.stringify(pages));
        if (!("FocusPropertyNullAndUndefined" == pages.name)) {
          console.info("get focusPropertyNullAndUndefined state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push focusPropertyNullAndUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push focusPropertyNullAndUndefined page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("focusPropertyNullAndUndefined after each called");
    });

    /**
     * @tc.name   focusBoxNullV12001
     * @tc.number SUB_ARKUI_FOCUSPROPERTY_PARAM_001
     * @tc.desc   Test focusBox with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('focusBoxNullV12001', Level.LEVEL0, async () => {
      console.info('[focusBoxNullV12001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('focusBoxNullResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[focusBoxNullV12001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('focusBoxNullFocused');
      console.info('[focusBoxNullV12001] END');
    });

    /**
     * @tc.name   focusBoxUndefinedV12002
     * @tc.number SUB_ARKUI_FOCUSPROPERTY_PARAM_002
     * @tc.desc   Test focusBox with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('focusBoxUndefinedV12002', Level.LEVEL0, async () => {
      console.info('[focusBoxUndefinedV12002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('focusBoxUndefinedResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[focusBoxUndefinedV12002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('focusBoxUndefinedFocused');
      console.info('[focusBoxUndefinedV12002] END');
    });

    /**
     * @tc.name   focusScopeIdEmptyV12003
     * @tc.number SUB_ARKUI_FOCUSPROPERTY_PARAM_003
     * @tc.desc   Test focusScopeId with empty parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('focusScopeIdEmptyV12003', Level.LEVEL0, async () => {
      console.info('[focusScopeIdEmptyV12003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('focusScopeIdEmptyResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[focusScopeIdEmptyV12003] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('focusScopeIdEmptyFocused');
      console.info('[focusScopeIdEmptyV12003] END');
    });

    /**
     * @tc.name   focusScopeIdNullV12004
     * @tc.number SUB_ARKUI_FOCUSPROPERTY_PARAM_004
     * @tc.desc   Test focusScopeId with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('focusScopeIdNullV12004', Level.LEVEL0, async () => {
      console.info('[focusScopeIdNullV12004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('focusScopeIdNullResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[focusScopeIdNullV12004] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('focusScopeIdNullFocused');
      console.info('[focusScopeIdNullV12004] END');
    });

    /**
     * @tc.name   focusScopeIdUndefinedV12005
     * @tc.number SUB_ARKUI_FOCUSPROPERTY_PARAM_005
     * @tc.desc   Test focusScopeId with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('focusScopeIdUndefinedV12005', Level.LEVEL0, async () => {
      console.info('[focusScopeIdUndefinedV12005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('focusScopeIdUndefinedResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[focusScopeIdUndefinedV12005] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('focusScopeIdUndefinedFocused');
      console.info('[focusScopeIdUndefinedV12005] END');
    });

    /**
     * @tc.name   focusScopeId14EmptyV14006
     * @tc.number SUB_ARKUI_FOCUSPROPERTY_PARAM_006
     * @tc.desc   Test focusScopeId with API14 and empty parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('focusScopeId14EmptyV14006', Level.LEVEL0, async () => {
      console.info('[focusScopeId14EmptyV14006] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('focusScopeId14EmptyResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[focusScopeId14EmptyV14006] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('focusScopeId14EmptyFocused');
      console.info('[focusScopeId14EmptyV14006] END');
    });

    /**
     * @tc.name   focusScopeId14NullV14007
     * @tc.number SUB_ARKUI_FOCUSPROPERTY_PARAM_007
     * @tc.desc   Test focusScopeId with API14 and null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('focusScopeId14NullV14007', Level.LEVEL0, async () => {
      console.info('[focusScopeId14NullV14007] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('focusScopeId14NullResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[focusScopeId14NullV14007] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('focusScopeId14NullFocused');
      console.info('[focusScopeId14NullV14007] END');
    });

    /**
     * @tc.name   focusScopeId14UndefinedV14008
     * @tc.number SUB_ARKUI_FOCUSPROPERTY_PARAM_008
     * @tc.desc   Test focusScopeId with API14 and undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('focusScopeId14UndefinedV14008', Level.LEVEL0, async () => {
      console.info('[focusScopeId14UndefinedV14008] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('focusScopeId14UndefinedResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[focusScopeId14UndefinedV14008] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('focusScopeId14UndefinedFocused');
      console.info('[focusScopeId14UndefinedV14008] END');
    });

    /**
     * @tc.name   focusScopeId14ArrowStepOutV14009
     * @tc.number SUB_ARKUI_FOCUSPROPERTY_PARAM_009
     * @tc.desc   Test focusScopeId with API14 and arrowStepOut parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('focusScopeId14ArrowStepOutV14009', Level.LEVEL0, async () => {
      console.info('[focusScopeId14ArrowStepOutV14009] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('focusScopeId14ArrowStepOutResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[focusScopeId14ArrowStepOutV14009] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('focusScopeId14ArrowStepOutFocused');
      console.info('[focusScopeId14ArrowStepOutV14009] END');
    });

    /**
     * @tc.name   focusScopePriorityScopeIdEmptyV12010
     * @tc.number SUB_ARKUI_FOCUSPROPERTY_PARAM_010
     * @tc.desc   Test focusScopePriority with empty scopeId parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('focusScopePriorityScopeIdEmptyV12010', Level.LEVEL0, async () => {
      console.info('[focusScopePriorityScopeIdEmptyV12010] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('focusScopePriorityScopeIdEmptyResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[focusScopePriorityScopeIdEmptyV12010] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('focusScopePriorityScopeIdEmptyFocused');
      console.info('[focusScopePriorityScopeIdEmptyV12010] END');
    });

    /**
     * @tc.name   focusScopePriorityScopeIdNullV12011
     * @tc.number SUB_ARKUI_FOCUSPROPERTY_PARAM_011
     * @tc.desc   Test focusScopePriority with null scopeId parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('focusScopePriorityScopeIdNullV12011', Level.LEVEL0, async () => {
      console.info('[focusScopePriorityScopeIdNullV12011] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('focusScopePriorityScopeIdNullResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[focusScopePriorityScopeIdNullV12011] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('focusScopePriorityScopeIdNullFocused');
      console.info('[focusScopePriorityScopeIdNullV12011] END');
    });

    /**
     * @tc.name   focusScopePriorityScopeIdUndefinedV12012
     * @tc.number SUB_ARKUI_FOCUSPROPERTY_PARAM_012
     * @tc.desc   Test focusScopePriority with undefined scopeId parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('focusScopePriorityScopeIdUndefinedV12012', Level.LEVEL0, async () => {
      console.info('[focusScopePriorityScopeIdUndefinedV12012] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('focusScopePriorityScopeIdUndefinedResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[focusScopePriorityScopeIdUndefinedV12012] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('focusScopePriorityScopeIdUndefinedFocused');
      console.info('[focusScopePriorityScopeIdUndefinedV12012] END');
    });

    /**
     * @tc.name   focusScopePriorityPriorityNullV12013
     * @tc.number SUB_ARKUI_FOCUSPROPERTY_PARAM_013
     * @tc.desc   Test focusScopePriority with null priority parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('focusScopePriorityPriorityNullV12013', Level.LEVEL0, async () => {
      console.info('[focusScopePriorityPriorityNullV12013] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('focusScopePriorityPriorityNullResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[focusScopePriorityPriorityNullV12013] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('focusScopePriorityPriorityNullFocused');
      console.info('[focusScopePriorityPriorityNullV12013] END');
    });

    /**
     * @tc.name   focusScopePriorityPriorityUndefinedV12014
     * @tc.number SUB_ARKUI_FOCUSPROPERTY_PARAM_014
     * @tc.desc   Test focusScopePriority with undefined priority parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('focusScopePriorityPriorityUndefinedV12014', Level.LEVEL0, async () => {
      console.info('[focusScopePriorityPriorityUndefinedV12014] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('focusScopePriorityPriorityUndefinedResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[focusScopePriorityPriorityUndefinedV12014] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('focusScopePriorityPriorityUndefinedFocused');
      console.info('[focusScopePriorityPriorityUndefinedV12014] END');
    });
  })
}
