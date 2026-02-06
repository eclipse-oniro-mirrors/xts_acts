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

export default function listItemSaturateTest() {

  describe('ListItemSaturateTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testListItemSaturate001
     * @tc.name     testListItemSaturate001
     * @tc.desc     testListItemSaturate001
     * @tc.level    Level.LEVEL1
     */
    it('testListItemSaturate001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemSaturate001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemSaturate002
     * @tc.name     testListItemSaturate002
     * @tc.desc     testListItemSaturate002
     * @tc.level    Level.LEVEL1
     */
    it('testListItemSaturate002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemSaturate002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemSaturate003
     * @tc.name     testListItemSaturate003
     * @tc.desc     testListItemSaturate003
     * @tc.level    Level.LEVEL1
     */
    it('testListItemSaturate003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemSaturate003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemSaturate004
     * @tc.name     testListItemSaturate004
     * @tc.desc     testListItemSaturate004
     * @tc.level    Level.LEVEL1
     */
    it('testListItemSaturate004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemSaturate004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemSaturate005
     * @tc.name     testListItemSaturate005
     * @tc.desc     testListItemSaturate005
     * @tc.level    Level.LEVEL1
     */
    it('testListItemSaturate005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemSaturate005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemSaturate006
     * @tc.name     testListItemSaturate006
     * @tc.desc     testListItemSaturate006
     * @tc.level    Level.LEVEL1
     */
    it('testListItemSaturate006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemSaturate006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemSaturate007
     * @tc.name     testListItemSaturate007
     * @tc.desc     testListItemSaturate007
     * @tc.level    Level.LEVEL1
     */
    it('testListItemSaturate007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemSaturate007()).assertEqual(0)
      done()
    })
  })
}
