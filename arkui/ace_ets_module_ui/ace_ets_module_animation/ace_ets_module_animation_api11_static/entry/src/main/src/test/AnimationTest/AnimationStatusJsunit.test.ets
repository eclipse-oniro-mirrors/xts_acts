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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import emitter from '@ohos.events.emitter';
import { UtilsTest } from '../../test/Util.test';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { AnimationStatus } from '@ohos.arkui.component';
import { RecordData } from '@ohos.base';

export default function animationStatusJsunit() {
  describe('animationStatusJsunit', () => {

    beforeAll(() => {
      console.info("animationStatusJsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.animation.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("animationStatusJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Animation/animationStatus',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get animationStatusJsunit state pages:" + JSON.stringify(pages));
        if (!("animationStatus" == pages.name)) {
          console.info("get animationStatusJsunit pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push animationStatusJsunit page error:" + err);
      }
      console.info("animationStatusJsunit beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("animationStatus after each called");
    });
    
    /**
     * @tc.number   animationStatus_static_01
     * @tc.name     animationStatus_static_01
     * @tc.desc     animationStatus_static_01
     * @tc.level    Level.LEVEL0
     */
it('animationStatus_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[animationStatus_static_01] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ImageAnimator');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[animationStatus_static_01] obj is: " + JSON.stringify(obj));
      expect(obj.getString('$type')).assertEqual('ImageAnimator');
      console.info('[animationStatus_static_01] END');
      done();
    });
    
    /**
     * @tc.number   animationStatus_static_02
     * @tc.name     animationStatus_static_02
     * @tc.desc     animationStatus_static_02
     * @tc.level    Level.LEVEL0
     */
it('animationStatus_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[animationStatus_static_02] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ImageAnimator');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[animationStatus_static_02] obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('state')).assertEqual('AnimationStatus.Initial');
      console.info('[animationStatus_static_02] END');
      done();
    });
    
    /**
     * @tc.number   animationStatus_static_03
     * @tc.name     animationStatus_static_03
     * @tc.desc     animationStatus_static_03
     * @tc.level    Level.LEVEL0
     */
it('animationStatus_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animationStatus_static_03 START');
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: emitter.EventData) => {
        console.info("animationStatus_static_03 get state result is: " + JSON.stringify(indexEvent));
        const data: Record<String,RecordData> =
          indexEvent.data as Record<String,RecordData>
        expect(data['animationStatus']).assertEqual(AnimationStatus.Paused);
        done();
      }
      let indexEvent: emitter.InnerEvent = {
        eventId: 56,
        priority: emitter.EventPriority.LOW
      } as emitter.InnerEvent
      try {
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animationStatus_static_03 on emitter err : " + JSON.stringify(err));
      }
      console.info("animationStatus_static_03 click result is: " +
      JSON.stringify(inspector.sendEventByKey('button2', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('animationStatus_static_03 END');
    });
    
    /**
     * @tc.number   animationStatus_static_04
     * @tc.name     animationStatus_static_04
     * @tc.desc     animationStatus_static_04
     * @tc.level    Level.LEVEL0
     */
it('animationStatus_static_04', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('animationStatus_static_04 START');
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: emitter.EventData) => {
        console.info("animationStatus_static_04 get state result is: " + JSON.stringify(indexEvent));
        const data: Record<String,RecordData> =
          indexEvent.data as Record<String,RecordData>
        expect(data['animationStatus']).assertEqual(AnimationStatus.Stopped);
        done();
      }
      let indexEvent: emitter.InnerEvent = {
        eventId: 57,
        priority: emitter.EventPriority.LOW
      } as emitter.InnerEvent
      try {
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("animationStatus_static_04 on emitter err : " + JSON.stringify(err));
      }
      console.info("animationStatus_static_04 click result is: " +
      JSON.stringify(inspector.sendEventByKey('button3', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('animationStatus_static_04 END');
    });
  })
}