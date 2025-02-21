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
import events_emitter from '@ohos.events.emitter';
import measure from '@ohos.measure'

export default function alertDialogCenterStartJsunit() {
  describe('alertDialogCenterStartTest', function () {
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/alertDialog',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get alertDialog state success " + JSON.stringify(pages));
        if (!("alertDialog" == pages.name)) {
          console.info("get alertDialog state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push alertDialog page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push alertDialog page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("alertDialogCenterStart after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testalertDialogCenterStart0001
     * @tc.desic         acealertDialogCenterStartEtsTest0001
     */
    it('testalertDialogCenterStart0001', 0, async function (done) {
      console.info('alertDialogCenterStart testalertDialogCenterStart0011 START');
      await Utils.sleep(2000);
      try {
        var event = {
          eventId: 81601,
          priority: events_emitter.EventPriority.LOW
        }
        var callback = (eventData) => {
          console.info("testalertDialogCenterStart0001 get event data is: " + JSON.stringify(eventData));
          expect(eventData.data.Result).assertEqual(true);
          console.info('testalertDialogCenterStart0011 END');
          done();
        }
        console.info("testalertDialogCenterStart0001 click result is: " + JSON.stringify(sendEventByKey('CenterStartButton', 10, "")));
        events_emitter.on(event, callback);
      } catch (err) {
        console.info("testalertDialogCenterStart0001 on events_emitter err : " + JSON.stringify(err));
      }
    });

     /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testMeasureText0001
     * @tc.desic        test text width
     */
    it('testMeasureText0001', 0, async function (done) {
      console.info('testMeasureText0001 start');
      await Utils.sleep(2000);
      try {
           let measureOptions = {textContent : "alertDialog-CenterStart"};
           let width = measure.measureText(measureOptions);
           console.info("testMeasureText0001 " + width.toString());
           expect(width > 0).assertTrue();
           done();
      } catch (err) {
        console.info("testMeasureText0001 err : " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });
  })
}
