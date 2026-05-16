/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function LinkSet() {
  describe('LinkSet', () => {
    beforeEach(async (done: Function) => {
      console.info("LinkSet beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Link/LinkSet',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LinkSet state pages: " + JSON.stringify(pages));
        if (!("LinkSet" == pages.name)) {
          console.info("get LinkSet state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LinkSet success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LinkSet page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   LinkSet_0100
     * @tc.number SUB_ACE_STATUSMANAGER_LINKSET_0010
     * @tc.desc   Test if the state decorator supports SET types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LinkSet_0100', Level.LEVEL0, async (done: Function) => {
      console.info('LinkSet_0100 START');
      let driver: Driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('LinkSet_init'));
      await btn_init.click();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('LinkSet_set'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('LinkSet_value_5');

      console.info("[LinkSet_0100] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[LinkSet_0100] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('5');
      console.info('[LinkSet_0100] END');
      done();
    });
    /**
     * @tc.name   LinkSet_0200
     * @tc.number SUB_ACE_STATUSMANAGER_LINKSET_0020
     * @tc.desc   Test if the state decorator supports SET types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LinkSet_0200', Level.LEVEL0, async (done: Function) => {
      console.info('LinkSet_0200 START');
      let driver: Driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('LinkSet_init'));
      await btn_init.click();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('LinkSet_clear'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('LinkSet_value_0');

      console.info("[LinkSet_0200] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[LinkSet_0200] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('0');
      console.info('[LinkSet_0200] END');
      done();
    });
    /**
     * @tc.name   LinkSet_0300
     * @tc.number SUB_ACE_STATUSMANAGER_LINKSET_0030
     * @tc.desc   Test if the state decorator supports SET types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LinkSet_0300', Level.LEVEL0, async (done: Function) => {
      console.info('LinkSet_0300 START');
      let driver: Driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('LinkSet_init'));
      await btn_init.click();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('LinkSet_delete'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('LinkSet_value_2');

      console.info("[LinkSet_0300] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[LinkSet_0300] value: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('2');
      console.info('[LinkSet_0300] END');
      done();
    });
  })
}