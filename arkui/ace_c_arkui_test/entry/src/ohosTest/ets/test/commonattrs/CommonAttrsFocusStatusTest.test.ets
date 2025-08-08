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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function commonAttrsFocusStatusTest() {

  describe('CommonAttrsFocusStatusTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTINPUT_FOCUSSTATUS_0100
     * @tc.name       : testCommonAttrsFocusStatus001
     * @tc.desc       : testing focusstatus for commonattrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsFocusStatus001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsFocusStatus001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXTINPUT_FOCUSSTATUS_0200
     * @tc.name       : testCommonAttrsFocusStatus002
     * @tc.desc       : testing focusstatus for commonattrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsFocusStatus002', 0, async (done: Function) => {
      await Utils.pushPage(`commonattrs/CommonAttrsFocusStatusTest`, done);
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('btnFocusStatus').$attrs.backgroundColor).assertEqual('#0xFF00FF00')
      done()
    })
  })
}