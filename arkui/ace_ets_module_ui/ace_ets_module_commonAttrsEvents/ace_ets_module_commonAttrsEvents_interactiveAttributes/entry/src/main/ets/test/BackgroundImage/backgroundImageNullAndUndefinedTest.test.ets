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

export default function backgroundImageNullAndUndefinedTest() {
  describe('backgroundImageNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("backgroundImageNullAndUndefinedTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/BackgroundImage/BackgroundImageNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get backgroundImageNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("BackgroundImageNullAndUndefined" == pages.name)) {
          console.info("get backgroundImageNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push backgroundImageNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push backgroundImageNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("backgroundImageNullAndUndefinedTest after each called");
    });

    /**
     * @tc.name   backgroundImagePositionNullV1001
     * @tc.number SUB_ARKUI_BACKGROUNDIMAGE_PARAM_001
     * @tc.desc   Test backgroundImagePosition with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('backgroundImagePositionNullV1001', Level.LEVEL0, async () => {
      console.info('[backgroundImagePositionNullV1001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('backgroundImagePositionNull');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[backgroundImagePositionNullV1001] backgroundImagePosition is: " + JSON.stringify(obj.$attrs.backgroundImagePosition));
      expect(JSON.stringify(obj.$attrs.backgroundImagePosition)).assertEqual('"{\\"x\\":0,\\"y\\":0}"');
      console.info('[backgroundImagePositionNullV1001] END');
    });

    /**
     * @tc.name   backgroundImagePositionUndefinedV1002
     * @tc.number SUB_ARKUI_BACKGROUNDIMAGE_PARAM_002
     * @tc.desc   Test backgroundImagePosition with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('backgroundImagePositionUndefinedV1002', Level.LEVEL0, async () => {
      console.info('[backgroundImagePositionUndefinedV1002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('backgroundImagePositionUndefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[backgroundImagePositionUndefinedV1002] backgroundImagePosition is: " + JSON.stringify(obj.$attrs.backgroundImagePosition));
      expect(JSON.stringify(obj.$attrs.backgroundImagePosition)).assertEqual('"{\\"x\\":0,\\"y\\":0}"');
      console.info('[backgroundImagePositionUndefinedV1002] END');
    });

    /**
     * @tc.name   backgroundImageResizableNullV1003
     * @tc.number SUB_ARKUI_BACKGROUNDIMAGE_PARAM_003
     * @tc.desc   Test backgroundImageResizable with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('backgroundImageResizableNullV1003', Level.LEVEL0, async () => {
      console.info('[backgroundImageResizableNullV1003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('backgroundImageResizableNull');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[backgroundImageResizableNullV1003] backgroundImageResizable is: " + JSON.stringify(obj.$attrs.backgroundImageResizable));
      expect(JSON.stringify(obj.$attrs.backgroundImageResizable)).assertEqual('"ImageResizableSlice: {left: 0.00px, right: 0.00px, top: 0.00px, bottom: 0.00px}"');
      console.info('[backgroundImageResizableNullV1003] END');
    });

    /**
     * @tc.name   backgroundImageResizableUndefinedV1004
     * @tc.number SUB_ARKUI_BACKGROUNDIMAGE_PARAM_004
     * @tc.desc   Test backgroundImageResizable with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('backgroundImageResizableUndefinedV1004', Level.LEVEL0, async () => {
      console.info('[backgroundImageResizableUndefinedV1004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('backgroundImageResizableUndefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[backgroundImageResizableUndefinedV1004] backgroundImageResizable is: " + JSON.stringify(obj.$attrs.backgroundImageResizable));
      expect(JSON.stringify(obj.$attrs.backgroundImageResizable)).assertEqual('"ImageResizableSlice: {left: 0.00px, right: 0.00px, top: 0.00px, bottom: 0.00px}"');
      console.info('[backgroundImageResizableUndefinedV1004] END');
    });
  })
}
