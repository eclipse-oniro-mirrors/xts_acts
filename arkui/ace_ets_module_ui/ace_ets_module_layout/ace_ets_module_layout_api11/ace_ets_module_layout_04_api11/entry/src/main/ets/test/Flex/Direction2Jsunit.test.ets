/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from '../Utils';
import events_emitter from '@ohos.events.emitter';

export default function direction2Jsunit(){
  describe('direction2Jsunit', () =>{
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/direction2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get direction state success " + JSON.stringify(pages));
        if (!("direction2" == pages.name)) {
          console.info("get direction state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(1000);
          console.info("push direction page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push direction page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("direction after each called");
    });

    /**
     * @tc.name   direction2Test_0200
     * @tc.number direction2Test_0200
     * @tc.desc   direction2Test_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('direction2Test_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('direction2Test_0200 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "direction": Direction.Rtl,
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 1082,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("direction2Test_0200 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("direction2Test_0200 change component data error: " + (err as Error)?.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('direction_2');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("direction2Test_0200 component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.direction).assertEqual('Direction.Rtl');
      console.info('direction2Test_0200 END');
      done();
    });

   /**
    * @tc.name   direction2Test_0100
    * @tc.number direction2Test_0100
    * @tc.desc   direction2Test_0100
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('direction2Test_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('direction2Test_0100 START');
      let strJson = getInspectorByKey('direction_2');
      console.info("direction2Test_0100 component strJson:" + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info("direction2Test_0100 component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.direction).assertEqual("Direction.Rtl");
      done();
    });

    /**
     * @tc.name   direction2Test_0300
     * @tc.number direction2Test_0300
     * @tc.desc   direction2Test_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('direction2Test_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('direction2Test_0300 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "direction":  Direction.Auto,
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 1083,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("direction2Test_0300 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("direction2Test_0300 change component data error: " + (err as Error)?.message);
      }
      await Utils.sleep(1000);
      let strJsonNew = getInspectorByKey('direction_2');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("direction2Test_0300 component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.direction).assertEqual('Direction.Auto');
      console.info('direction2Test_0300 END');
      done();
    });
  })
}