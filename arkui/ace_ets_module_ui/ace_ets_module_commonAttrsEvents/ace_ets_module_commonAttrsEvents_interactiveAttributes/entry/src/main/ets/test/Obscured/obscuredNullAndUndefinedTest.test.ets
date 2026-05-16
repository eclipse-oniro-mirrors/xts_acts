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

export default function obscuredNullAndUndefinedTest() {
  describe('obscuredNullAndUndefinedTest', () => {
    beforeEach(async () => {
      console.info("obscuredNullAndUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonMethod/obscuredNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get obscuredNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("obscuredNullAndUndefined" == pages.name)) {
          console.info("get obscuredNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push obscuredNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push obscuredNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   obscuredNullV10001
     * @tc.number SUB_ARKUI_COMMONMETHOD_OBSCURED_PARAM_001
     * @tc.desc   Test obscured with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('obscuredNullV10001', Level.LEVEL0, async () => {
      console.info('[obscuredNullV10001] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('btnObscuredNull');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[obscuredNullV10001] result: " + JSON.stringify(obj.$attrs.obscured));
      expect(JSON.stringify(obj.$attrs.obscured)).assertEqual('[]');
      console.info('[obscuredNullV10001] END');
    });

    /**
     * @tc.name   obscuredUndefinedV10002
     * @tc.number SUB_ARKUI_COMMONMETHOD_OBSCURED_PARAM_002
     * @tc.desc   Test obscured with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('obscuredUndefinedV10002', Level.LEVEL0, async () => {
      console.info('[obscuredUndefinedV10002] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('btnObscuredUndefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[obscuredUndefinedV10002] result: " + JSON.stringify(obj.$attrs.obscured));
      expect(JSON.stringify(obj.$attrs.obscured)).assertEqual('[]');
      console.info('[obscuredUndefinedV10002] END');
    });
  })
}
