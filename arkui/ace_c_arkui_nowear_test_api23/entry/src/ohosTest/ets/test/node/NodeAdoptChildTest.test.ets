/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

export default function NodeAdoptChildTest(){

  describe('NodeAdoptChildTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   NodeAdoptChildTest_001
     * @tc.number NodeAdoptChildTest_001
     * @tc.desc   NodeAdoptChildTest_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_002
     * @tc.number NodeAdoptChildTest_002
     * @tc.desc   NodeAdoptChildTest_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_003
     * @tc.number NodeAdoptChildTest_003
     * @tc.desc   NodeAdoptChildTest_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_004
     * @tc.number NodeAdoptChildTest_004
     * @tc.desc   NodeAdoptChildTest_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_005
     * @tc.number NodeAdoptChildTest_005
     * @tc.desc   NodeAdoptChildTest_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_006
     * @tc.number NodeAdoptChildTest_006
     * @tc.desc   NodeAdoptChildTest_006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_007
     * @tc.number NodeAdoptChildTest_007
     * @tc.desc   NodeAdoptChildTest_007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_008
     * @tc.number NodeAdoptChildTest_008
     * @tc.desc   NodeAdoptChildTest_008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_009
     * @tc.number NodeAdoptChildTest_009
     * @tc.desc   NodeAdoptChildTest_009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_010
     * @tc.number NodeAdoptChildTest_010
     * @tc.desc   NodeAdoptChildTest_010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_011
     * @tc.number NodeAdoptChildTest_011
     * @tc.desc   NodeAdoptChildTest_011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_012
     * @tc.number NodeAdoptChildTest_012
     * @tc.desc   NodeAdoptChildTest_012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_013
     * @tc.number NodeAdoptChildTest_013
     * @tc.desc   NodeAdoptChildTest_013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild013()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_014
     * @tc.number NodeAdoptChildTest_014
     * @tc.desc   NodeAdoptChildTest_014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild014()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_015
     * @tc.number NodeAdoptChildTest_015
     * @tc.desc   NodeAdoptChildTest_015
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild015()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_016
     * @tc.number NodeAdoptChildTest_016
     * @tc.desc   NodeAdoptChildTest_016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild016()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_017
     * @tc.number NodeAdoptChildTest_017
     * @tc.desc   NodeAdoptChildTest_017
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild017()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_018
     * @tc.number NodeAdoptChildTest_018
     * @tc.desc   NodeAdoptChildTest_018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_018', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild018()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_019
     * @tc.number NodeAdoptChildTest_019
     * @tc.desc   NodeAdoptChildTest_019
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_019', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild019()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_020
     * @tc.number NodeAdoptChildTest_020
     * @tc.desc   NodeAdoptChildTest_020
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_020', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild020()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_021
     * @tc.number NodeAdoptChildTest_021
     * @tc.desc   NodeAdoptChildTest_021
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_021', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild021()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_022
     * @tc.number NodeAdoptChildTest_022
     * @tc.desc   NodeAdoptChildTest_022
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_022', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild022()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_023
     * @tc.number NodeAdoptChildTest_023
     * @tc.desc   NodeAdoptChildTest_023
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_023', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild023()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_024
     * @tc.number NodeAdoptChildTest_024
     * @tc.desc   NodeAdoptChildTest_024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_024', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild024()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_025
     * @tc.number NodeAdoptChildTest_025
     * @tc.desc   NodeAdoptChildTest_025
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_025', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild025()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_026
     * @tc.number NodeAdoptChildTest_026
     * @tc.desc   NodeAdoptChildTest_026
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_026', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild026()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_027
     * @tc.number NodeAdoptChildTest_027
     * @tc.desc   NodeAdoptChildTest_027
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_027', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild027()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_028
     * @tc.number NodeAdoptChildTest_028
     * @tc.desc   NodeAdoptChildTest_028
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_028', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild028()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_029
     * @tc.number NodeAdoptChildTest_029
     * @tc.desc   NodeAdoptChildTest_029
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_029', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild029()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_030
     * @tc.number NodeAdoptChildTest_030
     * @tc.desc   NodeAdoptChildTest_030
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_030', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild030()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_031
     * @tc.number NodeAdoptChildTest_031
     * @tc.desc   NodeAdoptChildTest_031
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_031', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild031()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_032
     * @tc.number NodeAdoptChildTest_032
     * @tc.desc   NodeAdoptChildTest_032
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_032', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild032()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_033
     * @tc.number NodeAdoptChildTest_033
     * @tc.desc   NodeAdoptChildTest_033
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_033', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild033()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_034
     * @tc.number NodeAdoptChildTest_034
     * @tc.desc   NodeAdoptChildTest_034
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_034', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild034()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_035
     * @tc.number NodeAdoptChildTest_035
     * @tc.desc   NodeAdoptChildTest_035
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_035', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild035()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_036
     * @tc.number NodeAdoptChildTest_036
     * @tc.desc   NodeAdoptChildTest_036
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_036', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild036()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_037
     * @tc.number NodeAdoptChildTest_037
     * @tc.desc   NodeAdoptChildTest_037
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_037', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild037()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_038
     * @tc.number NodeAdoptChildTest_038
     * @tc.desc   NodeAdoptChildTest_038
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_038', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild038()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_039
     * @tc.number NodeAdoptChildTest_039
     * @tc.desc   NodeAdoptChildTest_039
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_039', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild039()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_040
     * @tc.number NodeAdoptChildTest_040
     * @tc.desc   NodeAdoptChildTest_040
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_040', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild040()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_041
     * @tc.number NodeAdoptChildTest_041
     * @tc.desc   NodeAdoptChildTest_041
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_041', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild041()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_042
     * @tc.number NodeAdoptChildTest_042
     * @tc.desc   NodeAdoptChildTest_042
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_042', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild042()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_043
     * @tc.number NodeAdoptChildTest_043
     * @tc.desc   NodeAdoptChildTest_043
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_043', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild043()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_044
     * @tc.number NodeAdoptChildTest_044
     * @tc.desc   NodeAdoptChildTest_044
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_044', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild044()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_045
     * @tc.number NodeAdoptChildTest_045
     * @tc.desc   NodeAdoptChildTest_045
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_045', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild045()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_046
     * @tc.number NodeAdoptChildTest_046
     * @tc.desc   NodeAdoptChildTest_046
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_046', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild046()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_047
     * @tc.number NodeAdoptChildTest_047
     * @tc.desc   NodeAdoptChildTest_047
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_047', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild047()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_048
     * @tc.number NodeAdoptChildTest_048
     * @tc.desc   NodeAdoptChildTest_048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_048', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild048()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_049
     * @tc.number NodeAdoptChildTest_049
     * @tc.desc   NodeAdoptChildTest_049
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_049', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild049()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_050
     * @tc.number NodeAdoptChildTest_050
     * @tc.desc   NodeAdoptChildTest_050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_050', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild050()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_051
     * @tc.number NodeAdoptChildTest_051
     * @tc.desc   NodeAdoptChildTest_051
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_051', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild051()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_052
     * @tc.number NodeAdoptChildTest_052
     * @tc.desc   NodeAdoptChildTest_052
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_052', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild052()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_053
     * @tc.number NodeAdoptChildTest_053
     * @tc.desc   NodeAdoptChildTest_053
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_053', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild053()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_054
     * @tc.number NodeAdoptChildTest_054
     * @tc.desc   NodeAdoptChildTest_054
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_054', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild054()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_055
     * @tc.number NodeAdoptChildTest_055
     * @tc.desc   NodeAdoptChildTest_055
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_055', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild055()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_056
     * @tc.number NodeAdoptChildTest_056
     * @tc.desc   NodeAdoptChildTest_056
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_056', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild056()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_057
     * @tc.number NodeAdoptChildTest_057
     * @tc.desc   NodeAdoptChildTest_057
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_057', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild057()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_058
     * @tc.number NodeAdoptChildTest_058
     * @tc.desc   NodeAdoptChildTest_058
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_058', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild058()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_059
     * @tc.number NodeAdoptChildTest_059
     * @tc.desc   NodeAdoptChildTest_059
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_059', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild059()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_060
     * @tc.number NodeAdoptChildTest_060
     * @tc.desc   NodeAdoptChildTest_060
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_060', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild060()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_061
     * @tc.number NodeAdoptChildTest_061
     * @tc.desc   NodeAdoptChildTest_061
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_061', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild061()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_062
     * @tc.number NodeAdoptChildTest_062
     * @tc.desc   NodeAdoptChildTest_062
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_062', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild062()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_063
     * @tc.number NodeAdoptChildTest_063
     * @tc.desc   NodeAdoptChildTest_063
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_063', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild063()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_064
     * @tc.number NodeAdoptChildTest_064
     * @tc.desc   NodeAdoptChildTest_064
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_064', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild064()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_065
     * @tc.number NodeAdoptChildTest_065
     * @tc.desc   NodeAdoptChildTest_065
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_065', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild065()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_066
     * @tc.number NodeAdoptChildTest_066
     * @tc.desc   NodeAdoptChildTest_066
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_066', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild066()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_067
     * @tc.number NodeAdoptChildTest_067
     * @tc.desc   NodeAdoptChildTest_067
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_067', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild067()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   NodeAdoptChildTest_068
     * @tc.number NodeAdoptChildTest_068
     * @tc.desc   NodeAdoptChildTest_068
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NodeAdoptChildTest_068', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChild068()).assertEqual(0)
      done()
    })
  })
}