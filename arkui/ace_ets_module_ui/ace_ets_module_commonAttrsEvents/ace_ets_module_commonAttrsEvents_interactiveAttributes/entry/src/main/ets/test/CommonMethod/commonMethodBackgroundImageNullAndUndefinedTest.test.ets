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

export default function commonMethodBackgroundImageNullAndUndefinedTest() {
  describe('commonMethodBackgroundImageNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("commonMethodBackgroundImageNullAndUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonMethod/backgroundImageNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get commonMethodBackgroundImageNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("backgroundImageNullAndUndefined" == pages.name)) {
          console.info("get commonMethodBackgroundImageNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push commonMethodBackgroundImageNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push commonMethodBackgroundImageNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("commonMethodBackgroundImageNullAndUndefinedTest after each called");
    });

    /**
     * @tc.name   commonMethodBackgroundImageNullFirstV1001
     * @tc.number SUB_ARKUI_COMMONMETHOD_BACKGROUNDIMAGE_PARAM_001
     * @tc.desc   Test CommonMethod backgroundImage with null first parameter (v7-12)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commonMethodBackgroundImageNullFirstV1001', Level.LEVEL0, async () => {
      console.info('[commonMethodBackgroundImageNullFirstV1001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('testOneNullBtn');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[commonMethodBackgroundImageNullFirstV1001] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[commonMethodBackgroundImageNullFirstV1001] backgroundImage is: " + JSON.stringify(obj.$attrs.backgroundImage));
      expect(JSON.stringify(obj.$attrs.backgroundImage)).assertEqual('", ImageRepeat.NoRepeat"');
      console.info('[commonMethodBackgroundImageNullFirstV1001] END');
    });

    /**
     * @tc.name   commonMethodBackgroundImageUndefinedFirstV1002
     * @tc.number SUB_ARKUI_COMMONMETHOD_BACKGROUNDIMAGE_PARAM_002
     * @tc.desc   Test CommonMethod backgroundImage with undefined first parameter (v7-12)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commonMethodBackgroundImageUndefinedFirstV1002', Level.LEVEL0, async () => {
      console.info('[commonMethodBackgroundImageUndefinedFirstV1002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('testOneUndefinedBtn');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[commonMethodBackgroundImageUndefinedFirstV1002] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[commonMethodBackgroundImageUndefinedFirstV1002] backgroundImage is: " + JSON.stringify(obj.$attrs.backgroundImage));
      expect(JSON.stringify(obj.$attrs.backgroundImage)).assertEqual('", ImageRepeat.NoRepeat"');
      console.info('[commonMethodBackgroundImageUndefinedFirstV1002] END');
    });

    /**
     * @tc.name   commonMethodBackgroundImageNullSecondV1003
     * @tc.number SUB_ARKUI_COMMONMETHOD_BACKGROUNDIMAGE_PARAM_003
     * @tc.desc   Test CommonMethod backgroundImage with null second parameter (v7-12)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commonMethodBackgroundImageNullSecondV1003', Level.LEVEL0, async () => {
      console.info('[commonMethodBackgroundImageNullSecondV1003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('testTwoNullBtn');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[commonMethodBackgroundImageNullSecondV1003] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[commonMethodBackgroundImageNullSecondV1003] backgroundImage is: " + JSON.stringify(obj.$attrs.backgroundImage));
      expect(JSON.stringify(obj.$attrs.backgroundImage)).assertEqual('"images/bg.png, ImageRepeat.NoRepeat"');
      console.info('[commonMethodBackgroundImageNullSecondV1003] END');
    });

    /**
     * @tc.name   commonMethodBackgroundImageUndefinedSecondV1004
     * @tc.number SUB_ARKUI_COMMONMETHOD_BACKGROUNDIMAGE_PARAM_004
     * @tc.desc   Test CommonMethod backgroundImage with undefined second parameter (v7-12)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commonMethodBackgroundImageUndefinedSecondV1004', Level.LEVEL0, async () => {
      console.info('[commonMethodBackgroundImageUndefinedSecondV1004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('testTwoUndefinedBtn');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[commonMethodBackgroundImageUndefinedSecondV1004] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[commonMethodBackgroundImageUndefinedSecondV1004] backgroundImage is: " + JSON.stringify(obj.$attrs.backgroundImage));
      expect(JSON.stringify(obj.$attrs.backgroundImage)).assertEqual('"images/bg.png, ImageRepeat.NoRepeat"');
      console.info('[commonMethodBackgroundImageUndefinedSecondV1004] END');
    });

    /**
     * @tc.name   commonMethodBackgroundImageNullFirstV2001
     * @tc.number SUB_ARKUI_COMMONMETHOD_BACKGROUNDIMAGE_PARAM_005
     * @tc.desc   Test CommonMethod backgroundImage with null first parameter (API 18+, BackgroundImageOptions)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commonMethodBackgroundImageNullFirstV2001', Level.LEVEL0, async () => {
      console.info('[commonMethodBackgroundImageNullFirstV2001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('testThreeNullBtn');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[commonMethodBackgroundImageNullFirstV2001] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[commonMethodBackgroundImageNullFirstV2001] backgroundImage is: " + JSON.stringify(obj.$attrs.backgroundImage));
      expect(obj.$attrs.backgroundImage).assertEqual(', ImageRepeat.NoRepeat');
      console.info('[commonMethodBackgroundImageNullFirstV2001] END');
    });

    /**
     * @tc.name   commonMethodBackgroundImageUndefinedFirstV2002
     * @tc.number SUB_ARKUI_COMMONMETHOD_BACKGROUNDIMAGE_PARAM_006
     * @tc.desc   Test CommonMethod backgroundImage with undefined first parameter (API 18+, BackgroundImageOptions)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commonMethodBackgroundImageUndefinedFirstV2002', Level.LEVEL0, async () => {
      console.info('[commonMethodBackgroundImageUndefinedFirstV2002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('testThreeUndefinedBtn');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[commonMethodBackgroundImageUndefinedFirstV2002] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[commonMethodBackgroundImageUndefinedFirstV2002] backgroundImage is: " + JSON.stringify(obj.$attrs.backgroundImage));
      expect(obj.$attrs.backgroundImage).assertEqual(', ImageRepeat.NoRepeat');
      console.info('[commonMethodBackgroundImageUndefinedFirstV2002] END');
    });

    /**
     * @tc.name   commonMethodBackgroundImageNullSecondV2003
     * @tc.number SUB_ARKUI_COMMONMETHOD_BACKGROUNDIMAGE_PARAM_007
     * @tc.desc   Test CommonMethod backgroundImage with null second parameter (API 18+, BackgroundImageOptions)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commonMethodBackgroundImageNullSecondV2003', Level.LEVEL0, async () => {
      console.info('[commonMethodBackgroundImageNullSecondV2003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('testFourNullBtn');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[commonMethodBackgroundImageNullSecondV2003] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[commonMethodBackgroundImageNullSecondV2003] backgroundImage is: " + JSON.stringify(obj.$attrs.backgroundImage));
      expect(JSON.stringify(obj.$attrs.backgroundImage).indexOf('images/bg.png') > -1).assertTrue();
      console.info('[commonMethodBackgroundImageNullSecondV2003] END');
    });

    /**
     * @tc.name   commonMethodBackgroundImageUndefinedSecondV2004
     * @tc.number SUB_ARKUI_COMMONMETHOD_BACKGROUNDIMAGE_PARAM_008
     * @tc.desc   Test CommonMethod backgroundImage with undefined second parameter (API 18+, BackgroundImageOptions)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commonMethodBackgroundImageUndefinedSecondV2004', Level.LEVEL0, async () => {
      console.info('[commonMethodBackgroundImageUndefinedSecondV2004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('testFourUndefinedBtn');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[commonMethodBackgroundImageUndefinedSecondV2004] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[commonMethodBackgroundImageUndefinedSecondV2004] backgroundImage is: " + JSON.stringify(obj.$attrs.backgroundImage));
      expect(JSON.stringify(obj.$attrs.backgroundImage).indexOf('images/bg.png') > -1).assertTrue();
      console.info('[commonMethodBackgroundImageUndefinedSecondV2004] END');
    });
  })
}
