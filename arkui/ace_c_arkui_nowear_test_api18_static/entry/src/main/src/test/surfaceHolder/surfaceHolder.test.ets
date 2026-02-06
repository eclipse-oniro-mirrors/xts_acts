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



export default function SurfaceHolderTest(){
  describe('SurfaceHolderTest',  () =>{
    beforeAll((): void => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_nowear_xts_api18_static", "EntryAbility")
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(100)
    })

    /**
     * @tc.number   SurfaceHolderTest_a
     * @tc.name     SurfaceHolderTest_a
     * @tc.desc     SurfaceHolderTest_a
     * @tc.level    Level.LEVEL0
     */
    it('SurfaceHolderTest_a', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SurfaceHolderTest_a()).assertEqual(0)
      console.log('SurfaceHolderTest_a will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SurfaceHolderTest_a1
     * @tc.name     SurfaceHolderTest_a1
     * @tc.desc     SurfaceHolderTest_a1
     * @tc.level    Level.LEVEL0
     */
    it('SurfaceHolderTest_a1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SurfaceHolderTest_a1()).assertEqual(0)
      console.log('SurfaceHolderTest_a1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SurfaceHolderTest_b
     * @tc.name     SurfaceHolderTest_b
     * @tc.desc     SurfaceHolderTest_b
     * @tc.level    Level.LEVEL0
     */
    it('SurfaceHolderTest_b', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SurfaceHolderTest_b()).assertEqual(0)
      console.log('SurfaceHolderTest_b will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SurfaceHolderTest_c
     * @tc.name     SurfaceHolderTest_c
     * @tc.desc     SurfaceHolderTest_c
     * @tc.level    Level.LEVEL0
     */
    it('SurfaceHolderTest_c', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SurfaceHolderTest_c()).assertEqual(0)
      console.log('SurfaceHolderTest_c will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SurfaceHolderTest_c1
     * @tc.name     SurfaceHolderTest_c1
     * @tc.desc     SurfaceHolderTest_c1
     * @tc.level    Level.LEVEL0
     */
    it('SurfaceHolderTest_c1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SurfaceHolderTest_c1()).assertEqual(0)
      console.log('SurfaceHolderTest_c1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SurfaceHolderTest_d
     * @tc.name     SurfaceHolderTest_d
     * @tc.desc     SurfaceHolderTest_d
     * @tc.level    Level.LEVEL0
     */
    it('SurfaceHolderTest_d', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SurfaceHolderTest_d()).assertEqual(0)
      console.log('SurfaceHolderTest_d will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SurfaceHolderTest_e
     * @tc.name     SurfaceHolderTest_e
     * @tc.desc     SurfaceHolderTest_e
     * @tc.level    Level.LEVEL0
     */
    it('SurfaceHolderTest_e', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SurfaceHolderTest_e()).assertEqual(0)
      console.log('SurfaceHolderTest_e will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SurfaceHolderTest_e1
     * @tc.name     SurfaceHolderTest_e1
     * @tc.desc     SurfaceHolderTest_e1
     * @tc.level    Level.LEVEL0
     */
    it('SurfaceHolderTest_e1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SurfaceHolderTest_e1()).assertEqual(0)
      console.log('SurfaceHolderTest_e1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SurfaceHolderTest_f
     * @tc.name     SurfaceHolderTest_f
     * @tc.desc     SurfaceHolderTest_f
     * @tc.level    Level.LEVEL0
     */
    it('SurfaceHolderTest_f', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SurfaceHolderTest_f()).assertEqual(0)
      console.log('SurfaceHolderTest_f will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SurfaceHolderTest_f1
     * @tc.name     SurfaceHolderTest_f1
     * @tc.desc     SurfaceHolderTest_f1
     * @tc.level    Level.LEVEL0
     */
    it('SurfaceHolderTest_f1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SurfaceHolderTest_f1()).assertEqual(0)
      console.log('SurfaceHolderTest_f1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SurfaceHolderTest_g
     * @tc.name     SurfaceHolderTest_g
     * @tc.desc     SurfaceHolderTest_g
     * @tc.level    Level.LEVEL0
     */
    it('SurfaceHolderTest_g', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SurfaceHolderTest_g()).assertEqual(0)
      console.log('SurfaceHolderTest_g will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SurfaceHolderTest_g1
     * @tc.name     SurfaceHolderTest_g1
     * @tc.desc     SurfaceHolderTest_g1
     * @tc.level    Level.LEVEL0
     */
    it('SurfaceHolderTest_g1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SurfaceHolderTest_g1()).assertEqual(0)
      console.log('SurfaceHolderTest_g1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SurfaceHolderTest_h
     * @tc.name     SurfaceHolderTest_h
     * @tc.desc     SurfaceHolderTest_h
     * @tc.level    Level.LEVEL0
     */
    it('SurfaceHolderTest_h', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SurfaceHolderTest_h()).assertEqual(0)
      console.log('SurfaceHolderTest_h will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SurfaceHolderTest_h1
     * @tc.name     SurfaceHolderTest_h1
     * @tc.desc     SurfaceHolderTest_h1
     * @tc.level    Level.LEVEL0
     */
    it('SurfaceHolderTest_h1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SurfaceHolderTest_h1()).assertEqual(0)
      console.log('SurfaceHolderTest_h1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })


  })
}