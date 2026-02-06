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

export default function TestArkUIAddApi() {

  describe('TestArkUIAddApi', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NativeXComponent_0100
     * @tc.name       : TestArkUIAddApi001
     * @tc.desc       : testing OH_NativeXComponent_RegisterUIInputEventCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_0200
     * @tc.name       : TestArkUIAddApi002
     * @tc.desc       : testing OH_ArkUI_UIInputEvent_GetType
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_0300
     * @tc.name       : TestArkUIAddApi003
     * @tc.desc       : testing OH_ArkUI_UIInputEvent_GetEventTime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_0400
     * @tc.name       : TestArkUIAddApi004
     * @tc.desc       : testing OH_ArkUI_PointerEvent_GetX
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_0500
     * @tc.name       : TestArkUIAddApi005
     * @tc.desc       : testing OH_ArkUI_PointerEvent_GetY
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_0600
     * @tc.name       : TestArkUIAddApi006
     * @tc.desc       : testing OH_ArkUI_PointerEvent_GetWindowX
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_0700
     * @tc.name       : TestArkUIAddApi007
     * @tc.desc       : testing OH_ArkUI Api
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_0800
     * @tc.name       : TestArkUIAddApi008
     * @tc.desc       : testing OH_ArkUI Api
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_0900
     * @tc.name       : TestArkUIAddApi009
     * @tc.desc       : testing OH_ArkUI Api
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_1000
     * @tc.name       : TestArkUIAddApi010
     * @tc.desc       : testing OH_ArkUI Api
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_1100
     * @tc.name       : TestArkUIAddApi011
     * @tc.desc       : testing OH_ArkUI Api
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_1200
     * @tc.name       : TestArkUIAddApi012
     * @tc.desc       : testing OH_ArkUI Api
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_13000
     * @tc.name       : TestArkUIAddApi013
     * @tc.desc       : testing OH_ArkUI Api
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_1400
     * @tc.name       : TestArkUIAddApi014
     * @tc.desc       : testing OH_ArkUI Api
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi014()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_1500
     * @tc.name       : TestArkUIAddApi015
     * @tc.desc       : testing OH_ArkUI Api
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi015()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_1600
     * @tc.name       : TestArkUIAddApi016
     * @tc.desc       : testing OH_ArkUI Api
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi016()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_1700
     * @tc.name       : TestArkUIAddApi017
     * @tc.desc       : testing OH_ArkUI Api
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi017()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_1800
     * @tc.name       : TestArkUIAddApi018
     * @tc.desc       : testing OH_ArkUI Api
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi018', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi018()).assertEqual(0)
      done()
    })



    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_1900
     * @tc.name       : TestArkUIAddApi019
     * @tc.desc       : testing OH_ArkUI Api
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi019', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi019()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_2000
     * @tc.name       : TestArkUIAddApi020
     * @tc.desc       : testing OH_ArkUI Api
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi020', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi020()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_2100
     * @tc.name       : TestArkUIAddApi021
     * @tc.desc       : testing OH_ArkUI Api
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi021', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi021()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_2200
     * @tc.name       : TestArkUIAddApi022
     * @tc.desc       : testing OH_ArkUI Api
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi022', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi022()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_2300
     * @tc.name       : TestArkUIAddApi023
     * @tc.desc       : testing OH_ArkUI Api
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi023', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi023()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_UIInputEvent_2400
     * @tc.name       : TestArkUIAddApi024
     * @tc.desc       : testing OH_ArkUI Api
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('TestArkUIAddApi024', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestArkUIAddApi024()).assertEqual(0)
      done()
    })



  })
}
