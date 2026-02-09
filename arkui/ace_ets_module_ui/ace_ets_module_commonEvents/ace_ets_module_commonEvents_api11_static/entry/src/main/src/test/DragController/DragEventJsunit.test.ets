'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import Utils from '../../../ets/MainAbility/common/Utils';
import RectValue from '../../../ets/MainAbility/common/Rect';
import accessibility from '@ohos.accessibility';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test'
import { RecordData } from '@ohos.base';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';

export default function dragEventJsunit() {
  describe('dragEventTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api11.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("dragEventTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragController/dragEvent',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get dragEventTest state pages:" + JSON.stringify(pages));
        if (!("dragEvent" == pages.name)) {
          console.info("get dragEventTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push dragEventTest page error:" + err);
      }
      console.info("dragEventTest beforeEach end");
    });


    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("dragEvent after each called");
    });

    
    
/**
     * @tc.number   dragEventTest_static_0100
     * @tc.name     dragEventTest_static_0100
     * @tc.desc     dragEventTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('dragEventTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
      let callback: (indexEvent: emitter.EventData) => void = (indexEvent: emitter.EventData) => {
        if (indexEvent != null) {
          const data = indexEvent.data as Record<String,RecordData>
          console.info("dragEventTest_0100 get state result is: " + JSON.stringify(indexEvent));
          expect(data['ACTION'] as string).assertEqual('onDragStart onAction');
        }
      }
      let indexEvent: emitter.InnerEvent = {
        eventId: 86,
        priority: emitter.EventPriority.LOW
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err: Error) {
        console.info("dragEventTest_0100 on emitter err : " + JSON.stringify(err));
      }
      console.info('dragEventTest_0100 END');
      done();
    });

    
    
/**
     * @tc.number   dragEventTest_static_0200
     * @tc.name     dragEventTest_static_0200
     * @tc.desc     dragEventTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('dragEventTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
      let callback: (indexEvent: emitter.EventData) => void = (indexEvent: emitter.EventData) => {
        if (indexEvent != null) {
          const data = indexEvent.data as Record<String,RecordData>
          console.info("dragEventTest_0200 get state result is: " + JSON.stringify(indexEvent));
          expect(Number.isNaN(data['pointX'] as number)).assertFalse();
          expect(Number.isNaN(data['pointY'] as number)).assertFalse();
        }
      }
      let indexEvent: emitter.InnerEvent = {
        eventId: 87,
        priority: emitter.EventPriority.LOW
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err: Error) {
        console.info("dragEventTest_0200 on emitter err : " + JSON.stringify(err));
      }
      console.info('dragEventTest_0200 END');
      done();
    });

    
    
/**
     * @tc.number   dragEventTest_static_0300
     * @tc.name     dragEventTest_static_0300
     * @tc.desc     dragEventTest_static_0300
     * @tc.level    Level.LEVEL0
     */
it('dragEventTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
      let callback: (indexEvent: emitter.EventData) => void = (indexEvent: emitter.EventData) => {
        if (indexEvent != null) {
          const data = indexEvent.data as Record<String,RecordData>
          console.info("dragEventTest_0300 get state result is: " + JSON.stringify(indexEvent));
          expect(data['ACTION'] as string).assertEqual("onDragMove onAction");
        }
      }
      let indexEvent: emitter.InnerEvent = {
        eventId: 88,
        priority: emitter.EventPriority.LOW
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err: Error) {
        console.info("dragEventTest_0300 on emitter err : " + JSON.stringify(err));
      }
      console.info('dragEventTest_0300 END');
      done();
    });

    
    
/**
     * @tc.number   dragEventTest_static_0400
     * @tc.name     dragEventTest_static_0400
     * @tc.desc     dragEventTest_static_0400
     * @tc.level    Level.LEVEL0
     */
it('dragEventTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
      let callback: (indexEvent: emitter.EventData) => void = (indexEvent: emitter.EventData) => {
        const data = indexEvent.data as Record<String,RecordData>
        console.info("dragEventTest_0400 get state result is: " + JSON.stringify(indexEvent));
        expect(data['ACTION'] as string).assertEqual("onDragLeave onAction");
      }
      let indexEvent: emitter.InnerEvent = {
        eventId: 89,
        priority: emitter.EventPriority.LOW
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err: Error) {
        console.info("dragEventTest_0400 on emitter err : " + JSON.stringify(err));
      }
      console.info('dragEventTest_0400 END');
      done();
    });

    
    
/**
     * @tc.number   dragEventTest_static_0500
     * @tc.name     dragEventTest_static_0500
     * @tc.desc     dragEventTest_static_0500
     * @tc.level    Level.LEVEL0
     */
it('dragEventTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
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
      let callback: (indexEvent: emitter.EventData) => void = (indexEvent: emitter.EventData) => {
        if (indexEvent != null) {
          const data = indexEvent.data as Record<String,RecordData>
          console.info("dragEventTest_0500 get state result is: " + JSON.stringify(indexEvent));
          expect(data['ACTION'] as string).assertEqual("onDrop onAction");
        }
      }
      let indexEvent: emitter.InnerEvent = {
        eventId: 90,
        priority: emitter.EventPriority.LOW
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err: Error) {
        console.info("dragEventTest_0500 on emitter err : " + JSON.stringify(err));
      }
      console.info('dragEventTest_0500 END');
      done();
    });
  })
}