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

export default function commonAttrsDisplayPriorityTest() {
    
  describe('CommonAttrsDisplayPriorityTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_DISPLAYPRIORITY_0100
     * @tc.name       : testCommonAttrsDisplayPriority001
     * @tc.desc       : testing displaypriority for commonAttrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsDisplayPriority001', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsDisplayPriority001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_DISPLAYPRIORITY_0200
     * @tc.name       : testCommonAttrsDisplayPriority002
     * @tc.desc       : testing displaypriority for commonAttrs with valid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsDisplayPriority002', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsDisplayPriority002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_DISPLAYPRIORITY_0300
     * @tc.name       : testCommonAttrsDisplayPriority003
     * @tc.desc       : testing displaypriority for commonAttrs with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsDisplayPriority003', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsDisplayPriority003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_DISPLAYPRIORITY_0400
     * @tc.name       : testCommonAttrsDisplayPriority004
     * @tc.desc       : testing displaypriority for commonAttrs with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsDisplayPriority004', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsDisplayPriority004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_DISPLAYPRIORITY_0500
     * @tc.name       : testCommonAttrsDisplayPriority005
     * @tc.desc       : testing displaypriority for commonAttrs with invalid value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsDisplayPriority005', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsDisplayPriority005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COLUMN_DISPLAYPRIORITY_0600
     * @tc.name       : testCommonAttrsDisplayPriority006
     * @tc.desc       : testing resetAttribute displaypriority for commonAttrs
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level1
     */
    it('testCommonAttrsDisplayPriority006', 0, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsDisplayPriority006()).assertEqual(0)
      done()
    })
  })
}