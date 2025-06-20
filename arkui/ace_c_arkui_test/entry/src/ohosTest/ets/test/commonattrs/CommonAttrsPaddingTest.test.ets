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

export default function commonAttrsPaddingTest() {

  describe('CommonAttrsPaddingTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_PADDING_0100
     * @tc.name       : testCommonAttrsPadding001
     * @tc.desc       : testing padding for commonAttrs with valid value 0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsPadding001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsPadding001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_PADDING_0200
     * @tc.name       : testCommonAttrsPadding002
     * @tc.desc       : testing padding for commonAttrs with valid value 10
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsPadding002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsPadding002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_PADDING_0300
     * @tc.name       : testCommonAttrsPadding003
     * @tc.desc       : testing padding for commonAttrs with invalid value -10
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsPadding003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsPadding003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_PADDING_0400
     * @tc.name       : testCommonAttrsPadding004
     * @tc.desc       : testing padding for commonAttrs with valid value 10,10,50,50
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsPadding004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsPadding004()).assertEqual(0)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_TEXT_PADDING_0500
    * @tc.name       : testCommonAttrsPadding005
    * @tc.desc       : testing resetAttribute padding for commonAttrs
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level1
    */
    it('testCommonAttrsPadding005', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsPadding005()).assertEqual(0)
      done()
    })
  })
}
