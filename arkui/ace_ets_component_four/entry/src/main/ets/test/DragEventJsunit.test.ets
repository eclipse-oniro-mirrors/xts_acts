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
import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';
import RectValue from './Rect';

export default function dragEventJsunit() {
  describe('dragEventTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dragEvent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get dragEvent state success " + JSON.stringify(pages));
        if (!("dragEvent" == pages.name)) {
          console.info("get dragEvent state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info("push dragEvent page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push dragEvent page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("dragEvent after each called");
    });

    it('dragEventTest_0100', 0, async (done: Function) => {
      console.info('dragEventTest_0100 START');
      let rect: RectValue = Utils.getComponentRect('apple')
      console.info("dragEventTest_0100 rectInfo is " + JSON.stringify(rect));
      let downX: number = rect.left + (rect.right - rect.left) / 2;
      let downY = rect.top + (rect.bottom - rect.top) / 2;
      let rectOne = Utils.getComponentRect('listItem')
      console.info("dragEventTest_0100 rectOneInfo is " + JSON.stringify(rectOne));
      let upX = rectOne.left + (rectOne.right - rectOne.left) / 2;
      let upY = rectOne.top + (rectOne.bottom - rectOne.top) / 2;
      await Utils.drag(downX, downY, upX, upY, 10)
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("dragEventTest_0100 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data.ACTION).assertEqual('onDragStart onAction');
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 86,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("dragEventTest_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('dragEventTest_0100 END');
      done();
    });

    it('dragEventTest_0200', 0, async (done: Function) => {
      console.info('dragEventTest_0200 START');
      let rect = Utils.getComponentRect('orange')
      console.info("dragEventTest_0200 rectInfo is " + JSON.stringify(rect));
      let downX = rect.left + (rect.right - rect.left) / 2;
      let downY = rect.top + (rect.bottom - rect.top) / 2;
      let rectOne = Utils.getComponentRect('listItem')
      console.info("dragEventTest_0200 rectOneInfo is " + JSON.stringify(rectOne));
      let upX = rectOne.left + (rectOne.right - rectOne.left) / 2;
      let upY = rectOne.top + (rectOne.bottom - rectOne.top) / 2;
      await Utils.drag(downX, downY, upX, upY, 10)
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("dragEventTest_0200 get state result is: " + JSON.stringify(indexEvent));
        expect(Number.isNaN(indexEvent.data.pointX)).assertFalse();
        expect(Number.isNaN(indexEvent.data.pointY)).assertFalse();
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 87,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("dragEventTest_0200 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('dragEventTest_0200 END');
      done();
    });

    it('dragEventTest_0300', 0, async (done: Function) => {
      console.info('dragEventTest_0300 START');
      let rect = Utils.getComponentRect('banana')
      console.info("dragEventTest_0300 rectInfo is " + JSON.stringify(rect));
      let downX = rect.left + (rect.right - rect.left) / 2;
      let downY = rect.top + (rect.bottom - rect.top) / 2;
      let rectOne = Utils.getComponentRect('listItem')
      console.info("dragEventTest_0300 rectOneInfo is " + JSON.stringify(rectOne));
      let upX = rectOne.left + (rectOne.right - rectOne.left) / 2;
      let upY = rectOne.top + (rectOne.bottom - rectOne.top) / 2;
      await Utils.drag(downX, downY, upX, upY, 10)
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("dragEventTest_0300 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data.ACTION).assertEqual("onDragMove onAction");
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 88,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("dragEventTest_0300 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('dragEventTest_0300 END');
      done();
    });

    it('dragEventTest_0400', 0, async (done: Function) => {
      console.info('dragEventTest_0400 START');
      let rect = Utils.getComponentRect('mango')
      console.info("dragEventTest_0400 rectInfo is " + JSON.stringify(rect));
      let downX = rect.left + (rect.right - rect.left) / 2;
      let downY = rect.top + (rect.bottom - rect.top) / 2;
      let rectOne = Utils.getComponentRect('listItem')
      console.info("dragEventTest_0400 rectOneInfo is " + JSON.stringify(rectOne));
      let upX = rectOne.right + (rect.right - rect.left);
      let upY = rectOne.bottom + (rect.bottom - rect.top);
      await Utils.drag(downX, downY, upX, upY, 10)
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("dragEventTest_0400 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data.ACTION).assertEqual("onDragLeave onAction");
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 89,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("dragEventTest_0400 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('dragEventTest_0400 END');
      done();
    });

    it('dragEventTest_0500', 0, async (done: Function) => {
      console.info('dragEventTest_0500 START');
      let rect = Utils.getComponentRect('strawberry')
      console.info("dragEventTest_0500 rectInfo is " + JSON.stringify(rect));
      let downX = rect.left + (rect.right - rect.left) / 2;
      let downY = rect.top + (rect.bottom - rect.top) / 2;
      let rectOne = Utils.getComponentRect('listItem')
      console.info("dragEventTest_0500 rectOneInfo is " + JSON.stringify(rectOne));
      let upX = rectOne.left + (rectOne.right - rectOne.left) / 2;
      let upY = rectOne.top + (rectOne.bottom - rectOne.top) / 2;
      await Utils.drag(downX, downY, upX, upY, 10)
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("dragEventTest_0500 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data.ACTION).assertEqual("onDrop onAction");
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 90,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("dragEventTest_0500 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('dragEventTest_0500 END');
      done();
    });
  })
}