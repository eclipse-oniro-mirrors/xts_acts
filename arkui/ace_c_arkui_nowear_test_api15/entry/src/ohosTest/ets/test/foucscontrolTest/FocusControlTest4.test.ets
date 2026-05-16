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

import { expect, describe, it, afterEach, beforeEach,  Level } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import router from '@ohos.router';
import nativeRender from 'libnativerender.so'
import Utils from '../common/Utils';

export default function FocusControlTest4(){
  describe('FocusControlTest4',  () =>{
    beforeEach(async (done:Function) =>{
      console.info("FocusControlTest4 beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/focuscontrol/focuscontrol4',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusControlTest4 state pages: " + JSON.stringify(pages));
        if (!("focuscontrol4" == pages.name)) {
          console.info("get focuscontrol4 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push focuscontrol4 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push focuscontrol4 page error: " + err);
        expect().assertFail();
      }
      done();
    });
     afterEach(async () => {
      await Utils.sleep(1000);
      console.info("FocusControlTest4 after each called");
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_FocusControlTest_TEST004
     * @tc.number SUB_ARKUI_CAPI_FocusControlTest_TEST004
     * @tc.desc   testing button focus when call OH_ArkUI_FocusActivate  interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_FocusControlTest_TEST004',  Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'focuscontrol4';
      await Utils.pushPage(`focuscontrol/${PAGE_TAG}`);
      await Utils.sleep(3000);
      let driver = await Driver.create();
      // click "transferKey4"
      let button = await driver.findComponent(ON.id('transferKey4'));
      await button.click();
      await Utils.sleep(1000);

      // click button4x
      let button4x = await driver.findComponent(ON.id('button4x'));
      await button4x.click();
      await Utils.sleep(1000);

      // click dalog
      let menu4 = await driver.findComponent(ON.id('menu4'));
      await menu4.click();
      await Utils.sleep(1000); 
      
      // tab key
      await driver.triggerKey(2049);
      await Utils.sleep(1000);

      await driver.triggerKey(2049);
      await Utils.sleep(1000);

      expect(Utils.getComponentInfoByKey('button4x').$attrs.backgroundColor).assertEqual('#FF00FF00');

      await driver.triggerKey(2070);
      await Utils.sleep(1000);
      done();
    })

  })
}