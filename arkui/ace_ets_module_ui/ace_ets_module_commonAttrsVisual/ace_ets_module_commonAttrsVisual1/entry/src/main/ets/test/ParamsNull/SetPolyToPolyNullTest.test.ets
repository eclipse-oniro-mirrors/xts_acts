/*
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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function SetPolyToPolyNullTest() {
  describe('SetPolyToPolyNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info('SetPolyToPolyNullTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ParamsNull/SetPolyToPolyNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get SetPolyToPolyNullTest state pages:' + JSON.stringify(pages));
        if (!('SetPolyToPolyNullTest' == pages.name)) {
          console.info('get SetPolyToPolyNullTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push SetPolyToPolyNullTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push SetPolyToPolyNullTest page error:' + err);
      }
      console.info('SetPolyToPolyNullTest beforeEach end');
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   SetPolyToPolyNullTest_0100
     * @tc.number SetPolyToPolyNullTest_0100
     * @tc.desc   setPolyToPoly null test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetPolyToPolyNullTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('SetPolyToPolyNullTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('btn_setPolyToPoly_null');
      let obj: ESObject = JSON.parse(strJson);
      let strJson1 = getInspectorByKey('btn_setPolyToPoly_undefined');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[SetPolyToPolyNullTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[SetPolyToPolyNullTest_0100] component obj1 is: " + JSON.stringify(obj1));
      expect(obj.$attrs.content).assertEqual('null')
      expect(obj1.$attrs.content).assertEqual('undefined')
      console.info('[SetPolyToPolyNullTest_0100] END');
      done();
    });
  })
}