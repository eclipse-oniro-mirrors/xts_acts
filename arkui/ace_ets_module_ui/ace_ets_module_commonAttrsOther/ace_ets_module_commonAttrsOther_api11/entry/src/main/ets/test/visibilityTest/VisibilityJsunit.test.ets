
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

export default function visibilityJsunit() {
  describe('visibilityTest', () => {
    beforeEach(async () => {
      console.info("visibility beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/visibility/visibility',
      }
      try {
        router.clear();
        let pages:router.RouterState = router.getState();
        console.info("get visibility state pages:" + JSON.stringify(pages));
        if (!("visibility" == pages.name)) {
          console.info("get visibility state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push visibility page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push visibility page error:" + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("visibility after each called");
    });

    /**
     * @tc.name   testVisibility01
     * @tc.number testVisibility01
     * @tc.desc   testVisibility01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVisibility01', Level.LEVEL0, async () => {
      console.info('[testVisibility01] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('box');
      
      console.info("[testVisibility01] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      console.info('[testVisibility01] END');

    });

    /**
     * @tc.name   testVisibility02
     * @tc.number testVisibility02
     * @tc.desc   testVisibility02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVisibility02', Level.LEVEL0, async () => {
      console.info('[testVisibility02] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "visibility": Visibility.Hidden,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 47,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testVisibility02] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testVisibility02] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('box');
      
      console.info("[testVisibility02] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Hidden');
      console.info('[testVisibility02] END');

    });

    /**
     * @tc.name   testVisibility03
     * @tc.number testVisibility03
     * @tc.desc   testVisibility03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVisibility03', Level.LEVEL0, async () => {
      console.info('[testVisibility03] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "visibility": Visibility.None,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 48,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testVisibility03] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testVisibility03] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('box');
      
      console.info("[testVisibility03] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.None');
      console.info('[testVisibility03] END');

    });

    /**
     * @tc.name   testVisibility04
     * @tc.number testVisibility04
     * @tc.desc   testVisibility04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVisibility04', Level.LEVEL0, async () => {
      console.info('[testVisibility04] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "visibility": 0.11111
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1116,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testVisibility04] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testVisibility04] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('box');
      
      console.info("[testVisibility04] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      console.info('[testVisibility04] END');
    });

    /**
     * @tc.name   testVisibility05
     * @tc.number testVisibility05
     * @tc.desc   testVisibility05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVisibility05', Level.LEVEL0, async () => {
      console.info('[testVisibility05] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "visibility": 'nothing',
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 1116,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testVisibility05] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testVisibility05] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('box');
      console.info("[testVisibility05] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.visibility).assertEqual('Visibility.Visible');
      console.info('[testVisibility05] END');
    });
  })
}
