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

export default function imageRotateTest() {

  describe('ImageRotateTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testImageRotate001
     * @tc.name     testImageRotate001
     * @tc.desc     testImageRotate001
     * @tc.level    Level.LEVEL1
     */
    it('testImageRotate001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageRotate001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageRotate002
     * @tc.name     testImageRotate002
     * @tc.desc     testImageRotate002
     * @tc.level    Level.LEVEL1
     */
    it('testImageRotate002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageRotate002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageRotate003
     * @tc.name     testImageRotate003
     * @tc.desc     testImageRotate003
     * @tc.level    Level.LEVEL1
     */
    it('testImageRotate003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageRotate003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageRotate004
     * @tc.name     testImageRotate004
     * @tc.desc     testImageRotate004
     * @tc.level    Level.LEVEL1
     */
    it('testImageRotate004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageRotate004()).assertEqual(0)
      done()
    })

  })
}
