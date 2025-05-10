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

export default function commonAttrsChainModeTest() {

  describe('CommonAttrsChainModeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_CHAINMODE_0100
     * @tc.name       : testCommonAttrsChainMode001
     * @tc.desc       : testing chainmode for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsChainMode001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsChainMode001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_CHAINMODE_0200
     * @tc.name       : testCommonAttrsChainMode002
     * @tc.desc       : testing chainmode for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsChainMode002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsChainMode002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_CHAINMODE_0300
     * @tc.name       : testCommonAttrsChainMode003
     * @tc.desc       : testing chainmode for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsChainMode003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsChainMode003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_CHAINMODE_0400
     * @tc.name       : testCommonAttrsChainMode004
     * @tc.desc       : testing chainmode for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsChainMode004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsChainMode004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_CHAINMODE_0500
     * @tc.name       : testCommonAttrsChainMode005
     * @tc.desc       : testing chainmode for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsChainMode005', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsChainMode005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_CHAINMODE_0600
     * @tc.name       : testCommonAttrsChainMode006
     * @tc.desc       : testing chainmode for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsChainMode006', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsChainMode006()).assertEqual(0)
      done()
    })
   
    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_CHAINMODE_0700
     * @tc.name       : testCommonAttrsChainMode007
     * @tc.desc       : testing chainmode for commonAttrs with valid value 
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsChainMode007', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsChainMode007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RELATIVECONTAINER_CHAINMODE_0800
     * @tc.name       : testCommonAttrsChainMode008
     * @tc.desc       : testing resetAttribute chainmode for commonAttrs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsChainMode008', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsChainMode008()).assertEqual(0)
      done()
    })
  })
}