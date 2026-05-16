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

export default function FocusControlTest3(){
  describe('FocusControlTest3',  () =>{
    beforeEach(async (done:Function) =>{
      console.info("FocusControlTest3 beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/focuscontrol/focuscontrol3x',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusControlTest3  state pages: " + JSON.stringify(pages));
        if (!("focuscontrol3x" == pages.name)) {
          console.info("get focuscontrol3 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push focuscontrol3 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push focuscontrol3 page error: " + err);
        expect().assertFail();
      }
      done();
    });
     afterEach(async () => {
      await Utils.sleep(1000);
      console.info("FocusControlTest3 after each called");
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_FocusControlTest_TEST003
     * @tc.number SUB_ARKUI_CAPI_FocusControlTest_TEST003
     * @tc.desc   testing button focus when call OH_ArkUI_FocusActivate  interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_FocusControlTest_TEST003',  Level.LEVEL1, async (done: Function) => {

      await Utils.sleep(1000);
      let driver = await Driver.create();
      // click "transferKey"
      let button = await driver.findComponent(ON.id('transferKey'));
      await button.click();
      await Utils.sleep(1000);

      // click button2
      let button2x = await driver.findComponent(ON.id('button2'));
      await button2x.click();
      await Utils.sleep(1000);
      // tab key
      await driver.triggerKey(2049);
      await Utils.sleep(1000);
      expect(Utils.getComponentInfoByKey('button2').$attrs.backgroundColor).assertEqual('#FF00FF00');;
      done();
    })

  })
}