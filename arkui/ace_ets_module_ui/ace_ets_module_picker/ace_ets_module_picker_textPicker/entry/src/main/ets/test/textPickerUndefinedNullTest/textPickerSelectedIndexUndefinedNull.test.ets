/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { ON, BY, Driver, UiDriver } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import CommonFunc from '../../MainAbility/utils/Common';

export default function TextPickeSelectedIndexUndefinedNullTest() {
  describe('TextPickeSelectedIndexUndefinedNullTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerUndefinedNull/textPickerSelectedIndexUndefinedNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextPickeSelectedIndexUndefinedNullTest state success ' + JSON.stringify(pages));
        if (!('textPickerSelectedIndexUndefinedNull' == pages.name)) {
          console.info('get TextStyle state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push TextPickeSelectedIndexUndefinedNullTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextPickeSelectedIndexUndefinedNullTest page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   TextPickeSelectedIndexUndefinedNullTest_0100
     * @tc.number TextPickeSelectedIndexUndefinedNullTest_0100
     * @tc.desc   To test the selectedIndex is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextPickeSelectedIndexUndefinedNullTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('TextPickeSelectedIndexUndefinedNullTest_0100 start');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('textPickerSelectedIndexUndefined');
      console.info('[TextPickeSelectedIndexUndefinedNullTest_0100]:' + JSON.stringify(strJson));
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextPickeSelectedIndexUndefinedNullTest_0100 obj $attrs]:' + JSON.stringify(obj.$attrs));
      console.info('[TextPickeSelectedIndexUndefinedNullTest_0100 obj undefined $attrs.selectedIndex]:' + JSON.stringify(obj.$attrs.selectedIndex));
      expect(JSON.stringify(obj.$attrs.selectedIndex)).assertEqual('[]');
      console.info('[TextPickeSelectedIndexUndefinedNullTest_0100] END');
      done();
    });

    /**
     * @tc.name   TextPickeSelectedIndexUndefinedNullTest_0200
     * @tc.number TextPickeSelectedIndexUndefinedNullTest_0200
     * @tc.desc   To test the selectedIndex is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextPickeSelectedIndexUndefinedNullTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('TextPickeSelectedIndexUndefinedNullTest_0200 start');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('textPickerSelectedIndexNull');
      console.info('[TextPickeSelectedIndexUndefinedNullTest_0200]:' + JSON.stringify(strJson));
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextPickeSelectedIndexUndefinedNullTest_0200 obj $attrs]:' + JSON.stringify(obj.$attrs));
      console.info('[TextPickeSelectedIndexUndefinedNullTest_0200 obj null $attrs.selectedIndex]:' + JSON.stringify(obj.$attrs.selectedIndex));
      expect(JSON.stringify(obj.$attrs.selectedIndex)).assertEqual('[]');
      console.info('[TextPickeSelectedIndexUndefinedNullTest_0200] END');
      done();
    });
  })
}
