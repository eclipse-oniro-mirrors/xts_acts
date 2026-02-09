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

export default function commonAttrsAlignTest() {

  describe('CommonAttrsAlignTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsAlign001
     * @tc.name     testCommonAttrsAlign001
     * @tc.desc     testCommonAttrsAlign001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsAlign002
     * @tc.name     testCommonAttrsAlign002
     * @tc.desc     testCommonAttrsAlign002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsAlign003
     * @tc.name     testCommonAttrsAlign003
     * @tc.desc     testCommonAttrsAlign003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsAlign004
     * @tc.name     testCommonAttrsAlign004
     * @tc.desc     testCommonAttrsAlign004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsAlign005
     * @tc.name     testCommonAttrsAlign005
     * @tc.desc     testCommonAttrsAlign005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsAlign006
     * @tc.name     testCommonAttrsAlign006
     * @tc.desc     testCommonAttrsAlign006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsAlign007
     * @tc.name     testCommonAttrsAlign007
     * @tc.desc     testCommonAttrsAlign007
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign007()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsAlign008
     * @tc.name     testCommonAttrsAlign008
     * @tc.desc     testCommonAttrsAlign008
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign008()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsAlign009
     * @tc.name     testCommonAttrsAlign009
     * @tc.desc     testCommonAttrsAlign009
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign009()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsAlign010
     * @tc.name     testCommonAttrsAlign010
     * @tc.desc     testCommonAttrsAlign010
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign010()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsAlign011
     * @tc.name     testCommonAttrsAlign011
     * @tc.desc     testCommonAttrsAlign011
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_1200
     * @tc.name       : testCommonAttrsAlign012
     * @tc.desc       : testing align for button with valid value
                        ARKUI_ALIGNMENT_TOP_START
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    
/**
     * @tc.number   testCommonAttrsAlign012
     * @tc.name     testCommonAttrsAlign012
     * @tc.desc     testCommonAttrsAlign012
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign012', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_1300
     * @tc.name       : testCommonAttrsAlign013
     * @tc.desc       : testing align for stack with valid value
                        ARKUI_ALIGNMENT_TOP
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    
/**
     * @tc.number   testCommonAttrsAlign013
     * @tc.name     testCommonAttrsAlign013
     * @tc.desc     testCommonAttrsAlign013
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign013', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_1400
     * @tc.name       : testCommonAttrsAlign014
     * @tc.desc       : testing align for stack with valid value
                        ARKUI_ALIGNMENT_TOP_END
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    
/**
     * @tc.number   testCommonAttrsAlign014
     * @tc.name     testCommonAttrsAlign014
     * @tc.desc     testCommonAttrsAlign014
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign014', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign014()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_1500
     * @tc.name       : testCommonAttrsAlign015
     * @tc.desc       : testing align for stack with valid value
                        ARKUI_ALIGNMENT_CENTER_START
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    
/**
     * @tc.number   testCommonAttrsAlign015
     * @tc.name     testCommonAttrsAlign015
     * @tc.desc     testCommonAttrsAlign015
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign015', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign015()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_1600
     * @tc.name       : testCommonAttrsAlign016
     * @tc.desc       : testing align for stack with valid value
                        ARKUI_ALIGNMENT_CENTER
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    
/**
     * @tc.number   testCommonAttrsAlign016
     * @tc.name     testCommonAttrsAlign016
     * @tc.desc     testCommonAttrsAlign016
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign016', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign016()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_1700
     * @tc.name       : testCommonAttrsAlign017
     * @tc.desc       : testing align for stack with valid value
                        ARKUI_ALIGNMENT_CENTER_END
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    
/**
     * @tc.number   testCommonAttrsAlign017
     * @tc.name     testCommonAttrsAlign017
     * @tc.desc     testCommonAttrsAlign017
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign017', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign017()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_1800
     * @tc.name       : testCommonAttrsAlign018
     * @tc.desc       : testing align for stack with valid value
                        ARKUI_ALIGNMENT_BOTTOM_START
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    
/**
     * @tc.number   testCommonAttrsAlign018
     * @tc.name     testCommonAttrsAlign018
     * @tc.desc     testCommonAttrsAlign018
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign018', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign018()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_1900
     * @tc.name       : testCommonAttrsAlign019
     * @tc.desc       : testing align for stack with valid value
                        ARKUI_ALIGNMENT_BOTTOM
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    
/**
     * @tc.number   testCommonAttrsAlign019
     * @tc.name     testCommonAttrsAlign019
     * @tc.desc     testCommonAttrsAlign019
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign019', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign019()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_2000
     * @tc.name       : testCommonAttrsAlign020
     * @tc.desc       : testing align for stack with valid value
                        ARKUI_ALIGNMENT_BOTTOM_END
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    
/**
     * @tc.number   testCommonAttrsAlign020
     * @tc.name     testCommonAttrsAlign020
     * @tc.desc     testCommonAttrsAlign020
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign020', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign020()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_2100
     * @tc.name       : testCommonAttrsAlign021
     * @tc.desc       : testing align for stack with valid value
                        -1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    
/**
     * @tc.number   testCommonAttrsAlign021
     * @tc.name     testCommonAttrsAlign021
     * @tc.desc     testCommonAttrsAlign021
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign021', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign021()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_2200
     * @tc.name       : testCommonAttrsAlign022
     * @tc.desc       : testing align for stack with default value
                        9
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    
/**
     * @tc.number   testCommonAttrsAlign022
     * @tc.name     testCommonAttrsAlign022
     * @tc.desc     testCommonAttrsAlign022
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign022', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign022()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_2300
     * @tc.name       : testCommonAttrsAlign023
     * @tc.desc       : testing align for stack with abnormal value
                        ARKUI_ALIGNMENT_TOP_START
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    
/**
     * @tc.number   testCommonAttrsAlign023
     * @tc.name     testCommonAttrsAlign023
     * @tc.desc     testCommonAttrsAlign023
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign023', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign023()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_2400
     * @tc.name       : testCommonAttrsAlign024
     * @tc.desc       : testing align for stack with valid value
                        ARKUI_ALIGNMENT_TOP
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    
/**
     * @tc.number   testCommonAttrsAlign024
     * @tc.name     testCommonAttrsAlign024
     * @tc.desc     testCommonAttrsAlign024
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign024', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign024()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_2500
     * @tc.name       : testCommonAttrsAlign025
     * @tc.desc       : testing align for stack with valid value
                        ARKUI_ALIGNMENT_TOP_END
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    
/**
     * @tc.number   testCommonAttrsAlign025
     * @tc.name     testCommonAttrsAlign025
     * @tc.desc     testCommonAttrsAlign025
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign025', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign025()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_2600
     * @tc.name       : testCommonAttrsAlign026
     * @tc.desc       : testing align for stack with valid value
                        ARKUI_ALIGNMENT_CENTER_START
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    
/**
     * @tc.number   testCommonAttrsAlign026
     * @tc.name     testCommonAttrsAlign026
     * @tc.desc     testCommonAttrsAlign026
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign026', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign026()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_2700
     * @tc.name       : testCommonAttrsAlign027
     * @tc.desc       : testing align for stack with valid value
                        ARKUI_ALIGNMENT_CENTER
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    
/**
     * @tc.number   testCommonAttrsAlign027
     * @tc.name     testCommonAttrsAlign027
     * @tc.desc     testCommonAttrsAlign027
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign027', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign027()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_2800
     * @tc.name       : testCommonAttrsAlign028
     * @tc.desc       : testing align for stack with valid value
                        ARKUI_ALIGNMENT_CENTER_END
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    
/**
     * @tc.number   testCommonAttrsAlign028
     * @tc.name     testCommonAttrsAlign028
     * @tc.desc     testCommonAttrsAlign028
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign028', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign028()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_2900
     * @tc.name       : testCommonAttrsAlign029
     * @tc.desc       : testing align for stack with valid value
                        ARKUI_ALIGNMENT_BOTTOM_START
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    
/**
     * @tc.number   testCommonAttrsAlign029
     * @tc.name     testCommonAttrsAlign029
     * @tc.desc     testCommonAttrsAlign029
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign029', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign029()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_3000
     * @tc.name       : testCommonAttrsAlign030
     * @tc.desc       : testing align for stack with valid value
                        ARKUI_ALIGNMENT_BOTTOM
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    
/**
     * @tc.number   testCommonAttrsAlign030
     * @tc.name     testCommonAttrsAlign030
     * @tc.desc     testCommonAttrsAlign030
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign030', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign030()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_3100
     * @tc.name       : testCommonAttrsAlign031
     * @tc.desc       : testing align for stack with default value
                        ARKUI_ALIGNMENT_BOTTOM_END
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    
/**
     * @tc.number   testCommonAttrsAlign031
     * @tc.name     testCommonAttrsAlign031
     * @tc.desc     testCommonAttrsAlign031
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign031', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign031()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_STACK_ALIGN_3200
     * @tc.name       : testCommonAttrsAlign032
     * @tc.desc       : testing align for stack with abnormal value
                        ARKUI_ALIGNMENT_TOP_START
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    
/**
     * @tc.number   testCommonAttrsAlign032
     * @tc.name     testCommonAttrsAlign032
     * @tc.desc     testCommonAttrsAlign032
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign032', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign032()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_3300
     * @tc.name       : testCommonAttrsAlign033
     * @tc.desc       : testing align for text with valid value
                        ARKUI_ALIGNMENT_TOP
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    
/**
     * @tc.number   testCommonAttrsAlign033
     * @tc.name     testCommonAttrsAlign033
     * @tc.desc     testCommonAttrsAlign033
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign033', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign033()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_3400
     * @tc.name       : testCommonAttrsAlign034
     * @tc.desc       : testing align for text with valid value
                        ARKUI_ALIGNMENT_TOP_END
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    
/**
     * @tc.number   testCommonAttrsAlign034
     * @tc.name     testCommonAttrsAlign034
     * @tc.desc     testCommonAttrsAlign034
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign034', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign034()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_3500
     * @tc.name       : testCommonAttrsAlign035
     * @tc.desc       : testing align for text with valid value
                        ARKUI_ALIGNMENT_CENTER_START
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    
/**
     * @tc.number   testCommonAttrsAlign035
     * @tc.name     testCommonAttrsAlign035
     * @tc.desc     testCommonAttrsAlign035
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign035', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign035()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_3600
     * @tc.name       : testCommonAttrsAlign036
     * @tc.desc       : testing align for text with valid value
                        ARKUI_ALIGNMENT_CENTER
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    
/**
     * @tc.number   testCommonAttrsAlign036
     * @tc.name     testCommonAttrsAlign036
     * @tc.desc     testCommonAttrsAlign036
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign036', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign036()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_3700
     * @tc.name       : testCommonAttrsAlign037
     * @tc.desc       : testing align for text with valid value
                        ARKUI_ALIGNMENT_END
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    
/**
     * @tc.number   testCommonAttrsAlign037
     * @tc.name     testCommonAttrsAlign037
     * @tc.desc     testCommonAttrsAlign037
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign037', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign037()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_3800
     * @tc.name       : testCommonAttrsAlign038
     * @tc.desc       : testing align for text with valid value
                        ARKUI_ALIGNMENT_BOTTOM_START
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    
/**
     * @tc.number   testCommonAttrsAlign038
     * @tc.name     testCommonAttrsAlign038
     * @tc.desc     testCommonAttrsAlign038
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign038', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign038()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_3900
     * @tc.name       : testCommonAttrsAlign039
     * @tc.desc       : testing align for text with valid value
                        ARKUI_ALIGNMENT_BOTTOM
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    
/**
     * @tc.number   testCommonAttrsAlign039
     * @tc.name     testCommonAttrsAlign039
     * @tc.desc     testCommonAttrsAlign039
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign039', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign039()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_4000
     * @tc.name       : testCommonAttrsAlign040
     * @tc.desc       : testing align for text with valid value
                        ARKUI_ALIGNMENT_BOTTOM_END
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    
/**
     * @tc.number   testCommonAttrsAlign040
     * @tc.name     testCommonAttrsAlign040
     * @tc.desc     testCommonAttrsAlign040
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign040', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign040()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_4100
     * @tc.name       : testCommonAttrsAlign041
     * @tc.desc       : testing align for text with default value
                        -1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    
/**
     * @tc.number   testCommonAttrsAlign041
     * @tc.name     testCommonAttrsAlign041
     * @tc.desc     testCommonAttrsAlign041
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign041', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign041()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_ALIGN_4200
     * @tc.name       : testCommonAttrsAlign042
     * @tc.desc       : testing align for text with abnormal value
                        9
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    
/**
     * @tc.number   testCommonAttrsAlign042
     * @tc.name     testCommonAttrsAlign042
     * @tc.desc     testCommonAttrsAlign042
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign042', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign042()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsAlign043
     * @tc.name     testCommonAttrsAlign043
     * @tc.desc     testCommonAttrsAlign043
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlign043', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlign043()).assertEqual(0)
      done()
    })
  })
}
