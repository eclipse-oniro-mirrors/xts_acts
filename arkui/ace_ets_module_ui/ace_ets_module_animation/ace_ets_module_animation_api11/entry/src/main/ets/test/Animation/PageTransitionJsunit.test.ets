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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../MainAbility/common/Utils';


export default function pageTransitionJsunit() {
  describe('pageTransitionJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("pageTransition beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Animation/pageTransition',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get pageTransition state pages:" + JSON.stringify(pages));
        if (!("pageTransition" == pages.name)) {
          console.info("get pageTransition state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push pageTransition page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push pageTransition page error:" + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("pageTransition after each called");
    });

    it('pageTransitionTest_0100', 0, async (done: Function) => {
      console.info('pageTransitionTest_0100 START');
      let strJson = getInspectorByKey('Navigator');
      console.info("pageTransitionTest_0100 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$type).assertEqual('Navigator');
      expect(JSON.parse(strJson).$attrs.target).assertEqual('pages/pageTransition2');
      console.info('pageTransitionTest_0100 END');
      done();
    });

    it('pageTransitionTest_0200', 0, async (done: Function) => {
      console.info('pageTransitionTest_0200 START');
      let strJson = getInspectorByKey('Navigator');
      console.info("pageTransitionTest_0200 component strJson:" + strJson);
      console.info("pageTransitionTest_0200 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.active).assertEqual('false');
      console.info('pageTransitionTest_0200 END');
      done();
    });

    it('pageTransitionTest_0300', 0, async (done: Function) => {
      console.info('pageTransitionTest_0300 START');
      let strJson = getInspectorByKey('Navigator');
      console.info("pageTransitionTest_0300 component strJson:" + strJson);
      console.info("pageTransitionTest_0300 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.type).assertEqual('NavigationType.Push');
      console.info('pageTransitionTest_0300 END');
      done();
    });

    it('pageTransitionTest_0400', 0, async (done: Function) => {
      console.info('pageTransitionTest_0400 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "scale": 6,
            "opacity": 5
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 145,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("pageTransitionTest_0400 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("pageTransitionTest_0400 change component data error: " + err.message);
      }
      await Utils.sleep(4000);
      let callback = (indexEventOne: events_emitter.EventData) => {
        try {
          console.info("pageTransitionTest_0400 get state result is: " + JSON.stringify(indexEventOne));
          expect(indexEventOne.data?.scale).assertEqual(6);
          expect(indexEventOne.data?.opacity).assertEqual(5);
          expect(indexEventOne.data?.type).assertEqual(RouteType.Push);
        } catch (err) {
          console.info("pageTransitionTest_0400 get state result is err:  " + JSON.stringify(err));
        }
      }
      let indexEventOne: events_emitter.InnerEvent = {
        eventId: 144,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEventOne, callback);
      } catch (err) {
        console.info("pageTransitionTest_0400 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("pageTransitionTest_0400 click result is: " + JSON.stringify(sendEventByKey('Navigator', 10, "")));
      await Utils.sleep(2000);
      console.info('pageTransitionTest_0400 END');
      done();
    });
  })
}

