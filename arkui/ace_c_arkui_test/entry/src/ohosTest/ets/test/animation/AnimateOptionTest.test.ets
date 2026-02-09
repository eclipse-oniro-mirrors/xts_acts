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

export default function animateOptionTest() {

  describe('AnimateOptionTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testAnimateOption002
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_0200
     * @tc.desc   testing animateTo without context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption003
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_0300
     * @tc.desc   testing animateTo without option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption004
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_0400
     * @tc.desc   testing OH_ArkUI_AnimateOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption004()).assertEqual(0)
      done()
    })


    /**
     * @tc.name   testAnimateOption005
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_0500
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetDuration with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption006
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_0600
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetDuration with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption007
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_0700
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetTempo with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption008
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_0800
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetTempo with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption009
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_0900
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetCurve with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption010
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_1000
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetCurve with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption011
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_1100
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetCurve with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption012
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_1200
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetCurve with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption013
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_1300
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetCurve with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption013()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption014
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_1400
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetCurve with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption014()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption015
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_1500
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetCurve with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption015()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption016
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_1600
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetCurve with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption016()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption017
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_1700
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetCurve with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption017()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption018
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_1800
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetCurve with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption018', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption018()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption019
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_1900
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetCurve with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption019', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption019()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption020
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_2000
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetCurve with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption020', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption020()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption021
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_2100
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetCurve with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption021', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption021()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption022
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_2200
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetDelay with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption022', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption022()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption023
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_2300
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetDelay with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption023', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption023()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption024
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_2400
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetIterations with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption024', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption024()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption025
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_2500
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetIterations with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption025', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption025()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption026
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_2600
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetPlayMode with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption026', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption026()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption027
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_2700
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetPlayMode with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption027', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption027()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption028
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_2800
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetPlayMode with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption028', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption028()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption029
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_2900
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetPlayMode with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption029', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption029()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption030
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_3000
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetExpectedFrameRateRange with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption030', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption030()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption031
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_3100
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetExpectedFrameRateRange with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption031', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption031()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption032
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_3200
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetExpectedFrameRateRange with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption032', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption032()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption033
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_3300
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetExpectedFrameRateRange with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption033', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption033()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption034
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_3400
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetExpectedFrameRateRange with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption034', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption034()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption035
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_3500
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetICurve with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption035', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption035()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption036
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_3600
     * @tc.desc   testing OH_ArkUI_AnimateOption_SetICurve with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption036', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption036()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption037
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_3700
     * @tc.desc   testing OH_ArkUI_AnimateOption_GetDuration with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption037', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption037()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption038
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_3800
     * @tc.desc   testing OH_ArkUI_AnimateOption_GetTempo with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption038', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption038()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption039
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_3900
     * @tc.desc   testing OH_ArkUI_AnimateOption_GetCurve with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption039', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption039()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption040
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_4000
     * @tc.desc   testing OH_ArkUI_AnimateOption_GetDelay with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption040', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption040()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption041
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_4100
     * @tc.desc   testing OH_ArkUI_AnimateOption_GetIterations with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption041', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption041()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption042
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_4200
     * @tc.desc   testing OH_ArkUI_AnimateOption_GetPlayMode with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption042', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption042()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateOption043
     * @tc.number SUB_ARKUI_CAPI_ANIMATEOPTION_4300
     * @tc.desc   testing OH_ArkUI_AnimateOption_GetExpectedFrameRateRange with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateOption043', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateOption043()).assertEqual(0)
      done()
    })

  })
}