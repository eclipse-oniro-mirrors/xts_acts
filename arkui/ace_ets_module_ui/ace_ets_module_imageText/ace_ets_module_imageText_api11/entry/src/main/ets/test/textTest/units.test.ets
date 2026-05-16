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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import CommonFunc from '../../MainAbility/common/Common'
import events_emitter from '@ohos.events.emitter';

export default function unitsModuleNameJsunit() {
  describe('unitsModuleNameTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/units',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get units state success " + JSON.stringify(pages));
        if (!("units" == pages.name)) {
          console.info("get units state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push units page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push units page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("unitsModuleName after each called");
    });

    /**
     * @tc.name   testunitsModuleName0001
     * @tc.number SUB_ACE_BASIC_ETS_API_0001
     * @tc.desc   testunitsModuleName0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testunitsModuleName0001', Level.LEVEL1, async (done: Function) => {
      console.info('unitsModuleName testunitsModuleName0001 START');
      await CommonFunc.sleep(2000);
      try {
        console.info("testunitsModuleName0001 click result is: " + JSON.stringify(sendEventByKey('moduleNameText', 10, "")));
        await CommonFunc.sleep(2000);
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60310,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (eventData: events_emitter.EventData) => {
          console.info("testunitsModuleName0001 get event state result is: " + JSON.stringify(eventData));
          try {
            expect(eventData.data?.ModuleName).assertFalse();
          } catch (err) {
            console.info("testunitsModuleName0001 get event state result is: " + JSON.stringify(err));
          }

        }
        events_emitter.on(innerEvent, callback);
      } catch (err) {
        console.info("testunitsModuleName0001 on click err : " + JSON.stringify(err));
      }
      console.info('testunitsModuleName0001 END');
      done();
    });

    /**
     * @tc.name   testunitsGlobalPosition0001
     * @tc.number SUB_ACE_BASIC_ETS_API_0002
     * @tc.desc   testunitsGlobalPosition0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testunitsGlobalPosition0001', Level.LEVEL1, async (done: Function) => {
      console.info('unitsModuleName testunitsGlobalPosition0001 START');
      await CommonFunc.sleep(2000);
      try {
        console.info("testunitsGlobalPosition0001 click result is: " + JSON.stringify(sendEventByKey('globalPositionText', 10, "")));
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60311,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (eventData: events_emitter.EventData) => {
          console.info("testunitsGlobalPosition0001 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data?.Result).assertEqual(true);
        }
        events_emitter.on(innerEvent, callback);
      } catch (err) {
        console.info("testunitsGlobalPosition0001 on click err : " + JSON.stringify(err));
      }
      console.info('testunitsGlobalPosition0001 END');
      done();
    });

    /**
     * @tc.name   testunitsMinWidth0001
     * @tc.number SUB_ACE_BASIC_ETS_API_0003
     * @tc.desc   testunitsMinWidth0001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testunitsMinWidth0001', Level.LEVEL1, async (done: Function) => {
      console.info('unitsModuleName testunitsMinWidth0001 START');
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('minWidthText');
      console.info("[testunitsMinWidth0001] component constraintSize strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      console.info('[testunitsMinWidth0001] constraintSize value :' + JSON.parse(JSON.parse(strJson).$attrs.constraintSize).minWidth);
      expect(JSON.parse(JSON.parse(strJson).$attrs.constraintSize).minWidth).assertEqual('200.00vp');
      console.info("[testunitsMinWidth0001] constraintSize value :" + JSON.parse(strJson).$attrs.constraintSize);
      done();
    });

    /**
     * @tc.name   testunitsMinWidth0002
     * @tc.number SUB_ACE_BASIC_ETS_API_0002
     * @tc.desc   testunitsMinWidth0002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testunitsMinWidth0002', Level.LEVEL1, async (done: Function) => {
      console.info('unitsModuleName testunitsMinWidth0001 START');
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('minWidthText');
      console.info("[testunitsMinWidth0002] component constraintSize strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Text');
      console.info("[testunitsMinWidth0002] constraintSize is : " + JSON.parse(JSON.parse(strJson).$attrs.constraintSize));
      expect(JSON.parse(strJson).$attrs.constraintSize.minWidth).assertEqual(undefined);
      console.info("[testunitsMinWidth0002] constraintSize value :" + JSON.parse(strJson).$attrs.constraintSize);
      done();
    });
  })
}
