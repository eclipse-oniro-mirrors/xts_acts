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

export default function IncludeFontPaddingTest() {
  describe('IncludeFontPaddingTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorDisplayOptimization/IncludeFontPadding',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get IncludeFontPaddingTest state pages: ' + JSON.stringify(pages));
        if (!('shaderStyle' == pages.name)) {
          console.info('get IncludeFontPaddingTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push IncludeFontPaddingTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push IncludeFontPaddingTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('IncludeFontPaddingTest after each called');
    });

    /**
     * @tc.number    IncludeFontPaddingTest_0010
     * @tc.name      IncludeFontPaddingTest_0010
     * @tc.desc      test the attr of RichEditor: includeFontPadding(false)
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('IncludeFontPaddingTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('[IncludeFontPaddingTest_0010] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('richEditor');
      let obj: ESObject = JSON.parse(strJson);

      console.info('[IncludeFontPaddingTest_0010] includeFontPadding: ' + obj.$attrs.includeFontPadding);
      expect(obj.$attrs.includeFontPadding).assertEqual('false');

      console.info('[IncludeFontPaddingTest_0010] END');
      done();
    });

    /**
     * @tc.number    IncludeFontPaddingTest_0011
     * @tc.name      IncludeFontPaddingTest_0011
     * @tc.desc      test the attr of RichEditor: includeFontPadding(true)
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('IncludeFontPaddingTest_0011', Level.LEVEL1, async (done: Function) => {
      console.info('[IncludeFontPaddingTest_0011] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('richEditor2');
      let obj: ESObject = JSON.parse(strJson);

      console.info('[IncludeFontPaddingTest_0011] includeFontPadding: ' + obj.$attrs.includeFontPadding);
      expect(obj.$attrs.includeFontPadding).assertEqual('true');

      console.info('[IncludeFontPaddingTest_0011] END');
      done();
    });

    /**
     * @tc.number    IncludeFontPaddingTest_0012
     * @tc.name      IncludeFontPaddingTest_0012
     * @tc.desc      test the attr of RichEditor: includeFontPadding(undefined)
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('IncludeFontPaddingTest_0012', Level.LEVEL1, async (done: Function) => {
      console.info('[IncludeFontPaddingTest_0012] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('richEditor3');
      let obj: ESObject = JSON.parse(strJson);

      console.info('[IncludeFontPaddingTest_0012] includeFontPadding: ' + obj.$attrs.includeFontPadding);
      expect(obj.$attrs.includeFontPadding).assertEqual('false');

      console.info('[IncludeFontPaddingTest_0012] END');
      done();
    });

    /**
     * @tc.number    IncludeFontPaddingTest_0013
     * @tc.name      IncludeFontPaddingTest_0013
     * @tc.desc      test the attr of RichEditor: includeFontPadding(null)
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('IncludeFontPaddingTest_0013', Level.LEVEL1, async (done: Function) => {
      console.info('[IncludeFontPaddingTest_0013] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('richEditor4');
      let obj: ESObject = JSON.parse(strJson);

      console.info('[IncludeFontPaddingTest_0013] includeFontPadding: ' + obj.$attrs.includeFontPadding);
      expect(obj.$attrs.includeFontPadding).assertEqual('false');

      console.info('[IncludeFontPaddingTest_0013] END');
      done();
    });
  })
}