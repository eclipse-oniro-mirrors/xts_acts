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

export default function TextPickeCanLoopUndefinedNullTest() {
  describe('TextPickeCanLoopUndefinedNullTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerUndefinedNull/textPickerCanLoopUndefinedNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextPickeCanLoopUndefinedNullTest state success ' + JSON.stringify(pages));
        if (!('textPickerCanLoopUndefinedNull' == pages.name)) {
          console.info('get TextStyle state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push TextPickeCanLoopUndefinedNullTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextPickeCanLoopUndefinedNullTest page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   TextPickeCanLoopUndefinedNullTest_0100
     * @tc.number TextPickeCanLoopUndefinedNullTest_0100
     * @tc.desc   To test the canLoop is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextPickeCanLoopUndefinedNullTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('TextPickeCanLoopUndefinedNullTest_0100 start');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('textPickerCanLoopUndefined');
      console.info('[TextPickeCanLoopUndefinedNullTest_0100]:' + JSON.stringify(strJson));
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextPickeCanLoopUndefinedNullTest_0100 obj $attrs]:' + JSON.stringify(obj.$attrs));
      console.info('[TextPickeCanLoopUndefinedNullTest_0100 obj undefined $attrs.canLoop]:' +JSON.stringify(obj.$attrs.canLoop));
      expect(obj.$attrs.canLoop).assertEqual('true');
      console.info('[TextPickeCanLoopUndefinedNullTest_0100] END');
      done();
    });

    /**
     * @tc.name   TextPickeCanLoopUndefinedNullTest_0200
     * @tc.number TextPickeCanLoopUndefinedNullTest_0200
     * @tc.desc   To test the canLoop is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextPickeCanLoopUndefinedNullTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('TextPickeCanLoopUndefinedNullTest_0200 start');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('textPickerCanLoopNull');
      console.info('[TextPickeCanLoopUndefinedNullTest_0200]:' + JSON.stringify(strJson));
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextPickeCanLoopUndefinedNullTest_0200 obj $attrs]:' + JSON.stringify(obj.$attrs));
      console.info('[TextPickeCanLoopUndefinedNullTest_0200 obj null $attrs.canLoop]:' + JSON.stringify(obj.$attrs.canLoop));
      expect(obj.$attrs.canLoop).assertEqual('true');
      console.info('[TextPickeCanLoopUndefinedNullTest_0200] END');
      done();
    });
  })
}
