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

export default function GetFrameNodeByIdTest() {
  describe('GetFrameNodeByIdTest', () => {
    beforeAll(async (done: Function) => {
      console.info('GetFrameNodeByIdTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/frameNode/GetFrameNodeById',
      }
      try {
        router.clear();
        let pages = router.getState();
        let result = await router.replaceUrl(options);
        console.info('get GetFrameNodeByIdTest state pages:' + JSON.stringify(pages));
        if (!('GetFrameNodeById' == pages.name)) {
          console.info('get GetFrameNodeByIdTest pages.name:' + JSON.stringify(pages.name));
          await CommonFunc.sleep(1000);
          console.info('push GetFrameNodeByIdTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push GetFrameNodeByIdTest page error:' + err);
      }
      console.info('GetFrameNodeByIdTest beforeEach end');
      done();
    });

    /**
     * @tc.name   GetFrameNodeByIdTest_0100
     * @tc.number SUB_ARKUI_FRAMENODE_GETFRAMENODEBYID_0100
     * @tc.desc   Test FrameNode.getFrameNodeById with existing node id and verify property change
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('GetFrameNodeByIdTest_0100', Level.LEVEL0, async () => {
      console.info('[GetFrameNodeByIdTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('GetFrameNodeById_testNode');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('GetFrameNodeByIdTest_0100 obj backgroundColor:' + obj.$attrs.backgroundColor);
      expect(obj.$attrs.backgroundColor).assertEqual('#FFFFFF00');

      console.info('GetFrameNodeByIdTest_0100 click GetFrameNodeById_testValidButton');
      let button = await driver.findComponent(ON.id('GetFrameNodeById_testValidButton'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJsonAfter = getInspectorByKey('GetFrameNodeById_testNode');
      let objAfter: Record<string, ESObject> = JSON.parse(strJsonAfter);
      console.info('GetFrameNodeByIdTest_0100 objAfter backgroundColor:' + objAfter.$attrs.backgroundColor);
      expect(objAfter.$attrs.backgroundColor).assertEqual('#FF2787D9');

      console.info('[GetFrameNodeByIdTest_0100] END');
    })

    /**
      * @tc.name   GetFrameNodeByIdTest_0200
      * @tc.number SUB_ARKUI_FRAMENODE_GETFRAMENODEBYID_0200
      * @tc.desc   Test FrameNode.getFrameNodeById with duplicate node id returns first match
      * @tc.type   FUNCTION
      * @tc.size   SMALLTEST
      * @tc.level  LEVEL0
      */
    it('GetFrameNodeByIdTest_0200', Level.LEVEL0, async () => {
      console.info('[GetFrameNodeByIdTest_0200] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      console.info('GetFrameNodeByIdTest_0200 click GetFrameNodeById_testDuplicateNodeButton');
      let button = await driver.findComponent(ON.id('GetFrameNodeById_testDuplicateNodeButton'));
      await button.click();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('getFrameNodeByIdDuplicateResult')).not().assertNull();
      AppStorage.delete('getFrameNodeByIdDuplicateResult');

      let strJson = getInspectorByKey('GetFrameNodeById_duplicateNode');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.content).assertEqual('Duplicate Node 1');

      console.info("[GetFrameNodeByIdTest_0200] obj width is: " + obj.$attrs.width);
      console.info("[GetFrameNodeByIdTest_0200] obj height is: " + obj.$attrs.height);
      expect(obj.$attrs.width).assertEqual('150.00vp');
      expect(obj.$attrs.height).assertEqual('60.00vp');

      console.info('[GetFrameNodeByIdTest_0200] END');
    })

    /**
      * @tc.name   GetFrameNodeByIdTest_0300
      * @tc.number SUB_ARKUI_FRAMENODE_GETFRAMENODEBYID_0300
      * @tc.desc   Test FrameNode.getFrameNodeById with empty string returns null
      * @tc.type   FUNCTION
      * @tc.size   SMALLTEST
      * @tc.level  LEVEL0
      */
    it('GetFrameNodeByIdTest_0300', Level.LEVEL0, async () => {
      console.info('[GetFrameNodeByIdTest_0300] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      console.info('GetFrameNodeByIdTest_0300 click GetFrameNodeById_testEmptyStringButton');
      let button = await driver.findComponent(ON.id('GetFrameNodeById_testEmptyStringButton'));
      await button.click();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('getFrameNodeByIdEmptyStringResult')).assertNull();
      AppStorage.delete('getFrameNodeByIdEmptyStringResult');

      console.info('[GetFrameNodeByIdTest_0300] END');
    })

    /**
      * @tc.name   GetFrameNodeByIdTest_0400
      * @tc.number SUB_ARKUI_FRAMENODE_GETFRAMENODEBYID_0400
      * @tc.desc   Test FrameNode.getFrameNodeById with null returns null
      * @tc.type   FUNCTION
      * @tc.size   SMALLTEST
      * @tc.level  LEVEL0
      */
    it('GetFrameNodeByIdTest_0400', Level.LEVEL0, async () => {
      console.info('[GetFrameNodeByIdTest_0400] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      console.info('GetFrameNodeByIdTest_0400 click GetFrameNodeById_testNullButton');
      let button = await driver.findComponent(ON.id('GetFrameNodeById_testNullButton'));
      await button.click();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('getFrameNodeByIdNullResult')).assertNull();
      AppStorage.delete('getFrameNodeByIdNullResult');

      console.info('[GetFrameNodeByIdTest_0400] END');
    })

    /**
      * @tc.name   GetFrameNodeByIdTest_0500
      * @tc.number SUB_ARKUI_FRAMENODE_GETFRAMENODEBYID_0500
      * @tc.desc   Test FrameNode.getFrameNodeById with undefined returns null
      * @tc.type   FUNCTION
      * @tc.size   SMALLTEST
      * @tc.level  LEVEL0
      */
    it('GetFrameNodeByIdTest_0500', Level.LEVEL0, async () => {
      console.info('[GetFrameNodeByIdTest_0500] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      console.info('GetFrameNodeByIdTest_0500 click GetFrameNodeById_testUndefinedButton');
      let button = await driver.findComponent(ON.id('GetFrameNodeById_testUndefinedButton'));
      await button.click();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('getFrameNodeByIdUndefinedResult')).assertNull();
      AppStorage.delete('getFrameNodeByIdUndefinedResult');

      console.info('[GetFrameNodeByIdTest_0500] END');
    })

    /**
      * @tc.name   GetFrameNodeByIdTest_0600
      * @tc.number SUB_ARKUI_FRAMENODE_GETFRAMENODEBYID_0600
      * @tc.desc   Test FrameNode.getFrameNodeById with non-existent node id returns null
      * @tc.type   FUNCTION
      * @tc.size   SMALLTEST
      * @tc.level  LEVEL0
      */
    it('GetFrameNodeByIdTest_0600', Level.LEVEL0, async () => {
      console.info('[GetFrameNodeByIdTest_0600] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      console.info('GetFrameNodeByIdTest_0600 click GetFrameNodeById_testNonExistentNodeButton');
      let button = await driver.findComponent(ON.id('GetFrameNodeById_testNonExistentNodeButton'));
      await button.click();
      await CommonFunc.sleep(1000);

      expect(AppStorage.get('getFrameNodeByIdNonExistentResult')).assertNull();
      AppStorage.delete('getFrameNodeByIdNonExistentResult');

      console.info('[GetFrameNodeByIdTest_0600] END');
    })
  })
}
