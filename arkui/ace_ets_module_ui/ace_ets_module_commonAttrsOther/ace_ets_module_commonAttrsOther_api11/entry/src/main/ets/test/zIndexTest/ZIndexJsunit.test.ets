
/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../MainAbility/common/Common';

export default function zIndexJsunit() {
  describe('zIndexTest', () => {
    beforeEach(async () => {
      console.info("zIndex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/zIndex/zIndex',
      }
      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        console.info("get zIndex state pages: " + JSON.stringify(pages));
        if (!("zIndex" == pages.name)) {
          console.info("get zIndex state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push zIndex page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push zIndex page error:" + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("zIndex after each called");
    });

    it('testZIndex01', Level.LEVEL0, async () => {
      console.info('[testZIndex01] START');
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('zIndex');
      console.info("[testZIndex01] obj is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson).$attrs.zIndex).assertEqual(1);
      console.info('[testZIndex01] END');

    });

    it('testZIndex02', Level.LEVEL0, async () => {
      console.info('[testZIndex02] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "zIndex": 4
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 236,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testZIndex02] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testZIndex02] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('zIndex');
      console.info("[testZIndex02] obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.zIndex).assertEqual(4);
      console.info('testZIndex02 END');

    });

    it('testZIndex03', Level.LEVEL0, async () => {
      console.info('[testZIndex03] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "zIndex": -5
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 236,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testZIndex03] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testZIndex03] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('zIndex');
      console.info("[testZIndex03] obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.zIndex).assertEqual(-5);
      console.info('testZIndex03 END');

    });

    it('testZIndex04', Level.LEVEL0, async () => {
      console.info('[testZIndex04] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "zIndex": 889900444
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1113,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testZIndex04] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testZIndex04] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('zIndex');
      console.info("[testZIndex04] obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.zIndex).assertEqual(889900444);
      console.info('testZIndex04 END');
    });
  })
}
