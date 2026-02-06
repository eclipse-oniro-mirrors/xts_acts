/**
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import Utils from './Utils.ets'

export default function gridColXlJsunit() {
  describe('gridColXlTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gridCol',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gridCol state success " + JSON.stringify(pages));
        if (!("gridCol" == pages.name)) {
          console.info("get gridCol state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push gridCol page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gridCol page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("gridColXl after each called");
    });

    /**
     * @tc.name   testgridColXl0001
     * @tc.number SUB_ACE_BASIC_ETS_API_0001
     * @tc.desc   testgridColXl0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testgridColXl0001', Level.LEVEL1, async (done: Function) => {
      console.info('gridColXl testgridColXl0001 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('GridCol');
      console.info("[testgridColXl0001] component order strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('GridCol');
      expect(JSON.parse(strJson).$attrs.order).assertEqual("{xl: 10}");
      console.info("[testgridColXl0001] order value :" + JSON.parse(strJson).$attrs.order);
      done();
    });

    /**
     * @tc.name   testgridColXl0002
     * @tc.number SUB_ACE_BASIC_ETS_API_0002
     * @tc.desc   testgridColXl0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testgridColXl0002', Level.LEVEL1, async (done: Function) => {
      console.info('gridColXl testgridColXl0002 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('GridCol');
      console.info("[testgridColXl0002] component backgroundColor strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Color.Green');
      expect(JSON.parse(strJson).$attrs.backgroundColor).assertEqual("Color.Green");
      console.info("[testgridColXl0002] backgroundColor value :" + JSON.parse(strJson).$attrs.backgroundColor);
      done();
    });
  })
}
