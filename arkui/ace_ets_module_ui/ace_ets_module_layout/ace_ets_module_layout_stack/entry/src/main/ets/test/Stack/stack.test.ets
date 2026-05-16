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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils'

export default function stackAlignContentJsunit() {
  describe('stackAlignContentTest2', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/stackPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get stack state success " + JSON.stringify(pages));
        if (!("stackPage" == pages.name)) {
          console.info("get stack state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push stack page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stack page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("stackAlignContent after each called");
    });

    /**
     * @tc.name   teststackAlignContent0001
     * @tc.number SUB_ACE_BASIC_ETS_API_0001
     * @tc.desc   acestackAlignContentEtsTest0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('teststackAlignContent0001', Level.LEVEL1, async () => {
      console.info('stackAlignContent teststackAlignContent0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Stack');
      console.info("[teststackAlignContent0001] component width strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.width).assertEqual("100.00%");
      console.info("[teststackAlignContent0001] width value :" + JSON.parse(strJson).$attrs.width);

    });

    /**
     * @tc.name   teststackAlignContent0002
     * @tc.number SUB_ACE_BASIC_ETS_API_0002
     * @tc.desc   acestackAlignContentEtsTest0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('teststackAlignContent0002', Level.LEVEL1, async () => {
      console.info('stackAlignContent teststackAlignContent0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Stack');
      console.info("[teststackAlignContent0002] component width strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Stack');
      expect(JSON.parse(strJson).$attrs.height).assertEqual("150.00vp");
      console.info("[teststackAlignContent0002] width value :" + JSON.parse(strJson).$attrs.width);

    });
  })
}
