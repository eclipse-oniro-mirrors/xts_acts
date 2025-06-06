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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';
import orouter from '@ohos.router';

export default function OhosRouterJsunit() {
  describe('ohosRouterTest', () => {
    beforeEach(async () => {
      let options: router.RouterOptions  = {
        url: 'pages/ohosRouterA',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ohosRouter state success " + JSON.stringify(pages));
        if (!("ohosRouter" == pages.name)) {
          console.info("get ohosRouter state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(4000);
          console.info("push ohosRouter page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ohosRouter page error " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("ohosRouter after each called");
    });

    it('ohosRouterTest001', 0, async () => {
      console.info('[ohosRouterTest001] START');
      let options: router.RouterOptions  = {
        uri: 'pages/ohosRouterA',
      }
      try {
        let result = await router.push(options);
        await Utils.sleep(1000);
        console.info("[ohosRouterTest001] push page success " + JSON.stringify(result));
        let pages = router.getState();
        expect(pages.index).assertEqual(3);
        expect(pages.name).assertEqual('ohosRouterA');
        expect(pages.path).assertEqual('pages/');
      } catch (err) {
        console.error("[ohosRouterTest001] push page error: " + err);
      }
      await Utils.sleep(2000);

    });

    it('ohosRouterTest002', 0, async () => {
      console.info('[ohosRouterTest002] START');
      let options: router.RouterOptions  = {
        uri: 'pages/ohosRouterA'
      }
      try {
        let result = await router.push(options);
        console.info("[ohosRouterTest002] push page success " + JSON.stringify(result));
      } catch (err) {
        console.error("[ohosRouterTest002] push page error " + JSON.stringify(err));
      }
      await Utils.sleep(1500);
      let callback = (paramsEvent) => {
        console.info("[ohosRouterTest002] get state result is: " + JSON.stringify(paramsEvent));
        expect(paramsEvent.data.params).assertEqual('B Page');
      }
      let paramsEvent: events_emitter.InnerEvent = {
        eventId: 142,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(paramsEvent, callback);
      } catch (err) {
        console.info("[ohosRouterTest002] on events_emitter err : " + JSON.stringify(err));
      }
      console.info("[ohosRouterTest002] click push button result is: "
        + JSON.stringify(sendEventByKey('pushButtonA', 10, "")));
      await Utils.sleep(1000);
      router.back();
      await Utils.sleep(1000);

    });

    it('ohosRouterTest003', 0, async () => {
      console.info('[ohosRouterTest003] START');
      await Utils.sleep(1000);
      router.clear();
      await Utils.sleep(2000);
      let size = router.getLength();
      console.info("[ohosRouterTest003] size" + size);
      expect(size).assertEqual("1");
      await Utils.sleep(1000);

    });

    it('ohosRouterTest004', 0, async () => {
      console.info('[ohosRouterTest004] START');
      router.clear();
      await Utils.sleep(1000);
      let options: router.RouterOptions  = {
        uri: 'pages/ohosRouterA'
      }
      try {
        let result = await router.push(options);
        console.info("[ohosRouterTest004] push page success " + JSON.stringify(result));
      } catch (err) {
        console.error("[ohosRouterTest004] push page error " + JSON.stringify(err));
      }
      await Utils.sleep(1000);
      let optionsB = {
        uri: 'pages/ohosRouterB'
      }
      try {
        let result = await router.replace(optionsB);
        console.info("[ohosRouterTest004] push page success " + JSON.stringify(result));
      } catch (err) {
        console.error("[ohosRouterTest004] push page error " + JSON.stringify(err));
      }
      await Utils.sleep(1500);
      let size = router.getLength();
      console.info("[ohosRouterTest004] size" + size);
      expect(size).assertEqual("2");

    });

    it('ohosRouterTest005', 0, async () => {
      console.info('[ohosRouterTest005] START');
      let options: router.RouterOptions  = {
        uri: 'pages/ohosRouterA'
      }
      try {
        let result = await router.push(options);
        console.info("[ohosRouterTest005] push page success " + JSON.stringify(result));
      } catch (err) {
        console.error("[ohosRouterTest005] push page error " + JSON.stringify(err));
      }
      await Utils.sleep(1000);
      router.clear();
      await Utils.sleep(1500);
      let callback = (paramsEvent) => {
        console.info("[ohosRouterTest005] get state result is: " + JSON.stringify(paramsEvent));
        expect(paramsEvent.data.params).assertEqual('B Page');
      }
      let paramsEvent: events_emitter.InnerEvent = {
        eventId: 142,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(paramsEvent, callback);
      } catch (err) {
        console.info("[ohosRouterTest005] on events_emitter err : " + JSON.stringify(err));
      }
      console.info("[ohosRouterTest005] click replace button result is: "
        + JSON.stringify(sendEventByKey('ReplaceButtonA', 10, "")));

    });


    it('ohosRouterTest006', 0, async () => {
      console.info('[ohosRouterTest006] START');
      let options: router.RouterOptions  = {
        uri: 'pages/ohosRouterA'
      }
      try {
        let result = await orouter.pushurl(options);
        console.info("[ohosRouterTest006] push page success " + JSON.stringify(result));
      } catch (err) {
        console.error("[ohosRouterTest006] push page error " + JSON.stringify(err));
      }
      await Utils.sleep(1000);
      router.clear();
      await Utils.sleep(1500);
      let callback = (paramsEvent) => {
        console.info("[ohosRouterTest006] get state result is: " + JSON.stringify(paramsEvent));
        expect(paramsEvent.data.params).assertEqual('B Page');
      }
      let paramsEvent: events_emitter.InnerEvent = {
        eventId: 142,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(paramsEvent, callback);
      } catch (err) {
        console.info("[ohosRouterTest006] on events_emitter err : " + JSON.stringify(err));
      }
      console.info("[ohosRouterTest006] click replace button result is: "
        + JSON.stringify(sendEventByKey('pushurlButton1', 10, "")));

    });

    it('ohosRouterTest008', 0, async () => {
      console.info('[ohosRouterTest008] START');
      let options: router.RouterOptions  = {
        uri: 'pages/ohosRouterA'
      }
      try {
        let result = await orouter.pushurl(options);
        console.info("[ohosRouterTest008] push page success " + JSON.stringify(result));
      } catch (err) {
        console.error("[ohosRouterTest008] push page error " + JSON.stringify(err));
      }
      await Utils.sleep(1000);
      router.clear();
      await Utils.sleep(1500);
      let callback = (paramsEvent) => {
        console.info("[ohosRouterTest008] get state result is: " + JSON.stringify(paramsEvent));
        expect(paramsEvent.data.params).assertEqual('B Page');
      }
      let paramsEvent: events_emitter.InnerEvent = {
        eventId: 142,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(paramsEvent, callback);
      } catch (err) {
        console.info("[ohosRouterTest008] on events_emitter err : " + JSON.stringify(err));
      }
      console.info("[ohosRouterTest008] click replace button result is: "
        + JSON.stringify(sendEventByKey('pushurlButton1A', 10, "")));

    });

    it('ohosRouterTest007', 0, async () => {
      console.info('[ohosRouterTest007] START');
      let options: router.RouterOptions  = {
        uri: 'pages/ohosRouterA'
      }
      try {
        let result = await orouter.replaceUrl(options);
        console.info("[ohosRouterTest007] push page success " + JSON.stringify(result));
      } catch (err) {
        console.error("[ohosRouterTest007] push page error " + JSON.stringify(err));
      }
      await Utils.sleep(1000);
      router.clear();
      await Utils.sleep(1500);
      let callback = (paramsEvent) => {
        console.info("[ohosRouterTest007] get state result is: " + JSON.stringify(paramsEvent));
        expect(paramsEvent.data.params).assertEqual('B Page');
      }
      let paramsEvent: events_emitter.InnerEvent = {
        eventId: 142,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(paramsEvent, callback);
      } catch (err) {
        console.info("[ohosRouterTest007] on events_emitter err : " + JSON.stringify(err));
      }
      console.info("[ohosRouterTest007] click replace button result is: "
        + JSON.stringify(sendEventByKey('ReplaceButtonA', 10, "")));

    });
    it('ohosRouterTest009', 0, async () => {
      console.info('[ohosRouterTest009] START');
      let options: router.RouterOptions  = {
        uri: 'pages/ohosRouterA'
      }
      try {
        let result = await orouter.replaceUrl(options);
        console.info("[ohosRouterTest009] push page success " + JSON.stringify(result));
      } catch (err) {
        console.error("[ohosRouterTest009] push page error " + JSON.stringify(err));
      }
      await Utils.sleep(1000);
      router.clear();
      await Utils.sleep(1500);
      let callback = (paramsEvent) => {
        console.info("[ohosRouterTest009] get state result is: " + JSON.stringify(paramsEvent));
        expect(paramsEvent.data.params).assertEqual('B Page');
      }
      let paramsEvent: events_emitter.InnerEvent = {
        eventId: 142,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(paramsEvent, callback);
      } catch (err) {
        console.info("[ohosRouterTest009] on events_emitter err : " + JSON.stringify(err));
      }
      console.info("[ohosRouterTest009] click replace button result is: "
        + JSON.stringify(sendEventByKey('replaceurl1', 10, "")));

    });
  });
}