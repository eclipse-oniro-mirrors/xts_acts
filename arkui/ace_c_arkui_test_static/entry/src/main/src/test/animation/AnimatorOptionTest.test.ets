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

import { beforeEach, describe, expect, it, Level, beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import {LibUtil} from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'
let libUtil:LibUtil = new LibUtil();

export default function animatorOptionTest() {

  describe('AnimatorOptionTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testAnimatorOption001
     * @tc.name     testAnimatorOption001
     * @tc.desc     testAnimatorOption001
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption002
     * @tc.name     testAnimatorOption002
     * @tc.desc     testAnimatorOption002
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption003
     * @tc.name     testAnimatorOption003
     * @tc.desc     testAnimatorOption003
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption004
     * @tc.name     testAnimatorOption004
     * @tc.desc     testAnimatorOption004
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption004()).assertEqual(0)
      done()
    })


    
    
/**
     * @tc.number   testAnimatorOption005
     * @tc.name     testAnimatorOption005
     * @tc.desc     testAnimatorOption005
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption006
     * @tc.name     testAnimatorOption006
     * @tc.desc     testAnimatorOption006
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption007
     * @tc.name     testAnimatorOption007
     * @tc.desc     testAnimatorOption007
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption007()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption008
     * @tc.name     testAnimatorOption008
     * @tc.desc     testAnimatorOption008
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption008()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption009
     * @tc.name     testAnimatorOption009
     * @tc.desc     testAnimatorOption009
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption009()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption010
     * @tc.name     testAnimatorOption010
     * @tc.desc     testAnimatorOption010
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption010()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption011
     * @tc.name     testAnimatorOption011
     * @tc.desc     testAnimatorOption011
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption011()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption012
     * @tc.name     testAnimatorOption012
     * @tc.desc     testAnimatorOption012
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption012', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption012()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption013
     * @tc.name     testAnimatorOption013
     * @tc.desc     testAnimatorOption013
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption013', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption013()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption014
     * @tc.name     testAnimatorOption014
     * @tc.desc     testAnimatorOption014
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption014', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption014()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption015
     * @tc.name     testAnimatorOption015
     * @tc.desc     testAnimatorOption015
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption015', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption015()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption016
     * @tc.name     testAnimatorOption016
     * @tc.desc     testAnimatorOption016
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption016', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption016()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption017
     * @tc.name     testAnimatorOption017
     * @tc.desc     testAnimatorOption017
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption017', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption017()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption018
     * @tc.name     testAnimatorOption018
     * @tc.desc     testAnimatorOption018
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption018', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption018()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption019
     * @tc.name     testAnimatorOption019
     * @tc.desc     testAnimatorOption019
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption019', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption019()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption020
     * @tc.name     testAnimatorOption020
     * @tc.desc     testAnimatorOption020
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption020', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption020()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption021
     * @tc.name     testAnimatorOption021
     * @tc.desc     testAnimatorOption021
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption021', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption021()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption022
     * @tc.name     testAnimatorOption022
     * @tc.desc     testAnimatorOption022
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption022', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption022()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption023
     * @tc.name     testAnimatorOption023
     * @tc.desc     testAnimatorOption023
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption023', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption023()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption024
     * @tc.name     testAnimatorOption024
     * @tc.desc     testAnimatorOption024
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption024', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption024()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption025
     * @tc.name     testAnimatorOption025
     * @tc.desc     testAnimatorOption025
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption025', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption025()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption026
     * @tc.name     testAnimatorOption026
     * @tc.desc     testAnimatorOption026
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption026', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption026()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption027
     * @tc.name     testAnimatorOption027
     * @tc.desc     testAnimatorOption027
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption027', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption027()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption028
     * @tc.name     testAnimatorOption028
     * @tc.desc     testAnimatorOption028
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption028', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption028()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption029
     * @tc.name     testAnimatorOption029
     * @tc.desc     testAnimatorOption029
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption029', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption029()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption030
     * @tc.name     testAnimatorOption030
     * @tc.desc     testAnimatorOption030
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption030', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption030()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption031
     * @tc.name     testAnimatorOption031
     * @tc.desc     testAnimatorOption031
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption031', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption031()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption032
     * @tc.name     testAnimatorOption032
     * @tc.desc     testAnimatorOption032
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption032', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption032()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption033
     * @tc.name     testAnimatorOption033
     * @tc.desc     testAnimatorOption033
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption033', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption033()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption034
     * @tc.name     testAnimatorOption034
     * @tc.desc     testAnimatorOption034
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption034', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption034()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption035
     * @tc.name     testAnimatorOption035
     * @tc.desc     testAnimatorOption035
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption035', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption035()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption036
     * @tc.name     testAnimatorOption036
     * @tc.desc     testAnimatorOption036
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption036', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption036()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption037
     * @tc.name     testAnimatorOption037
     * @tc.desc     testAnimatorOption037
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption037', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption037()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption038
     * @tc.name     testAnimatorOption038
     * @tc.desc     testAnimatorOption038
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption038', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption038()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption039
     * @tc.name     testAnimatorOption039
     * @tc.desc     testAnimatorOption039
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption039', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption039()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption040
     * @tc.name     testAnimatorOption040
     * @tc.desc     testAnimatorOption040
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption040', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption040()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption041
     * @tc.name     testAnimatorOption041
     * @tc.desc     testAnimatorOption041
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption041', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption041()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption042
     * @tc.name     testAnimatorOption042
     * @tc.desc     testAnimatorOption042
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption042', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption042()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption043
     * @tc.name     testAnimatorOption043
     * @tc.desc     testAnimatorOption043
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption043', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption043()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption044
     * @tc.name     testAnimatorOption044
     * @tc.desc     testAnimatorOption044
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption044', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption044()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption045
     * @tc.name     testAnimatorOption045
     * @tc.desc     testAnimatorOption045
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption045', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption045()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption046
     * @tc.name     testAnimatorOption046
     * @tc.desc     testAnimatorOption046
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption046', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption046()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption048
     * @tc.name     testAnimatorOption048
     * @tc.desc     testAnimatorOption048
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption048', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption048()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption049
     * @tc.name     testAnimatorOption049
     * @tc.desc     testAnimatorOption049
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption049', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption049()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption051
     * @tc.name     testAnimatorOption051
     * @tc.desc     testAnimatorOption051
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption051', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption051()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption052
     * @tc.name     testAnimatorOption052
     * @tc.desc     testAnimatorOption052
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption052', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption052()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption054
     * @tc.name     testAnimatorOption054
     * @tc.desc     testAnimatorOption054
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption054', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption054()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption055
     * @tc.name     testAnimatorOption055
     * @tc.desc     testAnimatorOption055
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption055', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption055()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption057
     * @tc.name     testAnimatorOption057
     * @tc.desc     testAnimatorOption057
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption057', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption057()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption058
     * @tc.name     testAnimatorOption058
     * @tc.desc     testAnimatorOption058
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption058', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption058()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption059
     * @tc.name     testAnimatorOption059
     * @tc.desc     testAnimatorOption059
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption059', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption059()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption060
     * @tc.name     testAnimatorOption060
     * @tc.desc     testAnimatorOption060
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption060', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption060()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption061
     * @tc.name     testAnimatorOption061
     * @tc.desc     testAnimatorOption061
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption061', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption061()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption063
     * @tc.name     testAnimatorOption063
     * @tc.desc     testAnimatorOption063
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption063', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption063()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption064
     * @tc.name     testAnimatorOption064
     * @tc.desc     testAnimatorOption064
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption064', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption064()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption065
     * @tc.name     testAnimatorOption065
     * @tc.desc     testAnimatorOption065
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption065', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption065()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption066
     * @tc.name     testAnimatorOption066
     * @tc.desc     testAnimatorOption066
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption066', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption066()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimatorOption067
     * @tc.name     testAnimatorOption067
     * @tc.desc     testAnimatorOption067
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption067', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimatorOption067()).assertEqual(0)
      done()
    })

  })
}