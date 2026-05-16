/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import { describe, Size, beforeEach, afterEach, TestType, it, expect, Level } from '@ohos/hypium';
import CommonFunc from '../../MainAbility/common/Common';
import { Driver, ON } from '@kit.TestKit';

const SLEEP_TIME = 1000;

export default function ImageReloadKeyTest() {
  describe('ImageReloadKeyTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ImageReloadKeyTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageReloadKey/ImageReloadKeyTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ImageReloadKeyTest state success ' + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!('ImageReloadKeyTest' == pages.name)) {
          console.info('get ImageReloadKeyTest state success ' + JSON.stringify(pages.name));
          await CommonFunc.sleep(SLEEP_TIME);
          console.info('push ImageReloadKeyTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ImageReloadKeyTest page error: ' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ImageReloadKeyTest after each called');
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_RELOAD_PARAM_0100
     * @tc.name ImageReloadKeyTest_0100
     * @tc.desc test reloadKey with string type
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ImageReloadKeyTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('ImageReloadKeyTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageReloadKeyDefaultId');
      console.info("[ImageReloadKeyTest_0100] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[ImageReloadKeyTest_0100] default is: " + JSON.parse(strJson1).$attrs.reloadKey);

      let strJson2 = getInspectorByKey('imageReloadKeyStringId');
      console.info("[ImageReloadKeyTest_0100] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[ImageReloadKeyTest_0100] string is: " + JSON.parse(strJson2).$attrs.reloadKey);

      expect(JSON.parse(strJson2).$attrs.reloadKey)
        .assertContain('key1');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_RELOAD_PARAM_0200
     * @tc.name ImageReloadKeyTest_0200
     * @tc.desc test reloadKey with empty string
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ImageReloadKeyTest_0200', Level.LEVEL2, async (done: Function) => {
      console.info('ImageReloadKeyTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageReloadKeyDefaultId');
      console.info("[ImageReloadKeyTest_0200] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[ImageReloadKeyTest_0200] default is: " + JSON.parse(strJson1).$attrs.reloadKey);

      let strJson2 = getInspectorByKey('imageReloadKeyEmptyStringId');
      console.info("[ImageReloadKeyTest_0200] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[ImageReloadKeyTest_0200] empty string is: " + JSON.parse(strJson2).$attrs.reloadKey);

      expect(JSON.parse(strJson1).$attrs.reloadKey)
        .assertEqual(JSON.parse(strJson2).$attrs.reloadKey);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_RELOAD_PARAM_0300
     * @tc.name ImageReloadKeyTest_0300
     * @tc.desc test reloadKey with undefined
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ImageReloadKeyTest_0300', Level.LEVEL2, async (done: Function) => {
      console.info('ImageReloadKeyTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageReloadKeyDefaultId');
      console.info("[ImageReloadKeyTest_0300] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[ImageReloadKeyTest_0300] default is: " + JSON.parse(strJson1).$attrs.reloadKey);

      let strJson2 = getInspectorByKey('imageReloadKeyUndefinedId');
      console.info("[ImageReloadKeyTest_0300] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[ImageReloadKeyTest_0300] undefined is: " + JSON.parse(strJson2).$attrs.reloadKey);

      expect(JSON.parse(strJson1).$attrs.reloadKey)
        .assertEqual(JSON.parse(strJson2).$attrs.reloadKey);
      done();
    });

    /**
     * @tc.number SUB_ARKUI_IMAGE_RELOAD_PARAM_0400
     * @tc.name ImageReloadKeyTest_0400
     * @tc.desc test reloadKey with null
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ImageReloadKeyTest_0400', Level.LEVEL2, async (done: Function) => {
      console.info('ImageReloadKeyTest_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageReloadKeyDefaultId');
      console.info("[ImageReloadKeyTest_0400] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[ImageReloadKeyTest_0400] default is: " + JSON.parse(strJson1).$attrs.reloadKey);

      let strJson2 = getInspectorByKey('imageReloadKeyNullId');
      console.info("[ImageReloadKeyTest_0400] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[ImageReloadKeyTest_0400] null is: " + JSON.parse(strJson2).$attrs.reloadKey);

      expect(JSON.parse(strJson1).$attrs.reloadKey)
        .assertEqual(JSON.parse(strJson2).$attrs.reloadKey);
      done();
    });
  })
}