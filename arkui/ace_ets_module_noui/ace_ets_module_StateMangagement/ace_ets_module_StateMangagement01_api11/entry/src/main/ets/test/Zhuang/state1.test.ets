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
import CommonFunc from '../../MainAbility/common/Common';


export default function state1() {
  describe('state1', () => {
    beforeEach(async (done: Function) => {
      console.info("state1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Zhuang/state1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get state1 state pages: " + JSON.stringify(pages));
        if (!("state1" == pages.name)) {
          console.info("get state1 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push state1 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push state1 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      router.back()
    });
    /**
     * @tc.name   state1_0100
     * @tc.number state1_0100
     * @tc.desc   state1_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('state1_0100', Level.LEVEL0, async (done: Function) => {
      console.info('state1_0100 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('sBtn1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('sBtn1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[state1_0100] component obj is: " + JSON.stringify(obj));
      console.info("[state1_0100] title: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFC0CB');
      console.info('[state1_0100] END');
      done();

    });

    /**
     * @tc.name   state1_0200
     * @tc.number state1_0200
     * @tc.desc   state1_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('state1_0200', Level.LEVEL0, async (done: Function) => {
      console.info('state1_0200 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('sBtn2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('sBtn2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[state1_0200] component obj is: " + JSON.stringify(obj));
      console.info("[state1_0200] title: " + JSON.stringify(obj.$attrs.backgroundColor));
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFC0CB');
      console.info('[state1_0200] END');
      done();

    });


    /**
     * @tc.name   state1_0300
     * @tc.number state1_0300
     * @tc.desc   state1_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('state1_0300', Level.LEVEL0, async (done: Function) => {
      console.info('state1_0300 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('sBtn3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('sBtn3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[state1_0300] component obj is: " + JSON.stringify(obj));
      console.info("[state1_0300] title: " + JSON.stringify(obj.$attrs.fontSize));
      expect(obj.$attrs.fontSize).assertEqual('100.00fp');
      console.info('[state1_0300] END');
      done();

    });

    /**
     * @tc.name   state1_0400
     * @tc.number state1_0400
     * @tc.desc   state1_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('state1_0400', Level.LEVEL0, async (done: Function) => {
      console.info('state1_0400 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('sBtn4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('sBtn4');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[state1_0400] component obj is: " + JSON.stringify(obj));
      console.info("[state1_0400] title: " + JSON.stringify(obj.$attrs.fontSize));
      expect(obj.$attrs.fontSize).assertEqual('100.00fp');
      console.info('[state1_0400] END');
      done();

    });


  })
}

