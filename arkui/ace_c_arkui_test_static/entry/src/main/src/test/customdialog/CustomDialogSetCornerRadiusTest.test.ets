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

export default function customDialogSetCornerRadiusTest() {

  describe('CustomDialogSetCornerRadiusTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomDialogSetCornerRadius001
     * @tc.name     testCustomDialogSetCornerRadius001
     * @tc.desc     testCustomDialogSetCornerRadius001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetCornerRadius001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetCornerRadius001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogSetCornerRadius002
     * @tc.name     testCustomDialogSetCornerRadius002
     * @tc.desc     testCustomDialogSetCornerRadius002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetCornerRadius002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetCornerRadius002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogSetCornerRadius003
     * @tc.name     testCustomDialogSetCornerRadius003
     * @tc.desc     testCustomDialogSetCornerRadius003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetCornerRadius003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetCornerRadius003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogSetCornerRadius004
     * @tc.name     testCustomDialogSetCornerRadius004
     * @tc.desc     testCustomDialogSetCornerRadius004
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetCornerRadius004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetCornerRadius004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomDialogSetCornerRadius005
     * @tc.name     testCustomDialogSetCornerRadius005
     * @tc.desc     testCustomDialogSetCornerRadius005
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetCornerRadius005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetCornerRadius005()).assertEqual(0)
      done()
    })

        
    
/**
     * @tc.number   testCustomDialogSetCornerRadius006
     * @tc.name     testCustomDialogSetCornerRadius006
     * @tc.desc     testCustomDialogSetCornerRadius006
     * @tc.level    Level.LEVEL1
     */
    it('testCustomDialogSetCornerRadius006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogSetCornerRadius006()).assertEqual(0)
      done()
    })
 
  })
}

    
