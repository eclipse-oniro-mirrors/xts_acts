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

export default function cachedShowList() {
  describe('cachedShowList', () => {
    beforeEach(async (done: Function) => {
      console.info("cachedShowList beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/cachedShowList",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get cachedShowList state pages:" + JSON.stringify(pages));
        if (!("cachedShowList" == pages.name)) {
          console.info("get cachedShowList pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push cachedShowList page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push cachedShowList page error:" + err);
      }
      console.info("cachedShowList beforeEach end");
      done();
    });

    /**
     * @tc.number    cachedShowList_001
     * @tc.name      cachedShowList_0100
     * @tc.desc      Set the preloading quantity of listItem in the list and display preloading nodes.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('cachedShowList_0100', 0, async (done: Function) => {
      console.info('[cachedShowList_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let strJson = getInspectorByKey('cachedCount_show_list');
      console.info("[cachedShowList_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[cachedShowList_0100] cachedCount: " + JSON.stringify(JSON.parse(strJson).$attrs.cachedCount));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$type).assertEqual('List');
      expect(JSON.parse(strJson).$attrs.cachedCount).assertEqual('2');
      await driver.assertComponentExist(ON.text('4'));
      console.info('[cachedShowList_0100] END');
      done();
    });

    /**
     * @tc.number    cachedShowList_002
     * @tc.name      cachedShowList_0200
     * @tc.desc      Do not crop sub components, and do not display preloaded nodes.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('cachedShowList_0200', 0, async (done: Function) => {
      console.info('[cachedShowList_0200] START');
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
        console.info("[cachedShowList_0200] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[cachedShowList_0200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let driver = await Driver.create()
      let onText: Component = await driver.findComponent(ON.type('Text').isAfter(ON.text('3')));
      console.info("[cachedShowList_0200] onText is: " + onText);
      expect(onText).assertEqual(null);
      console.info('[cachedShowList_0200] END');
      done();
    });

    /**
     * @tc.number    cachedShowList_003
     * @tc.name      cachedShowList_0300
     * @tc.desc      Crop sub components without displaying preloaded nodes.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('cachedShowList_0300', 0, async (done: Function) => {
      console.info('[cachedShowList_0300] START');
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
        console.info("[cachedShowList_0300] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[cachedShowGrid_0300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let driver = await Driver.create()
      let onText: Component = await driver.findComponent(ON.type('Text').isAfter(ON.text('3')));
      console.info("[cachedShowList_0300] onText is: " + onText);
      expect(onText).assertEqual(null);
      console.info('[cachedShowList_0300] END');
      done();
    });

    /**
     * @tc.number    cachedShowList_004
     * @tc.name      cachedShowList_0400
     * @tc.desc      Configure to display preloaded nodes and crop sub components.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('cachedShowList_0400', 0, async (done: Function) => {
      console.info('[cachedShowList_0400] START');
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
        console.info("[cachedShowList_0400] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[cachedShowList_0400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let driver = await Driver.create()
      let onText: Component = await driver.findComponent(ON.type('Text').isAfter(ON.text('3')));
      let text = await onText.getText();
      console.info("[cachedShowList_0400'] text is: " + text);
      await driver.assertComponentExist(ON.text('4'));
      console.info('[cachedShowList_0400] END');
      done();
    });

    /**
     * @tc.number    cachedShowList_005
     * @tc.name      cachedShowList_0500
     * @tc.desc      Do not crop the sub components, configure the property parameter 'show' as null.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('cachedShowList_0500', 0, async (done: Function) => {
      console.info('[cachedShowList_0500] START');
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
        console.info("[cachedShowList_0500] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[cachedShowList_0500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let driver = await Driver.create()
      let onText: Component = await driver.findComponent(ON.type('Text').isAfter(ON.text('3')));
      console.info("[cachedShowList_0500] onText is: " + onText);
      expect(onText).assertEqual(null);
      console.info('[cachedShowList_0500] END');
      done();
    });

    /**
     * @tc.number    cachedShowList_006
     * @tc.name      cachedShowList_0600
     * @tc.desc      Do not crop the sub components, configure the property parameter 'show' as undefined.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('cachedShowList_0600', 0, async (done: Function) => {
      console.info('[cachedShowList_0600] START');
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
        console.info("[cachedShowList_0600] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[cachedShowList_0600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let driver = await Driver.create()
      let onText: Component = await driver.findComponent(ON.type('Text').isAfter(ON.text('3')));
      console.info("[cachedShowList_0600] onText is: " + onText);
      expect(onText).assertEqual(null);
      console.info('[cachedShowList_0600] END');
      done();
    });
  })
}
