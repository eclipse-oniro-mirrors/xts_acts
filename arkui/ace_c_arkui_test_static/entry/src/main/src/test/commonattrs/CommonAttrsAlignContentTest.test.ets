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
import {focusControl} from '@ohos.arkui.component'
import { UtilsTest } from '../Util.test'
let libUtil:LibUtil = new LibUtil();

export default function commonAttrsAlignContentTest() {

  describe('CommonAttrsAlignContentTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsAlignContent001
     * @tc.name     testCommonAttrsAlignContent001
     * @tc.desc     testCommonAttrsAlignContent001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlignContent001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlignContent001()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCommonAttrsAlignContent002
     * @tc.name     testCommonAttrsAlignContent002
     * @tc.desc     testCommonAttrsAlignContent002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlignContent002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlignContent002()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCommonAttrsAlignContent003
     * @tc.name     testCommonAttrsAlignContent003
     * @tc.desc     testCommonAttrsAlignContent003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlignContent003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlignContent003()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCommonAttrsAlignContent004
     * @tc.name     testCommonAttrsAlignContent004
     * @tc.desc     testCommonAttrsAlignContent004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlignContent004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlignContent004()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCommonAttrsAlignContent005
     * @tc.name     testCommonAttrsAlignContent005
     * @tc.desc     testCommonAttrsAlignContent005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlignContent005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlignContent005()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCommonAttrsAlignContent006
     * @tc.name     testCommonAttrsAlignContent006
     * @tc.desc     testCommonAttrsAlignContent006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlignContent006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlignContent006()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCommonAttrsAlignContent007
     * @tc.name     testCommonAttrsAlignContent007
     * @tc.desc     testCommonAttrsAlignContent007
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlignContent007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlignContent007()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCommonAttrsAlignContent008
     * @tc.name     testCommonAttrsAlignContent008
     * @tc.desc     testCommonAttrsAlignContent008
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlignContent008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlignContent008()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCommonAttrsAlignContent009
     * @tc.name     testCommonAttrsAlignContent009
     * @tc.desc     testCommonAttrsAlignContent009
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlignContent009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlignContent009()).assertEqual(0)
      done();
    })
  })
}
