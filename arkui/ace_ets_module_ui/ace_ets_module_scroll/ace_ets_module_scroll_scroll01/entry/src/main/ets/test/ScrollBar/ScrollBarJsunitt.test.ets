
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
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../MainAbility/common/Common';

export default function scrollBarJsunitt() {
  describe('scrollBarJsunitt', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ScrollBar/scrollBarr',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollBar state success " + JSON.stringify(pages));
        if (!("scrollBarr" == pages.name)) {
          console.info("get scrollBar success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollBar page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollBar page error " + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("scrollBar after each called");
    });

    /**
     * @tc.name   testScrollBar001
     * @tc.number testScrollBar001
     * @tc.desc   Testing for the ScrollBar component.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollBar001', Level.LEVEL1, async (done: Function) => {
      console.info('[testScrollBar001] START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('scroll');
      console.info("[testScrollBar001] component strJson:" + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testScrollBar001] direction:" + obj.$attrs.direction);
      expect(obj.$attrs.direction).assertEqual('ScrollBarDirection.Vertical');
      done();
    });

    /**
     * @tc.name   testScrollBar002
     * @tc.number testScrollBar002
     * @tc.desc   Testing for the ScrollBar component.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollBar002', Level.LEVEL1, async (done: Function) => {
      console.info('[testScrollBar002] START');
      let object: ESObject = {
        "directionValue": "ScrollBarDirection.Horizontal"
      };
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "directionObject": JSON.stringify(object)
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testScrollBar002] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testScrollBar002] change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJson = getInspectorByKey('scroll');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testScrollBar002] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.direction).assertEqual('ScrollBarDirection.Vertical');
      console.info('testScrollBar002 END');
      done();
    });

    /**
     * @tc.name   testScrollBar003
     * @tc.number testScrollBar003
     * @tc.desc   Testing for the ScrollBar component.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollBar003', Level.LEVEL1, async (done: Function) => {
      console.info('[testScrollBar003] START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('scroll');
      console.info("[testScrollBar003] component strJson:" + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testScrollBar003] state:" + obj.$attrs.state);
      expect(obj.$attrs.state).assertEqual('BarState.Off');
      done();
    });

    /**
     * @tc.name   testScrollBar004
     * @tc.number testScrollBar004
     * @tc.desc   Testing for the ScrollBar component.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollBar004', Level.LEVEL1, async (done: Function) => {
      console.info('[testScrollBar004] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "stateValue": BarState.On
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testScrollBar004] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testScrollBar004] change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJson = getInspectorByKey('scroll');
      console.info("[testScrollBar004] component strJson:" + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testScrollBar004] state:" + obj.$attrs.state);
      expect(obj.$attrs.state).assertEqual("BarState.On");
      done();
    });

    /**
     * @tc.name   testScrollBar005
     * @tc.number testScrollBar005
     * @tc.desc   Testing for the ScrollBar component.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScrollBar005', Level.LEVEL1, async (done: Function) => {
      console.info('[testScrollBar005] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "stateValue": BarState.Auto
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 184,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testScrollBar005] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testScrollBar005] change component data error: " + err.message);
      }
      await CommonFunc.sleep(4000);
      let strJson = getInspectorByKey('scroll');
      console.info("[testScrollBar005] component strJson:" + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testScrollBar005] state:" + obj.$attrs.state);
      expect(obj.$attrs.state).assertEqual("BarState.Auto");
      done();
    });
  })
}