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

export default function ExpandSafeAreaNullUndefinedTest() {
  describe('ExpandSafeAreaNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("ExpandSafeAreaNullUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonAttrs/ExpandSafeAreaNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ExpandSafeAreaNullUndefined state success " + JSON.stringify(pages));
        if (!("ExpandSafeAreaNullUndefined" == pages.name)) {
          console.info("get ExpandSafeAreaNullUndefined state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ExpandSafeAreaNullUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ExpandSafeAreaNullUndefined page error: " + err);
      }
      done()
    });

    /**
     * @tc.name   ExpandSafeAreaNullUndefinedTest_0100
     * @tc.number ExpandSafeAreaNullUndefinedTest_0100
     * @tc.desc   test expandSafeArea with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpandSafeAreaNullUndefinedTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ExpandSafeAreaNullUndefinedTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
  
      let btn = await driver.findComponent(ON.id('ExpandSafeAreaNullUndefinedTest_null_1'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('ExpandSafeAreaNullUndefinedTest_stack');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[ExpandSafeAreaNullUndefinedTest_0100] obj.$type:' + obj.$type);
      expect(obj.$type).assertEqual('Stack');

      btn = await driver.findComponent(ON.id('ExpandSafeAreaNullUndefinedTest_null_2'));
      await btn.click();
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('ExpandSafeAreaNullUndefinedTest_stack');
      obj = JSON.parse(strJson);
      console.info('[ExpandSafeAreaNullUndefinedTest_0100] obj.$type:' + obj.$type);
      expect(obj.$type).assertEqual('Stack');

      console.info('ExpandSafeAreaNullUndefinedTest_0100 END');
      done();
    });

    /**
     * @tc.name   ExpandSafeAreaNullUndefinedTest_0200
     * @tc.number ExpandSafeAreaNullUndefinedTest_0200
     * @tc.desc   test expandSafeArea with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpandSafeAreaNullUndefinedTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('ExpandSafeAreaNullUndefinedTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
  
      let btn = await driver.findComponent(ON.id('ExpandSafeAreaNullUndefinedTest_undefined_1'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('ExpandSafeAreaNullUndefinedTest_stack');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[ExpandSafeAreaNullUndefinedTest_0200] obj.$type:' + obj.$type);
      expect(obj.$type).assertEqual('Stack');

      btn = await driver.findComponent(ON.id('ExpandSafeAreaNullUndefinedTest_undefined_2'));
      await btn.click();
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('ExpandSafeAreaNullUndefinedTest_stack');
      obj = JSON.parse(strJson);
      console.info('[ExpandSafeAreaNullUndefinedTest_0200] obj.$type:' + obj.$type);
      expect(obj.$type).assertEqual('Stack');

      console.info('ExpandSafeAreaNullUndefinedTest_0200 END');
      done();
    });

    /**
     * @tc.name   ExpandSafeAreaNullUndefinedTest_0300
     * @tc.number ExpandSafeAreaNullUndefinedTest_0300
     * @tc.desc   test expandSafeArea with empty array parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpandSafeAreaNullUndefinedTest_0300', Level.LEVEL1, async (done: Function) => {
      console.info('ExpandSafeAreaNullUndefinedTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
  
      let btn = await driver.findComponent(ON.id('ExpandSafeAreaNullUndefinedTest_empty_1'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('ExpandSafeAreaNullUndefinedTest_stack');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[ExpandSafeAreaNullUndefinedTest_0300] obj.$type:' + obj.$type);
      expect(obj.$type).assertEqual('Stack');

      btn = await driver.findComponent(ON.id('ExpandSafeAreaNullUndefinedTest_empty_2'));
      await btn.click();
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('ExpandSafeAreaNullUndefinedTest_stack');
      obj = JSON.parse(strJson);
      console.info('[ExpandSafeAreaNullUndefinedTest_0300] obj.$type:' + obj.$type);
      expect(obj.$type).assertEqual('Stack');

      console.info('ExpandSafeAreaNullUndefinedTest_0300 END');
      done();
    });
  })
}

