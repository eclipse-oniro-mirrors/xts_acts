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

export default function listItemRotateTest() {

  describe('ListItemRotateTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testListItemRotate001
     * @tc.name     testListItemRotate001
     * @tc.desc     testListItemRotate001
     * @tc.level    Level.LEVEL1
     */
    it('testListItemRotate001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemRotate001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemRotate002
     * @tc.name     testListItemRotate002
     * @tc.desc     testListItemRotate002
     * @tc.level    Level.LEVEL1
     */
    it('testListItemRotate002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemRotate002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemRotate003
     * @tc.name     testListItemRotate003
     * @tc.desc     testListItemRotate003
     * @tc.level    Level.LEVEL1
     */
    it('testListItemRotate003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemRotate003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemRotate004
     * @tc.name     testListItemRotate004
     * @tc.desc     testListItemRotate004
     * @tc.level    Level.LEVEL1
     */
    it('testListItemRotate004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemRotate004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemRotate005
     * @tc.name     testListItemRotate005
     * @tc.desc     testListItemRotate005
     * @tc.level    Level.LEVEL1
     */
    it('testListItemRotate005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemRotate005()).assertEqual(0)
      done()
    })
  })
}
