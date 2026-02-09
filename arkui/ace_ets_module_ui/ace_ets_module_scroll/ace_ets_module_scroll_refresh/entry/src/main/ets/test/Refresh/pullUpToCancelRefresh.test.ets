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
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON, Component, Point} from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';
import CommonFunc from '../../MainAbility/common/Common';
const SLEEP_TIME = 500;


export default function pullUpToCancelRefreshTest() {
  describe('pullUpToCancelRefresh', () => {
    beforeEach(async (done: Function) => {
      console.info("pullUpToCancelRefresh beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Refresh/pullUpToCancelRefresh',
      }
      router.clear();
      let pages = router.getState();
      console.info("get pullUpToCancelRefreshTest state pages: " + JSON.stringify(pages));
      if (!("pullUpToCancelRefresh" == pages.name)) {
        console.info("get pullUpToCancelRefreshTest state pages.name: " + JSON.stringify(pages.name));
        let result = await router.push(options);
        console.info("push pullUpToCancelRefreshTest success: " + JSON.stringify(result));
      }
      done();
    });

    /**
     * @tc.number test_pullUpToCancelRefresh_001
     * @tc.name   test_pullUpToCancelRefresh_001
     * @tc.desc   Set the value to true and return true.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_pullUpToCancelRefresh_001', Level.LEVEL0, async (done: Function) => {
      let driver = Driver.create();
      let oriBtn = await driver.findComponent(ON.id('valueTrue'));
      await oriBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJsonNew = getInspectorByKey('noRefresh');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Refresh');
      expect(JSON.parse(strJsonNew).$attrs.pullUpToCancelRefresh).assertEqual(true);
      done();
    });

    /**
     * @tc.number test_pullUpToCancelRefresh_002
     * @tc.name   test_pullUpToCancelRefresh_002
     * @tc.desc   Set the value to false and return false.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_pullUpToCancelRefresh_002', Level.LEVEL0, async (done: Function) => {
      let driver = Driver.create();
      let oriBtn = await driver.findComponent(ON.id('valueFalse'));
      await oriBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJsonNew = getInspectorByKey('noRefresh');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Refresh');
      expect(JSON.parse(strJsonNew).$attrs.pullUpToCancelRefresh).assertEqual(false);
      done();
    });

    /**
     * @tc.number test_pullUpToCancelRefresh_003
     * @tc.name   test_pullUpToCancelRefresh_003
     * @tc.desc   Set the value to undefined and return true.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_pullUpToCancelRefresh_003', Level.LEVEL0, async (done: Function) => {
      let driver = Driver.create();
      let oriBtn = await driver.findComponent(ON.id('valueUnde'));
      await oriBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJsonNew = getInspectorByKey('noRefresh');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Refresh');
      expect(JSON.parse(strJsonNew).$attrs.pullUpToCancelRefresh).assertEqual(true);
      done();
    });

    /**
     * @tc.number test_pullUpToCancelRefresh_004
     * @tc.name   test_pullUpToCancelRefresh_004
     * @tc.desc   Set the value to null and return true.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('test_pullUpToCancelRefresh_004', Level.LEVEL0, async (done: Function) => {
      let driver = Driver.create();
      let oriBtn = await driver.findComponent(ON.id('valueNull'));
      await oriBtn.click();
      await CommonFunc.sleep(SLEEP_TIME);
      let strJsonNew = getInspectorByKey('noRefresh');
      let obj: Record<string, Object> = JSON.parse(strJsonNew);
      expect(obj.$type).assertEqual('Refresh');
      expect(JSON.parse(strJsonNew).$attrs.pullUpToCancelRefresh).assertEqual(true);
      done();
    });
  })
}