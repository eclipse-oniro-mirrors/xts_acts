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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import Utils from './Utils.ets'

export default function gridMaxCountJsunit() {
  describe('gridMaxCountTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'MainAbility/pages/grid',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get grid state success " + JSON.stringify(pages));
        if (!("grid" == pages.name)) {
          console.info("get grid state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push grid page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push grid page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("gridMaxCount after each called");
    });

    it('testcheckgridMaxCount0001', 0, async function (done) {
      console.info('testcheckgridMaxCount testcheckgridMaxCount0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('maxCountTest');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Grid');
      console.info("[testcheckgridMaxCount0001] selectedMaxCount value :" + obj.$attrs.maxCount);
      let maxCount = obj.$attrs.maxCount;
      expect(maxCount == 5).assertTrue();
      done();
    });
    
    it('testEdgeEffectOptions0002', 0, async function (done) {
      console.info('testEdgeEffectOptions testEdgeEffectOptions0002 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('maxCountTest');
      let obj1 = JSON.parse(strJson);
      expect(obj1.$attrs.edgeEffectOptions.alwaysEnabled).assertTrue();
      console.info("edgeEffectOptions value :" +obj1.$attrs.edgeEffectOptions.alwaysEnabled);
      done();
    });

    it('testEdgeEffectOptions0003', 0, async function (done) {
      console.info('testEdgeEffectOptions testEdgeEffectOptions0003 START');
      await Utils.sleep(2000);
      try {
        var eventData = {
          data: {
            "alwaysEnabled": false
          }
        }
        var innerEvent = {
          eventId: 321,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testEdgeEffectOptions0003] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testEdgeEffectOptions0003] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('maxCountTest');
      let obj1 = JSON.parse(strJson);
      expect(obj1.$attrs.edgeEffectOptions.alwaysEnabled).assertFalse();
      console.info("edgeEffectOptions value :" +obj1.$attrs.edgeEffectOptions.alwaysEnabled);
      done();
    });
  })
}
