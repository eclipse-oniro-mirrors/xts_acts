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

export default function ImageSourceSizeUndefinedAndNullTest() {
  describe('ImageSourceSizeUndefinedAndNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ImageSourceSizeUndefinedAndNullTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageUndefinedAndNull/ImageSourceSizeUndefinedAndNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ImageSourceSizeUndefinedAndNullTest state pages: ' + JSON.stringify(pages));
        if (!('ImageSourceSizeUndefinedAndNull' == pages.name)) {
          console.info('get ImageSourceSizeUndefinedAndNullTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push ImageSourceSizeUndefinedAndNullTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ImageSourceSizeUndefinedAndNullTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   ImageSourceSizeUndefinedAndNullTest_0100
     * @tc.number ImageSourceSizeUndefinedAndNullTest_0100
     * @tc.desc   test the ImageSourceSize undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageSourceSizeUndefinedAndNullTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[ImageSourceSizeUndefinedAndNullTest_0100] START');
      await CommonFunc.sleep(2000);

      // test the child component response
      let strJson = getInspectorByKey('imageSourceSizeUndefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageSourceSizeUndefinedAndNullTest_0100] strJson is: ' + strJson);
      console.info('[ImageSourceSizeUndefinedAndNullTest_0100] ImageSourceSizeUndefinedAndNullTest obj is: ' + JSON.stringify(obj.$attrs.sourceSize));
      expect(obj.$attrs.sourceSize).assertEqual('[0.00 x 0.00]');
      console.info('[ImageSourceSizeUndefinedAndNullTest_0100] END');
      done();
    });

    /**
     * @tc.name   ImageSourceSizeUndefinedAndNullTest_0200
     * @tc.number ImageSourceSizeUndefinedAndNullTest_0200
     * @tc.desc   test the ImageSourceSize null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageSourceSizeUndefinedAndNullTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[ImageSourceSizeUndefinedAndNullTest_0200] START');
      await CommonFunc.sleep(2000);

      // test the child component response
      let strJson = getInspectorByKey('imageSourceSizeNull');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageSourceSizeUndefinedAndNullTest_0200] strJson is: ' + strJson);
      console.info('[ImageSourceSizeUndefinedAndNullTest_0200] ImageSourceSizeUndefinedAndNullTest obj is: ' + JSON.stringify(obj.$attrs.sourceSize));
      expect(obj.$attrs.sourceSize).assertEqual('[0.00 x 0.00]');
      console.info('[ImageSourceSizeUndefinedAndNullTest_0200] END');
      done();
    });
  })
}