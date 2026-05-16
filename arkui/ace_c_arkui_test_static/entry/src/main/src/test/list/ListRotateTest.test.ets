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

export default function listRotateTest() {

  describe('ListRotateTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testListRotate001
     * @tc.name     testListRotate001
     * @tc.desc     testListRotate001
     * @tc.level    Level.LEVEL1
     */
    it('testListRotate001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListRotate001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListRotate002
     * @tc.name     testListRotate002
     * @tc.desc     testListRotate002
     * @tc.level    Level.LEVEL1
     */
    it('testListRotate002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListRotate002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListRotate003
     * @tc.name     testListRotate003
     * @tc.desc     testListRotate003
     * @tc.level    Level.LEVEL1
     */
    it('testListRotate003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListRotate003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListRotate004
     * @tc.name     testListRotate004
     * @tc.desc     testListRotate004
     * @tc.level    Level.LEVEL1
     */
    it('testListRotate004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListRotate004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListRotate005
     * @tc.name     testListRotate005
     * @tc.desc     testListRotate005
     * @tc.level    Level.LEVEL1
     */
    it('testListRotate005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListRotate005()).assertEqual(0)
      done()
    })
  })
}
