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

export default function pluginComponentKVObjectJsunit() {
  describe('pluginComponentKVObjectTest', function () {
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/pluginComponent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get pluginComponent state success " + JSON.stringify(pages));
        if (!("pluginComponent" == pages.name)) {
          console.info("get pluginComponent state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push pluginComponent page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push pluginComponent page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("pluginComponentKVObject after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testpluginComponentKVObject0001
     * @tc.desic         acepluginComponentKVObjectEtsTest0001
     */
    it('testpluginComponentKVObject0001', 0, async function (done) {
      console.info('pluginComponentKVObject testpluginComponentKVObject0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('pluginComponent');
      console.info("[testpluginComponentKVObject0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('PluginComponent');
      expect(obj.$attrs.size.width).assertEqual('500.00vp');
      console.info("[testpluginComponentKVObject0001] size.width value :" + obj.$attrs.size.width);
      done();
    });
  })
}
