/*
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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function allowedTypesTest() {

  describe('allowedTypesTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureHandler/allowedTypes',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get allowedTypes state pages: " + JSON.stringify(pages));
        if (!("allowedTypes" == pages.name)) {
          console.info("get allowedTypes state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push allowedTypes success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push allowedTypes page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("allowedTypes after each called");
    });

    /**
     * @tc.number    allowedTypes_0010
     * @tc.name      test the api of allowedTypes
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('allowedTypes_0010', Level.LEVEL0, async (done: Function) => {
      console.info('allowedTypes_0010 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('allowedTypes_button');
      let obj: ESObject = JSON.parse(strJson);
      expect(obj.$attrs.label).assertEqual('allowedTypes succ');
      console.info('[allowedTypes_0010] END');
      done();
    });
  })
}
