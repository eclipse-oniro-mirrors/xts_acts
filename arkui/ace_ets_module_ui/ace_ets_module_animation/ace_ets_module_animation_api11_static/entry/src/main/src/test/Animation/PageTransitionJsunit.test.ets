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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest } from '../../test/Util.test'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { RouteType } from '@ohos.arkui.component';
import { RecordData } from '@ohos.base';

export default function pageTransitionJsunit() {
  describe('pageTransitionJsunit', () => {

    beforeAll(() => {
      console.info("pageTransitionJsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.animation.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("pageTransitionJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Animation/pageTransition',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get pageTransitionJsunit state pages:" + JSON.stringify(pages));
        if (!("pageTransition" == pages.name)) {
          console.info("get pageTransitionJsunit pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push pageTransitionJsunit page error:" + err);
      }
      console.info("pageTransitionJsunit beforeEach end");
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("pageTransition after each called");
    });

    
    /**
     * @tc.number   pageTransitionTest_static_0400
     * @tc.name     pageTransitionTest_static_0400
     * @tc.desc     pageTransitionTest_static_0400
     * @tc.level    Level.LEVEL0
     */
it('pageTransitionTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('pageTransitionTest_static_0400 START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "scale": 6.0,
            "opacity": 5.0
          } as Record<String,RecordData>
        }
        let indexEvent: emitter.InnerEvent = {
          eventId: 145,
          priority: emitter.EventPriority.LOW
        }
        console.info("pageTransitionTest_static_0400 start to publish emit");
        emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("pageTransitionTest_static_0400 change component data error: " + (err as Error).message);
      }
      await Utils.sleep(4000);
      let callback = (indexEventOne: emitter.EventData) => {
        try {
          console.info("pageTransitionTest_static_0400 get state result is: " + JSON.stringify(indexEventOne));
          const data: Record<String,RecordData> =
            indexEventOne.data as Record<String,RecordData>
          expect(data['scale']).assertEqual(6);
          expect(data['opacity']).assertEqual(5);
          expect(data['type']).assertEqual(RouteType.Push);
        } catch (err) {
          console.info("pageTransitionTest_static_0400 get state result is err:  " + JSON.stringify(err));
        }
      }
      let indexEventOne: emitter.InnerEvent = {
        eventId: 144,
        priority: emitter.EventPriority.LOW
      } as emitter.InnerEvent
      try {
        emitter.on(indexEventOne, callback);
      } catch (err) {
        console.info("pageTransitionTest_static_0400 on emitter err : " + JSON.stringify(err));
      }
      console.info("pageTransitionTest_static_0400 click result is: " +
      JSON.stringify(inspector.sendEventByKey('Navigator', 10, "")));
      await UtilsTest.msSleep(2000)
      console.info('pageTransitionTest_static_0400 END');
      done();
    });
  })
}