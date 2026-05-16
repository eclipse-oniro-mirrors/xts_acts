/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function underlineColor() {

  describe('underlineColor', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url:  'MainAbility/pages/TextInput/underlineColor',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get underlineColor state pages: " + JSON.stringify(pages));
        if (!("underlineColor" == pages.name)) {
          console.info("get underlineColor state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push underlineColor success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push underlineColor page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("underlineColor after each called");
    });



    /**
     * @tc.name   underlineColor_0100
     * @tc.number underlineColor_0100
     * @tc.desc   underlineColor_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('underlineColor_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('underlineColor_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('underlineColor1');
      let obj: ESObject = JSON.parse(strJson);
      let underlineColor: ESObject = JSON.parse(obj.$attrs.underlineColor)
      expect(underlineColor.normal).assertEqual('#FF808080');
      await CommonFunc.sleep(1000);
      console.info('[underlineColor_0100] END');
      done();
    });





  })
}
