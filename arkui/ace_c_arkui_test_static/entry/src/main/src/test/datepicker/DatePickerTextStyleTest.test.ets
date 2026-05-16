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

export default function datePickerTextStyleTest() {

  describe('DatePickerTextStyleTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testDatePickerTextStyle001
     * @tc.name     testDatePickerTextStyle001
     * @tc.desc     testDatePickerTextStyle001
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerTextStyle001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerTextStyle001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerTextStyle002
     * @tc.name     testDatePickerTextStyle002
     * @tc.desc     testDatePickerTextStyle002
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerTextStyle002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerTextStyle002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerTextStyle003
     * @tc.name     testDatePickerTextStyle003
     * @tc.desc     testDatePickerTextStyle003
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerTextStyle003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerTextStyle003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerTextStyle004
     * @tc.name     testDatePickerTextStyle004
     * @tc.desc     testDatePickerTextStyle004
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerTextStyle004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerTextStyle004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerTextStyle005
     * @tc.name     testDatePickerTextStyle005
     * @tc.desc     testDatePickerTextStyle005
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerTextStyle005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerTextStyle005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerTextStyle006
     * @tc.name     testDatePickerTextStyle006
     * @tc.desc     testDatePickerTextStyle006
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerTextStyle006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerTextStyle006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerTextStyle007
     * @tc.name     testDatePickerTextStyle007
     * @tc.desc     testDatePickerTextStyle007
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerTextStyle007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerTextStyle007()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerTextStyle008
     * @tc.name     testDatePickerTextStyle008
     * @tc.desc     testDatePickerTextStyle008
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerTextStyle008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerTextStyle008()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerTextStyle009
     * @tc.name     testDatePickerTextStyle009
     * @tc.desc     testDatePickerTextStyle009
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerTextStyle009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerTextStyle009()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerTextStyle010
     * @tc.name     testDatePickerTextStyle010
     * @tc.desc     testDatePickerTextStyle010
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerTextStyle010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerTextStyle010()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerTextStyle011
     * @tc.name     testDatePickerTextStyle011
     * @tc.desc     testDatePickerTextStyle011
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerTextStyle011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerTextStyle011()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerTextStyle012
     * @tc.name     testDatePickerTextStyle012
     * @tc.desc     testDatePickerTextStyle012
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerTextStyle012', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerTextStyle012()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerTextStyle013
     * @tc.name     testDatePickerTextStyle013
     * @tc.desc     testDatePickerTextStyle013
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerTextStyle013', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerTextStyle013()).assertEqual(0)
      done()
    })
  })
}
