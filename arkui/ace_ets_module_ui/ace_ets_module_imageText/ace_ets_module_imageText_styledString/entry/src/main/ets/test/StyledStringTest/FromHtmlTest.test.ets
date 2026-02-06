/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeEach, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function FromHtmlTest() {
  describe('FromHtmlTest', () => {
    beforeEach(async (done: Function) => {
      console.info("FromHtmlTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/FromHtml',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get fromHtmlTest state pages: " + JSON.stringify(pages));
        if (!("FromHtml" == pages.name)) {
          console.info("get fromHtmlTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push fromHtmlTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push fromHtmlTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   fromHtmlTest_0010
     * @tc.number fromHtmlTest_0010
     * @tc.desc   test the function of fromHtml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('fromHtmlTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[fromHtmlTest_0010] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('buttonAddStyleStringFromHtml'));
      await button1.click();      // add styleString
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('TextContentFromHtml');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[fromHtmlTest_0010] value: ' + JSON.stringify(obj1.$attrs.content));
      let button2 = await driver.findComponent(ON.id('button_toHtml'));
      await button2.click();      // toHtml
      await CommonFunc.sleep(1000);
      let button3 = await driver.findComponent(ON.id('button_fromHtml'));
      await button3.click();      // fromHtml
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('TextContentFromHtml');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[fromHtmlTest_0010] value: ' + JSON.stringify(obj2.$attrs.content));
      expect(obj1.$attrs.content).assertEqual(obj2.$attrs.content);
      console.info('[fromHtmlTest_0010] END');
      done();
    });

    /**
     * @tc.name   fromHtmlTest_0020
     * @tc.number fromHtmlTest_0020
     * @tc.desc   test the function of fromHtmlErrorCode 170001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('fromHtmlTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[fromHtmlTest_0020] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let errorButton170001 = await driver.findComponent(ON.id('button_fromHtml_170001'));
      await errorButton170001.click();     
      await CommonFunc.sleep(1000);
      expect(AppStorage.Get('fromHtmlErrorCode170001')+'').assertEqual('170001');
      AppStorage.delete('fromHtmlErrorCode170001')
      console.info('[fromHtmlTest_0020] END');
      done();
    });

    /**
     * @tc.name   fromHtmlTest_0030
     * @tc.number fromHtmlTest_0030
     * @tc.desc   test the function of fromHtmlErrorCode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('fromHtmlTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[fromHtmlTest_0030] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let errorButton401 = await driver.findComponent(ON.id('button_fromHtml_401'));
      await errorButton401.click();     
      await CommonFunc.sleep(1000);
      expect(AppStorage.Get('fromHtmlErrorCode401')+'').assertEqual('401');
      AppStorage.delete('fromHtmlErrorCode401')
      console.info('[fromHtmlTest_0030] END');
      done();
    });
  })
}