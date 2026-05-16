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

export default function ImageAutoResizeUndefinedAndNullTest() {
  describe('ImageAutoResizeUndefinedAndNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ImageAutoResizeUndefinedAndNullTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageUndefinedAndNull/ImageAutoResizeUndefinedAndNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ImageAutoResizeUndefinedAndNullTest state pages: ' + JSON.stringify(pages));
        if (!('ImageAutoResizeUndefinedAndNull' == pages.name)) {
          console.info('get ImageAutoResizeUndefinedAndNullTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push ImageAutoResizeUndefinedAndNullTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ImageAutoResizeUndefinedAndNullTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   ImageAutoResizeUndefinedAndNullTest_0100
     * @tc.number ImageAutoResizeUndefinedAndNullTest_0100
     * @tc.desc   test the ImageAutoResize undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageAutoResizeUndefinedAndNullTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[ImageAutoResizeUndefinedAndNullTest_0100] START');
      await CommonFunc.sleep(2000);

      // test the child component response
      let strJson = getInspectorByKey('imageAutoResizeUndefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageAutoResizeUndefinedAndNullTest_0100] strJson is: ' + strJson);
      console.info('[ImageAutoResizeUndefinedAndNullTest_0100] ImageAutoResizeUndefinedAndNullTest obj is: ' + JSON.stringify(obj.$attrs.autoResize));
      expect(obj.$attrs.autoResize).assertEqual('false');
      console.info('[ImageAutoResizeUndefinedAndNullTest_0100] END');
      done();
    });

    /**
     * @tc.name   ImageAutoResizeUndefinedAndNullTest_0200
     * @tc.number ImageAutoResizeUndefinedAndNullTest_0200
     * @tc.desc   test the ImageAutoResize null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageAutoResizeUndefinedAndNullTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[ImageAutoResizeUndefinedAndNullTest_0200] START');
      await CommonFunc.sleep(2000);

      // test the child component response
      let strJson = getInspectorByKey('imageAutoResizeNull');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageAutoResizeUndefinedAndNullTest_0200] strJson is: ' + strJson);
      console.info('[ImageAutoResizeUndefinedAndNullTest_0200] ImageAutoResizeUndefinedAndNullTest obj is: ' + JSON.stringify(obj.$attrs.autoResize));
      expect(obj.$attrs.autoResize).assertEqual('false');
      console.info('[ImageAutoResizeUndefinedAndNullTest_0200] END');
      done();
    });
  })
}