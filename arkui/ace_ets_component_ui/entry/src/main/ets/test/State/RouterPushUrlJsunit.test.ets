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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
const waitUiReadyMs = 1000;

export default function RouterPushUrlJsunit() {
  describe('RouterPushUrlJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("RouterPushUrlJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/RouterPushOne',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RouterPushUrlJsunit state pages: " + JSON.stringify(pages));
        if (!("RouterPushOne" == pages.name)) {
          console.info("get RouterPushUrlJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push RouterPushUrlJsunit page result:" + JSON.stringify(result));
          router.clear()
        }
      } catch (err) {
        console.error("push RouterPushUrlJsunit page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      router.clear()
    });

    it('RouterPushUrlJsunit_0001', 0, async (done: Function) => {
      console.info('[RouterPushUrlJsunit_0001] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('turn_RouterPushUrlTwo_noParms'));
      await driver.delayMs(waitUiReadyMs);
      await btn.click();
      await driver.delayMs(waitUiReadyMs);
      let text = await driver.findComponent(ON.id('Text_RouterPushTwo'));
      await driver.delayMs(waitUiReadyMs);
      let txt = await text.getText()
      expect(txt).assertEqual("RouterPushTwo ")
      done();
    });

    it('RouterPushUrlJsunit_0002', 0, async (done: Function) => {
      console.info('[RouterPushUrlJsunit_0002] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('turn_RouterPushUrlTwo_hasParms'));
      await driver.delayMs(waitUiReadyMs);
      await btn.click();
      await driver.delayMs(waitUiReadyMs);
      let text = await driver.findComponent(ON.id('Text_RouterPushTwo'));
      await driver.delayMs(waitUiReadyMs);
      let txt = await text.getText()
      expect(txt).assertEqual("RouterPushTwo params")
      done();
    });


    it('RouterPushUrlJsunit_0003', 0, async (done: Function) => {
      console.info('[RouterPushUrlJsunit_0003] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let Length = router.getLength()
      expect("Length = " + Length).assertEqual("Length = 1")
      let btn1 = await driver.findComponent(ON.id('turn_RouterPushUrlTwo_noParms'));
      await driver.delayMs(waitUiReadyMs);
      await btn1.click();
      await driver.delayMs(waitUiReadyMs);
      let pageTwoLength = router.getLength()
      expect("pageTwoLength = " + pageTwoLength).assertEqual("pageTwoLength = 2")
      let pages = router.getState();
      expect(pages.index).assertEqual(2)
      let btn2 = await driver.findComponent(ON.id('turn_RouterPushUrlOne_RouterMode_Standard'));
      await driver.delayMs(waitUiReadyMs);
      await btn2.click();
      await driver.delayMs(waitUiReadyMs);
      let pageOneLength = router.getLength()
      expect("pageOneLength = " + pageOneLength).assertEqual("pageOneLength = 3")
      pages = router.getState();
      expect(pages.index).assertEqual(3)
      done()
    });


    it('RouterPushUrlJsunit_0004', 0, async (done: Function) => {
      console.info('[RouterPushUrlJsunit_0004] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let Length = router.getLength()
      expect(Length).assertEqual("1")
      let btn1 = await driver.findComponent(ON.id('turn_RouterPushUrlTwo_noParms'));
      await driver.delayMs(waitUiReadyMs);
      await btn1.click();
      await driver.delayMs(waitUiReadyMs);
      let pageTwoLength = router.getLength()
      expect("pageTwoLength = " + pageTwoLength).assertEqual("pageTwoLength = 2")
      let pages = router.getState();
      expect(pages.index).assertEqual(2)
      let btn2 = await driver.findComponent(ON.id('turn_RouterPushUrlOne_RouterMode_Single'));
      await driver.delayMs(waitUiReadyMs);
      await btn2.click();
      await driver.delayMs(waitUiReadyMs);
      let pageOneLength = router.getLength()
      expect("pageOneLength = " + pageOneLength).assertEqual("pageOneLength = 2")
      pages = router.getState();
      expect(pages.index).assertEqual(2)
      done()
    });

    it('RouterPushUrlJsunit_0005', 0, async (done: Function) => {
      console.info('[RouterPushUrlJsunit_0005] START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('turn_RouterPushReplace_noParms'));
      await driver.delayMs(waitUiReadyMs);
      await btn.click();
      let Length = router.getLength()
      expect(Length).assertEqual("1")
      await driver.delayMs(waitUiReadyMs);
      let text = await driver.findComponent(ON.id('Text_RouterPushTwo'));
      await driver.delayMs(waitUiReadyMs);
      let txt = await text.getText()
      expect(txt).assertEqual("RouterPushTwo ")
      done();
    });

    it('RouterPushUrlJsunit_0006', 0, async (done: Function) => {
      console.info('[RouterPushUrlJsunit_0006] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('turn_RouterPushReplace_hasParms'));
      await driver.delayMs(waitUiReadyMs);
      await btn.click();
      let Length = router.getLength()
      expect(Length).assertEqual("1")
      await driver.delayMs(waitUiReadyMs);
      let text = await driver.findComponent(ON.id('Text_RouterPushTwo'));
      await driver.delayMs(waitUiReadyMs);
      let txt = await text.getText()
      expect(txt).assertEqual("RouterPushTwo params")
      done();
    });

    it('RouterPushUrlJsunit_0007', 0, async (done: Function) => {
      console.info('[RouterPushUrlJsunit_0007] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('turn_UIRouterPushUrlTwo_noParms'));
      await driver.delayMs(waitUiReadyMs);
      await btn.click();
      await driver.delayMs(waitUiReadyMs);
      let text = await driver.findComponent(ON.id('Text_UIRouterPushTwo'));
      await driver.delayMs(waitUiReadyMs);
      let txt = await text.getText()
      expect(txt).assertEqual("UIRouterPushTwo ")
      done();
    });

    it('RouterPushUrlJsunit_0008', 0, async (done: Function) => {
      console.info('[RouterPushUrlJsunit_0008] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('turn_UIRouterPushUrlTwo_hasParms'));
      await driver.delayMs(waitUiReadyMs);
      await btn.click();
      await driver.delayMs(waitUiReadyMs);
      let text = await driver.findComponent(ON.id('Text_UIRouterPushTwo'));
      await driver.delayMs(waitUiReadyMs);
      let txt = await text.getText()
      expect(txt).assertEqual("UIRouterPushTwo params")
      done();
    });


    it('RouterPushUrlJsunit_0009', 0, async (done: Function) => {
      console.info('[RouterPushUrlJsunit_0009] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let Length = router.getLength()
      expect("Length = " + Length).assertEqual("Length = 1")
      let btn1 = await driver.findComponent(ON.id('turn_UIRouterPushUrlTwo_noParms'));
      await driver.delayMs(waitUiReadyMs);
      await btn1.click();
      await driver.delayMs(waitUiReadyMs);
      let pageTwoLength = router.getLength()
      expect("pageTwoLength = " + pageTwoLength).assertEqual("pageTwoLength = 2")
      let pages = router.getState();
      expect(pages.index).assertEqual(2)
      let btn2 = await driver.findComponent(ON.id('turn_UIRouterPushUrlOne_RouterMode_Standard'));
      await driver.delayMs(waitUiReadyMs);
      await btn2.click();
      await driver.delayMs(waitUiReadyMs);
      let pageOneLength = router.getLength()
      expect("pageOneLength = " + pageOneLength).assertEqual("pageOneLength = 3")
      pages = router.getState();
      expect(pages.index).assertEqual(3)
      done()
    });


    it('RouterPushUrlJsunit_0010', 0, async (done: Function) => {
      console.info('[RouterPushUrlJsunit_0010] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let Length = router.getLength()
      expect(Length).assertEqual("1")
      let btn1 = await driver.findComponent(ON.id('turn_UIRouterPushUrlTwo_noParms'));
      await driver.delayMs(waitUiReadyMs);
      await btn1.click();
      await driver.delayMs(waitUiReadyMs);
      let pageTwoLength = router.getLength()
      expect("pageTwoLength = " + pageTwoLength).assertEqual("pageTwoLength = 2")
      let pages = router.getState();
      expect(pages.index).assertEqual(2)
      let btn2 = await driver.findComponent(ON.id('turn_UIRouterPushUrlOne_RouterMode_Single'));
      await driver.delayMs(waitUiReadyMs);
      await btn2.click();
      await driver.delayMs(waitUiReadyMs);
      let pageOneLength = router.getLength()
      expect("pageOneLength = " + pageOneLength).assertEqual("pageOneLength = 2")
      pages = router.getState();
      expect(pages.index).assertEqual(2)
      done()
    });

    it('RouterPushUrlJsunit_0011', 0, async (done: Function) => {
      console.info('[RouterPushUrlJsunit_0011] START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('turn_UIRouterPushReplace_noParms'));
      await driver.delayMs(waitUiReadyMs);
      await btn.click();
      let Length = router.getLength()
      expect(Length).assertEqual("1")
      await driver.delayMs(waitUiReadyMs);
      let text = await driver.findComponent(ON.id('Text_UIRouterPushTwo'));
      await driver.delayMs(waitUiReadyMs);
      let txt = await text.getText()
      expect(txt).assertEqual("UIRouterPushTwo ")
      done();
    });

    it('RouterPushUrlJsunit_0012', 0, async (done: Function) => {
      console.info('[RouterPushUrlJsunit_0012] START');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let btn = await driver.findComponent(ON.id('turn_UIRouterPushReplace_hasParms'));
      await driver.delayMs(waitUiReadyMs);
      await btn.click();
      let Length = router.getLength()
      expect(Length).assertEqual("1")
      await driver.delayMs(waitUiReadyMs);
      let text = await driver.findComponent(ON.id('Text_UIRouterPushTwo'));
      await driver.delayMs(waitUiReadyMs);
      let txt = await text.getText()
      expect(txt).assertEqual("UIRouterPushTwo params")
      done();
    });
        
  })
}
