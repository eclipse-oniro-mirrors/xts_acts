'use static';
/*
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
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from './Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
export default function assemblyCallbackTest() {
  describe('assemblyCallbackTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsEvents.api11.static", "EntryAbility")
      console.info("assemblyCallbackTest beforeAll start");
    });

    beforeEach(async (): Promise<void> => {
      console.info("assemblyCallbackTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/assemblyCallback",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!("assemblyCallback" == pages.name)) {
          console.info("get assemblyCallbackTest state pages:" + JSON.stringify(pages));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push assemblyCallbackTest page error:" + err);
      }
      console.info("assemblyCallbackTest beforeEach end");
    });

    
    /**
     * @tc.number   ArkUX_Callback_notification_static_0210
     * @tc.name     ArkUX_Callback_notification_static_0210
     * @tc.desc     ArkUX_Callback_notification_static_0210
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Callback_notification_static_0210', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Callback_notification_static_0210 START');
      let uiContext = AppStorage.get<UIContext>('uiContext')!
      setTimeout(() => {
        try {
          console.info('ArkUX_Callback_notification_static_0210 START  111:');
          let listener11 = uiContext.getUIInspector().createComponentObserver("null") as inspector.ComponentObserver
          console.info('ArkUX_Callback_notification_static_0210 START  222:');
          // console.info('ArkUX_Callback_notification_static_0210 START  :' + typeof listener11);
          expect(typeof listener11).assertEqual("object")
          // console.info('ArkUX_Callback_notification_static_0210 END ');
        } catch (err) {
          console.info('ArkUX_Callback_notification_static_0210 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Callback_notification_static_0220
     * @tc.name     ArkUX_Callback_notification_static_0220
     * @tc.desc     ArkUX_Callback_notification_static_0220
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Callback_notification_static_0220', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Callback_notification_static_0220 START');
      let uiContext = AppStorage.get<UIContext>('uiContext')!
      setTimeout(() => {
        try {
          let listener12 = uiContext.getUIInspector().createComponentObserver("")
          console.info('ArkUX_Callback_notification_static_0220 START  :' + listener12);
          console.info('ArkUX_Callback_notification_static_0220 START  :' + typeof listener12);
          expect(typeof listener12).assertEqual("object")
          console.info('ArkUX_Callback_notification_static_0220 END ');
        } catch (err) {
          console.info('ArkUX_Callback_notification_static_0220 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Callback_notification_static_0230
     * @tc.name     ArkUX_Callback_notification_static_0230
     * @tc.desc     ArkUX_Callback_notification_static_0230
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Callback_notification_static_0230', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Callback_notification_static_0230 START');
      let uiContext = AppStorage.get<UIContext>('uiContext')!
      setTimeout(() => {
        try {
          let listener13 = uiContext.getUIInspector().createComponentObserver("object")
          console.info('ArkUX_Callback_notification_static_0230 START  :' + listener13);
          console.info('ArkUX_Callback_notification_static_0230 START  :' + typeof listener13);
          expect(typeof listener13).assertEqual("object")
          console.info('ArkUX_Callback_notification_static_0230 END ');
        } catch (err) {
          console.info('ArkUX_Callback_notification_static_0230 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Callback_notification_static_0240
     * @tc.name     ArkUX_Callback_notification_static_0240
     * @tc.desc     ArkUX_Callback_notification_static_0240
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Callback_notification_static_0240', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Callback_notification_static_0240 START');
      let uiContext = AppStorage.get<UIContext>('uiContext')!
      setTimeout(() => {
        try {
          let listener14 = uiContext.getUIInspector().createComponentObserver("null")
          console.info('ArkUX_Callback_notification_static_0240 START  :' + listener14);
          console.info('ArkUX_Callback_notification_static_0240 START  :' + typeof listener14);
          expect(typeof listener14).assertEqual("object")
          console.info('ArkUX_Callback_notification_static_0240 END ');
        } catch (err) {
          console.info('ArkUX_Callback_notification_static_0240 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Callback_notification_static_0250
     * @tc.name     ArkUX_Callback_notification_static_0250
     * @tc.desc     ArkUX_Callback_notification_static_0250
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Callback_notification_static_0250', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Callback_notification_static_0250 START');
      let uiContext = AppStorage.get<UIContext>('uiContext')!
      setTimeout(() => {
        try {
          let listener15 = uiContext.getUIInspector().createComponentObserver("")
          console.info('ArkUX_Callback_notification_static_0250 START  :' + listener15);
          console.info('ArkUX_Callback_notification_static_0250 START  :' + typeof listener15);
          expect(typeof listener15).assertEqual("object")
          console.info('ArkUX_Callback_notification_static_0250 END ');
        } catch (err) {
          console.info('ArkUX_Callback_notification_static_0250 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    
    /**
     * @tc.number   ArkUX_Callback_notification_static_0260
     * @tc.name     ArkUX_Callback_notification_static_0260
     * @tc.desc     ArkUX_Callback_notification_static_0260
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Callback_notification_static_0260', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Callback_notification_static_0260 START');
      let uiContext = AppStorage.get<UIContext>('uiContext')!
      setTimeout(() => {
        try {
          let listener16 = uiContext.getUIInspector().createComponentObserver("object")
          console.info('ArkUX_Callback_notification_static_0260 START  :' + listener16);
          console.info('ArkUX_Callback_notification_static_0260 START  :' + typeof listener16);
          expect(typeof listener16).assertEqual("object")
          console.info('ArkUX_Callback_notification_static_0260 END ');
        } catch (err) {
          console.info('ArkUX_Callback_notification_static_0260 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

  })
}