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

import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import emitter from '@ohos.events.emitter';

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

export default function parallelGestureJsunit() {
  describe('parallelGestureTest', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("parallelGestureTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TapGesture/parallelGesture',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get parallelGestureTest state pages:" + JSON.stringify(pages));
        if (!("parallelGesture" == pages.name)) {
          console.info("get parallelGestureTest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push parallelGestureTest page error:" + err);
      }
      console.info("parallelGestureTest beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("parallelGesture after each called");
    });


    
    /**
     * @tc.number   parallelGestureTest_static_0100
     * @tc.name     parallelGestureTest_static_0100
     * @tc.desc     parallelGestureTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('parallelGestureTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000)
      let rect = CommonFunc.getComponentRect('tapGesture')
      console.info("parallelGestureTest_0100 rectInfo is " + JSON.stringify(rect));
      let x_value: number = rect.left + (rect.right - rect.left) / 2;
      let y_value: number = rect.top + (rect.bottom - rect.top) / 2;
      console.info("parallelGestureTest_0100 onTouch location is: " + "[x]=== " + x_value + "   [y]===" + y_value);
      let point: TouchObject = {
        id: 11,
        x: x_value,
        y: y_value,
        type: TouchType.Down,
        // screenX: 0,
        // screenY: 0,
        windowX: 0,
        windowY: 0,
        displayX: 0,
        displayY: 0
      }
      let callback = (eventData: emitter.EventData) => {
        console.info("parallelGestureTest_0100 get event state result is: " + JSON.stringify(eventData));
        // expect(eventData.data?.['value']).assertEqual('gesture onAction')
      }
      let innerEvent: emitter.InnerEvent = {
        eventId: 150,
        priority: emitter.EventPriority.LOW
      }
      try {
        emitter.on(innerEvent, callback)
      } catch (err: Error) {
        console.info("parallelGestureTest_0100 on emitter err : " + JSON.stringify(err));
      }
      console.info('parallelGestureTest_0100 sendTouchEvent result:' + sendTouchEvent(point));
      await CommonFunc.sleep(1000)
      console.info('parallelGestureTest_0100 testSendTouchEvent END');
      done();
    });
  })
}