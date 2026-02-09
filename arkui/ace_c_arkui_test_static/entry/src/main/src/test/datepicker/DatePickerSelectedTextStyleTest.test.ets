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

export default function datePickerSelectedTextStyleTest() {

  describe('DatePickerSelectedTextStyleTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testDatePickerSelectedTextStyle001
     * @tc.name     testDatePickerSelectedTextStyle001
     * @tc.desc     testDatePickerSelectedTextStyle001
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerSelectedTextStyle001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerSelectedTextStyle001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerSelectedTextStyle002
     * @tc.name     testDatePickerSelectedTextStyle002
     * @tc.desc     testDatePickerSelectedTextStyle002
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerSelectedTextStyle002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerSelectedTextStyle002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerSelectedTextStyle003
     * @tc.name     testDatePickerSelectedTextStyle003
     * @tc.desc     testDatePickerSelectedTextStyle003
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerSelectedTextStyle003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerSelectedTextStyle003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerSelectedTextStyle004
     * @tc.name     testDatePickerSelectedTextStyle004
     * @tc.desc     testDatePickerSelectedTextStyle004
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerSelectedTextStyle004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerSelectedTextStyle004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerSelectedTextStyle005
     * @tc.name     testDatePickerSelectedTextStyle005
     * @tc.desc     testDatePickerSelectedTextStyle005
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerSelectedTextStyle005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerSelectedTextStyle005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerSelectedTextStyle006
     * @tc.name     testDatePickerSelectedTextStyle006
     * @tc.desc     testDatePickerSelectedTextStyle006
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerSelectedTextStyle006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerSelectedTextStyle006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerSelectedTextStyle007
     * @tc.name     testDatePickerSelectedTextStyle007
     * @tc.desc     testDatePickerSelectedTextStyle007
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerSelectedTextStyle007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerSelectedTextStyle007()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerSelectedTextStyle008
     * @tc.name     testDatePickerSelectedTextStyle008
     * @tc.desc     testDatePickerSelectedTextStyle008
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerSelectedTextStyle008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerSelectedTextStyle008()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerSelectedTextStyle009
     * @tc.name     testDatePickerSelectedTextStyle009
     * @tc.desc     testDatePickerSelectedTextStyle009
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerSelectedTextStyle009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerSelectedTextStyle009()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerSelectedTextStyle010
     * @tc.name     testDatePickerSelectedTextStyle010
     * @tc.desc     testDatePickerSelectedTextStyle010
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerSelectedTextStyle010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerSelectedTextStyle010()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerSelectedTextStyle011
     * @tc.name     testDatePickerSelectedTextStyle011
     * @tc.desc     testDatePickerSelectedTextStyle011
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerSelectedTextStyle011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerSelectedTextStyle011()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerSelectedTextStyle012
     * @tc.name     testDatePickerSelectedTextStyle012
     * @tc.desc     testDatePickerSelectedTextStyle012
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerSelectedTextStyle012', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerSelectedTextStyle012()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testDatePickerSelectedTextStyle013
     * @tc.name     testDatePickerSelectedTextStyle013
     * @tc.desc     testDatePickerSelectedTextStyle013
     * @tc.level    Level.LEVEL1
     */
    it('testDatePickerSelectedTextStyle013', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testDatePickerSelectedTextStyle013()).assertEqual(0)
      done()
    })
  })
}
