'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { expect, describe, it, afterEach, beforeEach,  Level, beforeAll } from '../../../../hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import Utils from '../common/Utils';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'
import { LibUtil } from '../../../ets/pages/LibUtil';
let libUtil: LibUtil = new LibUtil();

export default function FocusControlTest4(){
  describe('FocusControlTest4',  () =>{
    beforeAll((): void => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_nowear_api15_static", "EntryAbility")
    });
     beforeEach(async (): Promise<void> => {
      console.info("FocusControlTest4 beforeEach start");
      let options:router.RouterOptions = {
        url: 'pages/focuscontrol/focuscontrol4',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FocusControlTest4 state pages: " + JSON.stringify(pages));
        if (!("focuscontrol4" == pages.name)) {
          console.info("get focuscontrol4 state pages.name: " + JSON.stringify(pages.name));
          let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push focuscontrol4 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push focuscontrol4 page error: " + err);
        expect().assertFail();
      }
    });
     afterEach(async () => {
      await Utils.sleep(1000);
      console.info("FocusControlTest4 after each called");
    });

   
    /**
     * @tc.number   SUB_ARKUI_CAPI_FocusControlTest_TEST004
     * @tc.name     SUB_ARKUI_CAPI_FocusControlTest_TEST004
     * @tc.desc     SUB_ARKUI_CAPI_FocusControlTest_TEST004
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_CAPI_FocusControlTest_TEST004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'focuscontrol4';
      await Utils.pushPage(`focuscontrol/${PAGE_TAG}`);
      await Utils.sleep(3000);
      let driver =  Driver.create();
      // click "transferKey4"
      let button = await driver.findComponent(ON.id('transferKey4'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);

      // click button4x
      let button4x = await driver.findComponent(ON.id('button4x'));
      await (button4x?.click() as Promise<void>);
      await Utils.sleep(1000);

      // click dalog
      let menu4 = await driver.findComponent(ON.id('menu4'));
      await (menu4?.click() as Promise<void>);
      await Utils.sleep(1000); 
      
      // tab key
      await driver.triggerKey(2049);
      await Utils.sleep(1000);

      await driver.triggerKey(2049);
      await Utils.sleep(1000);

      expect(Utils.getComponentInfoByKey('button4x').getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00');

      await driver.triggerKey(2070);
      await Utils.sleep(1000);
      done();
    })

  })
}