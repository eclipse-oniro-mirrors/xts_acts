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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function GetFrameNodeByUniqueIdTest() {
  describe('GetFrameNodeByUniqueIdTest', () => {
    beforeAll(async (done: Function) => {
      console.info('GetFrameNodeByUniqueIdTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/frameNode/GetFrameNodeByUniqueId',
      }
      try {
        router.clear();
        let pages = router.getState();
        let result = await router.replaceUrl(options);
        console.info('get GetFrameNodeByUniqueIdTest state pages:' + JSON.stringify(pages));
        if (!('GetFrameNodeByUniqueId' == pages.name)) {
          console.info('get GetFrameNodeByUniqueIdTest pages.name:' + JSON.stringify(pages.name));
          await CommonFunc.sleep(1000);
          console.info('push GetFrameNodeByUniqueIdTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push GetFrameNodeByUniqueIdTest page error:' + err);
      }
      console.info('GetFrameNodeByUniqueIdTest beforeEach end');
      done();
    });

    /**
     * @tc.name   GetFrameNodeByUniqueIdTest_0100
     * @tc.number SUB_ARKUI_FRAMENODE_GETFRAMENODEBYUNIQUEID_0100
     * @tc.desc   Test FrameNode.getFrameNodeByUniqueId with valid uniqueId and verify property change
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('GetFrameNodeByUniqueIdTest_0100', Level.LEVEL0, async () => {
      console.info('[GetFrameNodeByUniqueIdTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('GetFrameNodeByUniqueId_testNode');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('GetFrameNodeByUniqueIdTest_0100 obj backgroundColor:' + obj.$attrs.backgroundColor);
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFFF00');

      console.info('GetFrameNodeByUniqueIdTest_0100 click GetFrameNodeByUniqueId_testValidButton');
      let button = await driver.findComponent(ON.id('GetFrameNodeByUniqueId_testValidButton'));
      await button.click();
      await CommonFunc.sleep(1000);

      // return value is not null
      expect(AppStorage.get('getFrameNodeByUniqueIdValidResult')).not().assertNull();
      AppStorage.delete('getFrameNodeByUniqueIdValidResult');

      let strJsonAfter = getInspectorByKey('GetFrameNodeByUniqueId_testNode');
      let objAfter: Record<string, ESObject> = JSON.parse(strJsonAfter);
      console.info('GetFrameNodeByUniqueIdTest_0100 objAfter backgroundColor:' + objAfter.$attrs.backgroundColor);
      expect(objAfter.$attrs.backgroundColor).assertEqual('#FF2787D9');

      console.info('[GetFrameNodeByUniqueIdTest_0100] END');
    })

    /**
      * @tc.name   GetFrameNodeByUniqueIdTest_0200
      * @tc.number SUB_ARKUI_FRAMENODE_GETFRAMENODEBYUNIQUEID_0200
      * @tc.desc   Test FrameNode.getFrameNodeByUniqueId with non-existent uniqueId returns null
      * @tc.type   FUNCTION
      * @tc.size   SMALLTEST
      * @tc.level  LEVEL0
      */
    it('GetFrameNodeByUniqueIdTest_0200', Level.LEVEL0, async () => {
      console.info('[GetFrameNodeByUniqueIdTest_0200] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      console.info('GetFrameNodeByUniqueIdTest_0200 click GetFrameNodeByUniqueId_testNonExistentButton');
      let button = await driver.findComponent(ON.id('GetFrameNodeByUniqueId_testNonExistentButton'));
      await button.click();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('getFrameNodeByUniqueIdNonExistentResult')).assertNull();
      AppStorage.delete('getFrameNodeByUniqueIdNonExistentResult');

      console.info('[GetFrameNodeByUniqueIdTest_0200] END');
    })

    /**
      * @tc.name   GetFrameNodeByUniqueIdTest_0300
      * @tc.number SUB_ARKUI_FRAMENODE_GETFRAMENODEBYUNIQUEID_0300
      * @tc.desc   Test FrameNode.getFrameNodeByUniqueId with null returns null
      * @tc.type   FUNCTION
      * @tc.size   SMALLTEST
      * @tc.level  LEVEL0
      */
    it('GetFrameNodeByUniqueIdTest_0300', Level.LEVEL0, async () => {
      console.info('[GetFrameNodeByUniqueIdTest_0300] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      console.info('GetFrameNodeByUniqueIdTest_0300 click GetFrameNodeByUniqueId_testNullButton');
      let button = await driver.findComponent(ON.id('GetFrameNodeByUniqueId_testNullButton'));
      await button.click();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('getFrameNodeByUniqueIdNullResult')).assertNull();
      AppStorage.delete('getFrameNodeByUniqueIdNullResult');

      console.info('[GetFrameNodeByUniqueIdTest_0300] END');
    })

    /**
      * @tc.name   GetFrameNodeByUniqueIdTest_0400
      * @tc.number SUB_ARKUI_FRAMENODE_GETFRAMENODEBYUNIQUEID_0400
      * @tc.desc   Test FrameNode.getFrameNodeByUniqueId with undefined returns null
      * @tc.type   FUNCTION
      * @tc.size   SMALLTEST
      * @tc.level  LEVEL0
      */
    it('GetFrameNodeByUniqueIdTest_0400', Level.LEVEL0, async () => {
      console.info('[GetFrameNodeByUniqueIdTest_0400] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      console.info('GetFrameNodeByUniqueIdTest_0400 click GetFrameNodeByUniqueId_testUndefinedButton');
      let button = await driver.findComponent(ON.id('GetFrameNodeByUniqueId_testUndefinedButton'));
      await button.click();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('getFrameNodeByUniqueIdUndefinedResult')).assertNull();
      AppStorage.delete('getFrameNodeByUniqueIdUndefinedResult');

      console.info('[GetFrameNodeByUniqueIdTest_0400] END');
    })
  })
}
