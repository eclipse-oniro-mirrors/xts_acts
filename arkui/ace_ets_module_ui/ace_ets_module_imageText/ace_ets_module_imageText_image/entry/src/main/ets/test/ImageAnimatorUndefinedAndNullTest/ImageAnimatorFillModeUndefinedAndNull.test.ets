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

export default function ImageAnimatorFillModeUndefinedAndNullTest() {
  describe('ImageAnimatorFillModeUndefinedAndNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ImageAnimatorFillModeUndefinedAndNullTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageAnimatorUndefinedAndNull/ImageAnimatorFillModeUndefinedAndNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ImageAnimatorFillModeUndefinedAndNullTest state pages: ' + JSON.stringify(pages));
        if (!('ImageAnimatorFillModeUndefinedAndNull' == pages.name)) {
          console.info('get ImageAnimatorFillModeUndefinedAndNullTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push ImageAnimatorFillModeUndefinedAndNullTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ImageAnimatorFillModeUndefinedAndNullTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   ImageAnimatorFillModeUndefinedAndNullTest_0100
     * @tc.number ImageAnimatorFillModeUndefinedAndNullTest_0100
     * @tc.desc   test the ImageAnimatorFillMode undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageAnimatorFillModeUndefinedAndNullTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[ImageAnimatorFillModeUndefinedAndNullTest_0100] START');
      await CommonFunc.sleep(2000);

      // test the child component response
      let strJson = getInspectorByKey('fillModeUndefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageAnimatorFillModeUndefinedAndNullTest_0100] strJson is: ' + strJson);
      console.info('[ImageAnimatorFillModeUndefinedAndNullTest_0100] ImageAnimatorFillModeUndefinedAndNullTest obj is: ' + JSON.stringify(obj.$attrs.fillMode));
      expect(obj.$attrs.fillMode).assertEqual('FillMode.Forwards');
      console.info('[ImageAnimatorFillModeUndefinedAndNullTest_0100] END');
      done();
    });

    /**
     * @tc.name   ImageAnimatorFillModeUndefinedAndNullTest_0200
     * @tc.number ImageAnimatorFillModeUndefinedAndNullTest_0200
     * @tc.desc   test the ImageAnimatorFillMode null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageAnimatorFillModeUndefinedAndNullTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[ImageAnimatorFillModeUndefinedAndNullTest_0200] START');
      await CommonFunc.sleep(2000);

      // test the child component response
      let strJson = getInspectorByKey('fillModeNull');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[ImageAnimatorFillModeUndefinedAndNullTest_0200] strJson is: ' + strJson);
      console.info('[ImageAnimatorFillModeUndefinedAndNullTest_0200] ImageAnimatorFillModeUndefinedAndNullTest obj is: ' + JSON.stringify(obj.$attrs.fillMode));
      expect(obj.$attrs.fillMode).assertEqual('FillMode.Forwards');
      console.info('[ImageAnimatorFillModeUndefinedAndNullTest_0200] END');
      done();
    });
  })
}