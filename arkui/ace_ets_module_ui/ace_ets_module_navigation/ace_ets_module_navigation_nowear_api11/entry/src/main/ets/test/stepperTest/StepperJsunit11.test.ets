
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
import Utils from '../Utils';
import events_emitter from '@ohos.events.emitter';
import { BusinessError } from '@ohos.base';

export default function StepperJsunit11() {
  describe('StepperJsunit11', () => {
    beforeEach(async (done:Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stepper/stepper',
      }
      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        console.info("get stepper state success " + JSON.stringify(pages));
        if (!("stepper" == pages.name)) {
          console.info("get stepper state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(1000);
        }
      } catch (err) {
        console.error("push stepper page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("stepper after each called");
    });


    /**
     * @tc.name   stepperTest_0100
     * @tc.number stepperTest_0100
     * @tc.desc   stepperTest_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stepperTest_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('stepperTest_0100 START');
      let strJson: string = getInspectorByKey('stepper');
      console.info("stepperTest_0100 component strJson:" + strJson);
      console.info("stepperTest_0100 component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$type).assertEqual('Stepper');
      expect(JSON.parse(strJson).$attrs.index).assertEqual('0');
      console.info('stepperTest_0100 END');
      done()
    });

    /**
     * @tc.name   stepperTest_0200
     * @tc.number stepperTest_0200
     * @tc.desc   stepperTest_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stepperTest_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('stepperTest_0200 START');
      let strJson: string = getInspectorByKey('stepper');
      console.info("stepperTest_0200 component strJson:" + strJson);
      console.info("stepperTest_0200 component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.index).assertEqual('0');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "currentIndex": 1,
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 202,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("stepperTest_0200 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("stepperTest_0200 change component data error: " + (err as BusinessError).message);
      }
      await Utils.sleep(3000);
      let strJsonNew: string = getInspectorByKey('stepper');
      console.info("stepperTest_0200 component objNew is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.index).assertEqual('1');
      console.info('stepperTest_0200 END');
      done()
    });

    /**
     * @tc.name   stepperTest_0400
     * @tc.number stepperTest_0400
     * @tc.desc   stepperTest_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stepperTest_0400',  Level.LEVEL0, async (done: Function) => {

      await Utils.sleep(1000);
      globalThis.value.message.notify({
        name: 'index', value: -558038585
      })
      await Utils.sleep(2000);
      let strJsonNew: string = getInspectorByKey('stepper');
      console.info("stepperTest_0400 component objNew is: " + JSON.parse(strJsonNew).$attrs.index);
      expect(JSON.parse(strJsonNew).$attrs.index).assertEqual('0');
      console.info('stepperTest_0400 END');
      done()
    });

    /**
     * @tc.name   stepperTest_0500
     * @tc.number stepperTest_0500
     * @tc.desc   stepperTest_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stepperTest_0500',  Level.LEVEL0, async (done: Function) => {
      console.info('[stepperTest_0500] START');
      await Utils.sleep(1000);
      globalThis.value.message.notify({
        name: 'index', value: -10
      })
      await Utils.sleep(2000);
      let strJsonNew: string = getInspectorByKey('stepper');
      console.info("stepperTest_0500 component objNew is: " + JSON.parse(strJsonNew).$attrs.index);
      expect(JSON.parse(strJsonNew).$attrs.index).assertEqual('0');
      console.info('stepperTest_0400 END');
      done()
    });

    /**
     * @tc.name   stepperTest_0300
     * @tc.number stepperTest_0300
     * @tc.desc   stepperTest_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('stepperTest_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('stepperTest_0300v START');
      let strJson: string = getInspectorByKey('stepper');
      console.info("stepperTest_0300 component strJson:" + strJson);
      console.info("stepperTest_0300 component obj is: " + JSON.stringify(JSON.parse(strJson)));
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "currentIndex": 11111111,
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 909,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("stepperTest_0300 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("stepperTest_0300 change component data error: " + (err as BusinessError).message);
      }
      await Utils.sleep(3000);
      let strJsonNew: string = getInspectorByKey('stepper');
      console.info("stepperTest_0300 component objNew is: " + JSON.stringify(JSON.parse(strJsonNew)));
      expect(JSON.parse(strJsonNew).$attrs.index).assertEqual('0');
      console.info('stepperTest_0300 END');
      done()
    });

  })
}