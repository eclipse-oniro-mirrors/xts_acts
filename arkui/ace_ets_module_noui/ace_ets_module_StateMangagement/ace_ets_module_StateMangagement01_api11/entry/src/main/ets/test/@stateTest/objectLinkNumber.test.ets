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
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';


export default function objectLinkNumber() {
  describe('objectLinkNumber', () => {
    beforeEach(async (done: Function) => {
      console.info("objectLinkNumber beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/@state/objectLinkNumber',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get objectLinkNumber state pages: " + JSON.stringify(pages));
        if (!("objectLinkNumber" == pages.name)) {
          console.info("get objectLinkNumber state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push objectLinkNumber success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push objectLinkNumber page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   objectLinkNumber_0100
     * @tc.number SUB_ACE_STATUSMANAGER_SUPPORTUUNION_1160
     * @tc.desc   To test that the objectLink decorator supports union types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('objectLinkNumber_0100', Level.LEVEL0, async (done: Function) => {
      console.info('objectLinkNumber_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('objectLinkNumber');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[objectLinkNumber_0100] component obj is: " + JSON.stringify(obj));
      console.info("[objectLinkNumber_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Object]" number is {"a":100}');
      console.info('[objectLinkNumber_0100] END');
      done();
    });
    /**
     * @tc.name   objectLinkNumber_0200
     * @tc.number SUB_ACE_STATUSMANAGER_SUPPORTUUNION_1170
     * @tc.desc   To test that the objectLink decorator supports union types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('objectLinkNumber_0200', Level.LEVEL0, async (done: Function) => {
      console.info('objectLinkNumber_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('objectLinkNumber');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[objectLinkNumber_0100] component obj is: " + JSON.stringify(obj));
      console.info("[objectLinkNumber_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Object]" number is {"b":100}');
      console.info('[objectLinkNumber_0100] END');
      done();
    });
    /**
     * @tc.name   objectLinkNumber_0300
     * @tc.number SUB_ACE_STATUSMANAGER_SUPPORTUUNION_1180
     * @tc.desc   To test that the objectLink decorator supports union types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('objectLinkNumber_0300', Level.LEVEL0, async (done: Function) => {
      console.info('objectLinkNumber_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('objectLinkNumber');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[objectLinkNumber_0100] component obj is: " + JSON.stringify(obj));
      console.info("[objectLinkNumber_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Undefined]" number is undefined');
      console.info('[objectLinkNumber_0100] END');
      done();
    });
    /**
     * @tc.name   objectLinkNumber_0400
     * @tc.number SUB_ACE_STATUSMANAGER_SUPPORTUUNION_1190
     * @tc.desc   To test that the objectLink decorator supports union types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('objectLinkNumber_0400', Level.LEVEL0, async (done: Function) => {
      console.info('objectLinkNumber_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('objectLinkNumber');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[objectLinkNumber_0100] component obj is: " + JSON.stringify(obj));
      console.info("[objectLinkNumber_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Null]" number is null');
      console.info('[objectLinkNumber_0100] END');
      done();
    });


  })
}

