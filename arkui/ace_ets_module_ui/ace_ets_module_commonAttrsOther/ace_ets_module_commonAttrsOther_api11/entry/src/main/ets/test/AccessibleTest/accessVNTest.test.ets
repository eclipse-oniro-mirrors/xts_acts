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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
export default function accessVnTest() {
  describe('accessVnTest', () => {
    beforeEach(async (done: Function) => {
      console.info("accessVnTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Accessible/accessVN',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get accessVnTest state pages: " + JSON.stringify(pages));
        if (!("accessVN" == pages.name)) {
          console.info("get accessVnTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push accessVnTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push accessVnTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   accessVnTest_0100
     * @tc.number accessVnTest
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('accessVnTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('accessVnTest_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('accessVn_1');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Row');
      console.info('[accessVnTest_0100] END');
      done();
    });
  })
}

