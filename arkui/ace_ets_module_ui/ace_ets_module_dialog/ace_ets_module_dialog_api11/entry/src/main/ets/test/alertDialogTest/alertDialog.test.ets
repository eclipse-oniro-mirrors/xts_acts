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
import Utils from '../../MainAbility/common/Utils.ets'
import events_emitter from '@ohos.events.emitter';
import measure, { MeasureOptions } from '@ohos.measure'
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';


export default function alertDialogCenterStartJsunit() {
  describe('alertDialogCenterStartTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AlertDialog/alertDialog2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get alertDialog state success " + JSON.stringify(pages));
        if (!("alertDialog2" == pages.name)) {
          console.info("get alertDialog state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push alertDialog page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push alertDialog page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("alertDialogCenterStart after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testalertDialogCenterStart0001
     * @tc.desic         acealertDialogCenterStartEtsTest0001
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('testalertDialogCenterStart0001', Level.LEVEL2, async (done: Function) => {
      console.info('alertDialogCenterStart testalertDialogCenterStart0011 START');
      let driver = await Driver.create()
      await Utils.sleep(2000);
      try {
        let event: events_emitter.InnerEvent = {
          eventId: 81601,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (eventData: events_emitter.EventData) => {
          console.info("testalertDialogCenterStart0001 get event data is: " + JSON.stringify(eventData));
          expect(eventData.data?.Result).assertEqual(true);
          console.info('testalertDialogCenterStart0001 END');
          done();
        }
        console.info("testalertDialogCenterStart0001 click result is: " + JSON.stringify(sendEventByKey('CenterStartButton', 10, "")));
        events_emitter.on(event, callback);
      } catch (err) {
        console.info("testalertDialogCenterStart0001 on events_emitter err : " + JSON.stringify(err));
      }
      let button = await driver.findComponent(ON.text('button'));
      await button?.click();
      await Utils.sleep(1000);
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testMeasureText0001
     * @tc.desic        test text width
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
     
    it('testMeasureText0001', Level.LEVEL2, async (done: Function) => {
      console.info('testMeasureText0001 start');
      let driver = await Driver.create()
      await Utils.sleep(2000);
      try {
        let measureOptions: MeasureOptions = {
          textContent: "alertDialog-CenterStart"
        };
        let width = measure.measureText(measureOptions);
        console.info("++++++++++++++++++++++" + width.toString());
        expect(width > 0).assertTrue();
        done();
      } catch (err) {
        console.info("testMeasureText0001 err : " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      let button = await driver.findComponent(ON.text('button'));
      await button?.click();
      await Utils.sleep(1000);
    });

  })
}
