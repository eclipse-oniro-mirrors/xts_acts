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
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';
import events_emitter from '@ohos.events.emitter';

export default function panelJsunit2() {
  describe('panelTest2', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/panel2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get panel state success " + JSON.stringify(pages));
        if (!("panel2" == pages.name)) {
          console.info("get panel state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(4000);
          console.info("push panel page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push panel page error " + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("panel after each called");
    });

    /**
     * @tc.name   testPanel_100
     * @tc.number testPanel_100
     * @tc.desc   testPanel_100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPanel_100', Level.LEVEL2, async (done: Function) => {
      console.info('testPanel_100 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "type": "PanelType.Minibar"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 147,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testPanel_100 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testPanel_100 change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('Panel');
      console.info("testPanel_100 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      await Utils.sleep(2000);
      expect(JSON.parse(strJson).$attrs.type).assertEqual("PanelType.Minibar");
      console.info('testPanel_100 END');
      done();
    });

    /**
     * @tc.name   testPanel_200
     * @tc.number testPanel_200
     * @tc.desc   testPanel_200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPanel_200', Level.LEVEL2, async (done: Function) => {
      console.info('testPanel_200 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "mode": "PanelMode.Mini"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 148,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testPanel_200 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testPanel_200 change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('Panel');
      console.info("testPanel_200 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      await Utils.sleep(2000);
      expect(JSON.parse(strJson).$attrs.mode).assertEqual("PanelMode.Mini");
      console.info('testPanel_200 END');
      done();
    });

    /**
     * @tc.name   testPanel_300
     * @tc.number testPanel_300
     * @tc.desc   testPanel_300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPanel_300', Level.LEVEL2, async (done: Function) => {
      console.info('testPanel_300 START');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "show": "true"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 149,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testPanel_300 start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testPanel_300 change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('Panel');
      console.info("testPanel_300 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.show).assertEqual("true");
      console.info('testPanel_300 END');
      done();
    });

    /**
     * @tc.name   testPanel_400
     * @tc.number testPanel_400
     * @tc.desc   testPanel_400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPanel_400', Level.LEVEL2, async (done: Function) => {
      console.info('testPanel_400 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('Panel');
      console.info("testPanel_400 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.dragBar).assertEqual("true");
      console.info('testPanel_400 END');
      done();
    });

    /**
     * @tc.name   testPanel_500
     * @tc.number testPanel_500
     * @tc.desc   testPanel_500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPanel_500', Level.LEVEL2, async (done: Function) => {
      console.info('testPanel_500 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('Panel');
      console.info("testPanel_500 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.fullHeight).assertEqual("0.000000vp");
      console.info('testPanel_500 END');
      done();
    });

    /**
     * @tc.name   testPanel_600
     * @tc.number testPanel_600
     * @tc.desc   testPanel_600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPanel_600', Level.LEVEL2, async (done: Function) => {
      console.info('testPanel_600 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('Panel');
      console.info("testPanel_600 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.halfHeight).assertEqual("500.000000vp");
      console.info('testPanel_600 END');
      done();
    });

    /**
     * @tc.name   testPanel_700
     * @tc.number testPanel_700
     * @tc.desc   testPanel_700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPanel_700', Level.LEVEL2, async (done: Function) => {
      console.info('testPanel_700 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('Panel');
      console.info("testPanel_700 component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.miniHeight).assertEqual("0.000000vp");
      console.info('testPanel_700 END');
      done();
    });
  })
}