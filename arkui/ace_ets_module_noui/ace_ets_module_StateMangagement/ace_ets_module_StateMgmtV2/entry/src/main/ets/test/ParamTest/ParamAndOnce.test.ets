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

export default function ParamAndOnceTest() {
  describe('ParamAndOnceTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ParamAndOnceTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Param/ParamAndOnce',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ParamAndOnceTest state pages: " + JSON.stringify(pages));
        if (!("ParamAndOnce" == pages.name)) {
          console.info("get ParamAndOnceTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ParamAndOnceTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ParamAndOnceTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   ParamAndOnceTest_0100
     * @tc.number SUB_ACE_STATUSMANAGER_ONCE_0010
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ParamAndOnceTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ParamAndOnceTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('paramAndOnceButton1'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('paramAndOnceText1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ParamAndOnceTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Child onceParamNum: 11');

      button = await driver.findComponent(ON.id('paramAndOnceButton2'));
      await button.click();
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('paramAndOnceText2');
      obj = JSON.parse(strJson);
      console.info("[ParamAndOnceTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Child onceParamInfo: Cindy');

      button = await driver.findComponent(ON.id('paramAndOnceButton3'));
      await button.click();
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('paramAndOnceText3');
      obj = JSON.parse(strJson);
      console.info("[ParamAndOnceTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Parent localNum: 11');

      button = await driver.findComponent(ON.id('paramAndOnceButton4'));
      await button.click();
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('paramAndOnceText4');
      obj = JSON.parse(strJson);
      console.info("[ParamAndOnceTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Parent localInfo: Cindy');
      
      console.info('[ParamAndOnceTest_0100] END');
      done();
    });
  })
}

