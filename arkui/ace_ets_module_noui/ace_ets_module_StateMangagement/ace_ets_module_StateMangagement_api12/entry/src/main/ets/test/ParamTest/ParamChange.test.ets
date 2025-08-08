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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
export default function ParamChangeTest() {
  describe('ParamChangeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ParamChangeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Param/ParamChange',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ParamChangeTest state pages: " + JSON.stringify(pages));
        if (!("ParamChange" == pages.name)) {
          console.info("get ParamChangeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ParamChangeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ParamChangeTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_ACE_STATUSMANAGER_PARAM_0030
     * @tc.name      ParamChangeTest_0100
     * @tc.desc      api
     * @tc.level:    Level 0
     * @tc.type :    FUNC
     * @tc.size :    MEDIUM
     */
    it('ParamChangeTest_0100', 0, async (done: Function) => {
      console.info('ParamChangeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('paramChangeButton'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('paramChangeText1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParamChangeTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Local 1');

      strJson = getInspectorByKey('paramChangeText2');
      obj = JSON.parse(strJson);
      console.info("[ParamChangeTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Local Hello World');

      strJson = getInspectorByKey('paramChangeText3');
      obj = JSON.parse(strJson);
      console.info("[ParamChangeTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Local true');

      strJson = getInspectorByKey('paramChangeText4');
      obj = JSON.parse(strJson);
      console.info("[ParamChangeTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Param 1');

      strJson = getInspectorByKey('paramChangeText5');
      obj = JSON.parse(strJson);
      console.info("[ParamChangeTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Param Hello World');

      strJson = getInspectorByKey('paramChangeText6');
      obj = JSON.parse(strJson);
      console.info("[ParamChangeTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Param true');

      console.info('[ParamChangeTest_0100] END');
      done();
    });
  })
}

