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

export default function commonMethodMouseResponseRegionNullAndUndefinedTest() {
  describe('commonMethodMouseResponseRegionNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("commonMethodMouseResponseRegionNullAndUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonMethod/mouseResponseRegionNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get commonMethodMouseResponseRegionNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("mouseResponseRegionNullAndUndefined" == pages.name)) {
          console.info("get commonMethodMouseResponseRegionNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push commonMethodMouseResponseRegionNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push commonMethodMouseResponseRegionNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("commonMethodMouseResponseRegionNullAndUndefinedTest after each called");
    });

    /**
     * @tc.name   commonMethodMouseResponseRegionNullV1001
     * @tc.number SUB_ARKUI_COMMONMETHOD_MOUSERESPONSEREGION_PARAM_001
     * @tc.desc   Test CommonMethod mouseResponseRegion with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commonMethodMouseResponseRegionNullV1001', Level.LEVEL0, async () => {
      console.info('[commonMethodMouseResponseRegionNullV1001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('testNullBtn');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[commonMethodMouseResponseRegionNullV1001] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[commonMethodMouseResponseRegionNullV1001] mouseResponseRegion is: " + JSON.stringify(obj.$attrs.mouseResponseRegion));
      expect(JSON.stringify(obj.$attrs.mouseResponseRegion)).assertEqual('[]');
      console.info('[commonMethodMouseResponseRegionNullV1001] END');
    });

    /**
     * @tc.name   commonMethodMouseResponseRegionUndefinedV1002
     * @tc.number SUB_ARKUI_COMMONMETHOD_MOUSERESPONSEREGION_PARAM_002
     * @tc.desc   Test CommonMethod mouseResponseRegion with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commonMethodMouseResponseRegionUndefinedV1002', Level.LEVEL0, async () => {
      console.info('[commonMethodMouseResponseRegionUndefinedV1002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('testUndefinedBtn');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[commonMethodMouseResponseRegionUndefinedV1002] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[commonMethodMouseResponseRegionUndefinedV1002] mouseResponseRegion is: " + JSON.stringify(obj.$attrs.mouseResponseRegion));
      expect(JSON.stringify(obj.$attrs.mouseResponseRegion)).assertEqual('[]');
      console.info('[commonMethodMouseResponseRegionUndefinedV1002] END');
    });
  })
}
