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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../MainAbility/common/Common';

export default function onHeightDidChange() {

  describe('onHeightDidChange', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/onHeightDidChange',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onHeightDidChange state pages: " + JSON.stringify(pages));
        if (!("onHeightDidChange" == pages.name)) {
          console.info("get onHeightDidChange state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push onHeightDidChange success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onHeightDidChange page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("onHeightDidChange after each called");
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0100
     * @tc.name      testGetImageAttr010
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */


    it('onHeightDidChange_0100', 0, async (done: Function) => {
      console.info('onHeightDidChange_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('openModal1'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('ChangeHeight1'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('chaKan');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.label).assertEqual('onHeightDidChange success');
      await CommonFunc.sleep(1000);
      let button4 = await driver.findComponent(ON.id('closeModal1'));
      await button4.click();
      await CommonFunc.sleep(1000);
      console.info('[onHeightDidChange_0100] END');
      done();
    });





  })
}
