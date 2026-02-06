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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium'
import router from '@ohos.router';
import { Component, Driver, ON } from '@kit.TestKit';
import CommonFunc from '../../MainAbility/common/Common';

export default function dismissSheetActionTest() {
  describe('dismissSheetActionTest', () => {
    beforeEach(async (done: Function) => {
      console.info('dismissSheetActionTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SheetType/dismissSheetAction',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get dismissSheetActionTest state pages: ' + JSON.stringify(pages));
        if (!('dismissSheetActionTest' == pages.name)) {
          console.info('get dismissSheetActionTest pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(5000);
          console.info("push dismissSheetActionTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push dismissSheetActionTest page error: ' + err);
      }
      done()
    });

    /**
     * @tc.name   dismissSheetActionTest_001
     * @tc.number dismissSheetActionTest_001
     * @tc.desc   Test the SheetTypeTest not null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('dismissSheetActionTest_001', TestType.Function | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('dismissSheetActionTest_001 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('dismissSheetAction'));
      await button.click();
      await CommonFunc.sleep(1000);

      let col = await driver.findComponent(ON.id('col'))
      let height = await  col.getBoundsCenter()
      console.info("[dismissSheetActionTest_001] height is: " + JSON.stringify(height));
      console.info("[dismissSheetActionTest_001] height.y is: " + Math.round(height.y));
      console.info("[dismissSheetActionTest_001] height.x is: " + Math.round(height.x));
      await driver.swipe(Math.round(height.x - 200),Math.round(height.y),Math.round(height.x + 300),Math.round(height.y));
      await CommonFunc.sleep(1000);

      let strJson1 : string = getInspectorByKey('DismissReason');
      console.info("[dismissSheetActionTest_001] DismissReason obj is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[dismissSheetActionTest_001] $attrs obj is: " + JSON.parse(strJson1).$attrs);
      console.info("[dismissSheetActionTest_001] content obj is: " + JSON.parse(strJson1).$attrs.content);

      if(JSON.parse(strJson1).$attrs.content){
        expect(JSON.parse(strJson1).$attrs.content).assertEqual('success');
      }else{
        expect(JSON.parse(strJson1).$attrs.content).assertEqual('');
        console.info('dismissSheetActionTest_001 ERR');
      }
      
      await CommonFunc.sleep(1000);
      console.info('dismissSheetActionTest_001 END');
      done();
    });
  })
}