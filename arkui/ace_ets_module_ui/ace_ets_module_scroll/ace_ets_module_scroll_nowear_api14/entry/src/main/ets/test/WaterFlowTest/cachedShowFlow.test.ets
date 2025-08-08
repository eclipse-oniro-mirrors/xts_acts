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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function cachedShowFlow() {
  describe('cachedShowFlow', () => {
    beforeEach(async (done: Function) => {
      console.info("cachedShowFlow beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/cachedShowFlow",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get cachedShowFlow state pages:" + JSON.stringify(pages));
        if (!("cachedShowFlow" == pages.name)) {
          console.info("get cachedShowFlow pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push cachedShowFlow page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push cachedShowFlow page error:" + err);
      }
      console.info("cachedShowFlow beforeEach end");
      done();
    });

    /**
     * @tc.number    cachedShowFlow_001
     * @tc.name      cachedShowFlow_0100
     * @tc.desc      Set the number of FlowItems to be preloaded and display preloading nodes.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('cachedShowFlow_0100', 0, async (done: Function) => {
      console.info('[cachedShowFlow_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let strJson = getInspectorByKey('cachedCount_show_flow');
      console.info("[cachedShowFlow_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[cachedShowFlow_0100] cachedCount: " + JSON.stringify(JSON.parse(strJson).$attrs.cachedCount));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$type).assertEqual('WaterFlow');
      expect(JSON.parse(strJson).$attrs.cachedCount).assertEqual(6);
      await driver.assertComponentExist(ON.text('N9'));
      console.info('[cachedShowFlow_0100] END');
      done();
    });

    /**
     * @tc.number    cachedShowFlow_002
     * @tc.name      cachedShowFlow_0200
     * @tc.desc      Do not crop sub components, and do not display preloaded nodes.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('cachedShowFlow_0200', 0, async (done: Function) => {
      console.info('[cachedShowFlow_0200] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "clip1": false,
            "show1": false
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 125,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[cachedShowFlow_0200] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[cachedShowFlow_0200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let driver = await Driver.create()
      let onText: Component = await driver.findComponent(ON.type('Text').isAfter(ON.text('N8')));
      console.info("[cachedShowFlow_0200] onText is: " + onText);
      expect(onText).assertEqual(null);
      console.info('[cachedShowFlow_0200] END');
      done();
    });

    /**
     * @tc.number    cachedShowFlow_003
     * @tc.name      cachedShowFlow_0300
     * @tc.desc      Crop sub components without displaying preloaded nodes.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('cachedShowFlow_0300', 0, async (done: Function) => {
      console.info('[cachedShowFlow_0300] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "clip1": true,
            "show1": false
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 125,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[cachedShowFlow_0300] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[cachedShowGrid_0300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let driver = await Driver.create()
      let onText: Component = await driver.findComponent(ON.type('Text').isAfter(ON.text('N8')));
      console.info("[cachedShowFlow_0300] onText is: " + onText);
      expect(onText).assertEqual(null);
      console.info('[cachedShowFlow_0300] END');
      done();
    });

    /**
     * @tc.number    cachedShowFlow_004
     * @tc.name      cachedShowFlow_0400
     * @tc.desc      Configure to display preloaded nodes and crop sub components.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('cachedShowFlow_0400', 0, async (done: Function) => {
      console.info('[cachedShowFlow_0400] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "clip1": true,
            "show1": true
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 125,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[cachedShowFlow_0400] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[cachedShowFlow_0400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let driver = await Driver.create()
      let onText: Component = await driver.findComponent(ON.type('Text').isAfter(ON.text('N8')));
      let text = await onText.getText();
      console.info("[cachedShowFlow_0400'] text is: " + text);
      await driver.assertComponentExist(ON.text('N9'));
      console.info('[cachedShowFlow_0400] END');
      done();
    });

    /**
     * @tc.number    cachedShowFlow_005
     * @tc.name      cachedShowFlow_0500
     * @tc.desc      Do not crop the sub components, configure the property parameter 'show' as null.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('cachedShowFlow_0500', 0, async (done: Function) => {
      console.info('[cachedShowFlow_0500] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "clip1": false,
            "show1": null
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 125,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[cachedShowFlow_0500] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[cachedShowFlow_0500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let driver = await Driver.create()
      let onText: Component = await driver.findComponent(ON.type('Text').isAfter(ON.text('N8')));
      console.info("[cachedShowFlow_0500] onText is: " + onText);
      expect(onText).assertEqual(null);
      console.info('[cachedShowFlow_0500] END');
      done();
    });

    /**
     * @tc.number    cachedShowFlow_006
     * @tc.name      cachedShowFlow_0600
     * @tc.desc      Do not crop the sub components, configure the property parameter 'show' as undefined.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('cachedShowFlow_0600', 0, async (done: Function) => {
      console.info('[cachedShowFlow_0600] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "clip1": false,
            "show1": undefined
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 125,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[cachedShowFlow_0600] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[cachedShowFlow_0600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let driver = await Driver.create()
      let onText: Component = await driver.findComponent(ON.type('Text').isAfter(ON.text('N8')));
      console.info("[cachedShowFlow_0600] onText is: " + onText);
      expect(onText).assertEqual(null);
      console.info('[cachedShowFlow_0600] END');
      done();
    });
  })
}
