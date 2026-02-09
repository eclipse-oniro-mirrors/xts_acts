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

export default function commonEventOnBlurTest() {

  describe('CommonEventOnBlurTest', () => {

    let PAGE_TAG = 'CommonEventOnBlurTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`commonevent/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   testCommonEventOnBlur001
     * @tc.number SUB_ARKUI_CAPI_COMMONEVENT_ONBLUR_0100
     * @tc.desc   test onBlur event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonEventOnBlur001', Level.LEVEL1, async (done: Function) => {
      focusControl.requestFocus('OnBlurTestButtonCompare')
      await Utils.sleep(2000)
      focusControl.requestFocus('OnBlurTestButton')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnBlurTestButtonCompare').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })


    /**
     * @tc.name   testCommonEventOnBlur002
     * @tc.number SUB_ARKUI_CAPI_COMMONEVENT_ONBLUR_0200
     * @tc.desc   test onBlur event not callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonEventOnBlur002', Level.LEVEL1, async (done: Function) => {
      focusControl.requestFocus('OnBlurTestButtonDisable')
      await Utils.sleep(2000)
      focusControl.requestFocus('OnBlurTestButton')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnBlurTestButtonDisable').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done()
    })

  })
}
