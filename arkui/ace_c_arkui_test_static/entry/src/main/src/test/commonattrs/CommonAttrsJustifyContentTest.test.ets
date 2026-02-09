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

async function doIt(pageTag: string, testType: number, done?: Function) {
  Utils.emitEvent(pageTag, testType, 8888)
}

export default function commonAttrsJustifyContentTest() {

  describe('CommonAttrsJustifyContentTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsJustifyContent001
     * @tc.name     testCommonAttrsJustifyContent001
     * @tc.desc     testCommonAttrsJustifyContent001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsJustifyContent001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsJustifyContent001()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCommonAttrsJustifyContent002
     * @tc.name     testCommonAttrsJustifyContent002
     * @tc.desc     testCommonAttrsJustifyContent002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsJustifyContent002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsJustifyContent002()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCommonAttrsJustifyContent003
     * @tc.name     testCommonAttrsJustifyContent003
     * @tc.desc     testCommonAttrsJustifyContent003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsJustifyContent003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsJustifyContent003()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCommonAttrsJustifyContent004
     * @tc.name     testCommonAttrsJustifyContent004
     * @tc.desc     testCommonAttrsJustifyContent004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsJustifyContent004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsJustifyContent004()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCommonAttrsJustifyContent005
     * @tc.name     testCommonAttrsJustifyContent005
     * @tc.desc     testCommonAttrsJustifyContent005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsJustifyContent005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsJustifyContent005()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCommonAttrsJustifyContent006
     * @tc.name     testCommonAttrsJustifyContent006
     * @tc.desc     testCommonAttrsJustifyContent006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsJustifyContent006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsJustifyContent006()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCommonAttrsJustifyContent007
     * @tc.name     testCommonAttrsJustifyContent007
     * @tc.desc     testCommonAttrsJustifyContent007
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsJustifyContent007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsJustifyContent007()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCommonAttrsJustifyContent008
     * @tc.name     testCommonAttrsJustifyContent008
     * @tc.desc     testCommonAttrsJustifyContent008
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsJustifyContent008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsJustifyContent008()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCommonAttrsJustifyContent009
     * @tc.name     testCommonAttrsJustifyContent009
     * @tc.desc     testCommonAttrsJustifyContent009
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsJustifyContent009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsJustifyContent009()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCommonAttrsJustifyContent010
     * @tc.name     testCommonAttrsJustifyContent010
     * @tc.desc     testCommonAttrsJustifyContent010
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsJustifyContent010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsJustifyContent010()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCommonAttrsJustifyContent011
     * @tc.name     testCommonAttrsJustifyContent011
     * @tc.desc     testCommonAttrsJustifyContent011
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsJustifyContent011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsJustifyContent011()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCommonAttrsJustifyContent012
     * @tc.name     testCommonAttrsJustifyContent012
     * @tc.desc     testCommonAttrsJustifyContent012
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsJustifyContent012', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsJustifyContent012()).assertEqual(0)
      done();
    })
  })
}
