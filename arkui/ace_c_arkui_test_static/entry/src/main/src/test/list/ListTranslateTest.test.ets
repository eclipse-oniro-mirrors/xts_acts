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

export default function listTranslateTest() {

  describe('ListTranslateTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testListTranslate001
     * @tc.name     testListTranslate001
     * @tc.desc     testListTranslate001
     * @tc.level    Level.LEVEL1
     */
    it('testListTranslate001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListTranslate001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListTranslate002
     * @tc.name     testListTranslate002
     * @tc.desc     testListTranslate002
     * @tc.level    Level.LEVEL1
     */
    it('testListTranslate002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListTranslate002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListTranslate003
     * @tc.name     testListTranslate003
     * @tc.desc     testListTranslate003
     * @tc.level    Level.LEVEL1
     */
    it('testListTranslate003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListTranslate003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListTranslate004
     * @tc.name     testListTranslate004
     * @tc.desc     testListTranslate004
     * @tc.level    Level.LEVEL1
     */
    it('testListTranslate004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListTranslate004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListTranslate005
     * @tc.name     testListTranslate005
     * @tc.desc     testListTranslate005
     * @tc.level    Level.LEVEL1
     */
    it('testListTranslate005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListTranslate005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListTranslate006
     * @tc.name     testListTranslate006
     * @tc.desc     testListTranslate006
     * @tc.level    Level.LEVEL1
     */
    it('testListTranslate006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListTranslate006()).assertEqual(0)
      done()
    })
  })
}
