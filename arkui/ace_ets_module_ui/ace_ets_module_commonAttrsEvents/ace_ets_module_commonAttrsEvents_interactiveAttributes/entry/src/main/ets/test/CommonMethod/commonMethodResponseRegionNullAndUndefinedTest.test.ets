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

export default function commonMethodResponseRegionNullAndUndefinedTest() {
  describe('commonMethodResponseRegionNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("commonMethodResponseRegionNullAndUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonMethod/responseRegionNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get commonMethodResponseRegionNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("responseRegionNullAndUndefined" == pages.name)) {
          console.info("get commonMethodResponseRegionNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push commonMethodResponseRegionNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push commonMethodResponseRegionNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("commonMethodResponseRegionNullAndUndefinedTest after each called");
    });

    /**
     * @tc.name   commonMethodResponseRegionNullV1001
     * @tc.number SUB_ARKUI_COMMONMETHOD_RESPONSEREGION_PARAM_001
     * @tc.desc   Test CommonMethod responseRegion with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commonMethodResponseRegionNullV1001', Level.LEVEL0, async () => {
      console.info('[commonMethodResponseRegionNullV1001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('testNullBtn');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[commonMethodResponseRegionNullV1001] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[commonMethodResponseRegionNullV1001] responseRegion is: " + JSON.stringify(obj.$attrs.responseRegion));
      expect(JSON.stringify(obj.$attrs.responseRegion)).assertEqual('[]');
      console.info('[commonMethodResponseRegionNullV1001] END');
    });

    /**
     * @tc.name   commonMethodResponseRegionUndefinedV1002
     * @tc.number SUB_ARKUI_COMMONMETHOD_RESPONSEREGION_PARAM_002
     * @tc.desc   Test CommonMethod responseRegion with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commonMethodResponseRegionUndefinedV1002', Level.LEVEL0, async () => {
      console.info('[commonMethodResponseRegionUndefinedV1002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('testUndefinedBtn');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[commonMethodResponseRegionUndefinedV1002] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[commonMethodResponseRegionUndefinedV1002] responseRegion is: " + JSON.stringify(obj.$attrs.responseRegion));
      expect(JSON.stringify(obj.$attrs.responseRegion)).assertEqual('[]');
      console.info('[commonMethodResponseRegionUndefinedV1002] END');
    });
  })
}
