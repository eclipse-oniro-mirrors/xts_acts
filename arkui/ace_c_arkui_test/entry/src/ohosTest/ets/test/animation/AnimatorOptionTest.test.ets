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

export default function animatorOptionTest() {

  describe('AnimatorOptionTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_0100
     * @tc.name       : testAnimatorOption001
     * @tc.desc       : testing createAnimator with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption001', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_0200
     * @tc.name       : testAnimatorOption002
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_Create with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption002', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_0300
     * @tc.name       : testAnimatorOption003
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_Dispose
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption003', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_0400
     * @tc.name       : testAnimatorOption004
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetDuration with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption004', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption004()).assertEqual(0)
      done()
    })


    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_0500
     * @tc.name       : testAnimatorOption005
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetDuration with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption005', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_0600
     * @tc.name       : testAnimatorOption006
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetDuration with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption006', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_0700
     * @tc.name       : testAnimatorOption007
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetDelay with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption007', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_0800
     * @tc.name       : testAnimatorOption008
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetDelay with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption008', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_0900
     * @tc.name       : testAnimatorOption009
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetDelay with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption009', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_1000
     * @tc.name       : testAnimatorOption010
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetIterations with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption010', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_1100
     * @tc.name       : testAnimatorOption011
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetIterations with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption011', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_1200
     * @tc.name       : testAnimatorOption012
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetIterations with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption012', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_1300
     * @tc.name       : testAnimatorOption013
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetFill with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption013', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_1400
     * @tc.name       : testAnimatorOption014
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetFill with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption014', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption014()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_1500
     * @tc.name       : testAnimatorOption015
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetFill with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption015', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption015()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_1600
     * @tc.name       : testAnimatorOption016
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetFill with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption016', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption016()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_1700
     * @tc.name       : testAnimatorOption017
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetFill with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption017', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption017()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_1800
     * @tc.name       : testAnimatorOption018
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetDirection with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption018', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption018()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_1900
     * @tc.name       : testAnimatorOption019
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetDirection with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption019', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption019()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_2000
     * @tc.name       : testAnimatorOption020
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetDirection with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption020', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption020()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_2100
     * @tc.name       : testAnimatorOption021
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetDirection with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption021', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption021()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_2200
     * @tc.name       : testAnimatorOption022
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetDirection with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption022', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption022()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_2300
     * @tc.name       : testAnimatorOption023
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetCurve with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption023', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption023()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_2400
     * @tc.name       : testAnimatorOption024
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetCurve with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption024', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption024()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_2500
     * @tc.name       : testAnimatorOption025
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetCurve with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption025', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption025()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_2600
     * @tc.name       : testAnimatorOption026
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetCurve with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption026', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption026()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_2700
     * @tc.name       : testAnimatorOption027
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetBegin with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption027', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption027()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_2800
     * @tc.name       : testAnimatorOption028
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetBegin with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption028', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption028()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_2900
     * @tc.name       : testAnimatorOption029
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetEnd with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption029', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption029()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_3000
     * @tc.name       : testAnimatorOption030
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetEnd with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption030', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption030()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_3100
     * @tc.name       : testAnimatorOption031
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetBegin and OH_ArkUI_AnimatorOption_SetEnd with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption031', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption031()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_3200
     * @tc.name       : testAnimatorOption032
     * @tc.desc       : OH_ArkUI_AnimatorOption_SetBegin and OH_ArkUI_AnimatorOption_SetEnd with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption032', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption032()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_3300
     * @tc.name       : testAnimatorOption033
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetExpectedFrameRateRange with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption033', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption033()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_3400
     * @tc.name       : testAnimatorOption034
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetExpectedFrameRateRange with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption034', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption034()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_3500
     * @tc.name       : testAnimatorOption035
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetExpectedFrameRateRange with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption035', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption035()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_3600
     * @tc.name       : testAnimatorOption036
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetKeyframe with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption036', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption036()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_3700
     * @tc.name       : testAnimatorOption037
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetKeyframe with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption037', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption037()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_3800
     * @tc.name       : testAnimatorOption038
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetKeyframe with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption038', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption038()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_3900
     * @tc.name       : testAnimatorOption039
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetKeyframe with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption039', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption039()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_4000
     * @tc.name       : testAnimatorOption040
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetKeyframeCurve with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption040', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption040()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_4100
     * @tc.name       : testAnimatorOption041
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetKeyframeCurve with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption041', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption041()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_4200
     * @tc.name       : testAnimatorOption042
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetKeyframeCurve with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption042', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption042()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_4300
     * @tc.name       : testAnimatorOption043
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetKeyframeCurve with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption043', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption043()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_4400
     * @tc.name       : testAnimatorOption044
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_SetKeyframeCurve with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption044', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption044()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_4500
     * @tc.name       : testAnimatorOption045
     * @tc.desc       : testing OH_ArkUI_AnimatorEvent_GetUserData with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption045', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption045()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_4600
     * @tc.name       : testAnimatorOption046
     * @tc.desc       : testing OH_ArkUI_AnimatorOnFrameEvent_GetUserData and OH_ArkUI_AnimatorOnFrameEvent_GetValue
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption046', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption046()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_4800
     * @tc.name       : testAnimatorOption048
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_RegisterOnFrameCallback with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption048', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption048()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_4900
     * @tc.name       : testAnimatorOption049
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_RegisterOnFrameCallback with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption049', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption049()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_5100
     * @tc.name       : testAnimatorOption051
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_RegisterOnFinishCallback with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption051', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption051()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_5200
     * @tc.name       : testAnimatorOption052
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_RegisterOnFinishCallback with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption052', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption052()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_5400
     * @tc.name       : testAnimatorOption054
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_RegisterOnCancelCallback with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption054', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption054()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_5500
     * @tc.name       : testAnimatorOption055
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_RegisterOnCancelCallback with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption055', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption055()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_5700
     * @tc.name       : testAnimatorOption057
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_RegisterOnRepeatCallback with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption057', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption057()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_5800
     * @tc.name       : testAnimatorOption058
     * @tc.desc       : testing OH_ArkUI_AnimatorOption_RegisterOnRepeatCallback with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption058', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption058()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_5900
     * @tc.name       : testAnimatorOption059
     * @tc.desc       : testing OH_ArkUI_Animator_Play with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption059', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption059()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_6000
     * @tc.name       : testAnimatorOption060
     * @tc.desc       : testing OH_ArkUI_Animator_Pause with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption060', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption060()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_6100
     * @tc.name       : testAnimatorOption061
     * @tc.desc       : testing OH_ArkUI_Animator_Finish with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption061', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption061()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_6300
     * @tc.name       : testAnimatorOption063
     * @tc.desc       : testing OH_ArkUI_Animator_Reverse with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption063', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption063()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_6400
     * @tc.name       : testAnimatorOption064
     * @tc.desc       : testing OH_ArkUI_Animator_Cancel with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption064', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption064()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_6500
     * @tc.name       : testAnimatorOption065
     * @tc.desc       : testing OH_ArkUI_Animator_ResetAnimatorOption with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption065', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption065()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_6600
     * @tc.name       : testAnimatorOption066
     * @tc.desc       : testing OH_ArkUI_Animator_ResetAnimatorOption with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption066', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption066()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATOROPTION_6700
     * @tc.name       : testAnimatorOption067
     * @tc.desc       : testing OH_ArkUI_Animator_ResetAnimatorOption with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimatorOption067', 0, async (done: Function) => {
      expect(nativeFunc.testAnimatorOption067()).assertEqual(0)
      done()
    })

  })
}