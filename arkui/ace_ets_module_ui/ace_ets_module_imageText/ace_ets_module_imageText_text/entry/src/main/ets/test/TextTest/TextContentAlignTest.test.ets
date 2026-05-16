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

export default function TextContentAlignTest() {
  describe('TextContentAlignTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextContentAlign',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextContentAlignTest state pages: ' + JSON.stringify(pages));
        if (!('TextContentAlign' == pages.name)) {
          console.info('get TextContentAlignTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push TextContentAlignTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextContentAlignTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('TextContentAlign after each called');
    });

    /**
     * @tc.name   textContentAlignTest_0010
     * @tc.number textContentAlignTest_0010
     * @tc.desc   test the attr of Text: textContentAlign(TextContentAlign.TOP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textContentAlignTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('[textContentAlignTest_0010] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textTop');
      let obj: ESObject = JSON.parse(strJson);

      console.info('[textContentAlignTest_0010] textContentAlign: ' + obj.$attrs.textContentAlign);
      expect(obj.$attrs.textContentAlign).assertEqual('TextContentAlign.TOP');

      console.info('[textContentAlignTest_0010] END');
      done();
    });

    /**
     * @tc.name   textContentAlignTest_0011
     * @tc.number textContentAlignTest_0011
     * @tc.desc   test the attr of Text: textContentAlign(TextContentAlign.CENTER)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textContentAlignTest_0011', Level.LEVEL1, async (done: Function) => {
      console.info('[textContentAlignTest_0011] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textCenter');
      let obj: ESObject = JSON.parse(strJson);

      console.info('[textContentAlignTest_0010] textContentAlign: ' + obj.$attrs.textContentAlign);
      expect(obj.$attrs.textContentAlign).assertEqual('TextContentAlign.CENTER');

      console.info('[textContentAlignTest_0011] END');
      done();
    });

    /**
     * @tc.name   textContentAlignTest_0012
     * @tc.number textContentAlignTest_0012
     * @tc.desc   test the attr of Text: textContentAlign(TextContentAlign.BOTTOM)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('textContentAlignTest_0012', Level.LEVEL1, async (done: Function) => {
      console.info('[textContentAlignTest_0012] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('textBottom');
      let obj: ESObject = JSON.parse(strJson);

      console.info('[textContentAlignTest_0010] textContentAlign: ' + obj.$attrs.textContentAlign);
      expect(obj.$attrs.textContentAlign).assertEqual('TextContentAlign.BOTTOM');

      console.info('[textContentAlignTest_0012] END');
      done();
    });
  })
}