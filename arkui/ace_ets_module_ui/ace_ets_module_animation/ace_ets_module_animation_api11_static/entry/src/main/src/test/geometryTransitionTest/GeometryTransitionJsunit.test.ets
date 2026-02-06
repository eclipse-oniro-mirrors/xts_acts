'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import emitter from '@ohos.events.emitter';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest } from '../../test/Util.test'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function geometryTransitionJsunit() {
  describe('geometryTransitionTest', () => {

    beforeAll(() => {
      console.info("geometryTransitionJsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.animation.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("geometryTransitionJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/geometryTransition/geometryTransition2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get geometryTransitionJsunit state pages:" + JSON.stringify(pages));
        if (!("geometryTransition2" == pages.name)) {
          console.info("get geometryTransitionJsunit pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push playModeReverseTest page error:" + err);
      }
      console.info("playModeReverseTest beforeEach end");
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("geometryTransition after each called");
    });
    
    /**
     * @tc.number   geometryTransitionTest_static_0100
     * @tc.name     geometryTransitionTest_static_0100
     * @tc.desc     geometryTransitionTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('geometryTransitionTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('geometryTransitionTest_static_0100 START');
      let indexEvent: emitter.InnerEvent = {
        eventId: 104,
        priority: emitter.EventPriority.LOW
      } as emitter.InnerEvent
      await Utils.sleep(1000);
      let callback = (indexEvent: emitter.EventData) => {
        console.info("geometryTransitionTest_static_0100 get state result is: " + JSON.stringify(indexEvent));
        expect(((indexEvent.data) as ESObject)?.getProperty('btn1')).assertEqual(false);
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("geometryTransitionTest_static_0100 on emitter err : " + JSON.stringify(err));
      }
      console.info("geometryTransitionTest_static_0100 click result is: " +
      JSON.stringify(inspector.sendEventByKey('button', 10, "")));
      await Utils.sleep(1000);
      console.info('geometryTransitionTest_static_0100 END');
      done();
    });
  })
}