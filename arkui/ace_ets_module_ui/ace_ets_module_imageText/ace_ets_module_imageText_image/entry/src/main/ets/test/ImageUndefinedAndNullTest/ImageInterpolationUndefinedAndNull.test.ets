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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function ImageInterpolationUndefinedAndNullTest() {
  describe('ImageInterpolationUndefinedAndNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ImageInterpolationUndefinedAndNullTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageUndefinedAndNull/ImageInterpolationUndefinedAndNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ImageInterpolationUndefinedAndNullTest state pages: ' + JSON.stringify(pages));
        if (!('ImageInterpolationUndefinedAndNull' == pages.name)) {
          console.info('get ImageInterpolationUndefinedAndNullTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push ImageInterpolationUndefinedAndNullTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ImageInterpolationUndefinedAndNullTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   ImageInterpolationUndefinedAndNullTest_0100
     * @tc.number ImageInterpolationUndefinedAndNullTest_0100
     * @tc.desc   test the ImageInterpolation undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageInterpolationUndefinedAndNullTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[ImageInterpolationUndefinedAndNullTest_0100] START');
      await CommonFunc.sleep(2000);

      // test the child component response
      let strJson = getInspectorByKey('imageInterpolationUndefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageInterpolationUndefinedAndNullTest_0100] strJson is: ' + strJson);
      console.info('[ImageInterpolationUndefinedAndNullTest_0100] ImageInterpolationUndefinedAndNullTest obj is: ' + JSON.stringify(obj.$attrs.interpolation));
      expect(obj.$attrs.interpolation).assertEqual('ImageInterpolation.None');
      console.info('[ImageInterpolationUndefinedAndNullTest_0100] END');
      done();
    });

    /**
     * @tc.name   ImageInterpolationUndefinedAndNullTest_0200
     * @tc.number ImageInterpolationUndefinedAndNullTest_0200
     * @tc.desc   test the ImageInterpolation null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageInterpolationUndefinedAndNullTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[ImageInterpolationUndefinedAndNullTest_0200] START');
      await CommonFunc.sleep(2000);

      // test the child component response
      let strJson = getInspectorByKey('imageInterpolationNull');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageInterpolationUndefinedAndNullTest_0200] strJson is: ' + strJson);
      console.info('[ImageInterpolationUndefinedAndNullTest_0200] ImageInterpolationUndefinedAndNullTest obj is: ' + JSON.stringify(obj.$attrs.interpolation));
      expect(obj.$attrs.interpolation).assertEqual('ImageInterpolation.None');
      console.info('[ImageInterpolationUndefinedAndNullTest_0200] END');
      done();
    });
  })
}