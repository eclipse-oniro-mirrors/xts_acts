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

export default function commonMethodResponseRegionListNullAndUndefinedTest() {
  describe('commonMethodResponseRegionListNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("commonMethodResponseRegionListNullAndUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonMethod/responseRegionListNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get commonMethodResponseRegionListNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("responseRegionListNullAndUndefined" == pages.name)) {
          console.info("get commonMethodResponseRegionListNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push commonMethodResponseRegionListNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push commonMethodResponseRegionListNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("commonMethodResponseRegionListNullAndUndefinedTest after each called");
    });

    /**
     * @tc.name   commonMethodResponseRegionListNullV1001
     * @tc.number SUB_ARKUI_COMMONMETHOD_RESPONSEREGIONLIST_PARAM_001
     * @tc.desc   Test CommonMethod responseRegionList with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commonMethodResponseRegionListNullV1001', Level.LEVEL0, async () => {
      console.info('[commonMethodResponseRegionListNullV1001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('testNullBtn');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[commonMethodResponseRegionListNullV1001] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[commonMethodResponseRegionListNullV1001] responseRegionList is: " + JSON.stringify(obj.$attrs.responseRegionList));
      expect(JSON.stringify(obj.$attrs.responseRegionList)).assertEqual(undefined);
      console.info('[commonMethodResponseRegionListNullV1001] END');
    });

    /**
     * @tc.name   commonMethodResponseRegionListUndefinedV1002
     * @tc.number SUB_ARKUI_COMMONMETHOD_RESPONSEREGIONLIST_PARAM_002
     * @tc.desc   Test CommonMethod responseRegionList with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commonMethodResponseRegionListUndefinedV1002', Level.LEVEL0, async () => {
      console.info('[commonMethodResponseRegionListUndefinedV1002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('testUndefinedBtn');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[commonMethodResponseRegionListUndefinedV1002] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[commonMethodResponseRegionListUndefinedV1002] responseRegionList is: " + JSON.stringify(obj.$attrs.responseRegionList));
      expect(JSON.stringify(obj.$attrs.responseRegionList)).assertEqual(undefined);
      console.info('[commonMethodResponseRegionListUndefinedV1002] END');
    });

    /**
     * @tc.name   commonMethodResponseRegionListEmptyArrayV1003
     * @tc.number SUB_ARKUI_COMMONMETHOD_RESPONSEREGIONLIST_PARAM_003
     * @tc.desc   Test CommonMethod responseRegionList with empty array parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commonMethodResponseRegionListEmptyArrayV1003', Level.LEVEL0, async () => {
      console.info('[commonMethodResponseRegionListEmptyArrayV1003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('testEmptyArrayBtn');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[commonMethodResponseRegionListEmptyArrayV1003] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[commonMethodResponseRegionListEmptyArrayV1003] responseRegionList is: " + JSON.stringify(obj.$attrs.responseRegionList));
      expect(JSON.stringify(obj.$attrs.responseRegionList)).assertEqual(undefined);
      console.info('[commonMethodResponseRegionListEmptyArrayV1003] END');
    });
  })
}
