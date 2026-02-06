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

export default function commonAttrsResponseRegionTest() {

  describe('CommonAttrsResponseRegionTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCommonAttrsResponseRegion001
     * @tc.number SUB_ARKUI_CAPI_BUTTON_RESPONSEREGION_0100
     * @tc.desc   testing reponseRegion for commonAttrs with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsResponseRegion001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsResponseRegion001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsResponseRegion002
     * @tc.number SUB_ARKUI_CAPI_BUTTON_RESPONSEREGION_0200
     * @tc.desc   testing reponseRegion for commonAttrs with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsResponseRegion002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsResponseRegion002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsResponseRegion003
     * @tc.number SUB_ARKUI_CAPI_BUTTON_RESPONSEREGION_0300
     * @tc.desc   testing reponseRegion for commonAttrs with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsResponseRegion003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsResponseRegion003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsResponseRegion004
     * @tc.number SUB_ARKUI_CAPI_BUTTON_RESPONSEREGION_0400
     * @tc.desc   testing reponseRegion for commonAttrs with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsResponseRegion004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsResponseRegion004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsResponseRegion005
     * @tc.number SUB_ARKUI_CAPI_BUTTON_RESPONSEREGION_0500
     * @tc.desc   testing reponseRegion for commonAttrs with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsResponseRegion005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsResponseRegion005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsResponseRegion006
     * @tc.number SUB_ARKUI_CAPI_BUTTON_RESPONSEREGION_0600
     * @tc.desc   testing reponseRegion for commonAttrs with invalid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsResponseRegion006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsResponseRegion006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsResponseRegion007
     * @tc.number SUB_ARKUI_CAPI_BUTTON_RESPONSEREGION_0700
     * @tc.desc   testing resetAttribute reponseRegion for commonAttrs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsResponseRegion007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsResponseRegion007()).assertEqual(0)
      done()
    })
  })
}