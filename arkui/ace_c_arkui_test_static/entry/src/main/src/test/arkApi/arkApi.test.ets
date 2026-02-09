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

export default function TestArkUIAddApi() {

  describe('TestArkUIAddApi', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   TestArkUIAddApi001
     * @tc.name     TestArkUIAddApi001
     * @tc.desc     TestArkUIAddApi001
     * @tc.level    Level.LEVEL1
     */
    it('TestArkUIAddApi001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.TestArkUIAddApi001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   TestArkUIAddApi002
     * @tc.name     TestArkUIAddApi002
     * @tc.desc     TestArkUIAddApi002
     * @tc.level    Level.LEVEL1
     */
    it('TestArkUIAddApi002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.TestArkUIAddApi002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   TestArkUIAddApi003
     * @tc.name     TestArkUIAddApi003
     * @tc.desc     TestArkUIAddApi003
     * @tc.level    Level.LEVEL1
     */
    it('TestArkUIAddApi003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.TestArkUIAddApi003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   TestArkUIAddApi004
     * @tc.name     TestArkUIAddApi004
     * @tc.desc     TestArkUIAddApi004
     * @tc.level    Level.LEVEL1
     */
    it('TestArkUIAddApi004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.TestArkUIAddApi004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   TestArkUIAddApi005
     * @tc.name     TestArkUIAddApi005
     * @tc.desc     TestArkUIAddApi005
     * @tc.level    Level.LEVEL1
     */
    it('TestArkUIAddApi005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.TestArkUIAddApi005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   TestArkUIAddApi006
     * @tc.name     TestArkUIAddApi006
     * @tc.desc     TestArkUIAddApi006
     * @tc.level    Level.LEVEL1
     */
    it('TestArkUIAddApi006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.TestArkUIAddApi006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   TestArkUIAddApi007
     * @tc.name     TestArkUIAddApi007
     * @tc.desc     TestArkUIAddApi007
     * @tc.level    Level.LEVEL1
     */
    it('TestArkUIAddApi007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.TestArkUIAddApi007()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   TestArkUIAddApi008
     * @tc.name     TestArkUIAddApi008
     * @tc.desc     TestArkUIAddApi008
     * @tc.level    Level.LEVEL1
     */
    it('TestArkUIAddApi008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.TestArkUIAddApi008()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   TestArkUIAddApi009
     * @tc.name     TestArkUIAddApi009
     * @tc.desc     TestArkUIAddApi009
     * @tc.level    Level.LEVEL1
     */
    it('TestArkUIAddApi009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.TestArkUIAddApi009()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   TestArkUIAddApi010
     * @tc.name     TestArkUIAddApi010
     * @tc.desc     TestArkUIAddApi010
     * @tc.level    Level.LEVEL1
     */
    it('TestArkUIAddApi010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.TestArkUIAddApi010()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   TestArkUIAddApi011
     * @tc.name     TestArkUIAddApi011
     * @tc.desc     TestArkUIAddApi011
     * @tc.level    Level.LEVEL1
     */
    it('TestArkUIAddApi011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.TestArkUIAddApi011()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   TestArkUIAddApi012
     * @tc.name     TestArkUIAddApi012
     * @tc.desc     TestArkUIAddApi012
     * @tc.level    Level.LEVEL1
     */
    it('TestArkUIAddApi012', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.TestArkUIAddApi012()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   TestArkUIAddApi013
     * @tc.name     TestArkUIAddApi013
     * @tc.desc     TestArkUIAddApi013
     * @tc.level    Level.LEVEL1
     */
    it('TestArkUIAddApi013', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.TestArkUIAddApi013()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   TestArkUIAddApi014
     * @tc.name     TestArkUIAddApi014
     * @tc.desc     TestArkUIAddApi014
     * @tc.level    Level.LEVEL1
     */
    it('TestArkUIAddApi014', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.TestArkUIAddApi014()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   TestArkUIAddApi015
     * @tc.name     TestArkUIAddApi015
     * @tc.desc     TestArkUIAddApi015
     * @tc.level    Level.LEVEL1
     */
    it('TestArkUIAddApi015', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.TestArkUIAddApi015()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   TestArkUIAddApi016
     * @tc.name     TestArkUIAddApi016
     * @tc.desc     TestArkUIAddApi016
     * @tc.level    Level.LEVEL1
     */
    it('TestArkUIAddApi016', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.TestArkUIAddApi016()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   TestArkUIAddApi017
     * @tc.name     TestArkUIAddApi017
     * @tc.desc     TestArkUIAddApi017
     * @tc.level    Level.LEVEL1
     */
    it('TestArkUIAddApi017', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.TestArkUIAddApi017()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   TestArkUIAddApi018
     * @tc.name     TestArkUIAddApi018
     * @tc.desc     TestArkUIAddApi018
     * @tc.level    Level.LEVEL1
     */
    it('TestArkUIAddApi018', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.TestArkUIAddApi018()).assertEqual(0)
      done()
    })



    
    
/**
     * @tc.number   TestArkUIAddApi019
     * @tc.name     TestArkUIAddApi019
     * @tc.desc     TestArkUIAddApi019
     * @tc.level    Level.LEVEL1
     */
    it('TestArkUIAddApi019', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.TestArkUIAddApi019()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   TestArkUIAddApi020
     * @tc.name     TestArkUIAddApi020
     * @tc.desc     TestArkUIAddApi020
     * @tc.level    Level.LEVEL1
     */
    it('TestArkUIAddApi020', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.TestArkUIAddApi020()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   TestArkUIAddApi021
     * @tc.name     TestArkUIAddApi021
     * @tc.desc     TestArkUIAddApi021
     * @tc.level    Level.LEVEL1
     */
    it('TestArkUIAddApi021', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.TestArkUIAddApi021()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   TestArkUIAddApi022
     * @tc.name     TestArkUIAddApi022
     * @tc.desc     TestArkUIAddApi022
     * @tc.level    Level.LEVEL1
     */
    it('TestArkUIAddApi022', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.TestArkUIAddApi022()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   TestArkUIAddApi023
     * @tc.name     TestArkUIAddApi023
     * @tc.desc     TestArkUIAddApi023
     * @tc.level    Level.LEVEL1
     */
    it('TestArkUIAddApi023', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.TestArkUIAddApi023()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   TestArkUIAddApi024
     * @tc.name     TestArkUIAddApi024
     * @tc.desc     TestArkUIAddApi024
     * @tc.level    Level.LEVEL1
     */
    it('TestArkUIAddApi024', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.TestArkUIAddApi024()).assertEqual(0)
      done()
    })



  })
}
