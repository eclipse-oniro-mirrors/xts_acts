/*
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

import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { Driver, ON, Component } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';
import CommonFunc from "../../MainAbility/common/Common"

export default function selectDividerTest() {
  console.info('selectDividerTest beforeEach start');
  describe('selectDividerTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/selectDivider/selectDividerTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get selectDividerTest state success ' + JSON.stringify(pages));
        if (!('selectDividerTest' == pages.name)) {
          console.info('get selectDividerTest state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(5000);
          console.info('push selectDividerTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push selectDividerTest page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   selectDividerTest_001
     * @tc.number selectDividerTest_001
     * @tc.desc   set selectDividerTest mode:1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('selectDividerTest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('selectDividerTest_001 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('selectmode'));
      await button.click();
      await Utils.sleep(1000);
      
      let strJson = getInspectorByKey('selectmode');
      let obj: ESObject = JSON.parse(strJson);
      console.info("selectDividerTest_001 obj is: " + JSON.stringify(obj));
      console.info("[selectDividerTest_001] obj: " + JSON.stringify(obj.$attrs));
      console.info("[selectDividerTest_001] divider: " + JSON.stringify(obj.$attrs.divider));
      console.info("[selectDividerTest_001] DividerMode: " +JSON.parse(obj.$attrs.divider).dividerMode);
      expect(JSON.parse(obj.$attrs.divider).dividerMode).assertEqual("FLOATING_ABOVE_MENU");
      await Utils.sleep(1000);
      await driver.click(Math.round(globalThis.winLeft+20), Math.round(globalThis.winTop+200));
      await Utils.sleep(1000);
      console.info('selectDividerTest_001 END');
      done();
    });
    
    /**
     * @tc.name   selectDividerTest_002
     * @tc.number selectDividerTest_002
     * @tc.desc   set selectDividerTest mode:1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('selectDividerTest_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('selectDividerTest_002 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('selectmode1'));
      await button.click();
      await Utils.sleep(1000);
      
      let strJson = getInspectorByKey('selectmode1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("selectDividerTest_002 obj is: " + JSON.stringify(obj));
      console.info("[selectDividerTest_002] obj: " + JSON.stringify(obj.$attrs));
      console.info("[selectDividerTest_002] divider: " + JSON.stringify(obj.$attrs.divider));
      console.info("[selectDividerTest_002] DividerMode: " +JSON.parse(obj.$attrs.divider).dividerMode);
      expect(JSON.parse(obj.$attrs.divider).dividerMode).assertEqual("EMBEDDED_IN_MENU");
      await Utils.sleep(1000);
      console.info('selectDividerTest_002 END');
      done();
    });
  }
)
}
