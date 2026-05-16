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

export default function keyframeAnimateOptionTest() {

  describe('KeyframeAnimateOptionTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testKeyframeAnimateOption001
     * @tc.number SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_0100
     * @tc.desc   testing keyframeAnimateTo with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyframeAnimateOption001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testKeyframeAnimateOption002
     * @tc.number SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_0200
     * @tc.desc   testing keyframeAnimateTo without context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyframeAnimateOption002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testKeyframeAnimateOption003
     * @tc.number SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_0300
     * @tc.desc   testing keyframeAnimateTo without option
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyframeAnimateOption003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testKeyframeAnimateOption004
     * @tc.number SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_0400
     * @tc.desc   testing OH_ArkUI_KeyframeAnimateOption_Create with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyframeAnimateOption004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testKeyframeAnimateOption005
     * @tc.number SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_0500
     * @tc.desc   testing OH_ArkUI_KeyframeAnimateOption_Dispose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyframeAnimateOption005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testKeyframeAnimateOption006
     * @tc.number SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_0600
     * @tc.desc   testing OH_ArkUI_KeyframeAnimateOption_SetDelay with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyframeAnimateOption006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testKeyframeAnimateOption007
     * @tc.number SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_0700
     * @tc.desc   testing OH_ArkUI_KeyframeAnimateOption_SetDelay with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyframeAnimateOption007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testKeyframeAnimateOption008
     * @tc.number SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_0800
     * @tc.desc   testing OH_ArkUI_KeyframeAnimateOption_SetDelay with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyframeAnimateOption008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testKeyframeAnimateOption009
     * @tc.number SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_0900
     * @tc.desc   testing OH_ArkUI_KeyframeAnimateOption_SetIterations with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyframeAnimateOption009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testKeyframeAnimateOption010
     * @tc.number SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_1000
     * @tc.desc   testing OH_ArkUI_KeyframeAnimateOption_SetIterations with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyframeAnimateOption010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testKeyframeAnimateOption011
     * @tc.number SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_1100
     * @tc.desc   testing OH_ArkUI_KeyframeAnimateOption_SetIterations with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyframeAnimateOption011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testKeyframeAnimateOption013
     * @tc.number SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_1300
     * @tc.desc   testing OH_ArkUI_KeyframeAnimateOption_RegisterOnFinishCallback with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyframeAnimateOption013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption013()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testKeyframeAnimateOption014
     * @tc.number SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_1400
     * @tc.desc   testing OH_ArkUI_KeyframeAnimateOption_SetDuration with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyframeAnimateOption014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption014()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testKeyframeAnimateOption015
     * @tc.number SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_1500
     * @tc.desc   testing OH_ArkUI_KeyframeAnimateOption_SetDuration with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyframeAnimateOption015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption015()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testKeyframeAnimateOption016
     * @tc.number SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_1600
     * @tc.desc   testing OH_ArkUI_KeyframeAnimateOption_SetDuration with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyframeAnimateOption016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption016()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testKeyframeAnimateOption017
     * @tc.number SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_1700
     * @tc.desc   testing OH_ArkUI_KeyframeAnimateOption_SetDuration with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyframeAnimateOption017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption017()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testKeyframeAnimateOption018
     * @tc.number SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_1800
     * @tc.desc   testing OH_ArkUI_KeyframeAnimateOption_GetDuration with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyframeAnimateOption018', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption018()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testKeyframeAnimateOption019
     * @tc.number SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_1900
     * @tc.desc   testing OH_ArkUI_KeyframeAnimateOption_SetCurve with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyframeAnimateOption019', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption019()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testKeyframeAnimateOption020
     * @tc.number SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_2000
     * @tc.desc   testing OH_ArkUI_KeyframeAnimateOption_SetCurve with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyframeAnimateOption020', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption020()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testKeyframeAnimateOption021
     * @tc.number SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_2100
     * @tc.desc   testing OH_ArkUI_KeyframeAnimateOption_SetCurve with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyframeAnimateOption021', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption021()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testKeyframeAnimateOption022
     * @tc.number SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_2200
     * @tc.desc   testing OH_ArkUI_KeyframeAnimateOption_SetCurve with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyframeAnimateOption022', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption022()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testKeyframeAnimateOption024
     * @tc.number SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_2400
     * @tc.desc   testing OH_ArkUI_KeyframeAnimateOption_RegisterOnEventCallback with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyframeAnimateOption024', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption024()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testKeyframeAnimateOption025
     * @tc.number SUB_ARKUI_CAPI_KEYFRAMEANIMATEOPTION_2500
     * @tc.desc   testing OH_ArkUI_KeyframeAnimateOption_RegisterOnEventCallback with nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyframeAnimateOption025', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testKeyframeAnimateOption025()).assertEqual(0)
      done()
    })

  })
}