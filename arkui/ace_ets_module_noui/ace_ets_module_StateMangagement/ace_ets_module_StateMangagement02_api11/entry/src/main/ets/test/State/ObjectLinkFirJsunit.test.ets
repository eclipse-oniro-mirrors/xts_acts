/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';


export default function ObjectLinkFirJsunit() {
  describe('ObjectLinkFirJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("ObjectLinkFirJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/ObjectLinkFir',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ObjectLinkFirJsunit state pages: " + JSON.stringify(pages));
        if (!("ObjectLinkFir" == pages.name)) {
          console.info("get ObjectLinkFirJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ObjectLinkFirJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ObjectLinkFirJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      router.back({
        url: "MainAbility/pages/index/index"
      });
    });

    /**
     * @tc.name   ObjectLinkFirJsunit_0100
     * @tc.number ObjectLinkFirJsunit_0100
     * @tc.desc   ObjectLinkFirJsunit_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectLinkFirJsunit_0100', Level.LEVEL0, async (done: Function) => {

      console.info('ObjectLinkFirJsunit_0100 START');
      let strJson = getInspectorByKey('fir_state');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ObjectLinkFirJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkFirJsunit_0100] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("5");
      console.info('[ObjectLinkFirJsunit_0100] END');
      done();
    });

    /**
     * @tc.name   ObjectLinkFirJsunit_0200
     * @tc.number ObjectLinkFirJsunit_0200
     * @tc.desc   ObjectLinkFirJsunit_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectLinkFirJsunit_0200', Level.LEVEL0, async (done: Function) => {

      console.info('ObjectLinkFirJsunit_0200 START');
      let strJson = getInspectorByKey('fir_provide');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ObjectLinkFirJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkFirJsunit_0200] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("5");
      console.info('[ObjectLinkFirJsunit_0200] END');
      done();
    });


    /**
     * @tc.name   ObjectLinkFirJsunit_0300
     * @tc.number ObjectLinkFirJsunit_0300
     * @tc.desc   ObjectLinkFirJsunit_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectLinkFirJsunit_0300', Level.LEVEL0, async (done: Function) => {

      console.info('ObjectLinkFirJsunit_0300 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('btn_state1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('fir_state');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ObjectLinkFirJsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkFirJsunit_0300] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("6");

      console.info('[ObjectLinkFirJsunit_0300] END');
      done();
    });

    /**
     * @tc.name   ObjectLinkFirJsunit_0400
     * @tc.number ObjectLinkFirJsunit_0400
     * @tc.desc   ObjectLinkFirJsunit_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectLinkFirJsunit_0400', Level.LEVEL0, async (done: Function) => {

      console.info('ObjectLinkFirJsunit_0400 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('btn_provide1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('fir_provide');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ObjectLinkFirJsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkFirJsunit_0400] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("6");

      console.info('[ObjectLinkFirJsunit_0400] END');
      done();
    });
  })
}

