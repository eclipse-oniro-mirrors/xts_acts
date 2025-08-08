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

export default function commonAttrsContrastTest() {

  describe('CommonAttrsContrastTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_CONTRAST_0100
     * @tc.name       : testCommonAttrsContrast001
     * @tc.desc       : testing contrast for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsContrast001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsContrast001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_CONTRAST_0200
     * @tc.name       : testCommonAttrsContrast002
     * @tc.desc       : testing contrast for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsContrast002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsContrast002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_CONTRAST_0300
     * @tc.name       : testCommonAttrsContrast003
     * @tc.desc       : testing contrast for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsContrast003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsContrast003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_CONTRAST_0400
     * @tc.name       : testCommonAttrsContrast004
     * @tc.desc       : testing contrast for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsContrast004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsContrast004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_CONTRAST_0500
     * @tc.name       : testCommonAttrsContrast005
     * @tc.desc       : testing contrast for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCommonAttrsContrast005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsContrast005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_CONTRAST_0600
     * @tc.name       : testCommonAttrsContrast006
     * @tc.desc       : testing contrast for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCommonAttrsContrast006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsContrast006()).assertEqual(0)
      done()
    })

  })
}
