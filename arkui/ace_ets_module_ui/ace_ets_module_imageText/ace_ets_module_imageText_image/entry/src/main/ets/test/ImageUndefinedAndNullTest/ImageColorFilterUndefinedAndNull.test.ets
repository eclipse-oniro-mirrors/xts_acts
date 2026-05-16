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

export default function ImageColorFilterUndefinedAndNullTest() {
  describe('ImageColorFilterUndefinedAndNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ImageColorFilterUndefinedAndNullTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageUndefinedAndNull/ImageColorFilterUndefinedAndNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ImageColorFilterUndefinedAndNullTest state pages: ' + JSON.stringify(pages));
        if (!('ImageColorFilterUndefinedAndNull' == pages.name)) {
          console.info('get ImageColorFilterUndefinedAndNullTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push ImageColorFilterUndefinedAndNullTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ImageColorFilterUndefinedAndNullTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   ImageColorFilterUndefinedAndNullTest_0100
     * @tc.number ImageColorFilterUndefinedAndNullTest_0100
     * @tc.desc   test the ImageColorFilter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageColorFilterUndefinedAndNullTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[ImageColorFilterUndefinedAndNullTest_0100] START');
      await CommonFunc.sleep(2000);

      // test the child component response
      let strJson = getInspectorByKey('imageColorFilterUndefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageColorFilterUndefinedAndNullTest_0100] strJson is: ' + strJson);
      console.info('[ImageColorFilterUndefinedAndNullTest_0100] ImageColorFilterUndefinedAndNullTest obj is: ' + JSON.stringify(obj.$attrs.colorFilter));
      expect(obj.$attrs.colorFilter).assertEqual('1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 ');
      console.info('[ImageColorFilterUndefinedAndNullTest_0100] END');
      done();
    });

    /**
     * @tc.name   ImageColorFilterUndefinedAndNullTest_0200
     * @tc.number ImageColorFilterUndefinedAndNullTest_0200
     * @tc.desc   test the ImageColorFilter null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageColorFilterUndefinedAndNullTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[ImageColorFilterUndefinedAndNullTest_0200] START');
      await CommonFunc.sleep(2000);

      // test the child component response
      let strJson = getInspectorByKey('imageColorFilterNull');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageColorFilterUndefinedAndNullTest_0200] strJson is: ' + strJson);
      console.info('[ImageColorFilterUndefinedAndNullTest_0200] ImageColorFilterUndefinedAndNullTest obj is: ' + JSON.stringify(obj.$attrs.colorFilter));
      expect(obj.$attrs.colorFilter).assertEqual('1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 ');
      console.info('[ImageColorFilterUndefinedAndNullTest_0200] END');
      done();
    });
  })
}