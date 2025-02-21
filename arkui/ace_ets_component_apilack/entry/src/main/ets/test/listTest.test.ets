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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index"
import Utils from './Utils.ets'

export default function listNewJsunit() {
  describe('listNewJsunit', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/list',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get list state success " + JSON.stringify(pages));
        if (!("list" == pages.name)) {
          console.info("get list state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push list page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push list page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("listNe after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testListNew0001
     * @tc.desic        acelistNewEtsTest0001
     */
    it('testListNew0001', 0, async function (done) {
      console.info('listNe testListNew0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('list1');
      console.info("[testListNew0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('List');
      expect(obj.$attrs.width).assertEqual("90.00%");
      console.info("[testListNew0001] width value :" + obj.$attrs.width);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testListNe0002
     * @tc.desic         acelistNeEtsTest0002
     */
    it('testListNe0002', 0, async function (done) {
      console.info('listNe testListNe0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('list1');
      console.info("[testListNe0002] component height strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('List');
      expect(obj.$attrs.height).assertEqual("300.00vp");
      console.info("[testListNe0002] height value :" + obj.$attrs.height);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testListNe0003
     * @tc.desic         acelistNeEtsTest0003
     */
    it('testListNe0003', 0, async function (done) {
      console.info('listNe testListNe0003 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('list1');
      console.info("[testListNe0003] component editMode strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('List');
      expect(obj.$attrs.editMode).assertEqual("true");
      console.info("[testListNe0003] editMode value :" + obj.$attrs.editMode);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         testListNe0004
     * @tc.desic         acelistNeEtsTest0004
     */
    it('testListNe0004', 0, async function (done) {
      console.info('listNe testListNe0004 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('list1');
      console.info("[testListNe0004] component alignListItem strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('List');
      expect(obj.$attrs.alignListItem).assertEqual(undefined);
      console.info("[testListNe0004] alignListItem value :" + obj.$attrs.alignListItem);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         testListNe0005
     * @tc.desic         acelistNeEtsTest0005
     */
    it('testListNe0005', 0, async function (done) {
      console.info('listNe testListNe0005 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('list1');
      console.info("[testListNe0005] component lanes strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('List');
      expect(obj.$attrs.lanes).assertEqual(undefined);
      console.info("[testListNe0005] lanes value :" + obj.$attrs.lanes);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0006
     * @tc.name         testListNe0006
     * @tc.desic        acelistNeEtsTest0006
     */
    it('testListNe0006', 0, async function (done) {
      console.info('listNe testListNe0006 START');
      var innerEvent = {
        eventId: 60216,
        priority: events_emitter.EventPriority.LOW
      }
      var callback = (eventData) => {
        try{
          console.info("callback success" );
          console.info("testListNe0006 eventData.data.result result is: " + eventData.data.result);
          expect(eventData.data.result).assertEqual("success");
          console.info("testListNe0006 end");
        }catch(err){
          console.info("testListNe0006 on events_emitter err : " + JSON.stringify(err));
        }
      }
      try{
        console.info("testListNe0006 click result is: " + JSON.stringify(sendEventByKey('onScrollBegin', 10, "")));
        events_emitter.on(innerEvent, callback);
      }catch(err){
        console.info("testListNe0006 on events_emitter err : " + JSON.stringify(err));
      }
      done();
    });
  })
}
