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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "@ohos/hypium";
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../MainAbility/common/Common';
import { BusinessError } from '@ohos.base';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.information/MainAbility';

export default function searchJsunit() {
  describe('searchJsunit', () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/search',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get search state success " + JSON.stringify(pages));
        if (!("search" == pages.name)) {
          console.info("get search success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push search page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push search page error " + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("search after each called");
    });

    /**
     * @tc.name   testSearch001
     * @tc.number testSearch001
     * @tc.desc   testSearch001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSearch001', Level.LEVEL0, async (done: Function) => {
      console.info('[testSearch001] START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('search');
      console.info("[testSearch001] component strJson:" + strJson);
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.searchButton).assertEqual('10');
      done();
    });

    /**
     * @tc.name   testSearch002
     * @tc.number testSearch002
     * @tc.desc   testSearch002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSearch002', Level.LEVEL0, async (done: Function) => {
      console.info('[testSearch002] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButton": "5"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 190,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSearch002] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testSearch002] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = getInspectorByKey('search');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("[testSearch002] component objNew is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.searchButton).assertEqual('5');
      done();
    });

    /**
     * @tc.name   testSearch003
     * @tc.number testSearch003
     * @tc.desc   set max length 19, get backend max length property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSearch003', Level.LEVEL0, async (done: Function) => {
      console.info('[testSearch003] START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('search');
      console.info("[testSearch003] component strJson:" + strJson);
      let obj3: ESObject = JSON.parse(strJson);
      expect(obj3.$attrs.maxLength).assertEqual('19');
      done();
    });

    /**
     * @tc.name   testSearch004
     * @tc.number testSearch004
     * @tc.desc   set max length 0, get backend max length property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSearch004', Level.LEVEL0, async (done: Function) => {
      console.info('[testSearch004] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "maxLength": 0
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 190,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSearch004] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testSearch004] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('search');
      console.info("[testSearch004] component strJson:" + strJson);
      let obj4: ESObject = JSON.parse(strJson);
      expect(obj4.$attrs.maxLength).assertEqual('0');
      done();
    });

    /**
     * @tc.name   testSearch005
     * @tc.number testSearch005
     * @tc.desc   set max length 0, get backend max length property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSearch005', Level.LEVEL0, async (done: Function) => {
      console.info('[testSearch005] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "maxLength": 123
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 190,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSearch005] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testSearch005] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('search');
      console.info("[testSearch005] component strJson:" + strJson);
      let obj5: ESObject = JSON.parse(strJson);
      expect(obj5.$attrs.maxLength).assertEqual('123');
      done();
    });

    /**
     * @tc.name   testSearch006
     * @tc.number testSearch006
     * @tc.desc   set max length 1000000, get backend max length property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSearch006', Level.LEVEL0, async (done: Function) => {
      console.info('[testSearch006] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "maxLength": 1000000
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 190,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSearch006] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testSearch006] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('search');
      console.info("[testSearch006] component strJson:" + strJson);
      let obj6: ESObject = JSON.parse(strJson);
      expect(obj6.$attrs.maxLength).assertEqual('INF');
      done();
    });

    /**
     * @tc.name   testSearch007
     * @tc.number testSearch007
     * @tc.desc   set max length illeggal value, get backend max length property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSearch007', Level.LEVEL0, async (done: Function) => {
      console.info('[testSearch007] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "maxLength": -1
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 190,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSearch007] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testSearch007] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('search');
      console.info("[testSearch007] component strJson:" + strJson);
      let obj7: ESObject = JSON.parse(strJson);
      expect(obj7.$attrs.maxLength).assertEqual('INF');
      done();
    });

    /**
     * @tc.name   testSearch008
     * @tc.number testSearch008
     * @tc.desc   set max length illeggal value, get backend max length property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSearch008', Level.LEVEL0, async (done: Function) => {
      console.info('[testSearch008] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "maxLength": 1020300
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 190,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSearch008] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testSearch008] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('search');
      console.info("[testSearch008] component strJson:" + strJson);
      let obj8: ESObject = JSON.parse(strJson);
      expect(obj8.$attrs.maxLength).assertEqual('INF');
      done();
    });

    /**
     * @tc.name   testSearch009
     * @tc.number testSearch009
     * @tc.desc   get default copy options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSearch009', Level.LEVEL0, async (done: Function) => {
      console.info('[testSearch009] START');
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('search');
      console.info("[testSearch009] component strJson:" + strJson);
      let obj9: ESObject = JSON.parse(strJson);
      expect(obj9.$attrs.copyOption).assertEqual('CopyOptions.Local');
      done();
    });

    /**
     * @tc.name   testSearch0010
     * @tc.number testSearch0010
     * @tc.desc   get default copy options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSearch0010', Level.LEVEL0, async (done: Function) => {
      console.info('[testSearch0010] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "copyOption": CopyOptions.InApp
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 190,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSearch0010] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testSearch0010] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('search');
      console.info("[testSearch0010] component strJson:" + strJson);
      let obj10: ESObject = JSON.parse(strJson);
      expect(obj10.$attrs.copyOption).assertEqual('CopyOptions.InApp');
      done();
    });

    /**
     * @tc.name   testSearch0011
     * @tc.number testSearch0011
     * @tc.desc   get CopyOptions.CROSS_DEVICE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSearch0011', Level.LEVEL0, async (done: Function) => {
      console.info('[testSearch0011] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "copyOption": CopyOptions.CROSS_DEVICE
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 190,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSearch0011] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testSearch0011] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('search');
      console.info("[testSearch0011] component strJson:" + strJson);
      let obj11: ESObject = JSON.parse(strJson);
      expect(obj11.$attrs.copyOption).assertEqual('CopyOptions.Distributed');
      done();
    });

    /**
     * @tc.name   testSearch099
     * @tc.number testSearch099
     * @tc.desc   expect caretOffset index 0 when text is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSearch099', Level.LEVEL0, async (done: Function) => {
      console.info('[testSearch099] START');
      await CommonFunc.sleep(1000);
      let driver = UiDriver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(BY.key('caretOffsetBtn'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let caretText = await driver.findComponent(BY.key('caretOffsetText'));
      let text = await caretText.getText();
      expect(text).assertEqual('Index0');
      done();
    });

    /**
     * @tc.name   testSearch100
     * @tc.number testSearch100
     * @tc.desc   expect caretOffset index 9 when text length is 9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSearch100', Level.LEVEL0, async (done: Function) => {
      console.info('[testSearch100] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "text": '123456789'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 190,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSearch100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testSearch100] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let driver = UiDriver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(BY.key('caretOffsetBtn'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let caretText = await driver.findComponent(BY.key('caretOffsetText'));
      let text = await caretText.getText();
      expect(text).assertEqual('Index9');
      done();
    });

    /**
     * @tc.name   testSearch101
     * @tc.number testSearch101
     * @tc.desc   expect caretOffset index max length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSearch101', Level.LEVEL0, async (done: Function) => {
      console.info('[testSearch101] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "text": '1234567890abc'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 190,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSearch101] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testSearch101] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let driver = UiDriver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(BY.key('caretOffsetBtn'));
      await btn.click();
      await CommonFunc.sleep(1000);
      let caretText = await driver.findComponent(BY.key('caretOffsetText'));
      let text = await caretText.getText();
      expect(text).assertEqual('Index10');
      done();
    });
  })
}
