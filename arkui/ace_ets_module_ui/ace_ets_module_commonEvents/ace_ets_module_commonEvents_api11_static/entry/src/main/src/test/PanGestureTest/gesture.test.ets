'use static';
/*
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
import emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import Utils from '../../../ets/MainAbility/common/Utils'

import accessibility from '@ohos.accessibility';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { PanDirection } from '@ohos.arkui.component';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';

export default function gestureSetDirectionJsunit() {
  describe('gestureSetDirectionTest', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("gestureSetDirectionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PanGesture/gesture',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get gestureSetDirectionTest state pages:" + JSON.stringify(pages));
        if (!("gesture" == pages.name)) {
          console.info("get gestureSetDirectionTest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push gestureSetDirectionTest page error:" + err);
      }
      console.info("gestureSetDirectionTest beforeEach end");
    });


    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("gestureSetDirection after each called");
    });


    
    /**
     * @tc.number   testgestureSetDirection_static_0001
     * @tc.name     testgestureSetDirection_static_0001
     * @tc.desc     testgestureSetDirection_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testgestureSetDirection_static_0001', Level.LEVEL0, async () => {
      console.info('gestureSetDirection testgestureSetDirection0001 START');
      await Utils.sleep(2000);
      try {
        let callback = (indexEvent: emitter.EventData) => {
          console.info("onClick_0001 get state result is: " + JSON.stringify(indexEvent));
          expect((indexEvent.data as ESObject)?.getProperty('STATUS')).assertEqual(PanDirection.Vertical);
        }
        let indexEvent: emitter.InnerEvent = {
          eventId: 60204,
          priority: emitter.EventPriority.LOW
        }
        inspector.sendEventByKey('setDirectionPanGesture', 10, "")
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("onClick_0001 on emitter err : " + JSON.stringify(err));
      }
      console.info('gestureSetDirection testgestureSetDirection0002 END')

    });


    
    /**
     * @tc.number   testgestureSetDistance_static_0002
     * @tc.name     testgestureSetDistance_static_0002
     * @tc.desc     testgestureSetDistance_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testgestureSetDistance_static_0002', Level.LEVEL0, async () => {
      console.info('gestureSetDistance testgestureSetDistance0002 START');
      await Utils.sleep(2000);
      try {
        let callback = (indexEvent: emitter.EventData) => {
          console.info("onClick_0002 get state result is: " + JSON.stringify(indexEvent));
          expect((indexEvent.data as ESObject)?.getProperty('STATUS')).assertEqual(4.0);
        }
        let indexEvent: emitter.InnerEvent = {
          eventId: 60205,
          priority: emitter.EventPriority.LOW
        }
        inspector.sendEventByKey('setDistancePanGesture', 10, "")
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("onClick_0002 on emitter err : " + JSON.stringify(err));
      }
      console.info('gestureSetDistance testgestureSetDistance0002 END');

    });


    
    /**
     * @tc.number   testgestureSetFingers_static_0003
     * @tc.name     testgestureSetFingers_static_0003
     * @tc.desc     testgestureSetFingers_static_0003
     * @tc.level    Level.LEVEL0
     */
it('testgestureSetFingers_static_0003', Level.LEVEL0, async () => {
      console.info('gestureSetFingers testgestureSetFingers0003 START');
      await Utils.sleep(2000);
      try {
        let callback = (indexEvent: emitter.EventData) => {
          console.info("onClick_0003 get state result is: " + JSON.stringify(indexEvent));
          expect((indexEvent.data as ESObject)?.getProperty('STATUS')).assertEqual(2);
        }
        let indexEvent: emitter.InnerEvent = {
          eventId: 60206,
          priority: emitter.EventPriority.LOW
        }
        inspector.sendEventByKey('setFingersPanGesture', 10, "")
        emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("onClick_0003 on emitter err : " + JSON.stringify(err));
      }
      console.info('gestureSetFingers testgestureSetFingers0003 END');

    });

  })
}
