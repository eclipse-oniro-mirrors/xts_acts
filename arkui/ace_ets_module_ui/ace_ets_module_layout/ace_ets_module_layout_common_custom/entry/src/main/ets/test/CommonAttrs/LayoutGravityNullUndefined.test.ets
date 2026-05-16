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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest'
import CommonFunc from '../../MainAbility/common/Common';

export default function LayoutGravityNullUndefinedTest() {
  describe('LayoutGravityNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("LayoutGravityNullUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonAttrs/LayoutGravityNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LayoutGravityNullUndefined state success " + JSON.stringify(pages));
        if (!("LayoutGravityNullUndefined" == pages.name)) {
          console.info("get LayoutGravityNullUndefined state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LayoutGravityNullUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LayoutGravityNullUndefined page error: " + err);
      }
      done()
    });

    /**
     * @tc.name   LayoutGravityNullUndefinedTest_0100
     * @tc.number LayoutGravityNullUndefinedTest_0100
     * @tc.desc   test layoutGravity with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LayoutGravityNullUndefinedTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('LayoutGravityNullUndefinedTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
  
      let btn = await driver.findComponent(ON.id('LayoutGravityNullUndefinedTest_btn_null'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('LayoutGravityNullUndefinedTest_text');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[LayoutGravityNullUndefinedTest_0100] obj.$attrs.layoutGravity:' + obj.$attrs.layoutGravity);
      expect(obj.$attrs.layoutGravity).assertEqual('Alignment.Center');
      console.info('LayoutGravityNullUndefinedTest_0100 END');
      done();
    });

    /**
     * @tc.name   LayoutGravityNullUndefinedTest_0200
     * @tc.number LayoutGravityNullUndefinedTest_0200
     * @tc.desc   test layoutGravity with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LayoutGravityNullUndefinedTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('LayoutGravityNullUndefinedTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
  
      let btn = await driver.findComponent(ON.id('LayoutGravityNullUndefinedTest_btn_undefined'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('LayoutGravityNullUndefinedTest_text');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[LayoutGravityNullUndefinedTest_0200] obj.$attrs.layoutGravity:' + obj.$attrs.layoutGravity);
      expect(obj.$attrs.layoutGravity).assertEqual('Alignment.Center');
      console.info('LayoutGravityNullUndefinedTest_0200 END');
      done();
    });

    /**
     * @tc.name   LayoutGravityNullUndefinedTest_0300
     * @tc.number LayoutGravityNullUndefinedTest_0300
     * @tc.desc   test layoutGravity with valid parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LayoutGravityNullUndefinedTest_0300', Level.LEVEL1, async (done: Function) => {
      console.info('LayoutGravityNullUndefinedTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
  
      let btn = await driver.findComponent(ON.id('LayoutGravityNullUndefinedTest_btn_valid'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('LayoutGravityNullUndefinedTest_text');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[LayoutGravityNullUndefinedTest_0300] obj.$attrs.layoutGravity:' + obj.$attrs.layoutGravity);
      expect(obj.$attrs.layoutGravity).assertEqual('Alignment.Top');
      console.info('LayoutGravityNullUndefinedTest_0300 END');
      done();
    });
  })
}

