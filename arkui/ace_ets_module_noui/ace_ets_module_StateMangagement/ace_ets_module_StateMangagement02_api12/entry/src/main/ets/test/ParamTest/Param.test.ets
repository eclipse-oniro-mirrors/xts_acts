/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
export default function ParamTest() {
  describe('ParamTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ParamTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Param/Param',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ParamTest state pages: " + JSON.stringify(pages));
        if (!("Param" == pages.name)) {
          console.info("get ParamTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ParamTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ParamTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    Param
     * @tc.name      ParamTest_0100
     * @tc.desc      api
     * @tc.level:    Level 0
     * @tc.type :    FUNC
     * @tc.size :    MEDIUM
     */
    it('ParamTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ParamTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('ParamButton'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('ParamText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParamTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('count(0)');

      console.info('[ParamTest_0100] END');
      done();
    });
  })
}

