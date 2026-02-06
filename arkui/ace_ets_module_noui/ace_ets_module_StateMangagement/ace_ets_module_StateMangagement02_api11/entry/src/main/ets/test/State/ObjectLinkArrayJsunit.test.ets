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


export default function ObjectLinkArrayJsunit() {
  describe('ObjectLinkArrayJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("ObjectLinkArrayJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/ObjectLinkArray',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ObjectLinkArrayJsunit state pages: " + JSON.stringify(pages));
        if (!("ObjectLinkArray" == pages.name)) {
          console.info("get ObjectLinkArrayJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ObjectLinkArrayJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ObjectLinkArrayJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('arrViewB_reset'));
      await button.click();
      console.log('reset button click succ')
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   ObjectLinkArrayJsunit_0100
     * @tc.number ObjectLinkArrayJsunit_0100
     * @tc.desc   ObjectLinkArrayJsunit_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectLinkArrayJsunit_0100', Level.LEVEL0, async (done: Function) => {

      console.info('ObjectLinkArrayJsunit_0100 START');
      let strJson = getInspectorByKey('view_arrObl');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ObjectLinkArrayJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkArrayJsunit_0100] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('hello: [{"num":5,"id":0},{"num":6,"id":1}]');
      console.info('[ObjectLinkArrayJsunit_0100] END');
      done();
    });

    /**
     * @tc.name   ObjectLinkArrayJsunit_0200
     * @tc.number ObjectLinkArrayJsunit_0200
     * @tc.desc   ObjectLinkArrayJsunit_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectLinkArrayJsunit_0200', Level.LEVEL0, async (done: Function) => {

      console.info('ObjectLinkArrayJsunit_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('change_ArrObl'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('view_arrObl');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ObjectLinkArrayJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkArrayJsunit_0200] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('hello: [{"num":8,"id":2},{"num":6,"id":1}]');
      console.info('[ObjectLinkArrayJsunit_0200] END');
      done();
    });

    /**
     * @tc.name   ObjectLinkArrayJsunit_0300
     * @tc.number ObjectLinkArrayJsunit_0300
     * @tc.desc   ObjectLinkArrayJsunit_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectLinkArrayJsunit_0300', Level.LEVEL0, async (done: Function) => {

      console.info('ObjectLinkArrayJsunit_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('add_ArrObl'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('view_arrObl');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ObjectLinkArrayJsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkArrayJsunit_0300] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('hello: [{"num":5,"id":0},{"num":6,"id":1},{"num":7,"id":2}]');
      console.info('[ObjectLinkArrayJsunit_0300] END');
      done();
    });

    /**
     * @tc.name   ObjectLinkArrayJsunit_0400
     * @tc.number ObjectLinkArrayJsunit_0400
     * @tc.desc   ObjectLinkArrayJsunit_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectLinkArrayJsunit_0400', Level.LEVEL0, async (done: Function) => {

      console.info('ObjectLinkArrayJsunit_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('delete_Arr1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('view_arrObl');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ObjectLinkArrayJsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkArrayJsunit_0400] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('hello: [{"num":6,"id":1}]');
      console.info('[ObjectLinkArrayJsunit_0400] END');
      done();
    });

    /**
     * @tc.name   ObjectLinkArrayJsunit_0500
     * @tc.number ObjectLinkArrayJsunit_0500
     * @tc.desc   ObjectLinkArrayJsunit_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectLinkArrayJsunit_0500', Level.LEVEL0, async (done: Function) => {

      console.info('ObjectLinkArrayJsunit_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('delete_Arr2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('view_arrObl');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ObjectLinkArrayJsunit_0500] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkArrayJsunit_0500] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('hello: [{"num":5,"id":0}]');
      console.info('[ObjectLinkArrayJsunit_0500] END');
      done();
    });

    /**
     * @tc.name   ObjectLinkArrayJsunit_0600
     * @tc.number ObjectLinkArrayJsunit_0600
     * @tc.desc   ObjectLinkArrayJsunit_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ObjectLinkArrayJsunit_0600', Level.LEVEL0, async (done: Function) => {

      console.info('ObjectLinkArrayJsunit_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('reset_ArrObl'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('view_arrObl');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ObjectLinkArrayJsunit_0600] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkArrayJsunit_0600] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('hello: [{"num":5,"id":2},{"num":6,"id":3}]');
      console.info('[ObjectLinkArrayJsunit_0600] END');
      done();
    });
  })
}

