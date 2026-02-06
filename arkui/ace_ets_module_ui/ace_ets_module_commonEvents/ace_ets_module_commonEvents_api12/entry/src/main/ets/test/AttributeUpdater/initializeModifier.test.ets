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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function initializeModifierTest() {

  describe('initializeModifierTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AttributeUpdater/initializeModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get initializeModifier state pages: " + JSON.stringify(pages));
        if (!("initializeModifier" == pages.name)) {
          console.info("get initializeModifier state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push initializeModifier success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push initializeModifier page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("initializeModifier after each called");
    });

    /**
     * @tc.number    initializeModifier_0010
     * @tc.name      Test the api of initializeModifier
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('initializeModifier_0010', Level.LEVEL0, async (done: Function) => {
      console.info('initializeModifier_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('initializeModifier_id'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('initializeModifier_id');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.label).assertEqual('initializeModifier succ');
      console.info('[initializeModifier_0010] END');
      done();
    });

    /**
     * @tc.number    attribute_0020
     * @tc.name      Test the api of get attribute
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('attribute_0020', Level.LEVEL0, async (done: Function) => {
      console.info('attribute_0020 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('initializeModifier_id'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('initializeModifier_id');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.height).assertEqual("50.00vp");
      console.info('[attribute_0020] END');
      done();
    });
  })
}
