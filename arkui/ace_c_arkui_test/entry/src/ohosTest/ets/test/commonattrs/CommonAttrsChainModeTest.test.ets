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

export default function commonAttrsChainModeTest() {

  describe('CommonAttrsChainModeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCommonAttrsChainMode001
     * @tc.number SUB_ARKUI_CAPI_RELATIVECONTAINER_CHAINMODE_0100
     * @tc.desc   testing chainmode for commonAttrs with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsChainMode001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsChainMode001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsChainMode002
     * @tc.number SUB_ARKUI_CAPI_RELATIVECONTAINER_CHAINMODE_0200
     * @tc.desc   testing chainmode for commonAttrs with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsChainMode002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsChainMode002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsChainMode003
     * @tc.number SUB_ARKUI_CAPI_RELATIVECONTAINER_CHAINMODE_0300
     * @tc.desc   testing chainmode for commonAttrs with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsChainMode003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsChainMode003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsChainMode004
     * @tc.number SUB_ARKUI_CAPI_RELATIVECONTAINER_CHAINMODE_0400
     * @tc.desc   testing chainmode for commonAttrs with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsChainMode004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsChainMode004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsChainMode005
     * @tc.number SUB_ARKUI_CAPI_RELATIVECONTAINER_CHAINMODE_0500
     * @tc.desc   testing chainmode for commonAttrs with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsChainMode005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsChainMode005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsChainMode006
     * @tc.number SUB_ARKUI_CAPI_RELATIVECONTAINER_CHAINMODE_0600
     * @tc.desc   testing chainmode for commonAttrs with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsChainMode006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsChainMode006()).assertEqual(0)
      done()
    })
   
    /**
     * @tc.name   testCommonAttrsChainMode007
     * @tc.number SUB_ARKUI_CAPI_RELATIVECONTAINER_CHAINMODE_0700
     * @tc.desc   testing chainmode for commonAttrs with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsChainMode007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsChainMode007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCommonAttrsChainMode008
     * @tc.number SUB_ARKUI_CAPI_RELATIVECONTAINER_CHAINMODE_0800
     * @tc.desc   testing resetAttribute chainmode for commonAttrs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCommonAttrsChainMode008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsChainMode008()).assertEqual(0)
      done()
    })
  })
}