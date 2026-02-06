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

export default function RenderNodeTest(){

  describe('RenderNodeTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   RenderNodeErrorCode001
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_001
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode001()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode002
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_002
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode002()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode003
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_003
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode003()).assertEqual(0)
      done();
    })


    /**
     * @tc.name   RenderNodeErrorCode004
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_004
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode004()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode005
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_005
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode005()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode006
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_006
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode006()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode007
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_007
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode007()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode008
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_008
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode008()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode009
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_009
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode009()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode010
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_010
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode010()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode011
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_011
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode011()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode012
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_012
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode012()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode013
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_013
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode013()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode014
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_014
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode014()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode015
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_015
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode015()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode016
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_016
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode016()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode017
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_017
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode017()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode018
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_018
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode018', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode018()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode019
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_019
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode019', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode019()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode020
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_020
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode020', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode020()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode021
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_021
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode021', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode021()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode022
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_022
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode022', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode022()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode023
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_023
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode023', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode023()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode024
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_024
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode024', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode024()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode025
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_025
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode025', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode025()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode026
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_026
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode026', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode026()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode027
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_027
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode027', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode027()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode028
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_028
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode028', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode014()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode029
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_029
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode029', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode029()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode030
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_030
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode030', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode030()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode031
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_031
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode031', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode031()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode032
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_032
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode032', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode032()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode033
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_033
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode033', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode033()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode034
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_034
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode034', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode034()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode035
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_035
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode035', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode035()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode036
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_036
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode036', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode036()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode037
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_037
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode037', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode037()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode038
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_038
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode038', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode038()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode039
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_039
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode039', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode039()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode040
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_040
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode040', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode040()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode041
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_041
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode041', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode041()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode042
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_042
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode042', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode042()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode043
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_043
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode043', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode043()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode044
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_044
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode044', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode044()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode045
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_045
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode045', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode045()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode046
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_046
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode046', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode046()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode047
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_047
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode047', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode047()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode048
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_048
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode048', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode048()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode049
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_049
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode049', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode049()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode050
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_050
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode050', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode050()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode051
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_051
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode051', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode051()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode052
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_052
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode052', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode052()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode053
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_053
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode053', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode053()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode054
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_054
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode054', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode054()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode055
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_055
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode055', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode055()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeErrorCode060
     * @tc.number SUB_ARKUI_CAPI_RenderNodeErrorCode_060
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeErrorCode060', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeErrorCode060()).assertEqual(0)
      done();
    })


    /**
     * @tc.name   RenderNodeNullTest001
     * @tc.number SUB_ARKUI_CAPI_RenderNodeNullTest_001
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeNullTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeNullTest001()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   RenderNodeNullTest002
     * @tc.number SUB_ARKUI_CAPI_RenderNodeNullTest_002
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RenderNodeNullTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeNullTest002()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testRenderNode001
     * @tc.number SUB_ARKUI_CAPI_testRenderNode_0100
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRenderNode001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestRenderNode001()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testRenderNode009
     * @tc.number SUB_ARKUI_CAPI_testRenderNode_0900
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRenderNode009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestRenderNode009()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testRenderNode002
     * @tc.number SUB_ARKUI_CAPI_testRenderNode_0200
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRenderNode002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestRenderNode002()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testRenderNode003
     * @tc.number SUB_ARKUI_CAPI_testRenderNode_0300
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRenderNode003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestRenderNode003()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testRenderNode004
     * @tc.number SUB_ARKUI_CAPI_testRenderNode_0400
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRenderNode004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestRenderNode004()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testRenderNode005
     * @tc.number SUB_ARKUI_CAPI_testRenderNode_0500
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRenderNode005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestRenderNode005()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testRenderNode006
     * @tc.number SUB_ARKUI_CAPI_testRenderNode_0600
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRenderNode006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestRenderNode006()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testRenderNode007
     * @tc.number SUB_ARKUI_CAPI_testRenderNode_0700
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRenderNode007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestRenderNode007()).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testRenderNode008
     * @tc.number SUB_ARKUI_CAPI_testRenderNode_0800
     * @tc.desc   Test InitModuleForArkTSEnv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRenderNode008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestRenderNode008()).assertEqual(0)
      done();
    })    
  })
}