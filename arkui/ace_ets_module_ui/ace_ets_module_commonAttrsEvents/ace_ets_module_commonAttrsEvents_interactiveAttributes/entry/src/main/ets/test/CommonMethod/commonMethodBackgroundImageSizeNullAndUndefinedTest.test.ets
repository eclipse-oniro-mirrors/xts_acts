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

export default function commonMethodBackgroundImageSizeNullAndUndefinedTest() {
  describe('commonMethodBackgroundImageSizeNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("commonMethodBackgroundImageSizeNullAndUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonMethod/backgroundImageSizeNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get commonMethodBackgroundImageSizeNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("backgroundImageSizeNullAndUndefined" == pages.name)) {
          console.info("get commonMethodBackgroundImageSizeNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push commonMethodBackgroundImageSizeNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push commonMethodBackgroundImageSizeNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("commonMethodBackgroundImageSizeNullAndUndefinedTest after each called");
    });

    /**
     * @tc.name   commonMethodBackgroundImageSizeNullV1001
     * @tc.number SUB_ARKUI_COMMONMETHOD_BACKGROUNDIMAGESIZE_PARAM_001
     * @tc.desc   Test CommonMethod backgroundImageSize with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commonMethodBackgroundImageSizeNullV1001', Level.LEVEL0, async () => {
      console.info('[commonMethodBackgroundImageSizeNullV1001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('testNullBtn');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[commonMethodBackgroundImageSizeNullV1001] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[commonMethodBackgroundImageSizeNullV1001] backgroundImageSize is: " + JSON.stringify(obj.$attrs.backgroundImageSize));
      expect(obj.$attrs.backgroundImageSize).assertEqual('ImageSize.Auto');
      console.info('[commonMethodBackgroundImageSizeNullV1001] END');
    });

    /**
     * @tc.name   commonMethodBackgroundImageSizeUndefinedV1002
     * @tc.number SUB_ARKUI_COMMONMETHOD_BACKGROUNDIMAGESIZE_PARAM_002
     * @tc.desc   Test CommonMethod backgroundImageSize with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commonMethodBackgroundImageSizeUndefinedV1002', Level.LEVEL0, async () => {
      console.info('[commonMethodBackgroundImageSizeUndefinedV1002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('testUndefinedBtn');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[commonMethodBackgroundImageSizeUndefinedV1002] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[commonMethodBackgroundImageSizeUndefinedV1002] backgroundImageSize is: " + JSON.stringify(obj.$attrs.backgroundImageSize));
      expect(obj.$attrs.backgroundImageSize).assertEqual('ImageSize.Auto');
      console.info('[commonMethodBackgroundImageSizeUndefinedV1002] END');
    });
  })
}
