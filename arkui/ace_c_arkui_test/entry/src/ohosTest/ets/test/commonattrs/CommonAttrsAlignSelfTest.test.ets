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

export default function commonAttrsAlignSelfTest() {

  describe('CommonAttrsAlignSelfTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_COMMONATTRS_ALIGNSELF_0100
     * @tc.name: testCommonAttrsAlignSelf001
     * @tc.desc: testing alignSelf for row with auto value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCommonAttrsAlignSelf001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlignSelf001()).assertEqual(0)
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_COMMONATTRS_ALIGNSELF_0200
     * @tc.name: testCommonAttrsAlignSelf002
     * @tc.desc: testing alignSelf for row with start value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCommonAttrsAlignSelf002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlignSelf002()).assertEqual(0)
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_COMMONATTRS_ALIGNSELF_0300
     * @tc.name: testCommonAttrsAlignSelf003
     * @tc.desc: testing alignSelf for row with center value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCommonAttrsAlignSelf003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlignSelf003()).assertEqual(0)
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_COMMONATTRS_ALIGNSELF_0400
     * @tc.name: testCommonAttrsAlignSelf004
     * @tc.desc: testing alignSelf for row with end value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCommonAttrsAlignSelf004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlignSelf004()).assertEqual(0)
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_COMMONATTRS_ALIGNSELF_0500
     * @tc.name: testCommonAttrsAlignSelf005
     * @tc.desc: testing alignSelf for row with end value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCommonAttrsAlignSelf005', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlignSelf005()).assertEqual(0)
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_COMMONATTRS_ALIGNSELF_0600
     * @tc.name: testCommonAttrsAlignSelf006
     * @tc.desc: testing alignSelf for row with baseline value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testCommonAttrsAlignSelf006', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsAlignSelf006()).assertEqual(0)
      done();
    })
  })
}
