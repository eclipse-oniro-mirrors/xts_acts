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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
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
import CommonFunc from '../../MainAbility/utils/Common';

const waitUiReadyMs = 1000;

export default function ProvideJsunit() {
  describe('ProvideJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("Provide beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/Provide',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Provide state pages: " + JSON.stringify(pages));
        if (!("Provide" == pages.name)) {
          console.info("get Provide state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push Provide page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Provide page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('ProvideA_reset'));
      await button.click();
      console.log('reset button click succ')
      await CommonFunc.sleep(1000);
    });

    it('ProvideJsunit_0001', 0, async (done: Function) => {
      console.info('[ProvideJsunit_0001] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('ProvideAReviewVotes'));
      await btn.click();
      await driver.delayMs(waitUiReadyMs);
      let ProvideA1 = await driver.findComponent(ON.id('ProvideA1'));
      let txt_ProvideA1 = await ProvideA1.getText()
      expect(txt_ProvideA1).assertEqual("parent descent same nickname 0")
      let ProvideA2 = await driver.findComponent(ON.id('ProvideA2'));
      let txt_ProvideA2 = await ProvideA2.getText()
      expect(txt_ProvideA2).assertEqual("parent none nickname same name dif type 0")
      let ProvideA3 = await driver.findComponent(ON.id('ProvideA3'));
      let txt_ProvideA3 = await ProvideA3.getText()
      expect(txt_ProvideA3).assertEqual("multi son single parent 0")
      let ProvideB1 = await driver.findComponent(ON.id('ProvideB1'));
      let txt_ProvideB1 = await ProvideB1.getText()
      expect(txt_ProvideB1).assertEqual("reviewVotes 1")
      let ProvideB2 = await driver.findComponent(ON.id('ProvideB2'));
      let txt_ProvideB2 = await ProvideB2.getText()
      expect(txt_ProvideB2).assertEqual("descent same nickname dif name dif type 0")
      let ProvideB3 = await driver.findComponent(ON.id('ProvideB3'));
      let txt_ProvideB3 = await ProvideB3.getText()
      expect(txt_ProvideB3).assertEqual("descent none nickname same name dif type 0")
      let ProvideB4 = await driver.findComponent(ON.id('ProvideB4'));
      let txt_ProvideB4 = await ProvideB4.getText()
      expect(txt_ProvideB4).assertEqual("descent same nickname dif name same type 0")
      let ProvideB5 = await driver.findComponent(ON.id('ProvideB5'));
      let txt_ProvideB5 = await ProvideB5.getText()
      expect(txt_ProvideB5).assertEqual("descent same nickname same name same type 0")
      let ProvideB6 = await driver.findComponent(ON.id('ProvideB6'));
      let txt_ProvideB6 = await ProvideB6.getText()
      expect(txt_ProvideB6).assertEqual("descent dif nickname dif same type 0")
      done();
    });

    it('ProvideJsunit_0002', 0, async (done: Function) => {
      console.info('[ProvideJsunit_0002] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('ProvideAChangeA'));
      await btn.click();
      await driver.delayMs(waitUiReadyMs);
      let ProvideA1 = await driver.findComponent(ON.id('ProvideA1'));
      let txt_ProvideA1 = await ProvideA1.getText()
      expect(txt_ProvideA1).assertEqual("parent descent same nickname 1")
      let ProvideA2 = await driver.findComponent(ON.id('ProvideA2'));
      let txt_ProvideA2 = await ProvideA2.getText()
      expect(txt_ProvideA2).assertEqual("parent none nickname same name dif type 0")
      let ProvideA3 = await driver.findComponent(ON.id('ProvideA3'));
      let txt_ProvideA3 = await ProvideA3.getText()
      expect(txt_ProvideA3).assertEqual("multi son single parent 0")
      let ProvideB1 = await driver.findComponent(ON.id('ProvideB1'));
      let txt_ProvideB1 = await ProvideB1.getText()
      expect(txt_ProvideB1).assertEqual("reviewVotes 0")
      let ProvideB2 = await driver.findComponent(ON.id('ProvideB2'));
      let txt_ProvideB2 = await ProvideB2.getText()
      expect(txt_ProvideB2).assertEqual("descent same nickname dif name dif type 1")
      let ProvideB3 = await driver.findComponent(ON.id('ProvideB3'));
      let txt_ProvideB3 = await ProvideB3.getText()
      expect(txt_ProvideB3).assertEqual("descent none nickname same name dif type 0")
      let ProvideB4 = await driver.findComponent(ON.id('ProvideB4'));
      let txt_ProvideB4 = await ProvideB4.getText()
      expect(txt_ProvideB4).assertEqual("descent same nickname dif name same type 1")
      let ProvideB5 = await driver.findComponent(ON.id('ProvideB5'));
      let txt_ProvideB5 = await ProvideB5.getText()
      expect(txt_ProvideB5).assertEqual("descent same nickname same name same type 1")
      let ProvideB6 = await driver.findComponent(ON.id('ProvideB6'));
      let txt_ProvideB6 = await ProvideB6.getText()
      expect(txt_ProvideB6).assertEqual("descent dif nickname dif same type 0")
      done()
    });

    it('ProvideJsunit_0003', 0, async (done: Function) => {
      console.info('[ProvideJsunit_0003] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('ProvideAChangeB'));
      await btn.click();
      await driver.delayMs(waitUiReadyMs);
      let ProvideA1 = await driver.findComponent(ON.id('ProvideA1'));
      let txt_ProvideA1 = await ProvideA1.getText()
      expect(txt_ProvideA1).assertEqual("parent descent same nickname 0")
      let ProvideA2 = await driver.findComponent(ON.id('ProvideA2'));
      let txt_ProvideA2 = await ProvideA2.getText()
      expect(txt_ProvideA2).assertEqual("parent none nickname same name dif type 1")
      let ProvideA3 = await driver.findComponent(ON.id('ProvideA3'));
      let txt_ProvideA3 = await ProvideA3.getText()
      expect(txt_ProvideA3).assertEqual("multi son single parent 0")
      let ProvideB1 = await driver.findComponent(ON.id('ProvideB1'));
      let txt_ProvideB1 = await ProvideB1.getText()
      expect(txt_ProvideB1).assertEqual("reviewVotes 0")
      let ProvideB2 = await driver.findComponent(ON.id('ProvideB2'));
      let txt_ProvideB2 = await ProvideB2.getText()
      expect(txt_ProvideB2).assertEqual("descent same nickname dif name dif type 0")
      let ProvideB3 = await driver.findComponent(ON.id('ProvideB3'));
      let txt_ProvideB3 = await ProvideB3.getText()
      expect(txt_ProvideB3).assertEqual("descent none nickname same name dif type 1")
      let ProvideB4 = await driver.findComponent(ON.id('ProvideB4'));
      let txt_ProvideB4 = await ProvideB4.getText()
      expect(txt_ProvideB4).assertEqual("descent same nickname dif name same type 0")
      let ProvideB5 = await driver.findComponent(ON.id('ProvideB5'));
      let txt_ProvideB5 = await ProvideB5.getText()
      expect(txt_ProvideB5).assertEqual("descent same nickname same name same type 0")
      let ProvideB6 = await driver.findComponent(ON.id('ProvideB6'));
      let txt_ProvideB6 = await ProvideB6.getText()
      expect(txt_ProvideB6).assertEqual("descent dif nickname dif same type 0")
      done()
    });

    it('ProvideJsunit_0004', 0, async (done: Function) => {
      console.info('[ProvideJsunit_0004] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('ProvideAChangeF'));
      await btn.click();
      await driver.delayMs(waitUiReadyMs);
      let ProvideA1 = await driver.findComponent(ON.id('ProvideA1'));
      let txt_ProvideA1 = await ProvideA1.getText()
      expect(txt_ProvideA1).assertEqual("parent descent same nickname 0")
      let ProvideA2 = await driver.findComponent(ON.id('ProvideA2'));
      let txt_ProvideA2 = await ProvideA2.getText()
      expect(txt_ProvideA2).assertEqual("parent none nickname same name dif type 0")
      let ProvideA3 = await driver.findComponent(ON.id('ProvideA3'));
      let txt_ProvideA3 = await ProvideA3.getText()
      expect(txt_ProvideA3).assertEqual("multi son single parent 1")
      let ProvideB1 = await driver.findComponent(ON.id('ProvideB1'));
      let txt_ProvideB1 = await ProvideB1.getText()
      expect(txt_ProvideB1).assertEqual("reviewVotes 0")
      let ProvideB2 = await driver.findComponent(ON.id('ProvideB2'));
      let txt_ProvideB2 = await ProvideB2.getText()
      expect(txt_ProvideB2).assertEqual("descent same nickname dif name dif type 0")
      let ProvideB3 = await driver.findComponent(ON.id('ProvideB3'));
      let txt_ProvideB3 = await ProvideB3.getText()
      expect(txt_ProvideB3).assertEqual("descent none nickname same name dif type 0")
      let ProvideB4 = await driver.findComponent(ON.id('ProvideB4'));
      let txt_ProvideB4 = await ProvideB4.getText()
      expect(txt_ProvideB4).assertEqual("descent same nickname dif name same type 0")
      let ProvideB5 = await driver.findComponent(ON.id('ProvideB5'));
      let txt_ProvideB5 = await ProvideB5.getText()
      expect(txt_ProvideB5).assertEqual("descent same nickname same name same type 0")
      let ProvideB6 = await driver.findComponent(ON.id('ProvideB6'));
      let txt_ProvideB6 = await ProvideB6.getText()
      expect(txt_ProvideB6).assertEqual("descent dif nickname dif same type 1")
      done()
    });

    it('ProvideJsunit_0005', 0, async (done: Function) => {
      console.info('[ProvideJsunit_0005] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('ProvideBReviewVotes'));
      await btn.click();
      await driver.delayMs(waitUiReadyMs);
      let ProvideA1 = await driver.findComponent(ON.id('ProvideA1'));
      let txt_ProvideA1 = await ProvideA1.getText()
      expect(txt_ProvideA1).assertEqual("parent descent same nickname 0")
      let ProvideA2 = await driver.findComponent(ON.id('ProvideA2'));
      let txt_ProvideA2 = await ProvideA2.getText()
      expect(txt_ProvideA2).assertEqual("parent none nickname same name dif type 0")
      let ProvideA3 = await driver.findComponent(ON.id('ProvideA3'));
      let txt_ProvideA3 = await ProvideA3.getText()
      expect(txt_ProvideA3).assertEqual("multi son single parent 0")
      let ProvideB1 = await driver.findComponent(ON.id('ProvideB1'));
      let txt_ProvideB1 = await ProvideB1.getText()
      expect(txt_ProvideB1).assertEqual("reviewVotes 1")
      let ProvideB2 = await driver.findComponent(ON.id('ProvideB2'));
      let txt_ProvideB2 = await ProvideB2.getText()
      expect(txt_ProvideB2).assertEqual("descent same nickname dif name dif type 0")
      let ProvideB3 = await driver.findComponent(ON.id('ProvideB3'));
      let txt_ProvideB3 = await ProvideB3.getText()
      expect(txt_ProvideB3).assertEqual("descent none nickname same name dif type 0")
      let ProvideB4 = await driver.findComponent(ON.id('ProvideB4'));
      let txt_ProvideB4 = await ProvideB4.getText()
      expect(txt_ProvideB4).assertEqual("descent same nickname dif name same type 0")
      let ProvideB5 = await driver.findComponent(ON.id('ProvideB5'));
      let txt_ProvideB5 = await ProvideB5.getText()
      expect(txt_ProvideB5).assertEqual("descent same nickname same name same type 0")
      let ProvideB6 = await driver.findComponent(ON.id('ProvideB6'));
      let txt_ProvideB6 = await ProvideB6.getText()
      expect(txt_ProvideB6).assertEqual("descent dif nickname dif same type 0")
      done()
    });

    it('ProvideJsunit_0006', 0, async (done: Function) => {
      console.info('[ProvideJsunit_0006] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('ProvideBChangeA'));
      await btn.click();
      await driver.delayMs(waitUiReadyMs);
      let ProvideA1 = await driver.findComponent(ON.id('ProvideA1'));
      let txt_ProvideA1 = await ProvideA1.getText()
      expect(txt_ProvideA1).assertEqual("parent descent same nickname changed")
      let ProvideA2 = await driver.findComponent(ON.id('ProvideA2'));
      let txt_ProvideA2 = await ProvideA2.getText()
      expect(txt_ProvideA2).assertEqual("parent none nickname same name dif type 0")
      let ProvideA3 = await driver.findComponent(ON.id('ProvideA3'));
      let txt_ProvideA3 = await ProvideA3.getText()
      expect(txt_ProvideA3).assertEqual("multi son single parent 0")
      let ProvideB1 = await driver.findComponent(ON.id('ProvideB1'));
      let txt_ProvideB1 = await ProvideB1.getText()
      expect(txt_ProvideB1).assertEqual("reviewVotes 0")
      let ProvideB2 = await driver.findComponent(ON.id('ProvideB2'));
      let txt_ProvideB2 = await ProvideB2.getText()
      expect(txt_ProvideB2).assertEqual("descent same nickname dif name dif type changed")
      let ProvideB3 = await driver.findComponent(ON.id('ProvideB3'));
      let txt_ProvideB3 = await ProvideB3.getText()
      expect(txt_ProvideB3).assertEqual("descent none nickname same name dif type 0")
      let ProvideB4 = await driver.findComponent(ON.id('ProvideB4'));
      let txt_ProvideB4 = await ProvideB4.getText()
      expect(txt_ProvideB4).assertEqual("descent same nickname dif name same type changed")
      let ProvideB5 = await driver.findComponent(ON.id('ProvideB5'));
      let txt_ProvideB5 = await ProvideB5.getText()
      expect(txt_ProvideB5).assertEqual("descent same nickname same name same type changed")
      let ProvideB6 = await driver.findComponent(ON.id('ProvideB6'));
      let txt_ProvideB6 = await ProvideB6.getText()
      expect(txt_ProvideB6).assertEqual("descent dif nickname dif same type 0")
      done()
    });

    it('ProvideJsunit_0007', 0, async (done: Function) => {
      console.info('[ProvideJsunit_0007] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('ProvideBChangeD'));
      await btn.click();
      await driver.delayMs(waitUiReadyMs);
      let ProvideA1 = await driver.findComponent(ON.id('ProvideA1'));
      let txt_ProvideA1 = await ProvideA1.getText()
      expect(txt_ProvideA1).assertEqual("parent descent same nickname 0")
      let ProvideA2 = await driver.findComponent(ON.id('ProvideA2'));
      let txt_ProvideA2 = await ProvideA2.getText()
      expect(txt_ProvideA2).assertEqual("parent none nickname same name dif type changed")
      let ProvideA3 = await driver.findComponent(ON.id('ProvideA3'));
      let txt_ProvideA3 = await ProvideA3.getText()
      expect(txt_ProvideA3).assertEqual("multi son single parent 0")
      let ProvideB1 = await driver.findComponent(ON.id('ProvideB1'));
      let txt_ProvideB1 = await ProvideB1.getText()
      expect(txt_ProvideB1).assertEqual("reviewVotes 0")
      let ProvideB2 = await driver.findComponent(ON.id('ProvideB2'));
      let txt_ProvideB2 = await ProvideB2.getText()
      expect(txt_ProvideB2).assertEqual("descent same nickname dif name dif type 0")
      let ProvideB3 = await driver.findComponent(ON.id('ProvideB3'));
      let txt_ProvideB3 = await ProvideB3.getText()
      expect(txt_ProvideB3).assertEqual("descent none nickname same name dif type changed")
      let ProvideB4 = await driver.findComponent(ON.id('ProvideB4'));
      let txt_ProvideB4 = await ProvideB4.getText()
      expect(txt_ProvideB4).assertEqual("descent same nickname dif name same type 0")
      let ProvideB5 = await driver.findComponent(ON.id('ProvideB5'));
      let txt_ProvideB5 = await ProvideB5.getText()
      expect(txt_ProvideB5).assertEqual("descent same nickname same name same type 0")
      let ProvideB6 = await driver.findComponent(ON.id('ProvideB6'));
      let txt_ProvideB6 = await ProvideB6.getText()
      expect(txt_ProvideB6).assertEqual("descent dif nickname dif same type 0")
      done()
    });

    it('ProvideJsunit_0008', 0, async (done: Function) => {
      console.info('[ProvideJsunit_0008] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('ProvideBChangeC'));
      await btn.click();
      await driver.delayMs(waitUiReadyMs);
      let ProvideA1 = await driver.findComponent(ON.id('ProvideA1'));
      let txt_ProvideA1 = await ProvideA1.getText()
      expect(txt_ProvideA1).assertEqual("parent descent same nickname 1")
      let ProvideA2 = await driver.findComponent(ON.id('ProvideA2'));
      let txt_ProvideA2 = await ProvideA2.getText()
      expect(txt_ProvideA2).assertEqual("parent none nickname same name dif type 0")
      let ProvideA3 = await driver.findComponent(ON.id('ProvideA3'));
      let txt_ProvideA3 = await ProvideA3.getText()
      expect(txt_ProvideA3).assertEqual("multi son single parent 0")
      let ProvideB1 = await driver.findComponent(ON.id('ProvideB1'));
      let txt_ProvideB1 = await ProvideB1.getText()
      expect(txt_ProvideB1).assertEqual("reviewVotes 0")
      let ProvideB2 = await driver.findComponent(ON.id('ProvideB2'));
      let txt_ProvideB2 = await ProvideB2.getText()
      expect(txt_ProvideB2).assertEqual("descent same nickname dif name dif type 1")
      let ProvideB3 = await driver.findComponent(ON.id('ProvideB3'));
      let txt_ProvideB3 = await ProvideB3.getText()
      expect(txt_ProvideB3).assertEqual("descent none nickname same name dif type 0")
      let ProvideB4 = await driver.findComponent(ON.id('ProvideB4'));
      let txt_ProvideB4 = await ProvideB4.getText()
      expect(txt_ProvideB4).assertEqual("descent same nickname dif name same type 1")
      let ProvideB5 = await driver.findComponent(ON.id('ProvideB5'));
      let txt_ProvideB5 = await ProvideB5.getText()
      expect(txt_ProvideB5).assertEqual("descent same nickname same name same type 1")
      let ProvideB6 = await driver.findComponent(ON.id('ProvideB6'));
      let txt_ProvideB6 = await ProvideB6.getText()
      expect(txt_ProvideB6).assertEqual("descent dif nickname dif same type 0")
      done()
    });

    it('ProvideJsunit_0009', 0, async (done: Function) => {
      console.info('[ProvideJsunit_0008] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('ProvideBChangeB'));
      await btn.click();
      await driver.delayMs(waitUiReadyMs);
      let ProvideA1 = await driver.findComponent(ON.id('ProvideA1'));
      let txt_ProvideA1 = await ProvideA1.getText()
      expect(txt_ProvideA1).assertEqual("parent descent same nickname 1")
      let ProvideA2 = await driver.findComponent(ON.id('ProvideA2'));
      let txt_ProvideA2 = await ProvideA2.getText()
      expect(txt_ProvideA2).assertEqual("parent none nickname same name dif type 0")
      let ProvideA3 = await driver.findComponent(ON.id('ProvideA3'));
      let txt_ProvideA3 = await ProvideA3.getText()
      expect(txt_ProvideA3).assertEqual("multi son single parent 0")
      let ProvideB1 = await driver.findComponent(ON.id('ProvideB1'));
      let txt_ProvideB1 = await ProvideB1.getText()
      expect(txt_ProvideB1).assertEqual("reviewVotes 0")
      let ProvideB2 = await driver.findComponent(ON.id('ProvideB2'));
      let txt_ProvideB2 = await ProvideB2.getText()
      expect(txt_ProvideB2).assertEqual("descent same nickname dif name dif type 1")
      let ProvideB3 = await driver.findComponent(ON.id('ProvideB3'));
      let txt_ProvideB3 = await ProvideB3.getText()
      expect(txt_ProvideB3).assertEqual("descent none nickname same name dif type 0")
      let ProvideB4 = await driver.findComponent(ON.id('ProvideB4'));
      let txt_ProvideB4 = await ProvideB4.getText()
      expect(txt_ProvideB4).assertEqual("descent same nickname dif name same type 1")
      let ProvideB5 = await driver.findComponent(ON.id('ProvideB5'));
      let txt_ProvideB5 = await ProvideB5.getText()
      expect(txt_ProvideB5).assertEqual("descent same nickname same name same type 1")
      let ProvideB6 = await driver.findComponent(ON.id('ProvideB6'));
      let txt_ProvideB6 = await ProvideB6.getText()
      expect(txt_ProvideB6).assertEqual("descent dif nickname dif same type 0")
      done()
    });

    it('ProvideJsunit_0010', 0, async (done: Function) => {
      console.info('[ProvideJsunit_0010] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('ProvideBChangeF'));
      await btn.click();
      await driver.delayMs(waitUiReadyMs);
      let ProvideA1 = await driver.findComponent(ON.id('ProvideA1'));
      let txt_ProvideA1 = await ProvideA1.getText()
      expect(txt_ProvideA1).assertEqual("parent descent same nickname 0")
      let ProvideA2 = await driver.findComponent(ON.id('ProvideA2'));
      let txt_ProvideA2 = await ProvideA2.getText()
      expect(txt_ProvideA2).assertEqual("parent none nickname same name dif type 0")
      let ProvideA3 = await driver.findComponent(ON.id('ProvideA3'));
      let txt_ProvideA3 = await ProvideA3.getText()
      expect(txt_ProvideA3).assertEqual("multi son single parent 3")
      let ProvideB1 = await driver.findComponent(ON.id('ProvideB1'));
      let txt_ProvideB1 = await ProvideB1.getText()
      expect(txt_ProvideB1).assertEqual("reviewVotes 0")
      let ProvideB2 = await driver.findComponent(ON.id('ProvideB2'));
      let txt_ProvideB2 = await ProvideB2.getText()
      expect(txt_ProvideB2).assertEqual("descent same nickname dif name dif type 0")
      let ProvideB3 = await driver.findComponent(ON.id('ProvideB3'));
      let txt_ProvideB3 = await ProvideB3.getText()
      expect(txt_ProvideB3).assertEqual("descent none nickname same name dif type 0")
      let ProvideB4 = await driver.findComponent(ON.id('ProvideB4'));
      let txt_ProvideB4 = await ProvideB4.getText()
      expect(txt_ProvideB4).assertEqual("descent same nickname dif name same type 0")
      let ProvideB5 = await driver.findComponent(ON.id('ProvideB5'));
      let txt_ProvideB5 = await ProvideB5.getText()
      expect(txt_ProvideB5).assertEqual("descent same nickname same name same type 0")
      let ProvideB6 = await driver.findComponent(ON.id('ProvideB6'));
      let txt_ProvideB6 = await ProvideB6.getText()
      expect(txt_ProvideB6).assertEqual("descent dif nickname dif same type 3")
      done();
    });

    it('ProvideJsunit_0011', 0, async (done: Function) => {
      console.info('[ProvideJsunit_0011] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn_1 = await driver.findComponent(ON.id('ProvideBChangeA'));
      await btn_1.click();
      await driver.delayMs(waitUiReadyMs);
      let btn_2 = await driver.findComponent(ON.id('ProvideBChangeC'));
      await btn_2.click();
      await driver.delayMs(waitUiReadyMs);
      let ProvideA1 = await driver.findComponent(ON.id('ProvideA1'));
      let txt_ProvideA1 = await ProvideA1.getText()
      expect(txt_ProvideA1).assertEqual("parent descent same nickname changed1")
      let ProvideA2 = await driver.findComponent(ON.id('ProvideA2'));
      let txt_ProvideA2 = await ProvideA2.getText()
      expect(txt_ProvideA2).assertEqual("parent none nickname same name dif type 0")
      let ProvideA3 = await driver.findComponent(ON.id('ProvideA3'));
      let txt_ProvideA3 = await ProvideA3.getText()
      expect(txt_ProvideA3).assertEqual("multi son single parent 0")
      let ProvideB1 = await driver.findComponent(ON.id('ProvideB1'));
      let txt_ProvideB1 = await ProvideB1.getText()
      expect(txt_ProvideB1).assertEqual("reviewVotes 0")
      let ProvideB2 = await driver.findComponent(ON.id('ProvideB2'));
      let txt_ProvideB2 = await ProvideB2.getText()
      expect(txt_ProvideB2).assertEqual("descent same nickname dif name dif type changed1")
      let ProvideB3 = await driver.findComponent(ON.id('ProvideB3'));
      let txt_ProvideB3 = await ProvideB3.getText()
      expect(txt_ProvideB3).assertEqual("descent none nickname same name dif type 0")
      let ProvideB4 = await driver.findComponent(ON.id('ProvideB4'));
      let txt_ProvideB4 = await ProvideB4.getText()
      expect(txt_ProvideB4).assertEqual("descent same nickname dif name same type changed1")
      let ProvideB5 = await driver.findComponent(ON.id('ProvideB5'));
      let txt_ProvideB5 = await ProvideB5.getText()
      expect(txt_ProvideB5).assertEqual("descent same nickname same name same type changed1")
      let ProvideB6 = await driver.findComponent(ON.id('ProvideB6'));
      let txt_ProvideB6 = await ProvideB6.getText()
      expect(txt_ProvideB6).assertEqual("descent dif nickname dif same type 0")
      done()
    });

    it('ProvideJsunit_0012', 0, async (done: Function) => {
      console.info('[ProvideJsunit_0012] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn_1 = await driver.findComponent(ON.id('ProvideBChangeD'));
      await btn_1.click();
      await driver.delayMs(waitUiReadyMs);
      let btn_2 = await driver.findComponent(ON.id('ProvideAChangeB'));
      await btn_2.click();
      await driver.delayMs(waitUiReadyMs);
      let ProvideA1 = await driver.findComponent(ON.id('ProvideA1'));
      let txt_ProvideA1 = await ProvideA1.getText()
      expect(txt_ProvideA1).assertEqual("parent descent same nickname 0")
      let ProvideA2 = await driver.findComponent(ON.id('ProvideA2'));
      let txt_ProvideA2 = await ProvideA2.getText()
      expect(txt_ProvideA2).assertEqual("parent none nickname same name dif type changed1")
      let ProvideA3 = await driver.findComponent(ON.id('ProvideA3'));
      let txt_ProvideA3 = await ProvideA3.getText()
      expect(txt_ProvideA3).assertEqual("multi son single parent 0")
      let ProvideB1 = await driver.findComponent(ON.id('ProvideB1'));
      let txt_ProvideB1 = await ProvideB1.getText()
      expect(txt_ProvideB1).assertEqual("reviewVotes 0")
      let ProvideB2 = await driver.findComponent(ON.id('ProvideB2'));
      let txt_ProvideB2 = await ProvideB2.getText()
      expect(txt_ProvideB2).assertEqual("descent same nickname dif name dif type 0")
      let ProvideB3 = await driver.findComponent(ON.id('ProvideB3'));
      let txt_ProvideB3 = await ProvideB3.getText()
      expect(txt_ProvideB3).assertEqual("descent none nickname same name dif type changed1")
      let ProvideB4 = await driver.findComponent(ON.id('ProvideB4'));
      let txt_ProvideB4 = await ProvideB4.getText()
      expect(txt_ProvideB4).assertEqual("descent same nickname dif name same type 0")
      let ProvideB5 = await driver.findComponent(ON.id('ProvideB5'));
      let txt_ProvideB5 = await ProvideB5.getText()
      expect(txt_ProvideB5).assertEqual("descent same nickname same name same type 0")
      let ProvideB6 = await driver.findComponent(ON.id('ProvideB6'));
      let txt_ProvideB6 = await ProvideB6.getText()
      expect(txt_ProvideB6).assertEqual("descent dif nickname dif same type 0")
      done()
    });

  })
}
