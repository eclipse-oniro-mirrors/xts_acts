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

export default function radioRadioStyleTest() {

  describe('RadioRadioStyleTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testRadioRadioStyle001
     * @tc.name     testRadioRadioStyle001
     * @tc.desc     testRadioRadioStyle001
     * @tc.level    Level.LEVEL1
     */
    it('testRadioRadioStyle001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRadioRadioStyle001()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testRadioRadioStyle002
     * @tc.name     testRadioRadioStyle002
     * @tc.desc     testRadioRadioStyle002
     * @tc.level    Level.LEVEL1
     */
    it('testRadioRadioStyle002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRadioRadioStyle002()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testRadioRadioStyle003
     * @tc.name     testRadioRadioStyle003
     * @tc.desc     testRadioRadioStyle003
     * @tc.level    Level.LEVEL1
     */
    it('testRadioRadioStyle003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRadioRadioStyle003()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testRadioRadioStyle004
     * @tc.name     testRadioRadioStyle004
     * @tc.desc     testRadioRadioStyle004
     * @tc.level    Level.LEVEL1
     */
    it('testRadioRadioStyle004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRadioRadioStyle004()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testRadioRadioStyle005
     * @tc.name     testRadioRadioStyle005
     * @tc.desc     testRadioRadioStyle005
     * @tc.level    Level.LEVEL1
     */
    it('testRadioRadioStyle005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRadioRadioStyle005()).assertEqual(0)
      done();
    })
  })
}
