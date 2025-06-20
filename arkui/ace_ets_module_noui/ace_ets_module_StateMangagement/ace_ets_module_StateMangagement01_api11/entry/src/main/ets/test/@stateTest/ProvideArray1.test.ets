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


export default function ProvideArray1() {
  describe('ProvideArray1', () => {
    beforeEach(async (done: Function) => {
      console.info("ProvideArray1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/@state/ProvideArray1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ProvideArray1 state pages: " + JSON.stringify(pages));
        if (!("ProvideArray1" == pages.name)) {
          console.info("get ProvideArray1 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ProvideArray1 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ProvideArray1 page error: " + err);
        expect().assertFail();
      }
      done();
    });


    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0420
    * @tc.name  : ProvideArray_0500
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('ProvideArray_0500', Level.LEVEL0, async (done: Function) => {
      console.info('ProvideArray_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state5'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ProvideArray1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ProvideArray_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ProvideArray_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Array]" number is [10]');
      console.info('[ProvideArray_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0430
    * @tc.name  : ProvideArray_0600
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('ProvideArray_0600', Level.LEVEL0, async (done: Function) => {
      console.info('ProvideArray_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state6'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ProvideArray1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ProvideArray_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ProvideArray_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Date]" number is "2021-08-08T00:00:00.000Z"');
      console.info('[ProvideArray_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0440
    * @tc.name  : ProvideArray_0700
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('ProvideArray_0700', Level.LEVEL0, async (done: Function) => {
      console.info('ProvideArray_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state7'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ProvideArray1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ProvideArray_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ProvideArray_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Array]" number is ["20"]');
      console.info('[ProvideArray_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0450
    * @tc.name  : ProvideArray_0800
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('ProvideArray_0800', Level.LEVEL0, async (done: Function) => {
      console.info('ProvideArray_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state8'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ProvideArray1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ProvideArray_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ProvideArray_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Array]" number is [{"number":30}]');
      console.info('[ProvideArray_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0460
    * @tc.name  : ProvideArray_0900
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('ProvideArray_0900', Level.LEVEL0, async (done: Function) => {
      console.info('StateArray_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state9'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('ProvideArray1New');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[StateArray_0100] component obj is: " + JSON.stringify(obj));
      console.info("[StateArray_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('count type of "[object Array]" number is 200');
      console.info('[StateArray_0100] END');
      done();
    });

  })
}

