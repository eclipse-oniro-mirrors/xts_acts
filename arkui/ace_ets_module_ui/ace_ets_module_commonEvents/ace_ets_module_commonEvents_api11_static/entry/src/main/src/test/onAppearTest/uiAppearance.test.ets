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

import router from '@ohos.router';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import emitter from '@ohos.events.emitter';

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

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';

export default function uiAppearanceALWAYS_DARKJsunit() {
  describe('uiAppearanceALWAYS_DARKTest', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("uiAppearanceALWAYS_DARKTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/onAppear/uiAppearance',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get uiAppearanceALWAYS_DARKTest state pages:" + JSON.stringify(pages));
        if (!("uiAppearance" == pages.name)) {
          console.info("get uiAppearanceALWAYS_DARKTest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push uiAppearanceALWAYS_DARKTest page error:" + err);
      }
      console.info("uiAppearanceALWAYS_DARKTest beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("uiAppearanceALWAYS_DARK after each called");
    });


    
    /**
     * @tc.number   testuiAppearanceALWAYS_DARK_static_0001
     * @tc.name     testuiAppearanceALWAYS_DARK_static_0001
     * @tc.desc     testuiAppearanceALWAYS_DARK_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testuiAppearanceALWAYS_DARK_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('uiAppearanceALWAYS_DARK testuiAppearanceALWAYS_DARK0001 START');
      await CommonFunc.sleep(2000);
      try {
        let event: emitter.InnerEvent = {
          eventId: 60308,
          priority: emitter.EventPriority.LOW
        }
        let callback = (eventData: emitter.EventData) => {
          console.info("testuiAppearanceALWAYS_DARK0001 get event data is: " + JSON.stringify(eventData));
          // expect(eventData.data?.['Mode']).assertEqual(0);
          console.info('testuiAppearanceALWAYS_DARK0001 END');
          done();
        }
        console.info("testuiAppearanceALWAYS_DARK0001 click result is: " +
        JSON.stringify(inspector.sendEventByKey('ALWAYS_DARKText', 10, "")));
        emitter.on(event, callback);
      } catch (err) {
        console.info("testuiAppearanceALWAYS_DARK0001 on emitter err : " + JSON.stringify(err));
      }
    });


    
    /**
     * @tc.number   testuiAppearanceALWAYS_LIGHT0001
     * @tc.name     testuiAppearanceALWAYS_LIGHT0001
     * @tc.desc     testuiAppearanceALWAYS_LIGHT0001
     * @tc.level    Level.LEVEL0
     */
it('testuiAppearanceALWAYS_LIGHT0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('uiAppearanceALWAYS_LIGHT testuiAppearanceALWAYS_LIGHT0001 START');
      await CommonFunc.sleep(2000);
      try {
        let event: emitter.InnerEvent = {
          eventId: 60309,
          priority: emitter.EventPriority.LOW
        }
        let callback = (eventData: emitter.EventData) => {
          console.info("testuiAppearanceALWAYS_LIGHT0001 get event data is: " + JSON.stringify(eventData));
          // expect(eventData.data?.['Mode']).assertEqual(1);
          console.info('testuiAppearanceALWAYS_LIGHT0001 END');
          done();
        }
        console.info("testuiAppearanceALWAYS_LIGHT0001 click result is: " +
        JSON.stringify(inspector.sendEventByKey('ALWAYS_LIGHTText', 10, "")));
        emitter.on(event, callback);
      } catch (err) {
        console.info("testuiAppearanceALWAYS_LIGHT0001 on emitter err : " + JSON.stringify(err));
      }
    });
  })
}
