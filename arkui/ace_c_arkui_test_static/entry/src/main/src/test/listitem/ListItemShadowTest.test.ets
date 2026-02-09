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

export default function listItemShadowTest() {

  describe('ListItemShadowTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testListItemShadow001
     * @tc.name     testListItemShadow001
     * @tc.desc     testListItemShadow001
     * @tc.level    Level.LEVEL1
     */
    it('testListItemShadow001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemShadow001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemShadow002
     * @tc.name     testListItemShadow002
     * @tc.desc     testListItemShadow002
     * @tc.level    Level.LEVEL1
     */
    it('testListItemShadow002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemShadow002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemShadow003
     * @tc.name     testListItemShadow003
     * @tc.desc     testListItemShadow003
     * @tc.level    Level.LEVEL1
     */
    it('testListItemShadow003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemShadow003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemShadow004
     * @tc.name     testListItemShadow004
     * @tc.desc     testListItemShadow004
     * @tc.level    Level.LEVEL1
     */
    it('testListItemShadow004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemShadow004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemShadow005
     * @tc.name     testListItemShadow005
     * @tc.desc     testListItemShadow005
     * @tc.level    Level.LEVEL1
     */
    it('testListItemShadow005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemShadow005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemShadow006
     * @tc.name     testListItemShadow006
     * @tc.desc     testListItemShadow006
     * @tc.level    Level.LEVEL1
     */
    it('testListItemShadow006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemShadow006()).assertEqual(0)
      done()
    })
  })
}
