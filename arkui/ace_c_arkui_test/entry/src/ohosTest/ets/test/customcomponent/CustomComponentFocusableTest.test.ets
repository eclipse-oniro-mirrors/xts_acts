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

export default function customComponentFocusableTest() {

  describe('CustomComponentFocusableTest', () => {

    let PAGE_TAG = 'CustomComponentFocusableTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`customcomponent/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   testCustomComponentFocusable001
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOCUSABLE_0100
     * @tc.desc   test onClick event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentFocusable001', Level.LEVEL1, async (done: Function) => {
      focusControl.requestFocus('FocusableTestCustomComponentCompare')
      await Utils.sleep(2000)
      focusControl.requestFocus('FocusableTestCustomComponent')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('FocusableTestCustomComponent').$attrs.backgroundColor)
        .assertEqual('#FFFF0000')

      expect(Utils.getComponentInfoByKey('FocusableTestCustomComponent').$attrs.focusable).assertFalse()
      done()
    })

    /**
     * @tc.name   testCustomComponentFocusable002
     * @tc.number SUB_ARKUI_CAPI_CUSTOMCOMPONENT_FOCUSABLE_0200
     * @tc.desc   test onClick event not callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomComponentFocusable002', Level.LEVEL1, async (done: Function) => {
      focusControl.requestFocus('FocusableTestCustomComponent')
      await Utils.sleep(2000)
      focusControl.requestFocus('FocusableTestCustomComponentDisable')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('FocusableTestCustomComponentDisable').$attrs.backgroundColor)
        .assertEqual('#FFFF0000')

      expect(Utils.getComponentInfoByKey('FocusableTestCustomComponentDisable').$attrs.focusable).assertFalse()
      done()
    })

  })
}
