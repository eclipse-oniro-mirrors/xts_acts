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

export default function radioCheckedTest() {

  describe('RadioCheckedTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testRadioChecked001
     * @tc.name     testRadioChecked001
     * @tc.desc     testRadioChecked001
     * @tc.level    Level.LEVEL1
     */
    it('testRadioChecked001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRadioChecked001()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testRadioChecked002
     * @tc.name     testRadioChecked002
     * @tc.desc     testRadioChecked002
     * @tc.level    Level.LEVEL1
     */
    it('testRadioChecked002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRadioChecked002()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testRadioChecked003
     * @tc.name     testRadioChecked003
     * @tc.desc     testRadioChecked003
     * @tc.level    Level.LEVEL1
     */
    it('testRadioChecked003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRadioChecked003()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testRadioChecked004
     * @tc.name     testRadioChecked004
     * @tc.desc     testRadioChecked004
     * @tc.level    Level.LEVEL1
     */
    it('testRadioChecked004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRadioChecked004()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testRadioChecked005
     * @tc.name     testRadioChecked005
     * @tc.desc     testRadioChecked005
     * @tc.level    Level.LEVEL1
     */
    it('testRadioChecked005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRadioChecked005()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testRadioChecked006
     * @tc.name     testRadioChecked006
     * @tc.desc     testRadioChecked006
     * @tc.level    Level.LEVEL1
     */
    it('testRadioChecked006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRadioChecked006()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testRadioChecked007
     * @tc.name     testRadioChecked007
     * @tc.desc     testRadioChecked007
     * @tc.level    Level.LEVEL1
     */
    it('testRadioChecked007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRadioChecked007()).assertEqual(0)
      done();
    })
  })
}
