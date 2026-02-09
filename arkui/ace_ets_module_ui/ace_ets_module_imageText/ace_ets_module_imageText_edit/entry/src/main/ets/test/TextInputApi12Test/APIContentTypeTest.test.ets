/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, MouseButton, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function APIContentTypeTest() {
  describe('APIContentTypeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("APIContentTypeTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get APIContentTypeTest state pages:" + JSON.stringify(pages));
        if (!("APIContentType" == pages.name)) {
          console.info("get  APIContentTypeTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/TextInputApi12/APIContentType"})
          await CommonFunc.sleep(2000);
          console.info("push APIContentTypeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push APIContentTypeTest page error:" + err);
      }
      console.info("APIContentTypeTest foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("APIContentTypeTest after each called");
    });

    /**
     * @tc.name   APIContentTypeTest_001
     * @tc.number APIContentTypeTest_001
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('APIContentTypeTest_001',  Level.LEVEL3, async (done: Function) => {
      console.info('[APIContentTypeTest_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('APIContentTypeButton'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('APIContentTypeText');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[APIContentTypeTest_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('TextContentType.VISIBLE_PASSWORD');
      console.info('[APIContentTypeTest_001] END');
      done();
    });

    /**
     * @tc.name   APIContentTypeTest_0200
     * @tc.number SUB_ACE_TEXTINPUT_CONTENTTYPE_0200
     * @tc.desc   ContentType setting NICKNAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('APIContentTypeTest_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('APIContentTypeTest_0200 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('TypeButton_23'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('APIContentTypeText');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[APIContentTypeTest_0200] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('TextContentType.NICKNAME');
      console.info('[APIContentTypeTest_0200] END');
      done();
    });

    /**
     * @tc.name   APIContentTypeTest_0300
     * @tc.number SUB_ACE_TEXTINPUT_CONTENTTYPE_0300
     * @tc.desc   ContentType setting DETAIL_INFO_WITHOUT_STREET
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('APIContentTypeTest_0300',  Level.LEVEL3, async (done: Function) => {
      console.info('APIContentTypeTest_0300 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('TypeButton_24'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('APIContentTypeText');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[APIContentTypeTest_0300] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('TextContentType.DETAIL_INFO_WITHOUT_STREET');
      console.info('[APIContentTypeTest_0300] END');
      done();
    });

    /**
     * @tc.name   APIContentTypeTest_0400
     * @tc.number SUB_ACE_TEXTINPUT_CONTENTTYPE_0400
     * @tc.desc   ContentType setting FORMAT_ADDRESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('APIContentTypeTest_0400',  Level.LEVEL3, async (done: Function) => {
      console.info('APIContentTypeTest_0400 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('TypeButton_25'));
      await button1.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('APIContentTypeText');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[APIContentTypeTest_0400] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('TextContentType.FORMAT_ADDRESS');
      console.info('[APIContentTypeTest_0400] END');
      done();
    });
  })
}