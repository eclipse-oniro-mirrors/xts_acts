/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function componentUtilsTest() {
  describe('componentUtilsTest', () => {
    beforeEach(async (done: Function) => {
      console.info('componentUtilsTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/componentUtils/ComponentUtilsTestPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get componentUtilsTest state pages: ' + JSON.stringify(pages));
        if (!('ComponentUtilsTestPage' == pages.name)) {
          console.info('get componentUtilsTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push componentUtilsTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push componentUtilsTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('componentUtilsTest afterEach called');
    });

    /**
     * @tc.name   ComponentUtils_get_rectangle_by_id_empty_001
     * @tc.number ComponentUtils_get_rectangle_by_id_empty_001
     * @tc.desc   Test getRectangleById with empty string id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ComponentUtils_get_rectangle_by_id_empty_001', Level.LEVEL2, async (done: Function) => {
      console.info('[ComponentUtils_get_rectangle_by_id_empty_001] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('btn_get_rectangle_by_id'));
      await button.click();
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('get_rectangle_by_id_empty'));
      expect(result).assertEqual('"success"');
      console.info('[ComponentUtils_get_rectangle_by_id_empty_001] END');
      done();
    });

    /**
     * @tc.name   ComponentUtils_get_rectangle_by_id_null_002
     * @tc.number ComponentUtils_get_rectangle_by_id_null_002
     * @tc.desc   Test getRectangleById with null id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ComponentUtils_get_rectangle_by_id_null_002', Level.LEVEL2, async (done: Function) => {
      console.info('[ComponentUtils_get_rectangle_by_id_null_002] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('btn_get_rectangle_by_id'));
      await button.click();
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('get_rectangle_by_id_null'));
      expect(result).assertEqual('"error"');
      console.info('[ComponentUtils_get_rectangle_by_id_null_002] END');
      done();
    });

    /**
     * @tc.name   ComponentUtils_get_rectangle_by_id_undefined_003
     * @tc.number ComponentUtils_get_rectangle_by_id_undefined_003
     * @tc.desc   Test getRectangleById with undefined id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ComponentUtils_get_rectangle_by_id_undefined_003', Level.LEVEL2, async (done: Function) => {
      console.info('[ComponentUtils_get_rectangle_by_id_undefined_003] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('btn_get_rectangle_by_id'));
      await button.click();
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('get_rectangle_by_id_undefined'));
      expect(result).assertEqual('"error"');
      console.info('[ComponentUtils_get_rectangle_by_id_undefined_003] END');
      done();
    });

    /**
     * @tc.name   ComponentUtils_get_rectangle_by_id_valid_004
     * @tc.number ComponentUtils_get_rectangle_by_id_valid_004
     * @tc.desc   Test getRectangleById with valid id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ComponentUtils_get_rectangle_by_id_valid_004', Level.LEVEL1, async (done: Function) => {
      console.info('[ComponentUtils_get_rectangle_by_id_valid_004] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('btn_get_rectangle_by_id'));
      await button.click();
      await CommonFunc.sleep(1000);
      let result = JSON.stringify(AppStorage.get('get_rectangle_by_id_valid'));
      expect(result).assertEqual('"success"');
      console.info('[ComponentUtils_get_rectangle_by_id_valid_004] END');
      done();
    });
  });
}
