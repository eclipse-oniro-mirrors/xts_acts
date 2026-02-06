'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, Level,beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import {LibUtil} from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'
let libUtil:LibUtil = new LibUtil();

export default function customComponentBlendModeTest() {

  describe('CustomComponentBlendModeTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomComponentBlendMode001
     * @tc.name     testCustomComponentBlendMode001
     * @tc.desc     testCustomComponentBlendMode001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode002
     * @tc.name     testCustomComponentBlendMode002
     * @tc.desc     testCustomComponentBlendMode002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode003
     * @tc.name     testCustomComponentBlendMode003
     * @tc.desc     testCustomComponentBlendMode003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode004
     * @tc.name     testCustomComponentBlendMode004
     * @tc.desc     testCustomComponentBlendMode004
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode005
     * @tc.name     testCustomComponentBlendMode005
     * @tc.desc     testCustomComponentBlendMode005
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode006
     * @tc.name     testCustomComponentBlendMode006
     * @tc.desc     testCustomComponentBlendMode006
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode007
     * @tc.name     testCustomComponentBlendMode007
     * @tc.desc     testCustomComponentBlendMode007
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode007()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode008
     * @tc.name     testCustomComponentBlendMode008
     * @tc.desc     testCustomComponentBlendMode008
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode008()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode009
     * @tc.name     testCustomComponentBlendMode009
     * @tc.desc     testCustomComponentBlendMode009
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode009()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode010
     * @tc.name     testCustomComponentBlendMode010
     * @tc.desc     testCustomComponentBlendMode010
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode010()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode011
     * @tc.name     testCustomComponentBlendMode011
     * @tc.desc     testCustomComponentBlendMode011
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode011()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode012
     * @tc.name     testCustomComponentBlendMode012
     * @tc.desc     testCustomComponentBlendMode012
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode012', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode012()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode013
     * @tc.name     testCustomComponentBlendMode013
     * @tc.desc     testCustomComponentBlendMode013
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode013', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode013()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode014
     * @tc.name     testCustomComponentBlendMode014
     * @tc.desc     testCustomComponentBlendMode014
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode014', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode014()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode015
     * @tc.name     testCustomComponentBlendMode015
     * @tc.desc     testCustomComponentBlendMode015
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode015', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode015()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode016
     * @tc.name     testCustomComponentBlendMode016
     * @tc.desc     testCustomComponentBlendMode016
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode016', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode016()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode017
     * @tc.name     testCustomComponentBlendMode017
     * @tc.desc     testCustomComponentBlendMode017
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode017', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode017()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode018
     * @tc.name     testCustomComponentBlendMode018
     * @tc.desc     testCustomComponentBlendMode018
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode018', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode018()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode019
     * @tc.name     testCustomComponentBlendMode019
     * @tc.desc     testCustomComponentBlendMode019
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode019', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode019()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode020
     * @tc.name     testCustomComponentBlendMode020
     * @tc.desc     testCustomComponentBlendMode020
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode020', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode020()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode021
     * @tc.name     testCustomComponentBlendMode021
     * @tc.desc     testCustomComponentBlendMode021
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode021', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode021()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode022
     * @tc.name     testCustomComponentBlendMode022
     * @tc.desc     testCustomComponentBlendMode022
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode022', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode022()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode023
     * @tc.name     testCustomComponentBlendMode023
     * @tc.desc     testCustomComponentBlendMode023
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode023', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode023()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode024
     * @tc.name     testCustomComponentBlendMode024
     * @tc.desc     testCustomComponentBlendMode024
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode024', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode024()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode025
     * @tc.name     testCustomComponentBlendMode025
     * @tc.desc     testCustomComponentBlendMode025
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode025', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode025()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode026
     * @tc.name     testCustomComponentBlendMode026
     * @tc.desc     testCustomComponentBlendMode026
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode026', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode026()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode027
     * @tc.name     testCustomComponentBlendMode027
     * @tc.desc     testCustomComponentBlendMode027
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode027', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode027()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode028
     * @tc.name     testCustomComponentBlendMode028
     * @tc.desc     testCustomComponentBlendMode028
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode028', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode028()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode029
     * @tc.name     testCustomComponentBlendMode029
     * @tc.desc     testCustomComponentBlendMode029
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode029', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode029()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode030
     * @tc.name     testCustomComponentBlendMode030
     * @tc.desc     testCustomComponentBlendMode030
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode030', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode030()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode031
     * @tc.name     testCustomComponentBlendMode031
     * @tc.desc     testCustomComponentBlendMode031
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode031', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode031()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode032
     * @tc.name     testCustomComponentBlendMode032
     * @tc.desc     testCustomComponentBlendMode032
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode032', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode032()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode033
     * @tc.name     testCustomComponentBlendMode033
     * @tc.desc     testCustomComponentBlendMode033
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode033', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode033()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode034
     * @tc.name     testCustomComponentBlendMode034
     * @tc.desc     testCustomComponentBlendMode034
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode034', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode034()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode035
     * @tc.name     testCustomComponentBlendMode035
     * @tc.desc     testCustomComponentBlendMode035
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode035', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode035()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode036
     * @tc.name     testCustomComponentBlendMode036
     * @tc.desc     testCustomComponentBlendMode036
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode036', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode036()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode037
     * @tc.name     testCustomComponentBlendMode037
     * @tc.desc     testCustomComponentBlendMode037
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode037', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode037()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode038
     * @tc.name     testCustomComponentBlendMode038
     * @tc.desc     testCustomComponentBlendMode038
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode038', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode038()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode039
     * @tc.name     testCustomComponentBlendMode039
     * @tc.desc     testCustomComponentBlendMode039
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode039', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode039()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode040
     * @tc.name     testCustomComponentBlendMode040
     * @tc.desc     testCustomComponentBlendMode040
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode040', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode040()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode041
     * @tc.name     testCustomComponentBlendMode041
     * @tc.desc     testCustomComponentBlendMode041
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode041', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode041()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode042
     * @tc.name     testCustomComponentBlendMode042
     * @tc.desc     testCustomComponentBlendMode042
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode042', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode042()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode043
     * @tc.name     testCustomComponentBlendMode043
     * @tc.desc     testCustomComponentBlendMode043
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode043', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode043()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode044
     * @tc.name     testCustomComponentBlendMode044
     * @tc.desc     testCustomComponentBlendMode044
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode044', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode044()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode045
     * @tc.name     testCustomComponentBlendMode045
     * @tc.desc     testCustomComponentBlendMode045
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode045', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode045()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode046
     * @tc.name     testCustomComponentBlendMode046
     * @tc.desc     testCustomComponentBlendMode046
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode046', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode046()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode047
     * @tc.name     testCustomComponentBlendMode047
     * @tc.desc     testCustomComponentBlendMode047
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode047', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode047()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode048
     * @tc.name     testCustomComponentBlendMode048
     * @tc.desc     testCustomComponentBlendMode048
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode048', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode048()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode049
     * @tc.name     testCustomComponentBlendMode049
     * @tc.desc     testCustomComponentBlendMode049
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode049', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode049()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode050
     * @tc.name     testCustomComponentBlendMode050
     * @tc.desc     testCustomComponentBlendMode050
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode050', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode050()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode051
     * @tc.name     testCustomComponentBlendMode051
     * @tc.desc     testCustomComponentBlendMode051
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode051', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode051()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode052
     * @tc.name     testCustomComponentBlendMode052
     * @tc.desc     testCustomComponentBlendMode052
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode052', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode052()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode053
     * @tc.name     testCustomComponentBlendMode053
     * @tc.desc     testCustomComponentBlendMode053
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode053', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode053()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode054
     * @tc.name     testCustomComponentBlendMode054
     * @tc.desc     testCustomComponentBlendMode054
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode054', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode054()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode055
     * @tc.name     testCustomComponentBlendMode055
     * @tc.desc     testCustomComponentBlendMode055
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode055', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode055()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode056
     * @tc.name     testCustomComponentBlendMode056
     * @tc.desc     testCustomComponentBlendMode056
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode056', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode056()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode057
     * @tc.name     testCustomComponentBlendMode057
     * @tc.desc     testCustomComponentBlendMode057
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode057', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode057()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode058
     * @tc.name     testCustomComponentBlendMode058
     * @tc.desc     testCustomComponentBlendMode058
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode058', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode058()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode059
     * @tc.name     testCustomComponentBlendMode059
     * @tc.desc     testCustomComponentBlendMode059
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode059', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode059()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode060
     * @tc.name     testCustomComponentBlendMode060
     * @tc.desc     testCustomComponentBlendMode060
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode060', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode060()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBlendMode061
     * @tc.name     testCustomComponentBlendMode061
     * @tc.desc     testCustomComponentBlendMode061
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBlendMode061', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBlendMode061()).assertEqual(0)
      done()
    })



  })
}
