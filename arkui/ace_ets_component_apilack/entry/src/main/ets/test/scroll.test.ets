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

export default function scrollOnScrollBeginJsunit() {
  describe('scrollOnScrollBeginTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'MainAbility/pages/scroll',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scroll state success " + JSON.stringify(pages));
        if (!("scroll" == pages.name)) {
          console.info("get scroll state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push scroll page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scroll page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("scrollOnScrollBegin after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testscrollOnScrollBegin0001
     * @tc.desic         acescrollOnScrollBeginEtsTest0001
     */
    it('testscrollOnScrollBegin0001', 0, async function (done) {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Scroll');
      console.info("[testscrollOnScrollBegin0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Scroll');
      expect(obj.$attrs.width).assertEqual("100.00%");
      console.info("[testscrollOnScrollBegin0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testscrollOnScrollBegin0002
     * @tc.desic         acescrollOnScrollBeginEtsTest0002
     */
    it('testscrollOnScrollBegin0002', 0, async function (done) {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Scroll');
      console.info("[testscrollOnScrollBegin0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Scroll');
      expect(obj.$attrs.height).assertEqual("100.00%");
      console.info("[testscrollOnScrollBegin0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testscrollOnScrollBegin0003
     * @tc.desic         acescrollOnScrollBeginEtsTest0003
     */
    it('testscrollOnScrollBegin0003', 0, async function (done) {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Scroll');
      console.info("[testscrollOnScrollBegin0003] component fontSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Scroll');
      expect(obj.$attrs.scrollBar).assertEqual("BarState.On");
      console.info("[testscrollOnScrollBegin0003] scrollBar value :" + obj.$attrs.scrollBar);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testscrollOnScrollBegin0004
     * @tc.desic         acescrollOnScrollBeginEtsTest0004
     */
    it('testscrollOnScrollBegin0004', 0, async function (done) {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Scroll');
      console.info("[testscrollOnScrollBegin0004] component opacity strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Scroll');
      expect(obj.$attrs.scrollBarColor).assertEqual("#FF808080");
      console.info("[testscrollOnScrollBegin0004] scrollBarColor value :" + obj.$attrs.scrollBarColor);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testscrollOnScrollBegin0005
     * @tc.desic         acescrollOnScrollBeginEtsTest0005
     */
    it('testscrollOnScrollBegin0005', 0, async function (done) {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Scroll');
      console.info("[testscrollOnScrollBegin0005] component align strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Scroll');
      expect(obj.$attrs.scrollBarWidth).assertEqual("30.00vp");
      console.info("[testscrollOnScrollBegin0005] scrollBarWidth value :" + obj.$attrs.scrollBarWidth);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0012
     * @tc.name         testscrollOnScrollBegin0005
     * @tc.desic         acescrollOnScrollBeginEtsTest0006
     */
    it('testscrollOnScrollBegin0006', 0, async function (done) {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0006 START');
      await Utils.sleep(2000);

      let callback = (indexEvent) => {
        console.info("scrollOnScrollBegin get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data.STATUS).assertEqual(true);
      }
      let indexEvent = {
        eventId: 10086,
        priority: events_emitter.EventPriority.LOW
      }
      sendEventByKey('Scroll', 10, "")
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("scrollOnScrollBegin on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testscrollOnScrollBegin0006 END');
      done();
    });

    /**
     * @tc.number    : testscrollOnScrollBegin0007
     * @tc.name      : test edgeEffectOptions default
     * @tc.desc      : expect edgeEffectOptions.alwaysEnabled false
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testscrollOnScrollBegin0007', 0, async function (done) {
      console.info('scrollOnScrollBegin testscrollOnScrollBegin0007 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Scroll');
      console.info("[testscrollOnScrollBegin0007] component align strJson:" + strJson);
      let obj7 = JSON.parse(strJson);
      expect(obj7.$attrs.edgeEffectOptions.alwaysEnabled).assertFalse();
      console.info("EdgeEffectOptions value :" +obj7.$attrs.edgeEffectOptions.alwaysEnabled);
      done();
    });

    /**
     * @tc.number    : testscrollOnScrollBegin0008
     * @tc.name      : test edgeEffectOptions set true
     * @tc.desc      : expect edgeEffectOptions.alwaysEnabled true
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testscrollOnScrollBegin0008', 0, async function (done) {
      console.info('testEdgeEffectOptions testscrollOnScrollBegin0008 START');
      await Utils.sleep(2000);
      try {
        var eventData = {
          data: {
            "alwaysEnabled": true
          }
        }
        var innerEvent = {
          eventId: 323,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testscrollOnScrollBegin0008] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testscrollOnScrollBegin0008] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('Scroll');
      let obj1 = JSON.parse(strJson);
      expect(obj1.$attrs.edgeEffectOptions.alwaysEnabled).assertTrue();
      console.info("edgeEffectOptions value :" +obj1.$attrs.edgeEffectOptions.alwaysEnabled);
      done();
    });
  })
}
