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

export default function commonAttrsBackgroundBlurStyleTest() {

  describe('CommonAttrsBackgroundBlurStyleTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle001
     * @tc.name     testCommonAttrsBackgroundBlurStyle001
     * @tc.desc     testCommonAttrsBackgroundBlurStyle001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle002
     * @tc.name     testCommonAttrsBackgroundBlurStyle002
     * @tc.desc     testCommonAttrsBackgroundBlurStyle002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle003
     * @tc.name     testCommonAttrsBackgroundBlurStyle003
     * @tc.desc     testCommonAttrsBackgroundBlurStyle003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle004
     * @tc.name     testCommonAttrsBackgroundBlurStyle004
     * @tc.desc     testCommonAttrsBackgroundBlurStyle004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle004()).assertEqual(0)
      done()
    }) 

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle005
     * @tc.name     testCommonAttrsBackgroundBlurStyle005
     * @tc.desc     testCommonAttrsBackgroundBlurStyle005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle006
     * @tc.name     testCommonAttrsBackgroundBlurStyle006
     * @tc.desc     testCommonAttrsBackgroundBlurStyle006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle007
     * @tc.name     testCommonAttrsBackgroundBlurStyle007
     * @tc.desc     testCommonAttrsBackgroundBlurStyle007
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle007()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle008
     * @tc.name     testCommonAttrsBackgroundBlurStyle008
     * @tc.desc     testCommonAttrsBackgroundBlurStyle008
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle008()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle009
     * @tc.name     testCommonAttrsBackgroundBlurStyle009
     * @tc.desc     testCommonAttrsBackgroundBlurStyle009
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle009()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle010
     * @tc.name     testCommonAttrsBackgroundBlurStyle010
     * @tc.desc     testCommonAttrsBackgroundBlurStyle010
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle010()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle011
     * @tc.name     testCommonAttrsBackgroundBlurStyle011
     * @tc.desc     testCommonAttrsBackgroundBlurStyle011
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle011()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle012
     * @tc.name     testCommonAttrsBackgroundBlurStyle012
     * @tc.desc     testCommonAttrsBackgroundBlurStyle012
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle012', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle012()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle013
     * @tc.name     testCommonAttrsBackgroundBlurStyle013
     * @tc.desc     testCommonAttrsBackgroundBlurStyle013
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle013', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle013()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle014
     * @tc.name     testCommonAttrsBackgroundBlurStyle014
     * @tc.desc     testCommonAttrsBackgroundBlurStyle014
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle014', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle014()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle015
     * @tc.name     testCommonAttrsBackgroundBlurStyle015
     * @tc.desc     testCommonAttrsBackgroundBlurStyle015
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle015', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle015()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle016
     * @tc.name     testCommonAttrsBackgroundBlurStyle016
     * @tc.desc     testCommonAttrsBackgroundBlurStyle016
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle016', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle016()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle017
     * @tc.name     testCommonAttrsBackgroundBlurStyle017
     * @tc.desc     testCommonAttrsBackgroundBlurStyle017
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle017', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle017()).assertEqual(0)
      done()
    })
    
    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle018
     * @tc.name     testCommonAttrsBackgroundBlurStyle018
     * @tc.desc     testCommonAttrsBackgroundBlurStyle018
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle018', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle018()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle019
     * @tc.name     testCommonAttrsBackgroundBlurStyle019
     * @tc.desc     testCommonAttrsBackgroundBlurStyle019
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle019', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle019()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle020
     * @tc.name     testCommonAttrsBackgroundBlurStyle020
     * @tc.desc     testCommonAttrsBackgroundBlurStyle020
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle020', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle020()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle021
     * @tc.name     testCommonAttrsBackgroundBlurStyle021
     * @tc.desc     testCommonAttrsBackgroundBlurStyle021
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle021', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle021()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle022
     * @tc.name     testCommonAttrsBackgroundBlurStyle022
     * @tc.desc     testCommonAttrsBackgroundBlurStyle022
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle022', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle022()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle023
     * @tc.name     testCommonAttrsBackgroundBlurStyle023
     * @tc.desc     testCommonAttrsBackgroundBlurStyle023
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle023', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle023()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle024
     * @tc.name     testCommonAttrsBackgroundBlurStyle024
     * @tc.desc     testCommonAttrsBackgroundBlurStyle024
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle024', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle024()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle025
     * @tc.name     testCommonAttrsBackgroundBlurStyle025
     * @tc.desc     testCommonAttrsBackgroundBlurStyle025
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle025', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle025()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle026
     * @tc.name     testCommonAttrsBackgroundBlurStyle026
     * @tc.desc     testCommonAttrsBackgroundBlurStyle026
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle026', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle026()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle027
     * @tc.name     testCommonAttrsBackgroundBlurStyle027
     * @tc.desc     testCommonAttrsBackgroundBlurStyle027
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle027', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle027()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle028
     * @tc.name     testCommonAttrsBackgroundBlurStyle028
     * @tc.desc     testCommonAttrsBackgroundBlurStyle028
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle028', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle028()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle029
     * @tc.name     testCommonAttrsBackgroundBlurStyle029
     * @tc.desc     testCommonAttrsBackgroundBlurStyle029
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle029', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle029()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle030
     * @tc.name     testCommonAttrsBackgroundBlurStyle030
     * @tc.desc     testCommonAttrsBackgroundBlurStyle030
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle030', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle030()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle031
     * @tc.name     testCommonAttrsBackgroundBlurStyle031
     * @tc.desc     testCommonAttrsBackgroundBlurStyle031
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle031', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle031()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle032
     * @tc.name     testCommonAttrsBackgroundBlurStyle032
     * @tc.desc     testCommonAttrsBackgroundBlurStyle032
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle032', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle032()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBackgroundBlurStyle033
     * @tc.name     testCommonAttrsBackgroundBlurStyle033
     * @tc.desc     testCommonAttrsBackgroundBlurStyle033
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBackgroundBlurStyle033', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBackgroundBlurStyle033()).assertEqual(0)
      done()
    })
  })
}
