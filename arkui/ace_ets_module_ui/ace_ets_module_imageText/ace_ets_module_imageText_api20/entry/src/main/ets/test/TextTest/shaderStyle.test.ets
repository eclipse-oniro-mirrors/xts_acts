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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium'
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function shaderStyleTest() {
  describe('shaderStyleTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/shaderStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get shaderStyleTest state pages: ' + JSON.stringify(pages));
        if (!('shaderStyle' == pages.name)) {
          console.info('get shaderStyleTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push shaderStyleTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push shaderStyleTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ShaderStyleTest after each called');
    });

    /**
     * @tc.number    shaderStyleTest_0010
     * @tc.name      shaderStyleTest_0010
     * @tc.desc      test Text shaderStyle
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('shaderStyleTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('[shaderStyleTest_0010] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text');
      let obj: ESObject = JSON.parse(strJson);

      console.info('[shaderStyleTest_0010] shaderStyle is: ' + JSON.stringify(obj.$attrs.shaderStyle));
      expect(JSON.stringify(obj.$attrs.shaderStyle)).assertEqual('{"direction":"GradientDirection.Right","colors":[["#FFFF0000","0.000000"],["#FFFFFF00","0.200000"],["#FF0000FF","0.500000"]],"repeating":"true"}');

      console.info('[shaderStyleTest_0010] END');
      done();
    });
  })
}