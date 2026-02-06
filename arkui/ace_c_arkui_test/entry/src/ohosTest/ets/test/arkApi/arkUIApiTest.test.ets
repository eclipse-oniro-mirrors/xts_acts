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

export default function testArkUI() {

  describe('testArkUI', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testArkUI001
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0100
     * @tc.desc   testing OH_NativeXComponent_SetNeedSoftKeyboard
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArkUI002
     * @tc.number SUB_ARKUI_CAPI_testArkUI_0200
     * @tc.desc   testing OH_NativeXComponent_RegisterSurfaceShowCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArkUI003
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0300
     * @tc.desc   testing OH_NativeXComponent_RegisterSurfaceHideCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArkUI004
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0400
     * @tc.desc   testing OH_NativeXComponent_RegisterOnTouchInterceptCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArkUI005
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0500
     * @tc.desc   testing OH_NativeXComponent_GetTouchEventSourceType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArkUI006
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_LayoutConstraint_Copy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArkUI007
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_LayoutConstraint_Create OH_ArkUI_LayoutConstraint_Dispose OH_ArkUI_LayoutConstraint_Copy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI007()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI008
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_LayoutConstraint_Create OH_ArkUI_LayoutConstraint_Copy OH_ArkUI_LayoutConstraint_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI008()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI009
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_NodeCustomEvent_GetLayoutConstraintInMeasure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI009()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI010
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_NodeCustomEvent_GetPositionInLayout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI010()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI011
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_NodeCustomEvent_GetDrawContextInDraw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI011()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI012
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_Create OH_ArkUI_GuidelineOption_SetId OH_ArkUI_GuidelineOption_GetId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI012()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI013
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetDirection OH_ArkUI_GuidelineOption_GetDirection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI013()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArkUI014
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionStart OH_ArkUI_GuidelineOption_GetPositionStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI014()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI015
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI015()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI016
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI016()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI017
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI017()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI018
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI018', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI018()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI019
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI019', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI019()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI020
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI020', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI020()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI021
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI021', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI021()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI022
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI022', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI022()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI024
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI024', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI024()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI025
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI025', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI025()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI026
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI026', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI026()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI028
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI028', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI028()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI029
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI029', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI029()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI030
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI030', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI030()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI031
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI031', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI031()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI032
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI032', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI032()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI033
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI033', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI033()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI034
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI034', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI034()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI035
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI035', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI035()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI036
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI036', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI036()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI037
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI037', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI037()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI038
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI038', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI038()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI039
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI039', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI039()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI040
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI040', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI040()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI041
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI041', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI041()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI042
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI042', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI042()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI043
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI043', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI043()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI044
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI044', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI044()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI045
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI045', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI045()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI046
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI046', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI046()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI047
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI047', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI047()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI048
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI048', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI048()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI049
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI049', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI049()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI050
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI050', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI050()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI051
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI051', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI051()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI054
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI054', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI054()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI055
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI055', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI055()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI056
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI056', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI056()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI057
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI057', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI057()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI058
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI058', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI058()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI059
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI059', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI059()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI060
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI060', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI060()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI061
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI061', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI061()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI062
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI062', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI062()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI063
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI063', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI063()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI064
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI064', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI064()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI065
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI065', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI065()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI066
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI066', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI066()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI067
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI067', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI067()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI068
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI068', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI068()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI069
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI069', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI069()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI070
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI070', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI070()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI071
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI071', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI071()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI072
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI072', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI072()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI073
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI073', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI073()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI074
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI074', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI074()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI075
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI075', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI075()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI076
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI076', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI076()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI077
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI077', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI077()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI078
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI078', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI078()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI079
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI079', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI079()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI080
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI080', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI080()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI081
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI081', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI081()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI082
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI082', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI082()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI083
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI083', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI083()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI084
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI084', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI084()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI085
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI085', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI085()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI086
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI086', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI086()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI087
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI087', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI087()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI088
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI088', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI088()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI089
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI089', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI089()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI090
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI090', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI090()).assertEqual(0)
      done()
    })
    /**
     * @tc.name   testArkUI091
     * @tc.number SUB_ARKUI_CAPI_TESTARKUI_0600
     * @tc.desc   testing OH_ArkUI_GuidelineOption_SetPositionEnd OH_ArkUI_GuidelineOption_GetPositionEnd OH_ArkUI_GuidelineOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkUI091', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArkUI091()).assertEqual(0)
      done()
    })
  })
}
