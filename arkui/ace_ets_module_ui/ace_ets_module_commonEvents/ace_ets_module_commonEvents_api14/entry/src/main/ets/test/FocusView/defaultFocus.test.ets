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

import {describe, beforeAll, beforeEach, afterEach, it, expect} from "@ohos/hypium"
import {UiComponent, UiDriver, Component, Driver, ON, BY } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function defaultFocus() {

  describe('defaultFocus', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FocusView/defaultFocus',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get defaultFocus state pages: " + JSON.stringify(pages));
        if (!("defaultFocus" == pages.name)) {
          console.info("get defaultFocus state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push defaultFocus success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push defaultFocus page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("defaultFocus after each called");
    });

    /**
     * @tc.number    defaultFocus_0010
     * @tc.name      defaultFocus_0010
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('defaultFocus_0010', 0, async (done: Function) => {
      console.info('defaultFocus_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text');
      console.info("[defaultFocus_0010] attrs is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[defaultFocus_0010] content is: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('false');
      await CommonFunc.sleep(1000);
      console.info('[defaultFocus_0010] END');
      done();
    });
    /**
     * @tc.number    defaultFocus_0020
     * @tc.name      defaultFocus_0020
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('defaultFocus_0020', 0, async (done: Function) => {
      console.info('defaultFocus_0020 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('btn'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text');
      console.info("[defaultFocus_0020] attrs is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[defaultFocus_0020] content is: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('true');
      await CommonFunc.sleep(1000);
      console.info('[defaultFocus_0020] END');
      done();
    });

  })
}
