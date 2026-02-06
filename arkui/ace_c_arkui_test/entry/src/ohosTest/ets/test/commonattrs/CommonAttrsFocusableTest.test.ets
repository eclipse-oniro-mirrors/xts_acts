/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';

export default function commonAttrsFocusableTest() {

  describe('CommonAttrsFocusableTest', () => {

    let PAGE_TAG = 'CommonAttrsFocusableTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`commonattrs/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOCUSABLE_0100
    * @tc.name       : testCommonAttrsFocusable001
    * @tc.desc       : test onClick event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCommonAttrsFocusable001', Level.LEVEL1, async (done: Function) => {
      focusControl.requestFocus('FocusableTestButtonCompare')
      await Utils.sleep(2000)
      focusControl.requestFocus('FocusableTestButton')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('FocusableTestButton').$attrs.backgroundColor).assertEqual('#FF00FF00')

      expect(Utils.getComponentInfoByKey('FocusableTestButton').$attrs.focusable).assertTrue()
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_FOCUSABLE_0200
    * @tc.name       : testCommonAttrsFocusable002
    * @tc.desc       : test onClick event not callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testCommonAttrsFocusable002', Level.LEVEL1, async (done: Function) => {
      focusControl.requestFocus('FocusableTestButton')
      await Utils.sleep(2000)
      focusControl.requestFocus('FocusableTestButtonDisable')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('FocusableTestButtonDisable').$attrs.backgroundColor).assertEqual('#FFFF0000')

      expect(Utils.getComponentInfoByKey('FocusableTestButtonDisable').$attrs.focusable).assertFalse()
      done()
    })

  })
}
