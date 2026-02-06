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

export default function imageTranslateTest() {

  describe('ImageTranslateTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testImageTranslate001
     * @tc.name     testImageTranslate001
     * @tc.desc     testImageTranslate001
     * @tc.level    Level.LEVEL1
     */
    it('testImageTranslate001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageTranslate001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageTranslate002
     * @tc.name     testImageTranslate002
     * @tc.desc     testImageTranslate002
     * @tc.level    Level.LEVEL1
     */
    it('testImageTranslate002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageTranslate002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageTranslate003
     * @tc.name     testImageTranslate003
     * @tc.desc     testImageTranslate003
     * @tc.level    Level.LEVEL1
     */
    it('testImageTranslate003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageTranslate003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageTranslate004
     * @tc.name     testImageTranslate004
     * @tc.desc     testImageTranslate004
     * @tc.level    Level.LEVEL1
     */
    it('testImageTranslate004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageTranslate004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageTranslate005
     * @tc.name     testImageTranslate005
     * @tc.desc     testImageTranslate005
     * @tc.level    Level.LEVEL1
     */
    it('testImageTranslate005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageTranslate005()).assertEqual(0)
      done()
    })

  })
}
