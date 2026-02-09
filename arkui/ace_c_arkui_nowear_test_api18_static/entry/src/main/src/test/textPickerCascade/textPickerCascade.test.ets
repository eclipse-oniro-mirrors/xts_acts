'use static';
/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index";
import Utils from '../common/Utils';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'
import { LibUtil } from '../../../ets/pages/LibUtil';

const libUtil: LibUtil = new LibUtil();



export default function TextPickerCascadeTest(){
  describe('TextPickerCascadeTest',  () =>{
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_nowear_xts_api18_static", "EntryAbility")
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(100)
    })

    /**
     * @tc.number   TextPickerCascadeTest_a
     * @tc.name     TextPickerCascadeTest_a
     * @tc.desc     TextPickerCascadeTest_a
     * @tc.level    Level.LEVEL0
     */
    it('TextPickerCascadeTest_a', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.TextPickerCascadeTest_a()).assertEqual(0)
      console.log('TextPickerCascadeTest_a will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   TextPickerCascadeTest_a1
     * @tc.name     TextPickerCascadeTest_a1
     * @tc.desc     TextPickerCascadeTest_a1
     * @tc.level    Level.LEVEL0
     */
    it('TextPickerCascadeTest_a1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.TextPickerCascadeTest_a1()).assertEqual(0)
      console.log('TextPickerCascadeTest_a1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   TextPickerCascadeTest_b
     * @tc.name     TextPickerCascadeTest_b
     * @tc.desc     TextPickerCascadeTest_b
     * @tc.level    Level.LEVEL0
     */
    it('TextPickerCascadeTest_b', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.TextPickerCascadeTest_b()).assertEqual(0)
      console.log('TextPickerCascadeTest_b will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   TextPickerCascadeTest_b1
     * @tc.name     TextPickerCascadeTest_b1
     * @tc.desc     TextPickerCascadeTest_b1
     * @tc.level    Level.LEVEL0
     */
    it('TextPickerCascadeTest_b1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.TextPickerCascadeTest_b1()).assertEqual(0)
      console.log('TextPickerCascadeTest_b1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   TextPickerCascadeTest_c
     * @tc.name     TextPickerCascadeTest_c
     * @tc.desc     TextPickerCascadeTest_c
     * @tc.level    Level.LEVEL0
     */
    it('TextPickerCascadeTest_c', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.TextPickerCascadeTest_c()).assertEqual(0)
      console.log('TextPickerCascadeTest_c will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   TextPickerCascadeTest_c1
     * @tc.name     TextPickerCascadeTest_c1
     * @tc.desc     TextPickerCascadeTest_c1
     * @tc.level    Level.LEVEL0
     */
    it('TextPickerCascadeTest_c1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.TextPickerCascadeTest_c1()).assertEqual(0)
      console.log('TextPickerCascadeTest_c1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   TextPickerCascadeTest_d
     * @tc.name     TextPickerCascadeTest_d
     * @tc.desc     TextPickerCascadeTest_d
     * @tc.level    Level.LEVEL0
     */
    it('TextPickerCascadeTest_d', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.TextPickerCascadeTest_d()).assertEqual(0)
      console.log('TextPickerCascadeTest_d will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   TextPickerCascadeTest_d1
     * @tc.name     TextPickerCascadeTest_d1
     * @tc.desc     TextPickerCascadeTest_d1
     * @tc.level    Level.LEVEL0
     */
    it('TextPickerCascadeTest_d1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.TextPickerCascadeTest_d1()).assertEqual(0)
      console.log('TextPickerCascadeTest_d1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   TextPickerCascadeTest_e
     * @tc.name     TextPickerCascadeTest_e
     * @tc.desc     TextPickerCascadeTest_e
     * @tc.level    Level.LEVEL0
     */
    it('TextPickerCascadeTest_e', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.TextPickerCascadeTest_e()).assertEqual(0)
      console.log('TextPickerCascadeTest_e will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   TextPickerCascadeTest_e1
     * @tc.name     TextPickerCascadeTest_e1
     * @tc.desc     TextPickerCascadeTest_e1
     * @tc.level    Level.LEVEL0
     */
    it('TextPickerCascadeTest_e1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.TextPickerCascadeTest_e1()).assertEqual(0)
      console.log('TextPickerCascadeTest_e1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   TextPickerCascadeTest_f
     * @tc.name     TextPickerCascadeTest_f
     * @tc.desc     TextPickerCascadeTest_f
     * @tc.level    Level.LEVEL0
     */
    it('TextPickerCascadeTest_f', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.TextPickerCascadeTest_f()).assertEqual(0)
      console.log('TextPickerCascadeTest_f will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   TextPickerCascadeTest_f1
     * @tc.name     TextPickerCascadeTest_f1
     * @tc.desc     TextPickerCascadeTest_f1
     * @tc.level    Level.LEVEL0
     */
    it('TextPickerCascadeTest_f1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.TextPickerCascadeTest_f1()).assertEqual(0)
      console.log('TextPickerCascadeTest_f1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })


  })
}