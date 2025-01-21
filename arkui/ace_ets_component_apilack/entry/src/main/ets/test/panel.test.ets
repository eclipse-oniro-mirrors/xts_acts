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
import events_emitter from '@ohos.events.emitter';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index"
import Utils from './Utils.ets'

export default function panelBackgroundMaskJsunit() {
  describe('panelBackgroundMaskTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/panel',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get panel state success " + JSON.stringify(pages));
        if (!("panel" == pages.name)) {
          console.info("get panel state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push panel page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push panel page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("panelBackgroundMask after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testpanelBackgroundMask0001
     * @tc.desic         acepanelBackgroundMaskEtsTest0001
     */
    it('testpanelBackgroundMask0001', 0, async function (done) {
      console.info('panelBackgroundMask testpanelBackgroundMask0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('panel');
      let obj = JSON.parse(strJson);
      console.info("get inspector value is: " + JSON.stringify(obj));
      console.log(JSON.stringify(obj.$type))
      expect(obj.$type).assertEqual('Panel')
      console.log('Panel‘s backgroundMask is ' + JSON.stringify(obj.$attrs.backgroundMask))
      expect(obj.$attrs.backgroundMask).assertEqual('#FFFF0000');
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testpanelOnHeightChange0002
     * @tc.desic         acepanelBackgroundMaskEtsTest0002
     */
    it('testpanelOnHeightChange0002', 0, async function (done) {
      console.info('panelBackgroundMask testpanelOnHeightChange0002 START');
      var panelOnHeightChangeEvent = {
        eventId: 10111,
        priority: events_emitter.EventPriority.LOW
      }
      var callback1 = (backData) => {
        console.info("testpanelOnHeightChange0002 backData.data.result is: " + backData.data.result);
        try{
          console.info("testpanelOnHeightChange0002 callback1 success" );
          expect(backData.data.result).assertEqual("success");
          done();
        }catch(err){
          console.info("testpanelOnHeightChange0002 on events_emitter err : " + JSON.stringify(err));
        }
      }
      try {
        console.info("testpanelOnHeightChange0002 click result is: " + JSON.stringify(sendEventByKey('onHeightChangeText', 10, "")));
        events_emitter.on(panelOnHeightChangeEvent, callback1);
      } catch (err) {
        console.info("testpanelOnHeightChange0002 on events_emitter err : " + JSON.stringify(err));
      }
    });

  })
}
