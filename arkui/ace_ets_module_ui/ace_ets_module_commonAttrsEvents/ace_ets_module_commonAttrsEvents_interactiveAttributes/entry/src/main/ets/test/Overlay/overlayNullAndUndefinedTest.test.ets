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

export default function commonMethodOverlayNullAndUndefinedTest() {
  describe('commonMethodOverlayNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("commonMethodOverlayNullAndUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonMethod/overlayNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get commonMethodOverlayNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("overlayNullAndUndefined" == pages.name)) {
          console.info("get commonMethodOverlayNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push commonMethodOverlayNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push commonMethodOverlayNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("commonMethodOverlayNullAndUndefinedTest after each called");
    });

    /**
     * @tc.name   commonMethodOverlayNullV1001
     * @tc.number SUB_ARKUI_COMMONMETHOD_OVERLAY_PARAM_001
     * @tc.desc   Test CommonMethod overlay with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commonMethodOverlayNullV1001', Level.LEVEL0, async () => {
      console.info('[commonMethodOverlayNullV1001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('testNullBtn');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[commonMethodOverlayNullV1001] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[commonMethodOverlayNullV1001] overlay is: " + JSON.stringify(obj.$attrs.overlay));
      expect(obj.$attrs.overlay.title).assertEqual('');
      console.info('[commonMethodOverlayNullV1001] END');
    });

    /**
     * @tc.name   commonMethodOverlayUndefinedV1002
     * @tc.number SUB_ARKUI_COMMONMETHOD_OVERLAY_PARAM_002
     * @tc.desc   Test CommonMethod overlay with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commonMethodOverlayUndefinedV1002', Level.LEVEL0, async () => {
      console.info('[commonMethodOverlayUndefinedV1002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('testUndefinedBtn');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[commonMethodOverlayUndefinedV1002] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[commonMethodOverlayUndefinedV1002] overlay is: " + JSON.stringify(obj.$attrs.overlay));
      expect(obj.$attrs.overlay.title).assertEqual('');
      console.info('[commonMethodOverlayUndefinedV1002] END');
    });
  })
}
