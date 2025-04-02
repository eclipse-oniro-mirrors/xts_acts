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

export default function customComponentContrastTest() {

  describe('CustomComponentContrastTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_CONTRAST_0100
     * @tc.name       : testCustomComponentContrast001
     * @tc.desc       : testing contrast for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentContrast001', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentContrast001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_CONTRAST_0200
     * @tc.name       : testCustomComponentContrast002
     * @tc.desc       : testing contrast for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentContrast002', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentContrast002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_CONTRAST_0300
     * @tc.name       : testCustomComponentContrast003
     * @tc.desc       : testing contrast for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentContrast003', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentContrast003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_CONTRAST_0400
     * @tc.name       : testCustomComponentContrast004
     * @tc.desc       : testing contrast for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomComponentContrast004', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentContrast004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_CONTRAST_0500
     * @tc.name       : testCustomComponentContrast005
     * @tc.desc       : testing contrast for stack with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCustomComponentContrast005', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentContrast005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOMCOMPONENT_CONTRAST_0600
     * @tc.name       : testCustomComponentContrast006
     * @tc.desc       : testing contrast for stack with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCustomComponentContrast006', 0, async (done: Function) => {
      expect(nativeFunc.testCustomComponentContrast006()).assertEqual(0)
      done()
    })

  })
}
