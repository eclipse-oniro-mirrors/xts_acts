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

export default function spanTextBackgroundStyleTest() {

  describe('SpanTextBackgroundStyleTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testSpanTextBackgroundStyle001
     * @tc.name     testSpanTextBackgroundStyle001
     * @tc.desc     testSpanTextBackgroundStyle001
     * @tc.level    Level.LEVEL1
     */
    it('testSpanTextBackgroundStyle001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSpanTextBackgroundStyle001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSpanTextBackgroundStyle002
     * @tc.name     testSpanTextBackgroundStyle002
     * @tc.desc     testSpanTextBackgroundStyle002
     * @tc.level    Level.LEVEL1
     */
    it('testSpanTextBackgroundStyle002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSpanTextBackgroundStyle002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSpanTextBackgroundStyle003
     * @tc.name     testSpanTextBackgroundStyle003
     * @tc.desc     testSpanTextBackgroundStyle003
     * @tc.level    Level.LEVEL1
     */
    it('testSpanTextBackgroundStyle003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSpanTextBackgroundStyle003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSpanTextBackgroundStyle004
     * @tc.name     testSpanTextBackgroundStyle004
     * @tc.desc     testSpanTextBackgroundStyle004
     * @tc.level    Level.LEVEL1
     */
    it('testSpanTextBackgroundStyle004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSpanTextBackgroundStyle004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSpanTextBackgroundStyle005
     * @tc.name     testSpanTextBackgroundStyle005
     * @tc.desc     testSpanTextBackgroundStyle005
     * @tc.level    Level.LEVEL1
     */
    it('testSpanTextBackgroundStyle005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSpanTextBackgroundStyle005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSpanTextBackgroundStyle006
     * @tc.name     testSpanTextBackgroundStyle006
     * @tc.desc     testSpanTextBackgroundStyle006
     * @tc.level    Level.LEVEL1
     */
    it('testSpanTextBackgroundStyle006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSpanTextBackgroundStyle006()).assertEqual(0)
      done()
    })

  })
}