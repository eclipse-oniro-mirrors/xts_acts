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
import { describe, beforeEach, afterEach, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import Utils from '../Utils';
import { BusinessError } from '@ohos.base';

export default function sharedTransitionJsunit() {
  describe('sharedTransitionJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("sharedTransition beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigator/sharedTransition',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get sharedTransition state pages:" + JSON.stringify(pages));
        if (!("sharedTransition" == pages.name)) {
          console.info("get sharedTransition state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push sharedTransition page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push sharedTransition page error:" + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("sharedTransition after each called");
    });

    it('sharedTransitionTest_0100', 0, async (done: Function) => {
      console.info('sharedTransitionTest_0100 START');
      let strJson: string = getInspectorByKey('Navigator');

      console.info("sharedTransitionTest_0100 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$type).assertEqual('Navigator')
      console.info('sharedTransitionTest_0100 END');
      done();
    });

    it('sharedTransitionTest_0200', 0, async (done: Function) => {
      console.info('sharedTransitionTest_0200 START');
      let strJson: string = getInspectorByKey('Navigator');

      console.info("sharedTransitionTest_0200 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$type).assertEqual('Navigator')
      expect(JSON.parse(strJson).$attrs.target).assertEqual('pages/sharedTransition2')
      console.info('sharedTransitionTest_0200 END');
      done();
    });

    it('sharedTransitionTest_0300', 0, async (done: Function) => {
      console.info('sharedTransitionTest_0300 START');
      let strJson: string = getInspectorByKey('Navigator');

      console.info("sharedTransitionTest_0300 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$type).assertEqual('Navigator')
      expect(JSON.parse(strJson).$attrs.active).assertEqual('false')
      console.info('sharedTransitionTest_0300 END');
      done();
    });

    it('sharedTransitionTest_0400', 0, async (done: Function) => {
      console.info('sharedTransitionTest_0400 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "duration": 2000,
            "delay": 5,
            "type": SharedTransitionEffectType.Exchange
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 194,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(indexEvent, eventData);
        await Utils.sleep(2500);
      } catch (err) {
        console.log("sharedTransitionTest_0400 change component data error: " + (err as BusinessError).message);
      }
      let callback = (indexEventOne: events_emitter.EventData) => {
        console.info("sharedTransitionTest_0400 get state result is: " + JSON.stringify(indexEventOne));
        try {
          expect(indexEventOne.data?.duration).assertEqual(2000);
          expect(indexEventOne.data?.delay).assertEqual(5);
          expect(indexEventOne.data?.type).assertEqual(SharedTransitionEffectType.Exchange);
        } catch (err) {
          console.info("sharedTransitionTest_0400 error: " + (err as BusinessError).message);
        }

      }
      let indexEventOne: events_emitter.InnerEvent = {
        eventId: 193,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEventOne, callback);
      } catch (err) {
        console.info("sharedTransitionTest_0400 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("sharedTransitionTest_0400 click result is: " + JSON.stringify(sendEventByKey('Navigator', 10, "")));
      await Utils.sleep(2000);
      console.info('sharedTransitionTest_0400 END');
      done();
    });
  })
}

