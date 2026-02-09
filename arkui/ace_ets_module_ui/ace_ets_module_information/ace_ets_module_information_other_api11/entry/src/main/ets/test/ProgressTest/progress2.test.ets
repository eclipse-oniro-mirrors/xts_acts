/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import CommonFunc from '../../MainAbility/common/Common';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.information.other/MainAbility';

export default function progressStyleJsunit() {
  describe('progressStyleTest', () => {
    beforeAll(async () => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Progress/progress2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get progress state success " + JSON.stringify(pages));
        if (!("progress2" == pages.name)) {
          console.info("get progress state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push progress page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push progress page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("progressStyle after each called");
    });

    /**
     * @tc.name   testprogressStyle0001
     * @tc.number SUB_ACE_BASIC_ETS_API_0001
     * @tc.desc   testprogressStyle0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testprogressStyle0001', Level.LEVEL0, async () => {
      console.info('progressStyle testprogressStyle0001 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('Progress');
      console.info("[testprogressStyle0001] component width strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Progress');
      expect(JSON.parse(strJson).$attrs.width).assertEqual("100.00vp");
      console.info("[testprogressStyle0001] width value :" + JSON.parse(strJson).$attrs.width);

    });

    /**
     * @tc.name   testprogressStyle0002
     * @tc.number SUB_ACE_BASIC_ETS_API_0002
     * @tc.desc   testprogressStyle0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testprogressStyle0002', Level.LEVEL0, async () => {
      console.info('progressStyle testprogressStyle0002 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('Progress');
      console.info("[testprogressStyle0002] component color strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Progress');
      expect(JSON.parse(strJson).$attrs.color).assertEqual("#FF008000");
      console.info("[testprogressStyle0002] color value :" + JSON.parse(strJson).$attrs.color);

    });

    /**
     * @tc.name   testprogressStyle0003
     * @tc.number SUB_ACE_BASIC_ETS_API_0003
     * @tc.desc   testprogressStyle0003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testprogressStyle0003', Level.LEVEL0, async () => {
      console.info('progressStyle testprogressStyle0003 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('Progress');
      console.info("[testprogressStyle0003] component value strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Progress');
      expect(JSON.parse(strJson).$attrs.value).assertEqual("50.000000");
      console.info("[testprogressStyle0003] value value :" + JSON.parse(strJson).$attrs.value);

    });

    /**
     * @tc.name   testprogressStyle0004
     * @tc.number SUB_ACE_BASIC_ETS_API_0004
     * @tc.desc   testprogressStyle0004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testprogressStyle0004', Level.LEVEL0, async () => {
      console.info('progressStyle testprogressStyle0004 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('Progress');
      console.info("[testprogressStyle0004] component style strokeWidth strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Progress');
      console.info("[testprogressStyle0004] component style strokeWidth strJson:" + JSON.parse(strJson).$attrs.style);
      let jsonObject: Record<string, Object> = JSON.parse(JSON.parse(strJson).$attrs.style);
      expect(jsonObject.strokeWidth).assertEqual("20.00vp");

    });

    /**
     * @tc.name   testprogressStyle0005
     * @tc.number SUB_ACE_BASIC_ETS_API_0005
     * @tc.desc   testprogressStyle0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testprogressStyle0005', Level.LEVEL0, async () => {
      console.info('progressStyle testprogressStyle0005 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('Progress');
      console.info("[testprogressStyle0005] component style scaleCount strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Progress');
      let jsonObject: Record<string, Object> = JSON.parse(JSON.parse(strJson).$attrs.style);
      expect(jsonObject.scaleCount).assertEqual("30");

    });

    /**
     * @tc.name   testprogressStyle0006
     * @tc.number SUB_ACE_BASIC_ETS_API_0006
     * @tc.desc   testprogressStyle0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testprogressStyle0006', Level.LEVEL0, async () => {
      console.info('progressStyle testprogressStyle0006 START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('Progress');
      console.info("[testprogressStyle0006] component style scaleWidth strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Progress');
      let jsonObject: Record<string, Object> = JSON.parse(JSON.parse(strJson).$attrs.style);
      expect(jsonObject.scaleWidth).assertEqual("20.00vp");

    });
  })
}
