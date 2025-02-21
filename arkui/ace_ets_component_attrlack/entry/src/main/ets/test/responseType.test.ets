//@ts-nocheck
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index"
import Utils from './Utils.ets'

export default function responseTypeJsunit() {
  describe('responseTypeTest', function () {
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/responseType',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get responseType state success " + JSON.stringify(pages));
        if (!("responseType" == pages.name)) {
          console.info("get responseType state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push responseType page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push responseType page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("responseType after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testresponseType0002
     * @tc.desic        acehoverEffectEtsTest0002
     */
    it('testresponseType0002', 0, async function (done) {
      console.info('responseType testresponseType0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('RightClickText');
      console.info("[testresponseType0002] component bindContextMenu strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.bindContextMenu).assertEqual("ResponseType.LongPress");
      console.info("[testresponseType0002] bindContextMenu value :" + obj.$attrs.bindContextMenu);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testhoverEffect0003
     * @tc.desic        acehoverEffectEtsTest0003
     */
    it('testresponseType0003', 0, async function (done) {
      console.info('responseType testresponseType0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('LongPressText');
      console.info("[testresponseType0003] component bindContextMenu strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.bindContextMenu).assertEqual("ResponseType.LongPress");
      console.info("[testresponseType0003] bindContextMenu value :" + obj.$attrs.bindContextMenu);
      done();
    });
  })
}