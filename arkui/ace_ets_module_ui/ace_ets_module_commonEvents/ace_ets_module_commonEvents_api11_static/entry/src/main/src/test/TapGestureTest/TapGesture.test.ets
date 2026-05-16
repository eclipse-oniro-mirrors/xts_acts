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
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common';

import accessibility from '@ohos.accessibility';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { TouchObject, TouchType } from '@ohos.arkui.component'
import { sendTouchEvent } from '@ohos.arkui.Test';
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

export default function tapGestureTest() {
  describe('tapGestureTest', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("tapGestureTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TapGesture/tapGesture',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get tapGestureTest state pages:" + JSON.stringify(pages));
        if (!("tapGesture" == pages.name)) {
          console.info("get tapGestureTest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push tapGestureTest page error:" + err);
      }
      console.info("tapGestureTest beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("tapGesture after each called");
    });


    
    /**
     * @tc.number   testTapGesture_static_01
     * @tc.name     testTapGesture_static_01
     * @tc.desc     testTapGesture_static_01
     * @tc.level    Level.LEVEL0
     */
it('testTapGesture_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000)
      let rect = CommonFunc.getComponentRect('tapGesture')
      console.info("[testTapGesture01] rectInfo is " + JSON.stringify(rect));
      let x_value: number = rect.left + (rect.right - rect.left) / 2;
      let y_value: number = rect.top + (rect.bottom - rect.top) / 2;
      let x_value_two: number = rect.left + (rect.right - rect.left) / 20;
      let y_value_two: number = rect.top + (rect.bottom - rect.top) / 20;
      console.info("[testTapGesture01] onTouch location is: " + "[x]=== " + x_value + "   [y]===" + y_value);
      let point: TouchObject = {
        id: 1,
        x: x_value,
        y: y_value,
        type: TouchType.Move,
        // screenX: 0,
        // screenY: 0,
        windowX: 0,
        windowY: 0,
        displayX: 0,
        displayY: 0
      }
      let point2: TouchObject = {
        id: 2,
        x: x_value_two,
        y: y_value_two,
        type: TouchType.Move,
        // screenX: 0,
        // screenY: 0,
        windowX: 0,
        windowY: 0,
        displayX: 0,
        displayY: 0
      }
      let callback = (eventData: emitter.EventData) => {
        console.info("[testTapGesture01] get event state result is: " + JSON.stringify(eventData));
        // expect(eventData.data?.['ACTION']).assertEqual(true)
      }
      let innerEvent: emitter.InnerEvent = {
        eventId: 214,
        priority: emitter.EventPriority.LOW
      }
      try {
        emitter.on(innerEvent, callback)
      } catch (err: Error) {
        console.info("[testTapGesture01] on emitter err : " + JSON.stringify(err));
      }
      console.info('testTapGesture01 sendTouchEvent one:' + sendTouchEvent(point));
      console.info('testTapGesture01 sendTouchEvent two:' + sendTouchEvent(point2));
      await CommonFunc.sleep(1000)
      console.info('[testClickEvent001] testSendTouchEvent END');
      done();
    });

  })
}
