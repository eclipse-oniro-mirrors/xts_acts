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
import Utils from '../../MainAbility/common/Utils';

export default function rectNewTest() {
  describe('rectNewTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/Rect/rectNew',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get rectNew state success " + JSON.stringify(pages));
        if (!("rectNew" == pages.name)) {
          console.info("get rectNew state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push rectNew page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push rectNew page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("rectNew after each called");
    });

    /**
     * @tc.name   testRectNew0001
     * @tc.number SUB_ARKUI_API_testRectNew0001
     * @tc.desc   RectAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectNew0001', Level.LEVEL0, async () => {
      console.info('rectNe testrectNe0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Rect3');
      console.info("[testrectNe0001] component width strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Rect');
      expect(JSON.parse(strJson).$attrs.width).assertEqual("90.00%");
      console.info("[testrectNe0001] width value :" + JSON.parse(strJson).$attrs.width);

    });

    /**
     * @tc.name   testRectNew0002
     * @tc.number SUB_ARKUI_API_testRectNew0002
     * @tc.desc   RectAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectNew0002', Level.LEVEL0, async () => {
      console.info('rectNe testrectNe0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Rect3');
      console.info("[testrectNe0002] component height strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Rect');
      expect(JSON.parse(strJson).$attrs.height).assertEqual("50.00px");
      console.info("[testrectNe0002] height value :" + JSON.parse(strJson).$attrs.height);

    });
  })
}
