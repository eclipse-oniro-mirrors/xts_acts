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

export default function polygonNewJsunit() {
  describe('polygonNewJsunit', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/polygon',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get polygon state success " + JSON.stringify(pages));
        if (!("polygon" == pages.name)) {
          console.info("get polygon state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push polygon page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push polygon page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("polygonNe after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testpolygonNe0001
     * @tc.desic         acepolygonNeEtsTest0001
     */
    it('testpolygonNe0001', Level.LEVEL0, async () => {
      console.info('polygonNe testpolygonNe0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Polygon');
      console.info("[testpolygonNe0001] component width strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Polygon');
      expect(JSON.parse(strJson).$attrs.width).assertEqual("100.00px");
      console.info("[testpolygonNe0001] width value :" + JSON.parse(strJson).$attrs.width);

    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testpolygonNe0002
     * @tc.desic         acepolygonNeEtsTest0002
     */
    it('testpolygonNe0002', Level.LEVEL0, async () => {
      console.info('polygonNe testpolygonNe0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Polygon');
      console.info("[testpolygonNe0002] component height strJson:" + strJson);
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Polygon');
      expect(JSON.parse(strJson).$attrs.height).assertEqual("100.00px");
      console.info("[testpolygonNe0002] height value :" + JSON.parse(strJson).$attrs.height);

    });
  })
}
