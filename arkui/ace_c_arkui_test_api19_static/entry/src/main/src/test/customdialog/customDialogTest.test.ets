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

import { expect, describe, it, afterEach,Level, beforeAll } from '../../../../hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import {LibUtil} from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'

let libUtil:LibUtil = new LibUtil();

export default function customDialogTest(){

  describe('CustomDialogTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api19.static", "EntryAbility")
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(100);
    })

    
    /**
     * @tc.number   testCustomDialog001
     * @tc.name     testCustomDialog001
     * @tc.desc     testCustomDialog001
     * @tc.level    Level.LEVEL0
     */
    it('testCustomDialog001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogWidth()).assertEqual(0)
      done()
    });

    
    /**
     * @tc.number   testCustomDialog002
     * @tc.name     testCustomDialog002
     * @tc.desc     testCustomDialog002
     * @tc.level    Level.LEVEL0
     */
    it('testCustomDialog002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogHeight()).assertEqual(0)
      done()
    });

    
    /**
     * @tc.number   testCustomDialog003
     * @tc.name     testCustomDialog003
     * @tc.desc     testCustomDialog003
     * @tc.level    Level.LEVEL0
     */
    it('testCustomDialog003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogBorderWidth()).assertEqual(0)
      done()
    });

    
    /**
     * @tc.number   testCustomDialog004
     * @tc.name     testCustomDialog004
     * @tc.desc     testCustomDialog004
     * @tc.level    Level.LEVEL0
     */
    it('testCustomDialog004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogBorderColor()).assertEqual(0)
      done()
    });

    
    /**
     * @tc.number   testCustomDialog005
     * @tc.name     testCustomDialog005
     * @tc.desc     testCustomDialog005
     * @tc.level    Level.LEVEL0
     */
    it('testCustomDialog005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogBorderStyle()).assertEqual(0)
      done()
    });

    
    /**
     * @tc.number   testCustomDialog006
     * @tc.name     testCustomDialog006
     * @tc.desc     testCustomDialog006
     * @tc.level    Level.LEVEL0
     */
    it('testCustomDialog006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogShadow()).assertEqual(0)
      done()
    });

    
    /**
     * @tc.number   testCustomDialog007
     * @tc.name     testCustomDialog007
     * @tc.desc     testCustomDialog007
     * @tc.level    Level.LEVEL0
     */
    it('testCustomDialog007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogCustomShadow()).assertEqual(0)
      done()
    });

    
    /**
     * @tc.number   testCustomDialog008
     * @tc.name     testCustomDialog008
     * @tc.desc     testCustomDialog008
     * @tc.level    Level.LEVEL0
     */
    it('testCustomDialog008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogBackgroundBlurStyle()).assertEqual(0)
      done()
    });

    
    /**
     * @tc.number   testCustomDialog009
     * @tc.name     testCustomDialog009
     * @tc.desc     testCustomDialog009
     * @tc.level    Level.LEVEL0
     */
    it('testCustomDialog009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogKeyboardAvoidMode()).assertEqual(0)
      done()
    });

    
    /**
     * @tc.number   testCustomDialog010
     * @tc.name     testCustomDialog010
     * @tc.desc     testCustomDialog010
     * @tc.level    Level.LEVEL0
     */
    it('testCustomDialog010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogEnableHoverMode()).assertEqual(0)
      done()
    });

    
    /**
     * @tc.number   testCustomDialog011
     * @tc.name     testCustomDialog011
     * @tc.desc     testCustomDialog011
     * @tc.level    Level.LEVEL0
     */
    it('testCustomDialog011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogHoverModeArea()).assertEqual(0)
      done()
    });

    
    /**
     * @tc.number   testCustomDialog012
     * @tc.name     testCustomDialog012
     * @tc.desc     testCustomDialog012
     * @tc.level    Level.LEVEL0 
     */
    it('testCustomDialog012', Level.LEVEL0 , async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogLevelMode()).assertEqual(0)
      done()
    });

    
    /**
     * @tc.number   testCustomDialog013
     * @tc.name     testCustomDialog013
     * @tc.desc     testCustomDialog013
     * @tc.level    Level.LEVEL0 
     */
    it('testCustomDialog013', Level.LEVEL0 , async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogLevelUniqueId()).assertEqual(0)
      done()
    });

    
    /**
     * @tc.number   testCustomDialog014
     * @tc.name     testCustomDialog014
     * @tc.desc     testCustomDialog014
     * @tc.level    Level.LEVEL0 
     */
    it('testCustomDialog014', Level.LEVEL0 , async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogImmersiveMode()).assertEqual(0)
      done()
    });

    
    /**
     * @tc.number   testCustomDialog015
     * @tc.name     testCustomDialog015
     * @tc.desc     testCustomDialog015
     * @tc.level    Level.LEVEL0 
     */
    it('testCustomDialog015', Level.LEVEL0 , async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogBackgroundColor()).assertEqual(0)
      done()
    });

    
    /**
     * @tc.number   testCustomDialog016
     * @tc.name     testCustomDialog016
     * @tc.desc     testCustomDialog016
     * @tc.level    Level.LEVEL0 
     */
    it('testCustomDialog016', Level.LEVEL0 , async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomDialogCornerRadius()).assertEqual(0)
      done()
    });

    
    /**
     * @tc.number   testCustomDialog017
     * @tc.name     testCustomDialog017
     * @tc.desc     testCustomDialog017
     * @tc.level    Level.LEVEL0 
     */
    it('testCustomDialog017', Level.LEVEL0 , async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomModalMode()).assertEqual(0)
      done()
    });

    
    /**
     * @tc.number   testCustomDialog018
     * @tc.name     testCustomDialog018
     * @tc.desc     testCustomDialog018
     * @tc.level    Level.LEVEL0 
     */
    it('testCustomDialog018', Level.LEVEL0 , async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomAutoCancel()).assertEqual(0)
      done()
    });

    
    /**
     * @tc.number   testCustomDialog019
     * @tc.name     testCustomDialog019
     * @tc.desc     testCustomDialog019
     * @tc.level    Level.LEVEL0 
     */
    it('testCustomDialog019', Level.LEVEL0 , async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomMask()).assertEqual(0)
      done()
    });
  })
}