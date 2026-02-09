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


export default function Storage37Jsunit() {
  describe('Storage37Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("Storage37Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/Storage37',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Storage37Jsunit state pages: " + JSON.stringify(pages));
        if (!("Storage37" == pages.name)) {
          console.info("get Storage37Jsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Storage37Jsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Storage37Jsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   Storage37Jsunit_0100
     * @tc.number Storage37Jsunit_0100
     * @tc.desc   Storage37Jsunit_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Storage37Jsunit_0100', Level.LEVEL0, async (done: Function) => {
      console.info('Storage37Jsunit_0100 START');
      let strJson = getInspectorByKey('text37_prop1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Storage37Jsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[Storage37Jsunit_0100] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("undefined");
      console.info('[Storage37Jsunit_0100] END');
      done();
    });

    /**
     * @tc.name   Storage37Jsunit_0200
     * @tc.number Storage37Jsunit_0200
     * @tc.desc   Storage37Jsunit_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Storage37Jsunit_0200', Level.LEVEL0, async (done: Function) => {
      console.info('Storage37Jsunit_0200 START');
      let strJson = getInspectorByKey('text37_link1Date');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Storage37Jsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[Storage37Jsunit_0200] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("0");
      console.info('[Storage37Jsunit_0200] END');
      done();
    });

    /**
     * @tc.name   Storage37Jsunit_0300
     * @tc.number Storage37Jsunit_0300
     * @tc.desc   Storage37Jsunit_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Storage37Jsunit_0300', Level.LEVEL0, async (done: Function) => {
      console.info('Storage37Jsunit_0300 START');
      let strJson = getInspectorByKey('text37_link1Date2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Storage37Jsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[Storage37Jsunit_0300] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("0");
      console.info('[Storage37Jsunit_0300] END');
      done();
    });

    /**
     * @tc.name   Storage37Jsunit_0400
     * @tc.number Storage37Jsunit_0400
     * @tc.desc   Storage37Jsunit_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Storage37Jsunit_0400', Level.LEVEL0, async (done: Function) => {
      console.info('Storage37Jsunit_0400 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('Storage37Btn'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text37_link1Date');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Storage37Jsunit_0400] component obj is: " + JSON.stringify(obj));
      console.info("[Storage37Jsunit_0400] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("122");
      console.info('[Storage37Jsunit_0400] END');
      done();
    });

    /**
     * @tc.name   Storage37Jsunit_0500
     * @tc.number Storage37Jsunit_0500
     * @tc.desc   Storage37Jsunit_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Storage37Jsunit_0500', Level.LEVEL0, async (done: Function) => {
      console.info('Storage37Jsunit_0500 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('Storage37Btn'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text37_link1Date2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Storage37Jsunit_0500] component obj is: " + JSON.stringify(obj));
      console.info("[Storage37Jsunit_0500] text: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("47");
      console.info('[Storage37Jsunit_0500] END');
      done();
    });
  })
}
