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

export default function copyOptionJsunit() {
  describe('copyOptionTest', function () {
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'MainAbility/pages/copyOption',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get copyOption state success " + JSON.stringify(pages));
        if (!("copyOption" == pages.name)) {
          console.info("get copyOption state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push copyOption page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push copyOption page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("copyOption after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testcopyOption0001
     * @tc.desic         acecopyOptionEtsTest0001
     */
    it('testcopyOption0001', 0, async function (done) {
      console.info('hoverEffect testcopyOption0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('InAppText');
      console.info("[testcopyOption0001] component copyOption strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.copyOption).assertEqual("CopyOptions.None");
      console.info("[testcopyOption0001] copyOption value :" + obj.$attrs.copyOption);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testcopyOption0002
     * @tc.desic         acecopyOptionEtsTest0002
     */
    it('testcopyOption0002', 0, async function (done) {
      console.info('hoverEffect testcopyOption0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('LocalDeviceText');
      console.info("[testcopyOption0002] component copyOption strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.copyOption).assertEqual("CopyOptions.None");
      console.info("[testcopyOption0002] copyOption value :" + obj.$attrs.copyOption);
      done();
    });
  })
}