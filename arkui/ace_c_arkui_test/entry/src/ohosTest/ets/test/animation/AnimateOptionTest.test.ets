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

export default function animateOptionTest() {

  describe('AnimateOptionTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_0200
     * @tc.name       : testAnimateOption002
     * @tc.desc       : testing animateTo without context
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption002', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_0300
     * @tc.name       : testAnimateOption003
     * @tc.desc       : testing animateTo without option
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption003', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_0400
     * @tc.name       : testAnimateOption004
     * @tc.desc       : testing OH_ArkUI_AnimateOption_Dispose
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption004', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption004()).assertEqual(0)
      done()
    })


    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_0500
     * @tc.name       : testAnimateOption005
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetDuration with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption005', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_0600
     * @tc.name       : testAnimateOption006
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetDuration with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption006', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_0700
     * @tc.name       : testAnimateOption007
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetTempo with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption007', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_0800
     * @tc.name       : testAnimateOption008
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetTempo with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption008', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_0900
     * @tc.name       : testAnimateOption009
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetCurve with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption009', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_1000
     * @tc.name       : testAnimateOption010
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetCurve with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption010', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_1100
     * @tc.name       : testAnimateOption011
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetCurve with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption011', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_1200
     * @tc.name       : testAnimateOption012
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetCurve with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption012', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_1300
     * @tc.name       : testAnimateOption013
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetCurve with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption013', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_1400
     * @tc.name       : testAnimateOption014
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetCurve with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption014', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption014()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_1500
     * @tc.name       : testAnimateOption015
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetCurve with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption015', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption015()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_1600
     * @tc.name       : testAnimateOption016
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetCurve with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption016', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption016()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_1700
     * @tc.name       : testAnimateOption017
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetCurve with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption017', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption017()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_1800
     * @tc.name       : testAnimateOption018
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetCurve with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption018', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption018()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_1900
     * @tc.name       : testAnimateOption019
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetCurve with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption019', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption019()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_2000
     * @tc.name       : testAnimateOption020
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetCurve with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption020', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption020()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_2100
     * @tc.name       : testAnimateOption021
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetCurve with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption021', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption021()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_2200
     * @tc.name       : testAnimateOption022
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetDelay with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption022', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption022()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_2300
     * @tc.name       : testAnimateOption023
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetDelay with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption023', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption023()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_2400
     * @tc.name       : testAnimateOption024
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetIterations with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption024', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption024()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_2500
     * @tc.name       : testAnimateOption025
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetIterations with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption025', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption025()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_2600
     * @tc.name       : testAnimateOption026
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetPlayMode with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption026', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption026()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_2700
     * @tc.name       : testAnimateOption027
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetPlayMode with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption027', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption027()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_2800
     * @tc.name       : testAnimateOption028
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetPlayMode with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption028', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption028()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_2900
     * @tc.name       : testAnimateOption029
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetPlayMode with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption029', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption029()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_3000
     * @tc.name       : testAnimateOption030
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetExpectedFrameRateRange with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption030', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption030()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_3100
     * @tc.name       : testAnimateOption031
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetExpectedFrameRateRange with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption031', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption031()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_3200
     * @tc.name       : testAnimateOption032
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetExpectedFrameRateRange with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption032', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption032()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_3300
     * @tc.name       : testAnimateOption033
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetExpectedFrameRateRange with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption033', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption033()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_3400
     * @tc.name       : testAnimateOption034
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetExpectedFrameRateRange with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption034', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption034()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_3500
     * @tc.name       : testAnimateOption035
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetICurve with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption035', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption035()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_3600
     * @tc.name       : testAnimateOption036
     * @tc.desc       : testing OH_ArkUI_AnimateOption_SetICurve with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption036', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption036()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_3700
     * @tc.name       : testAnimateOption037
     * @tc.desc       : testing OH_ArkUI_AnimateOption_GetDuration with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption037', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption037()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_3800
     * @tc.name       : testAnimateOption038
     * @tc.desc       : testing OH_ArkUI_AnimateOption_GetTempo with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption038', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption038()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_3900
     * @tc.name       : testAnimateOption039
     * @tc.desc       : testing OH_ArkUI_AnimateOption_GetCurve with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption039', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption039()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_4000
     * @tc.name       : testAnimateOption040
     * @tc.desc       : testing OH_ArkUI_AnimateOption_GetDelay with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption040', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption040()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_4100
     * @tc.name       : testAnimateOption041
     * @tc.desc       : testing OH_ArkUI_AnimateOption_GetIterations with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption041', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption041()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_4200
     * @tc.name       : testAnimateOption042
     * @tc.desc       : testing OH_ArkUI_AnimateOption_GetPlayMode with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption042', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption042()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATEOPTION_4300
     * @tc.name       : testAnimateOption043
     * @tc.desc       : testing OH_ArkUI_AnimateOption_GetExpectedFrameRateRange with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateOption043', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateOption043()).assertEqual(0)
      done()
    })

  })
}