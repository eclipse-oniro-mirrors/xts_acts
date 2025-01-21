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
import events_emitter from '@ohos.events.emitter';

export default function xcomponentGetXComponentContextJsunit() {
  describe('xcomponentGetXComponentContextTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'MainAbility/pages/xcomponent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get xcomponent state success " + JSON.stringify(pages));
        if (!("xcomponent" == pages.name)) {
          console.info("get xcomponent state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push xcomponent page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push xcomponent page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("xcomponentGetXComponentContext after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0009
     * @tc.name         testxcomponentGetXComponentContext0010
     * @tc.desic         acexcomponentGetXComponentContextEtsTest0010
     */
    it('testxcomponentGetXComponentContext0010', 0, async function (done) {
      console.info('xcomponentGetXComponentContext testxcomponentGetXComponentContext0010 START');
      await Utils.sleep(1000);
      try {
        var innerEventOne = {
          eventId: 60228,
          priority: events_emitter.EventPriority.LOW
        }
        var callback1 = (eventData) => {
          console.info("onRequestPopupData_0010 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data.STATUS).assertEqual("callBackSuccess");
        }
        events_emitter.on(innerEventOne, callback1);
        await Utils.sleep(1000);
        console.info("onSelect_0012 click result is: " + JSON.stringify(sendEventByKey('getXComponentContextText', 10, "")));
        await Utils.sleep(2000);       
      } catch (err) {
        console.info("onRequestPopupData_0010 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testxcomponentGetXComponentContext0010 END');
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testxcomponentSetXComponentSurfaceSize0001
     * @tc.desic         acexcomponentSetXComponentSurfaceSizeEtsTest0001
     */
    it('testxcomponentSetXComponentSurfaceSize0001', 0, async function (done) {
      console.info('xcomponentSetXComponentContext testxcomponentSetXComponentSurfaceSize0001 START');
      await Utils.sleep(2000);
      console.info("setXComponentSurfaceSize0001 click result is: " + JSON.stringify(sendEventByKey('setXComponentSurfaceSizeText', 10, "")));
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('setXComponentSurfaceSizeText');
      //console
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual("Text");
      expect(obj.$attrs.surfaceWidth).assertEqual(undefined);
      console.info('testxcomponentSetXComponentSurfaceSize0001 END');
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0010
     * @tc.name         testxcomponentSetXComponentSurfaceSize0002
     * @tc.desic         acexcomponentSetXComponentSurfaceSizeEtsTest0002
     */
    it('testxcomponentSetXComponentSurfaceSize0002', 0, async function (done) {
      console.info('xcomponentSetXComponentContext testxcomponentSetXComponentSurfaceSize0002 START');
      await Utils.sleep(2000);
      console.info("testxcomponentSetXComponentSurfaceSize0002 click result is: " + JSON.stringify(sendEventByKey('setXComponentSurfaceSizeText', 10, "")))
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('setXComponentSurfaceSizeText');
      //console
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual("Text");
      expect(obj.$attrs.surfaceHeight).assertEqual(undefined);
      console.info('testxcomponentSetXComponentSurfaceSize0002 END');
      done();
    });
  })
}
