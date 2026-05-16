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

export default function IgnoreLayoutSafeAreaNullUndefinedTest() {
  describe('IgnoreLayoutSafeAreaNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("IgnoreLayoutSafeAreaNullUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonAttrs/IgnoreLayoutSafeAreaNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get IgnoreLayoutSafeAreaNullUndefined state success " + JSON.stringify(pages));
        if (!("IgnoreLayoutSafeAreaNullUndefined" == pages.name)) {
          console.info("get IgnoreLayoutSafeAreaNullUndefined state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push IgnoreLayoutSafeAreaNullUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push IgnoreLayoutSafeAreaNullUndefined page error: " + err);
      }
      done()
    });

    /**
     * @tc.name   IgnoreLayoutSafeAreaNullUndefinedTest_0100
     * @tc.number IgnoreLayoutSafeAreaNullUndefinedTest_0100
     * @tc.desc   test ignoreLayoutSafeArea with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IgnoreLayoutSafeAreaNullUndefinedTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('IgnoreLayoutSafeAreaNullUndefinedTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
  
      let btn = await driver.findComponent(ON.id('IgnoreLayoutSafeAreaNullUndefinedTest_null_1'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('IgnoreLayoutSafeAreaNullUndefinedTest_row');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[IgnoreLayoutSafeAreaNullUndefinedTest_0100] obj.$type:' + obj.$type);
      expect(obj.$type).assertEqual('Row');

      btn = await driver.findComponent(ON.id('IgnoreLayoutSafeAreaNullUndefinedTest_null_2'));
      await btn.click();
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('IgnoreLayoutSafeAreaNullUndefinedTest_row');
      obj = JSON.parse(strJson);
      console.info('[IgnoreLayoutSafeAreaNullUndefinedTest_0100] obj.$type:' + obj.$type);
      expect(obj.$type).assertEqual('Row');

      console.info('IgnoreLayoutSafeAreaNullUndefinedTest_0100 END');
      done();
    });

    /**
     * @tc.name   IgnoreLayoutSafeAreaNullUndefinedTest_0200
     * @tc.number IgnoreLayoutSafeAreaNullUndefinedTest_0200
     * @tc.desc   test ignoreLayoutSafeArea with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IgnoreLayoutSafeAreaNullUndefinedTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('IgnoreLayoutSafeAreaNullUndefinedTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
  
      let btn = await driver.findComponent(ON.id('IgnoreLayoutSafeAreaNullUndefinedTest_undefined_1'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('IgnoreLayoutSafeAreaNullUndefinedTest_row');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[IgnoreLayoutSafeAreaNullUndefinedTest_0200] obj.$type:' + obj.$type);
      expect(obj.$type).assertEqual('Row');

      btn = await driver.findComponent(ON.id('IgnoreLayoutSafeAreaNullUndefinedTest_undefined_2'));
      await btn.click();
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('IgnoreLayoutSafeAreaNullUndefinedTest_row');
      obj = JSON.parse(strJson);
      console.info('[IgnoreLayoutSafeAreaNullUndefinedTest_0200] obj.$type:' + obj.$type);
      expect(obj.$type).assertEqual('Row');

      console.info('IgnoreLayoutSafeAreaNullUndefinedTest_0200 END');
      done();
    });

    /**
     * @tc.name   IgnoreLayoutSafeAreaNullUndefinedTest_0300
     * @tc.number IgnoreLayoutSafeAreaNullUndefinedTest_0300
     * @tc.desc   test ignoreLayoutSafeArea with empty array parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IgnoreLayoutSafeAreaNullUndefinedTest_0300', Level.LEVEL1, async (done: Function) => {
      console.info('IgnoreLayoutSafeAreaNullUndefinedTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
  
      let btn = await driver.findComponent(ON.id('IgnoreLayoutSafeAreaNullUndefinedTest_empty_1'));
      await btn.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('IgnoreLayoutSafeAreaNullUndefinedTest_row');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[IgnoreLayoutSafeAreaNullUndefinedTest_0300] obj.$type:' + obj.$type);
      expect(obj.$type).assertEqual('Row');

      btn = await driver.findComponent(ON.id('IgnoreLayoutSafeAreaNullUndefinedTest_empty_2'));
      await btn.click();
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('IgnoreLayoutSafeAreaNullUndefinedTest_row');
      obj = JSON.parse(strJson);
      console.info('[IgnoreLayoutSafeAreaNullUndefinedTest_0300] obj.$type:' + obj.$type);
      expect(obj.$type).assertEqual('Row');

      console.info('IgnoreLayoutSafeAreaNullUndefinedTest_0300 END');
      done();
    });
  })
}

