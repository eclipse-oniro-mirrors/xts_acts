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

export default function imageObjectRepeatTest() {

  describe('ImageObjectRepeatTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testImageObjectRepeat001
     * @tc.name     testImageObjectRepeat001
     * @tc.desc     testImageObjectRepeat001
     * @tc.level    Level.LEVEL1
     */
    it('testImageObjectRepeat001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageObjectRepeat001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageObjectRepeat002
     * @tc.name     testImageObjectRepeat002
     * @tc.desc     testImageObjectRepeat002
     * @tc.level    Level.LEVEL1
     */
    it('testImageObjectRepeat002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageObjectRepeat002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageObjectRepeat003
     * @tc.name     testImageObjectRepeat003
     * @tc.desc     testImageObjectRepeat003
     * @tc.level    Level.LEVEL1
     */
    it('testImageObjectRepeat003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageObjectRepeat003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageObjectRepeat004
     * @tc.name     testImageObjectRepeat004
     * @tc.desc     testImageObjectRepeat004
     * @tc.level    Level.LEVEL1
     */
    it('testImageObjectRepeat004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageObjectRepeat004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageObjectRepeat005
     * @tc.name     testImageObjectRepeat005
     * @tc.desc     testImageObjectRepeat005
     * @tc.level    Level.LEVEL1
     */
    it('testImageObjectRepeat005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageObjectRepeat005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageObjectRepeat006
     * @tc.name     testImageObjectRepeat006
     * @tc.desc     testImageObjectRepeat006
     * @tc.level    Level.LEVEL1
     */
    it('testImageObjectRepeat006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageObjectRepeat006()).assertEqual(0)
      done()
    })

  })
}
