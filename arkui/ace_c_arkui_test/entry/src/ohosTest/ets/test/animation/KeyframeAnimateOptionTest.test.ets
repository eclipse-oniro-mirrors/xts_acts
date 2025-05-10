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

export default function keyframeAnimateOptionTest() {

  describe('KeyframeAnimateOptionTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_0100
     * @tc.name       : testKeyframeAnimateOption001
     * @tc.desc       : testing keyframeAnimateTo with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testKeyframeAnimateOption001', 0, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_0200
     * @tc.name       : testKeyframeAnimateOption002
     * @tc.desc       : testing keyframeAnimateTo without context
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testKeyframeAnimateOption002', 0, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_0300
     * @tc.name       : testKeyframeAnimateOption003
     * @tc.desc       : testing keyframeAnimateTo without option
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testKeyframeAnimateOption003', 0, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_0400
     * @tc.name       : testKeyframeAnimateOption004
     * @tc.desc       : testing OH_ArkUI_KeyframeAnimateOption_Create with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testKeyframeAnimateOption004', 0, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_0500
     * @tc.name       : testKeyframeAnimateOption005
     * @tc.desc       : testing OH_ArkUI_KeyframeAnimateOption_Dispose
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testKeyframeAnimateOption005', 0, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_0600
     * @tc.name       : testKeyframeAnimateOption006
     * @tc.desc       : testing OH_ArkUI_KeyframeAnimateOption_SetDelay with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testKeyframeAnimateOption006', 0, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_0700
     * @tc.name       : testKeyframeAnimateOption007
     * @tc.desc       : testing OH_ArkUI_KeyframeAnimateOption_SetDelay with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testKeyframeAnimateOption007', 0, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_0800
     * @tc.name       : testKeyframeAnimateOption008
     * @tc.desc       : testing OH_ArkUI_KeyframeAnimateOption_SetDelay with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testKeyframeAnimateOption008', 0, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_0900
     * @tc.name       : testKeyframeAnimateOption009
     * @tc.desc       : testing OH_ArkUI_KeyframeAnimateOption_SetIterations with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testKeyframeAnimateOption009', 0, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_1000
     * @tc.name       : testKeyframeAnimateOption010
     * @tc.desc       : testing OH_ArkUI_KeyframeAnimateOption_SetIterations with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testKeyframeAnimateOption010', 0, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_1100
     * @tc.name       : testKeyframeAnimateOption011
     * @tc.desc       : testing OH_ArkUI_KeyframeAnimateOption_SetIterations with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testKeyframeAnimateOption011', 0, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_1300
     * @tc.name       : testKeyframeAnimateOption013
     * @tc.desc       : testing OH_ArkUI_KeyframeAnimateOption_RegisterOnFinishCallback with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testKeyframeAnimateOption013', 0, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_1400
     * @tc.name       : testKeyframeAnimateOption014
     * @tc.desc       : testing OH_ArkUI_KeyframeAnimateOption_SetDuration with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testKeyframeAnimateOption014', 0, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption014()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_1500
     * @tc.name       : testKeyframeAnimateOption015
     * @tc.desc       : testing OH_ArkUI_KeyframeAnimateOption_SetDuration with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testKeyframeAnimateOption015', 0, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption015()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_1600
     * @tc.name       : testKeyframeAnimateOption016
     * @tc.desc       : testing OH_ArkUI_KeyframeAnimateOption_SetDuration with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testKeyframeAnimateOption016', 0, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption016()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_1700
     * @tc.name       : testKeyframeAnimateOption017
     * @tc.desc       : testing OH_ArkUI_KeyframeAnimateOption_SetDuration with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testKeyframeAnimateOption017', 0, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption017()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_1800
     * @tc.name       : testKeyframeAnimateOption018
     * @tc.desc       : testing OH_ArkUI_KeyframeAnimateOption_GetDuration with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testKeyframeAnimateOption018', 0, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption018()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_1900
     * @tc.name       : testKeyframeAnimateOption019
     * @tc.desc       : testing OH_ArkUI_KeyframeAnimateOption_SetCurve with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testKeyframeAnimateOption019', 0, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption019()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_2000
     * @tc.name       : testKeyframeAnimateOption020
     * @tc.desc       : testing OH_ArkUI_KeyframeAnimateOption_SetCurve with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testKeyframeAnimateOption020', 0, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption020()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_2100
     * @tc.name       : testKeyframeAnimateOption021
     * @tc.desc       : testing OH_ArkUI_KeyframeAnimateOption_SetCurve with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testKeyframeAnimateOption021', 0, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption021()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_2200
     * @tc.name       : testKeyframeAnimateOption022
     * @tc.desc       : testing OH_ArkUI_KeyframeAnimateOption_SetCurve with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testKeyframeAnimateOption022', 0, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption022()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_2400
     * @tc.name       : testKeyframeAnimateOption024
     * @tc.desc       : testing OH_ArkUI_KeyframeAnimateOption_RegisterOnEventCallback with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testKeyframeAnimateOption024', 0, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption024()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_2500
     * @tc.name       : testKeyframeAnimateOption025
     * @tc.desc       : testing OH_ArkUI_KeyframeAnimateOption_RegisterOnEventCallback with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testKeyframeAnimateOption025', 0, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption025()).assertEqual(0)
      done()
    })

  })
}