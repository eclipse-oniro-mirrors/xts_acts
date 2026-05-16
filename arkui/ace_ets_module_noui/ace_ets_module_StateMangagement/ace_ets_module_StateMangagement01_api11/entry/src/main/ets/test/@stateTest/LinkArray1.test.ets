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

export default function LinkArray1() {
  describe('LinkArray1', () => {
    beforeEach(async (done: Function) => {
      console.info("LinkArray1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/@state/LinkArray1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LinkArray1 state pages: " + JSON.stringify(pages));
        if (!("LinkArray1" == pages.name)) {
          console.info("get LinkArray1 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LinkArray1 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LinkArray1 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   LinkArray_0500
     * @tc.number SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0880
     * @tc.desc   To test that the Link decorator supports union types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LinkArray_0500', Level.LEVEL0, async (done: Function) => {
      console.info('LinkArray_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state5'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('LinkArray1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LinkArray_0100] component obj is: " + JSON.stringify(obj));
      console.info("[LinkArray_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Array]" number is [10]');
      console.info('[LinkArray_0100] END');
      done();
    });
    /**
     * @tc.name   LinkArray_0600
     * @tc.number SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0890
     * @tc.desc   To test that the Link decorator supports union types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LinkArray_0600', Level.LEVEL0, async (done: Function) => {
      console.info('LinkArray_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state6'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('LinkArray1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LinkArray_0100] component obj is: " + JSON.stringify(obj));
      console.info("[LinkArray_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Date]" number is "2021-08-08T00:00:00.000Z"');
      console.info('[LinkArray_0100] END');
      done();
    });
    /**
     * @tc.name   LinkArray_0700
     * @tc.number SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0900
     * @tc.desc   To test that the Link decorator supports union types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LinkArray_0700', Level.LEVEL0, async (done: Function) => {
      console.info('LinkArray_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state7'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('LinkArray1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LinkArray_0100] component obj is: " + JSON.stringify(obj));
      console.info("[LinkArray_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Array]" number is ["20"]');
      console.info('[LinkArray_0100] END');
      done();
    });
    /**
     * @tc.name   LinkArray_0800
     * @tc.number SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0910
     * @tc.desc   To test that the Link decorator supports union types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LinkArray_0800', Level.LEVEL0, async (done: Function) => {
      console.info('LinkArray_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state8'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('LinkArray1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[LinkArray_0100] component obj is: " + JSON.stringify(obj));
      console.info("[LinkArray_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Array]" number is [{"number":30}]');
      console.info('[LinkArray_0100] END');
      done();
    });
    /**
     * @tc.name   LinkArray_0900
     * @tc.number SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0920
     * @tc.desc   To test that the Link decorator supports union types.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LinkArray_0900', Level.LEVEL0, async (done: Function) => {
      console.info('StateArray_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state9'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('LinkArray1New');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[StateArray_0100] component obj is: " + JSON.stringify(obj));
      console.info("[StateArray_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Array]" number is 200');
      console.info('[StateArray_0100] END');
      done();
    });

  })
}

