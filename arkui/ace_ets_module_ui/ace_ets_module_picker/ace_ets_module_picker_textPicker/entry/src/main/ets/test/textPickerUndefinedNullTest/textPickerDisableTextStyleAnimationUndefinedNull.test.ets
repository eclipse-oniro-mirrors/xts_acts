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

export default function TextPickeDisableTextStyleAnimationUndefinedNullTest() {
  describe('TextPickeDisableTextStyleAnimationUndefinedNullTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerUndefinedNull/textPickerDisableTextStyleAnimationUndefinedNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextPickeDisableTextStyleAnimationUndefinedNullTest state success ' + JSON.stringify(pages));
        if (!('textPickerDisableTextStyleAnimationUndefinedNull' == pages.name)) {
          console.info('get TextStyle state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push TextPickeDisableTextStyleAnimationUndefinedNullTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextPickeDisableTextStyleAnimationUndefinedNullTest page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   TextPickeDisableTextStyleAnimationUndefinedNullTest_0100
     * @tc.number TextPickeDisableTextStyleAnimationUndefinedNullTest_0100
     * @tc.desc   To test the disableTextStyleAnimation is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextPickeDisableTextStyleAnimationUndefinedNullTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('TextPickeDisableTextStyleAnimationUndefinedNullTest_0100 start');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('textPickerDisableTextStyleAnimationUndefined');
      console.info('[TextPickeDisableTextStyleAnimationUndefinedNullTest_0100]:' + JSON.stringify(strJson));
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextPickeDisableTextStyleAnimationUndefinedNullTest_0100 obj $attrs]:' + JSON.stringify(obj.$attrs));
      console.info('[TextPickeDisableTextStyleAnimationUndefinedNullTest_0100 obj undefined $attrs.disableTextStyleAnimation]:' +JSON.stringify(obj.$attrs.disableTextStyleAnimation));
      expect(obj.$attrs.disableTextStyleAnimation).assertEqual('false');
      console.info('[TextPickeDisableTextStyleAnimationUndefinedNullTest_0100] END');
      done();
    });

    /**
     * @tc.name   TextPickeDisableTextStyleAnimationUndefinedNullTest_0200
     * @tc.number TextPickeDisableTextStyleAnimationUndefinedNullTest_0200
     * @tc.desc   To test the disableTextStyleAnimation is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextPickeDisableTextStyleAnimationUndefinedNullTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('TextPickeDisableTextStyleAnimationUndefinedNullTest_0200 start');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('textPickerDisableTextStyleAnimationNull');
      console.info('[TextPickeDisableTextStyleAnimationUndefinedNullTest_0200]:' + JSON.stringify(strJson));
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextPickeDisableTextStyleAnimationUndefinedNullTest_0200 obj $attrs]:' + JSON.stringify(obj.$attrs));
      console.info('[TextPickeDisableTextStyleAnimationUndefinedNullTest_0200 obj null $attrs.disableTextStyleAnimation]:' + JSON.stringify(obj.$attrs.disableTextStyleAnimation));
      expect(obj.$attrs.disableTextStyleAnimation).assertEqual('false');
      console.info('[TextPickeDisableTextStyleAnimationUndefinedNullTest_0200] END');
      done();
    });
  })
}
