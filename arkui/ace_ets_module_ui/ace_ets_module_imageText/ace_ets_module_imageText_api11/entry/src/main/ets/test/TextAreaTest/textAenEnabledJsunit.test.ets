/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';


export default function textAenEnabledJsunit() {
  describe('textAenEnabledJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("textAenEnabledJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/textAenEnabled',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textAenEnabledJsunit state pages: " + JSON.stringify(pages));
        if (!("textAenEnabled" == pages.name)) {
          console.info("get textAenEnabledJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push textAenEnabledJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textAenEnabledJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   textAenEnabledJsunit_0100
     * @tc.number textAenEnabledJsunit_0100
     * @tc.desc   textAenEnabledJsunit_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAenEnabledJsunit_0100', Level.LEVEL1, async (done: Function) => {

      console.info('textAenEnabledJsunit_0100 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('taText'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('taEnable');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textAenEnabledJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[textAenEnabledJsunit_0100] text1: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("TextArea组件事件触发");
      console.info('[textAenEnabledJsunit_0100] END');
      done();
    });

    /**
     * @tc.name   textAenEnabledJsunit_0100
     * @tc.number textAenEnabledJsunit_0100
     * @tc.desc   textAenEnabledJsunit_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textAenEnabledJsunit_0100', Level.LEVEL1, async (done: Function) => {

      console.info('textAenEnabledJsunit_0100 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('tiText'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tiEnable');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[textAenEnabledJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[textAenEnabledJsunit_0100] text2: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("TextInput组件事件触发");
      console.info('[textAenEnabledJsunit_0100] END');
      done();
    });

  })
}

