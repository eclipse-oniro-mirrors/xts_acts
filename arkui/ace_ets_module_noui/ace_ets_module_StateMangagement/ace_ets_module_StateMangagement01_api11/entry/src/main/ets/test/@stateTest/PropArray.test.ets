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

export default function PropArray() {
  describe('PropArray', () => {
    beforeEach(async (done: Function) => {
      console.info("PropArray beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/@state/PropArray',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PropArray state pages: " + JSON.stringify(pages));
        if (!("PropArray" == pages.name)) {
          console.info("get PropArray state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PropArray success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PropArray page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   PropArray_0100
     * @tc.number SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0610
     * @tc.desc   To test that the Prop decorator supports union types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PropArray_0100', Level.LEVEL0, async (done: Function) => {
      console.info('PropArray_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PropArray');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropArray_0100] component obj is: " + JSON.stringify(obj));
      console.info("[PropArray_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Array]" number is [10]');
      console.info('[PropArray_0100] END');
      done();
    });
    /**
     * @tc.name   PropArray_0200
     * @tc.number SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0620
     * @tc.desc   To test that the Prop decorator supports union types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PropArray_0200', Level.LEVEL0, async (done: Function) => {
      console.info('PropArray_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PropArray');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropArray_0100] component obj is: " + JSON.stringify(obj));
      console.info("[PropArray_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Array]" number is [true]');
      console.info('[PropArray_0100] END');
      done();
    });
    /**
     * @tc.name   PropArray_0300
     * @tc.number SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0630
     * @tc.desc   To test that the Prop decorator supports union types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PropArray_0300', Level.LEVEL0, async (done: Function) => {
      console.info('PropArray_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PropArray');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropArray_0100] component obj is: " + JSON.stringify(obj));
      console.info("[PropArray_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Boolean]" number is true');
      console.info('[PropArray_0100] END');
      done();
    });
    /**
     * @tc.name   PropArray_0400
     * @tc.number SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0640
     * @tc.desc   To test that the Prop decorator supports union types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PropArray_0400', Level.LEVEL0, async (done: Function) => {
      console.info('PropArray_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('PropArrayNew');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[PropArray_0100] component obj is: " + JSON.stringify(obj));
      console.info("[PropArray_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Array]" number is 200');
      console.info('[PropArray_0100] END');
      done();
    });


  })
}

