/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from './Utils'

export default function lineNeJsunit() {
  describe('lineNeTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/line',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get line state success " + JSON.stringify(pages));
        if (!("line" == pages.name)) {
          console.info("get line state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push line page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push line page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("lineNe after each called");
    });

    /**
     * @tc.name   testlineNe0001
     * @tc.number SUB_ACE_BASIC_ETS_API_0001
     * @tc.desc   testlineNe0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testlineNe0001', Level.LEVEL0, async () => {
      console.info('lineNe testlineNe0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('line1');
      console.info("[testlineNe0001] component width strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Line');
      expect(JSON.parse(strJson).$attrs.width).assertEqual("50.00vp");
      console.info("[testlineNe0001] width value :" + JSON.parse(strJson).$attrs.width);

    });

    /**
     * @tc.name   testlineNe0002
     * @tc.number SUB_ACE_BASIC_ETS_API_0002
     * @tc.desc   testlineNe0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testlineNe0002', Level.LEVEL0, async () => {
      console.info('lineNe testlineNe0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('line1');
      console.info("[testlineNe0002] component height strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Line');
      expect(JSON.parse(strJson).$attrs.height).assertEqual("100.00vp");
      console.info("[testlineNe0002] height value :" + JSON.parse(strJson).$attrs.height);

    });

    /**
     * @tc.name   testlineNe0005
     * @tc.number SUB_ACE_BASIC_ETS_API_0005
     * @tc.desc   testlineNe0005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testlineNe0005', Level.LEVEL0, async () => {
      console.info('lineNe testlineNe0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('line2');
      console.info("[testlineNe0005] component width strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Line');
      expect(JSON.parse(strJson).$attrs.width).assertEqual("200.00vp");
      console.info("[testlineNe0005] width value :" + JSON.parse(strJson).$attrs.width);

    });

    /**
     * @tc.name   testlineNe0006
     * @tc.number SUB_ACE_BASIC_ETS_API_0006
     * @tc.desc   testlineNe0006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testlineNe0006', Level.LEVEL0, async () => {
      console.info('lineNe testlineNe0006 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('line2');
      console.info("[testlineNe0006] component height strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Line');
      expect(JSON.parse(strJson).$attrs.height).assertEqual("200.00vp");
      console.info("[testlineNe0006] height value :" + JSON.parse(strJson).$attrs.height);

    });
  })
}
