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

import { expect, describe, it, afterEach, beforeEach, Level } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import router from '@ohos.router';
import nativeRender from 'libnativerender.so'
import Utils from '../common/Utils';

export default function FocusControlTest2(){
  describe('FocusControlTest2',  () =>{
    beforeEach(async (done:Function) =>{
      console.info("FocusControlTest2 beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/focuscontrol/focuscontrol2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusControlTest2  state pages: " + JSON.stringify(pages));
        if (!("focuscontrol2" == pages.name)) {
          console.info("get focuscontrol2 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push focuscontrol2 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push focuscontrol2 page error: " + err);
        expect().assertFail();
      }
      done();
    });
     afterEach(async () => {
      await Utils.sleep(1000);
      console.info("FocusControlTest2 after each called");
    });

    /**
     * @tc.name   SUB_ARKUI_CAPI_FocusControlTest_TEST002
     * @tc.number SUB_ARKUI_CAPI_FocusControlTest_TEST002
     * @tc.desc   testing button clear focus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_CAPI_FocusControlTest_TEST002', Level.LEVEL1, async (done: Function) => {
      let driver = await Driver.create();
      // click "transferKey2
      let button = await driver.findComponent(ON.id('transferKey2'));
      await button.click();
      await Utils.sleep(1000);
      // click button1
      let button1x = await driver.findComponent(ON.id('button1xxx'));
      await button1x.click();
      await Utils.sleep(2500);

      expect(Utils.getComponentInfoByKey('button1xxx').$attrs.backgroundColor).assertEqual('#FF00FF00');;
      done();
    }) 


  })
}