/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function commonMethodBackgroundNullAndUndefinedTest() {
  describe('commonMethodBackgroundNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("commonMethodBackgroundNullAndUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonMethod/backgroundNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get commonMethodBackgroundNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("backgroundNullAndUndefined" == pages.name)) {
          console.info("get commonMethodBackgroundNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push commonMethodBackgroundNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push commonMethodBackgroundNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("commonMethodBackgroundNullAndUndefinedTest after each called");
    });

    /**
     * @tc.name   commonMethodBackgroundNullFirstV1001
     * @tc.number SUB_ARKUI_COMMONMETHOD_BACKGROUND_PARAM_001
     * @tc.desc   Test CommonMethod background with null first parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commonMethodBackgroundNullFirstV1001', Level.LEVEL0, async () => {
      console.info('[commonMethodBackgroundNullFirstV1001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('testNullFirstBtn');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[commonMethodBackgroundNullFirstV1001] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[commonMethodBackgroundNullFirstV1001] background is: " + JSON.stringify(obj.$attrs.background));
      expect(obj.$attrs.background).assertEqual(undefined);
      console.info('[commonMethodBackgroundNullFirstV1001] END');
    });

    /**
     * @tc.name   commonMethodBackgroundUndefinedFirstV1002
     * @tc.number SUB_ARKUI_COMMONMETHOD_BACKGROUND_PARAM_002
     * @tc.desc   Test CommonMethod background with undefined first parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commonMethodBackgroundUndefinedFirstV1002', Level.LEVEL0, async () => {
      console.info('[commonMethodBackgroundUndefinedFirstV1002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('testUndefinedFirstBtn');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[commonMethodBackgroundUndefinedFirstV1002] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[commonMethodBackgroundUndefinedFirstV1002] background is: " + JSON.stringify(obj.$attrs.background));
      expect(obj.$attrs.background).assertEqual(undefined);
      console.info('[commonMethodBackgroundUndefinedFirstV1002] END');
    });

    /**
     * @tc.name   commonMethodBackgroundNullSecondV1003
     * @tc.number SUB_ARKUI_COMMONMETHOD_BACKGROUND_PARAM_003
     * @tc.desc   Test CommonMethod background with null second parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commonMethodBackgroundNullSecondV1003', Level.LEVEL0, async () => {
      console.info('[commonMethodBackgroundNullSecondV1003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('testNullSecondBtn');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[commonMethodBackgroundNullSecondV1003] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[commonMethodBackgroundNullSecondV1003] background is: " + JSON.stringify(obj.$attrs.background));
      expect(obj.$attrs.background).assertEqual(undefined);
      console.info('[commonMethodBackgroundNullSecondV1003] END');
    });

    /**
     * @tc.name   commonMethodBackgroundUndefinedSecondV1004
     * @tc.number SUB_ARKUI_COMMONMETHOD_BACKGROUND_PARAM_004
     * @tc.desc   Test CommonMethod background with undefined second parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commonMethodBackgroundUndefinedSecondV1004', Level.LEVEL0, async () => {
      console.info('[commonMethodBackgroundUndefinedSecondV1004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('testUndefinedSecondBtn');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[commonMethodBackgroundUndefinedSecondV1004] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[commonMethodBackgroundUndefinedSecondV1004] background is: " + JSON.stringify(obj.$attrs.background));
      expect(obj.$attrs.background).assertEqual(undefined);
      console.info('[commonMethodBackgroundUndefinedSecondV1004] END');
    });

    /**
     * @tc.name   commonMethodBackgroundEmptyArrayV1005
     * @tc.number SUB_ARKUI_COMMONMETHOD_BACKGROUND_PARAM_005
     * @tc.desc   Test CommonMethod background with empty array ignoresLayoutSafeAreaEdges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commonMethodBackgroundEmptyArrayV1005', Level.LEVEL0, async () => {
      console.info('[commonMethodBackgroundEmptyArrayV1005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('testEmptyArrayBtn');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[commonMethodBackgroundEmptyArrayV1005] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[commonMethodBackgroundEmptyArrayV1005] background is: " + JSON.stringify(obj.$attrs.background));
      expect(obj.$attrs.background).assertEqual(undefined);
      console.info('[commonMethodBackgroundEmptyArrayV1005] END');
    });
  })
}
