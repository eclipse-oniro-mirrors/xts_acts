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

import router from '@system.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import Utils from './Utils.ets'

export default function gridColXlJsunit() {
  describe('gridColXlTest', function () {
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'MainAbility/pages/gridCol',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gridCol state success " + JSON.stringify(pages));
        if (!("gridCol" == pages.name)) {
          console.info("get gridCol state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push gridCol page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gridCol page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("gridColXl after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testgridColXl0001
     * @tc.desic         acegridColXlEtsTest0001
     */
    it('testgridColXl0001', 0, async function (done) {
      console.info('gridColXl testgridColXl0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('GridCol');
      console.info("[testgridColXl0001] component order strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('GridCol');
      expect(obj.$attrs.order).assertEqual("{xl: 10}");
      console.info("[testgridColXl0001] order value :" + obj.$attrs.order);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testgridColXl0002
     * @tc.desic         acegridColXlEtsTest0002
     */
    it('testgridColXl0002', 0, async function (done) {
      console.info('gridColXl testgridColXl0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('GridCol');
      console.info("[testgridColXl0002] component backgroundColor strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Color.Green');
      expect(obj.$attrs.backgroundColor).assertEqual("Color.Green");
      console.info("[testgridColXl0002] backgroundColor value :" + obj.$attrs.backgroundColor);
      done();
    });
  })
}
