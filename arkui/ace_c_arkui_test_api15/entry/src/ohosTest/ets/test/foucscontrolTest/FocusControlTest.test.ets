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

import { expect, describe, it, afterEach, beforeEach } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import router from '@ohos.router';
import nativeRender from 'libnativerender.so'
import Utils from '../common/Utils';

export default function FocusControlTest(){
  describe('FocusControlTest',  () =>{
    beforeEach(async (done:Function) =>{
      console.info("FocusControlTest beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/focuscontrol/focuscontrol',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FocusControlTest  state pages: " + JSON.stringify(pages));
        if (!("focuscontrol" == pages.name)) {
          console.info("get focuscontrol state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push focuscontrol success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push focuscontrol page error: " + err);
        expect().assertFail();
      }
      done();
    });
     afterEach(async () => {
      await Utils.sleep(1000);
      console.info("FocusControlTest after each called");
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_FocusControlTest_TEST001
     * @tc.name       : SUB_ARKUI_CAPI_FocusControlTest_TEST001
     * @tc.desc       : testing button2 request focus
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_ARKUI_CAPI_FocusControlTest_TEST001', 0, async (done: Function) => {
      await Utils.sleep(1000);
      expect(Utils.getComponentInfoByKey('button2').$attrs.backgroundColor).assertEqual('#FF00FF00');;
      done();
    });


  })
}