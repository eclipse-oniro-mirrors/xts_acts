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
import Utils from '../../MainAbility/common/Utils';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';


export default function refreshResource() {
  describe('refreshResource', () => {
    beforeEach(async (done: Function) => {
      console.info("refresh beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Refresh/refreshResource',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get refresh state pages:" + JSON.stringify(pages));
        if (!("refresh" == pages.name)) {
          console.info("get refresh state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push refresh page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push refresh page error:" + err);
      }
      done()
    });


    /**
     * @tc.name   refreshResource_0100
     * @tc.number refreshResource_0100
     * @tc.desc   refreshResource_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('refreshResource_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[refreshResource_0100] START');
      let strJson: string = getInspectorByKey('refreshResource');
      console.info("[refreshResource_0100] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.promptText).assertEqual("Refreshing...");
      expect(JSON.parse(strJson).$attrs.refreshOffset).assertEqual("64.00vp");
      console.info('refreshResource_0100 END');
      done();
    });


    /**
     * @tc.name   refreshResource_0200
     * @tc.number refreshResource_0200
     * @tc.desc   refreshResource_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('refreshResource_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[refreshResource_0200] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "promptText": $r('app.string.Refresh_SpecialCharacters')
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 180,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[refreshResource_0200] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[refreshResource_0200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('refreshResource');

      console.info("[refreshResource_0200] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.promptText).assertEqual("*&^%$#@!~...");
      console.info('refreshResource_0200 END');
      done();
    });


    /**
     * @tc.name   refreshResource_0300
     * @tc.number refreshResource_0300
     * @tc.desc   refreshResource_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('refreshResource_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[refreshResource_0300] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "promptText": $r('app.string.Refresh_ChineseCharacters')
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 180,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[refreshResource_0300] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[refreshResource_0300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('refreshResource');

      console.info("[refreshResource_0300] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.promptText).assertEqual("下拉刷新。。。");
      console.info('refreshResource_0300 END');
      done();
    });


    /**
     * @tc.name   refreshResource_0400
     * @tc.number refreshResource_0400
     * @tc.desc   refreshResource_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('refreshResource_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[refreshResource_0400] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "promptText": $r('app.string.Refresh_Alphabet')
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 180,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[refreshResource_0400] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[refreshResource_0400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('refreshResource');

      console.info("[refreshResource_0400] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.promptText).assertEqual("abcabc");
      console.info('refreshResource_0400 END');
      done();
    });


    /**
     * @tc.name   refreshResource_0500
     * @tc.number refreshResource_0500
     * @tc.desc   refreshResource_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('refreshResource_0500', Level.LEVEL1, async (done: Function) => {
      console.info('[refreshResource_0500] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "promptText": $r('app.string.Refresh_VeryLongText')
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 180,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[refreshResource_0500] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[refreshResource_0500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('refreshResource');

      console.info("[refreshResource_0500] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.promptText).assertEqual("文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本");
      console.info('refreshResource_0500 END');
      done();
    });


    /**
     * @tc.name   refreshResource_0600
     * @tc.number refreshResource_0600
     * @tc.desc   refreshResource_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('refreshResource_0600', Level.LEVEL1, async (done: Function) => {
      console.info('[refreshResource_0600] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "promptText": $r('app.string.Refresh_MixedContent')
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 180,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[refreshResource_0600] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[refreshResource_0600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('refreshResource');

      console.info("[refreshResource_0600] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.promptText).assertEqual("*&#123swq...");
      console.info('refreshResource_0600 END');
      done();
    });


    /**
     * @tc.name   refreshResource_0700
     * @tc.number refreshResource_0700
     * @tc.desc   refreshResource_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('refreshResource_0700', Level.LEVEL1, async (done: Function) => {
      console.info('[refreshResource_0700] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "promptText": $r('app.string.Refresh_Numbers')
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 180,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[refreshResource_0700] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[refreshResource_0700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('refreshResource');

      console.info("[refreshResource_0700] JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.promptText).assertEqual("123456");
      console.info('refreshResource_0700 END');
      done();
    });

  });
}
