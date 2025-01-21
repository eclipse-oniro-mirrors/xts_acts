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

import events_emitter from '@ohos.events.emitter';
import router from '@system.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import Utils from './Utils.ets'
import font from '@ohos.font'

export default function common_ts_ets_apiStaticClearJsunit() {
  describe('common_ts_ets_apiStaticClearTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'MainAbility/pages/common_ts_ets_api',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get common_ts_ets_api state success " + JSON.stringify(pages));
        if (!("common_ts_ets_api" == pages.name)) {
          console.info("get common_ts_ets_api state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push common_ts_ets_api page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push common_ts_ets_api page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("common_ts_ets_apiStaticClear after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testcommon_ts_ets_apiPersistProp0001
     * @tc.desic         acecommon_ts_ets_apiPersistPropEtsTest0001
     */
    it('testcommon_ts_ets_apiPersistProp0001', 0, async function (done) {
      console.info('common_ts_ets_apiPersistProp testcommon_ts_ets_apiPersistProp0001 START');
      await Utils.sleep(2000);
      try {
        var innerEvent = {
          eventId: 60230,
          priority: events_emitter.EventPriority.LOW
        }
        var callback = (eventData) => {
          console.info("common_ts_ets_apiPersistProp0001 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data.Score).assertEqual("Score");
          done()
        }
        console.info("PersistProp0001 click result is: " + JSON.stringify(sendEventByKey('PersistPropText', 10, "")));
        events_emitter.on(innerEvent, callback);
      } catch (err) {
        console.info("common_ts_ets_apiPersistProp0001 on events_emitter err : " + JSON.stringify(err));
      }
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testcommon_ts_ets_apiEnvProp0001
     * @tc.desic         acecommon_ts_ets_apiEnvPropEtsTest0001
     */
    it('testcommon_ts_ets_apiEnvProp0001', 0, async function (done) {
      console.info('common_ts_ets_apiEnvProp testcommon_ts_ets_apiEnvProp0001 START');
      await Utils.sleep(2000);
      try {
        var innerEvent = {
          eventId: 60231,
          priority: events_emitter.EventPriority.LOW
        }
        var callback = (eventData) => {
          console.info("common_ts_ets_apiEnvProp0001 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data.Result).assertEqual(false);
          done()
        }
        console.info("EnvProp0001 click result is: " + JSON.stringify(sendEventByKey('EnvPropText', 10, "")));
        events_emitter.on(innerEvent, callback);
      } catch (err) {
        console.info("common_ts_ets_apiEnvProp0001 on events_emitter err : " + JSON.stringify(err));
      }
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0003
    * @tc.name         test_font_registerFont_0001
    * @tc.desc        Register a customized font in the FontManager
    */
    it('test_font_registerFont_0001', 0, async function (done) {
      console.info('test_font_registerFont_0001 Register a customized font in the FontManagerSTART');
      await Utils.sleep(2000);
      let fontOptions = {
          familyName: "Italy",
          familySrc: "resource/base/Italy"
      }
      try {
           let result = font.registerFont(fontOptions);
           done();
      } catch (err) {
           console.info("test_font_registerFont_0001  err : " + JSON.stringify(err));
           expect().assertFail();
           done();
      }
    });


  })
}
