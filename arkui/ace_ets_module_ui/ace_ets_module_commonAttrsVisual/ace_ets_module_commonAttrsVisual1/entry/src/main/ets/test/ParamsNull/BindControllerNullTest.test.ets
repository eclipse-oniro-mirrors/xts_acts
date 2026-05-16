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

export default function BindControllerNullTest() {
  describe('BindControllerNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info('BindControllerNullTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ParamsNull/BindControllerNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get BindControllerNullTest state pages:' + JSON.stringify(pages));
        if (!('BindControllerNullTest' == pages.name)) {
          console.info('get BindControllerNullTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push BindControllerNullTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push BindControllerNullTest page error:' + err);
      }
      console.info('BindControllerNullTest beforeEach end');
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   BindControllerNullTest_0100
     * @tc.number BindControllerNullTest_0100
     * @tc.desc   bindController null test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BindControllerNullTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('BindControllerNullTest_0100 START');
      let driver = await Driver.create()
      expect(AppStorage.get('bindController1Null')).assertEqual(100023);
      expect(AppStorage.get('bindController2Null')).assertEqual(100023);
      expect(AppStorage.get('bindController1Undefined')).assertEqual(100023);
      expect(AppStorage.get('bindController2Undefined')).assertEqual(100023);
      AppStorage.delete('bindController1Null');
      AppStorage.delete('bindController2Null');
      AppStorage.delete('bindController1Undefined');
      AppStorage.delete('bindController2Undefined');
      console.info('[BindControllerNullTest_0100] END');
      done();
    });

    /**
     * @tc.name   BindControllerNullTest_0200
     * @tc.number BindControllerNullTest_0200
     * @tc.desc   bindController null test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BindControllerNullTest_0200', Level.LEVEL2, async (done: Function) => {
      console.info('BindControllerNullTest_0200 START');
      let driver = await Driver.create()
      expect(RelateType.FILL).assertEqual(0);
      console.info('[BindControllerNullTest_0200] END');
      done();
    });
  })
}