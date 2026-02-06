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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function commonAttrsForegroundColorTest() {

  describe('CommonAttrsForegroundColorTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCommonAttrsForegroundColor001
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDCOLOR_0100
     * @tc.desc   testing foreground color for commonAttrs with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundColor001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundColor001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundColor002
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDCOLOR_0200
     * @tc.desc   testing foreground color for commonAttrs with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundColor002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundColor002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundColor003
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDCOLOR_0300
     * @tc.desc   testing foreground color for commonAttrs with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundColor003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundColor003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundColor004
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDCOLOR_0400
     * @tc.desc   testing foreground color for commonAttrs with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundColor004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundColor004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsForegroundColor005
     * @tc.number SUB_ARKUI_CAPI_COLUMN_FOREGROUNDCOLOR_0500
     * @tc.desc   testing resetAttribute foreground color for commonAttrs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsForegroundColor005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsForegroundColor005()).assertEqual(0)
      done()
    })
  })
}