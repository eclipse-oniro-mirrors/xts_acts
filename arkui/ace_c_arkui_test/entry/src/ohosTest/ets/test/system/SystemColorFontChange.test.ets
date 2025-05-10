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


export default function systemColorFontChangeTest() {
  describe('systemColorFontChangeTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RegisterSystemColorModeChangeEvent_0100
     * @tc.name       : testRegisterSystemColorModeChangeEvent_001
     * @tc.desc       : testing RegisterSystemColorModeChangeEvent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegisterSystemColorModeChangeEvent_001', 0, async (done: Function) => {
      expect(nativeFunc.testRegisterSystemColorModeChangeEvent_001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UnregisterSystemColorModeChangeEvent_0200
     * @tc.name       : testUnregisterSystemColorModeChangeEvent_002
     * @tc.desc       : testing UnregisterSystemColorModeChangeEvent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUnregisterSystemColorModeChangeEvent_002', 0, async (done: Function) => {
      expect(nativeFunc.testUnregisterSystemColorModeChangeEvent_002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RegisterSystemFontStyleChangeEvent_0300
     * @tc.name       : testRegisterSystemFontStyleChangeEvent_003
     * @tc.desc       : testing RegisterSystemFontStyleChangeEvent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRegisterSystemFontStyleChangeEvent_003', 0, async (done: Function) => {
      expect(nativeFunc.testRegisterSystemFontStyleChangeEvent_003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UnregisterSystemFontStyleChangeEvent_0400
     * @tc.name       : testUnregisterSystemFontStyleChangeEvent_004
     * @tc.desc       : testing UnregisterSystemFontStyleChangeEvent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUnregisterSystemFontStyleChangeEvent_004', 0, async (done: Function) => {
      expect(nativeFunc.testUnregisterSystemFontStyleChangeEvent_004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_SystemFontStyleEvent_GetFontSizeScale_0500
     * @tc.name       : testSystemFontStyleEvent_GetFontSizeScale_005
     * @tc.desc       : testing SystemFontStyleEvent GetFontSizeScale
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSystemFontStyleEvent_GetFontSizeScale_005', 0, async (done: Function) => {
      expect(nativeFunc.testSystemFontStyleEvent_GetFontSizeScale_005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SystemFontStyleEvent_GetFontWeightScale_0600
     * @tc.name       : testSystemFontStyleEvent_GetFontWeightScale_006
     * @tc.desc       : testing SystemFontStyleEvent GetFontWeightScale
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSystemFontStyleEvent_GetFontWeightScale_006', 0, async (done: Function) => {
      expect(nativeFunc.testSystemFontStyleEvent_GetFontWeightScale_006()).assertEqual(0)
      done()
    })
  })
}