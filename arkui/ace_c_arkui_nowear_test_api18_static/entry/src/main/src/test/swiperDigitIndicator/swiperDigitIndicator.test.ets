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



export default function swiperDigitIndicatorTest(){
  describe('swiperDigitIndicatorTest',  () =>{
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_nowear_xts_api18_static", "EntryAbility")
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(100)
    })

    /**
     * @tc.number   swiperDigitIndicatorTest_a
     * @tc.name     swiperDigitIndicatorTest_a
     * @tc.desc     swiperDigitIndicatorTest_a
     * @tc.level    Level.LEVEL0
     */
    it('swiperDigitIndicatorTest_a', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.swiperDigitIndicatorTest_a()).assertEqual(0)
      console.log('swiperDigitIndicatorTest_a will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   swiperDigitIndicatorTest_b
     * @tc.name     swiperDigitIndicatorTest_b
     * @tc.desc     swiperDigitIndicatorTest_b
     * @tc.level    Level.LEVEL0
     */
    it('swiperDigitIndicatorTest_b', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.swiperDigitIndicatorTest_b()).assertEqual(0)
      console.log('swiperDigitIndicatorTest_b will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   swiperDigitIndicatorTest_c
     * @tc.name     swiperDigitIndicatorTest_c
     * @tc.desc     swiperDigitIndicatorTest_c
     * @tc.level    Level.LEVEL0
     */
    it('swiperDigitIndicatorTest_c', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.swiperDigitIndicatorTest_c()).assertEqual(0)
      console.log('swiperDigitIndicatorTest_c will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   swiperDigitIndicatorTest_d
     * @tc.name     swiperDigitIndicatorTest_d
     * @tc.desc     swiperDigitIndicatorTest_d
     * @tc.level    Level.LEVEL0
     */
    it('swiperDigitIndicatorTest_d', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.swiperDigitIndicatorTest_d()).assertEqual(0)
      console.log('swiperDigitIndicatorTest_d will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   swiperDigitIndicatorTest_e
     * @tc.name     swiperDigitIndicatorTest_e
     * @tc.desc     swiperDigitIndicatorTest_e
     * @tc.level    Level.LEVEL0
     */
    it('swiperDigitIndicatorTest_e', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.swiperDigitIndicatorTest_e()).assertEqual(0)
      console.log('swiperDigitIndicatorTest_e will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   swiperDigitIndicatorTest_b1
     * @tc.name     swiperDigitIndicatorTest_b1
     * @tc.desc     swiperDigitIndicatorTest_b1
     * @tc.level    Level.LEVEL0
     */
    it('swiperDigitIndicatorTest_b1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.swiperDigitIndicatorTest_b1()).assertEqual(0)
      console.log('swiperDigitIndicatorTest_b1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   swiperDigitIndicatorTest_c1
     * @tc.name     swiperDigitIndicatorTest_c1
     * @tc.desc     swiperDigitIndicatorTest_c1
     * @tc.level    Level.LEVEL0
     */
    it('swiperDigitIndicatorTest_c1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.swiperDigitIndicatorTest_c1()).assertEqual(0)
      console.log('swiperDigitIndicatorTest_c1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   swiperDigitIndicatorTest_d1
     * @tc.name     swiperDigitIndicatorTest_d1
     * @tc.desc     swiperDigitIndicatorTest_d1
     * @tc.level    Level.LEVEL0
     */
    it('swiperDigitIndicatorTest_d1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.swiperDigitIndicatorTest_d1()).assertEqual(0)
      console.log('swiperDigitIndicatorTest_d1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   swiperDigitIndicatorTest_e1
     * @tc.name     swiperDigitIndicatorTest_e1
     * @tc.desc     swiperDigitIndicatorTest_e1
     * @tc.level    Level.LEVEL0
     */
    it('swiperDigitIndicatorTest_e1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.swiperDigitIndicatorTest_e1()).assertEqual(0)
      console.log('swiperDigitIndicatorTest_e1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   swiperDigitIndicatorTest_f
     * @tc.name     swiperDigitIndicatorTest_f
     * @tc.desc     swiperDigitIndicatorTest_f
     * @tc.level    Level.LEVEL0
     */
    it('swiperDigitIndicatorTest_f', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.swiperDigitIndicatorTest_f()).assertEqual(0)
      console.log('swiperDigitIndicatorTest_f will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   swiperDigitIndicatorTest_f1
     * @tc.name     swiperDigitIndicatorTest_f1
     * @tc.desc     swiperDigitIndicatorTest_f1
     * @tc.level    Level.LEVEL0
     */
    it('swiperDigitIndicatorTest_f1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.swiperDigitIndicatorTest_f1()).assertEqual(0)
      console.log('swiperDigitIndicatorTest_f1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   swiperDigitIndicatorTest_g
     * @tc.name     swiperDigitIndicatorTest_g
     * @tc.desc     swiperDigitIndicatorTest_g
     * @tc.level    Level.LEVEL0
     */
    it('swiperDigitIndicatorTest_g', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.swiperDigitIndicatorTest_g()).assertEqual(0)
      console.log('swiperDigitIndicatorTest_g will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   swiperDigitIndicatorTest_g1
     * @tc.name     swiperDigitIndicatorTest_g1
     * @tc.desc     swiperDigitIndicatorTest_g1
     * @tc.level    Level.LEVEL0
     */
    it('swiperDigitIndicatorTest_g1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.swiperDigitIndicatorTest_g1()).assertEqual(0)
      console.log('swiperDigitIndicatorTest_g1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   swiperDigitIndicatorTest_h
     * @tc.name     swiperDigitIndicatorTest_h
     * @tc.desc     swiperDigitIndicatorTest_h
     * @tc.level    Level.LEVEL0
     */
    it('swiperDigitIndicatorTest_h', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.swiperDigitIndicatorTest_h()).assertEqual(0)
      console.log('swiperDigitIndicatorTest_h will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   swiperDigitIndicatorTest_h1
     * @tc.name     swiperDigitIndicatorTest_h1
     * @tc.desc     swiperDigitIndicatorTest_h1
     * @tc.level    Level.LEVEL0
     */
    it('swiperDigitIndicatorTest_h1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.swiperDigitIndicatorTest_h1()).assertEqual(0)
      console.log('swiperDigitIndicatorTest_h1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   swiperDigitIndicatorTest_i
     * @tc.name     swiperDigitIndicatorTest_i
     * @tc.desc     swiperDigitIndicatorTest_i
     * @tc.level    Level.LEVEL0
     */
    it('swiperDigitIndicatorTest_i', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.swiperDigitIndicatorTest_i()).assertEqual(0)
      console.log('swiperDigitIndicatorTest_i will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   swiperDigitIndicatorTest_i1
     * @tc.name     swiperDigitIndicatorTest_i1
     * @tc.desc     swiperDigitIndicatorTest_i1
     * @tc.level    Level.LEVEL0
     */
    it('swiperDigitIndicatorTest_i1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.swiperDigitIndicatorTest_i1()).assertEqual(0)
      console.log('swiperDigitIndicatorTest_i1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   swiperDigitIndicatorTest_j
     * @tc.name     swiperDigitIndicatorTest_j
     * @tc.desc     swiperDigitIndicatorTest_j
     * @tc.level    Level.LEVEL0
     */
    it('swiperDigitIndicatorTest_j', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.swiperDigitIndicatorTest_j()).assertEqual(0)
      console.log('swiperDigitIndicatorTest_j will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   swiperDigitIndicatorTest_j1
     * @tc.name     swiperDigitIndicatorTest_j1
     * @tc.desc     swiperDigitIndicatorTest_j1
     * @tc.level    Level.LEVEL0
     */
    it('swiperDigitIndicatorTest_j1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.swiperDigitIndicatorTest_j1()).assertEqual(0)
      console.log('swiperDigitIndicatorTest_j1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   swiperDigitIndicatorTest_k
     * @tc.name     swiperDigitIndicatorTest_k
     * @tc.desc     swiperDigitIndicatorTest_k
     * @tc.level    Level.LEVEL0
     */
    it('swiperDigitIndicatorTest_k', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.swiperDigitIndicatorTest_k()).assertEqual(0)
      console.log('swiperDigitIndicatorTest_k will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   swiperDigitIndicatorTest_k1
     * @tc.name     swiperDigitIndicatorTest_k1
     * @tc.desc     swiperDigitIndicatorTest_k1
     * @tc.level    Level.LEVEL0
     */
    it('swiperDigitIndicatorTest_k1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.swiperDigitIndicatorTest_k1()).assertEqual(0)
      console.log('swiperDigitIndicatorTest_k1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   swiperDigitIndicatorTest_l
     * @tc.name     swiperDigitIndicatorTest_l
     * @tc.desc     swiperDigitIndicatorTest_l
     * @tc.level    Level.LEVEL0
     */
    it('swiperDigitIndicatorTest_l', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.swiperDigitIndicatorTest_l()).assertEqual(0)
      console.log('swiperDigitIndicatorTest_l will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })


    /**
     * @tc.number   swiperDigitIndicatorTest_l1
     * @tc.name     swiperDigitIndicatorTest_l1
     * @tc.desc     swiperDigitIndicatorTest_l1
     * @tc.level    Level.LEVEL0
     */
    it('swiperDigitIndicatorTest_l1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.swiperDigitIndicatorTest_l1()).assertEqual(0)
      console.log('swiperDigitIndicatorTest_l1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })


  })
}