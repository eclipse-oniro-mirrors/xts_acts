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



export default function CustomDialogTest(){
  describe('CustomDialogTest',  () =>{
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_nowear_xts_api18_static", "EntryAbility")
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(100)
    })

    /**
     * @tc.number   CustomDialogTest_g1
     * @tc.name     CustomDialogTest_g1
     * @tc.desc     CustomDialogTest_g1
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_g1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_g1()).assertEqual(0)
      console.log('CustomDialogTest_g 1will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_a
     * @tc.name     CustomDialogTest_a
     * @tc.desc     CustomDialogTest_a
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_a', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_a()).assertEqual(0)
      console.log('CustomDialogTest_a will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_a1
     * @tc.name     CustomDialogTest_a1
     * @tc.desc     CustomDialogTest_a1
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_a1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_a1()).assertEqual(0)
      console.log('CustomDialogTest_a1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_b
     * @tc.name     CustomDialogTest_b
     * @tc.desc     CustomDialogTest_b
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_b', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_b()).assertEqual(0)
      console.log('CustomDialogTest_b will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_b1
     * @tc.name     CustomDialogTest_b1
     * @tc.desc     CustomDialogTest_b1
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_b1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_b1()).assertEqual(0)
      console.log('CustomDialogTest_b1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_c
     * @tc.name     CustomDialogTest_c
     * @tc.desc     CustomDialogTest_c
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_c', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_c()).assertEqual(0)
      console.log('CustomDialogTest_c will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })


    /**
     * @tc.number   CustomDialogTest_c1
     * @tc.name     CustomDialogTest_c1
     * @tc.desc     CustomDialogTest_c1
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_c1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_c1()).assertEqual(0)
      console.log('CustomDialogTest_c1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })
    /**
     * @tc.number   CustomDialogTest_d
     * @tc.name     CustomDialogTest_d
     * @tc.desc     CustomDialogTest_d
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_d', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_d()).assertEqual(0)
      console.log('CustomDialogTest_d will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })
    /**
     * @tc.number   CustomDialogTest_d1
     * @tc.name     CustomDialogTest_d1
     * @tc.desc     CustomDialogTest_d1
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_d1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_d1()).assertEqual(0)
      console.log('CustomDialogTest_d1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_e
     * @tc.name     CustomDialogTest_e
     * @tc.desc     CustomDialogTest_e
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_e', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_e()).assertEqual(0)
      console.log('CustomDialogTest_e will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_e1
     * @tc.name     CustomDialogTest_e1
     * @tc.desc     CustomDialogTest_e1
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_e1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_e1()).assertEqual(0)
      console.log('CustomDialogTest_e1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_f
     * @tc.name     CustomDialogTest_f
     * @tc.desc     CustomDialogTest_f
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_f', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_f()).assertEqual(0)
      console.log('CustomDialogTest_f will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_f1
     * @tc.name     CustomDialogTest_f1
     * @tc.desc     CustomDialogTest_f1
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_f1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_f1()).assertEqual(0)
      console.log('CustomDialogTest_f1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })


    /**
     * @tc.number   CustomDialogTest_h
     * @tc.name     CustomDialogTest_h
     * @tc.desc     CustomDialogTest_h
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_h', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_h()).assertEqual(0)
      console.log('CustomDialogTest_h will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_h1
     * @tc.name     CustomDialogTest_h1
     * @tc.desc     CustomDialogTest_h1
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_h1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_h1()).assertEqual(0)
      console.log('CustomDialogTest_h1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_i
     * @tc.name     CustomDialogTest_i
     * @tc.desc     CustomDialogTest_i
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_i', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_i()).assertEqual(0)
      console.log('CustomDialogTest_i will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_i1
     * @tc.name     CustomDialogTest_i1
     * @tc.desc     CustomDialogTest_i1
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_i1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_i1()).assertEqual(0)
      console.log('CustomDialogTest_i1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_j
     * @tc.name     CustomDialogTest_j
     * @tc.desc     CustomDialogTest_j
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_j', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_j()).assertEqual(0)
      console.log('CustomDialogTest_j will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_j1
     * @tc.name     CustomDialogTest_j1
     * @tc.desc     CustomDialogTest_j1
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_j1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_j1()).assertEqual(0)
      console.log('CustomDialogTest_j1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_k
     * @tc.name     CustomDialogTest_k
     * @tc.desc     CustomDialogTest_k
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_k', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_k()).assertEqual(0)
      console.log('CustomDialogTest_k will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_k1
     * @tc.name     CustomDialogTest_k1
     * @tc.desc     CustomDialogTest_k1
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_k1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_k1()).assertEqual(0)
      console.log('CustomDialogTest_k1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_l
     * @tc.name     CustomDialogTest_l
     * @tc.desc     CustomDialogTest_l
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_l', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_l()).assertEqual(0)
      console.log('CustomDialogTest_l will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_l1
     * @tc.name     CustomDialogTest_l1
     * @tc.desc     CustomDialogTest_l1
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_l1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_l1()).assertEqual(0)
      console.log('CustomDialogTest_l1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_m
     * @tc.name     CustomDialogTest_m
     * @tc.desc     CustomDialogTest_m
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_m', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_m()).assertEqual(0)
      console.log('CustomDialogTest_m will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_m1
     * @tc.name     CustomDialogTest_m1
     * @tc.desc     CustomDialogTest_m1
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_m1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_m1()).assertEqual(0)
      console.log('CustomDialogTest_m1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_n
     * @tc.name     CustomDialogTest_n
     * @tc.desc     CustomDialogTest_n
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_n', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_n()).assertEqual(0)
      console.log('CustomDialogTest_n will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_n1
     * @tc.name     CustomDialogTest_n1
     * @tc.desc     CustomDialogTest_n1
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_n1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_n1()).assertEqual(0)
      console.log('CustomDialogTest_n1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_o
     * @tc.name     CustomDialogTest_o
     * @tc.desc     CustomDialogTest_o
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_o', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_o()).assertEqual(0)
      console.log('CustomDialogTest_o will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_o1
     * @tc.name     CustomDialogTest_o1
     * @tc.desc     CustomDialogTest_o1
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_o1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_o1()).assertEqual(0)
      console.log('CustomDialogTest_o1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_p
     * @tc.name     CustomDialogTest_p
     * @tc.desc     CustomDialogTest_p
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_p', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_p()).assertEqual(0)
      console.log('CustomDialogTest_p will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_p1
     * @tc.name     CustomDialogTest_p1
     * @tc.desc     CustomDialogTest_p1
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_p1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_p1()).assertEqual(0)
      console.log('CustomDialogTest_p1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_q
     * @tc.name     CustomDialogTest_q
     * @tc.desc     CustomDialogTest_q
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_q', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_q()).assertEqual(0)
      console.log('CustomDialogTest_q will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_q1
     * @tc.name     CustomDialogTest_q1
     * @tc.desc     CustomDialogTest_q1
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_q1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_q1()).assertEqual(0)
      console.log('CustomDialogTest_q1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_r
     * @tc.name     CustomDialogTest_r
     * @tc.desc     CustomDialogTest_r
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_r', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_r()).assertEqual(0)
      console.log('CustomDialogTest_r will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_r1
     * @tc.name     CustomDialogTest_r1
     * @tc.desc     CustomDialogTest_r1
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_r1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_r1()).assertEqual(0)
      console.log('CustomDialogTest_r1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_s
     * @tc.name     CustomDialogTest_s
     * @tc.desc     CustomDialogTest_s
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_s', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_s()).assertEqual(0)
      console.log('CustomDialogTest_s will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_s1
     * @tc.name     CustomDialogTest_s1
     * @tc.desc     CustomDialogTest_s1
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_s1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_s1()).assertEqual(0)
      console.log('CustomDialogTest_s1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_t
     * @tc.name     CustomDialogTest_t
     * @tc.desc     CustomDialogTest_t
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_t', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_t()).assertEqual(0)
      console.log('CustomDialogTest_t will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_t1
     * @tc.name     CustomDialogTest_t1
     * @tc.desc     CustomDialogTest_t1
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_t1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_t1()).assertEqual(0)
      console.log('CustomDialogTest_t1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_u
     * @tc.name     CustomDialogTest_u
     * @tc.desc     CustomDialogTest_u
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_u', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_u()).assertEqual(0)
      console.log('CustomDialogTest_u will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_u1
     * @tc.name     CustomDialogTest_u1
     * @tc.desc     CustomDialogTest_u1
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_u1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_u1()).assertEqual(0)
      console.log('CustomDialogTest_u1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_v
     * @tc.name     CustomDialogTest_v
     * @tc.desc     CustomDialogTest_v
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_v', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_v()).assertEqual(0)
      console.log('CustomDialogTest_v will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_v1
     * @tc.name     CustomDialogTest_v1
     * @tc.desc     CustomDialogTest_v1
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_v1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_v1()).assertEqual(0)
      console.log('CustomDialogTest_v1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_w
     * @tc.name     CustomDialogTest_w
     * @tc.desc     CustomDialogTest_w
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_w', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_w()).assertEqual(0)
      console.log('CustomDialogTest_w will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_w1
     * @tc.name     CustomDialogTest_w1
     * @tc.desc     CustomDialogTest_w1
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_w1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_w1()).assertEqual(0)
      console.log('CustomDialogTest_w1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_x
     * @tc.name     CustomDialogTest_x
     * @tc.desc     CustomDialogTest_x
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_x', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_x()).assertEqual(0)
      console.log('CustomDialogTest_x will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_x1
     * @tc.name     CustomDialogTest_x1
     * @tc.desc     CustomDialogTest_x1
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_x1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_x1()).assertEqual(0)
      console.log('CustomDialogTest_x1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_y
     * @tc.name     CustomDialogTest_y
     * @tc.desc     CustomDialogTest_y
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_y', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_y()).assertEqual(0)
      console.log('CustomDialogTest_y will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_y1
     * @tc.name     CustomDialogTest_y1
     * @tc.desc     CustomDialogTest_y1
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_y1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_y1()).assertEqual(0)
      console.log('CustomDialogTest_y1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_z
     * @tc.name     CustomDialogTest_z
     * @tc.desc     CustomDialogTest_z
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_z', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_z()).assertEqual(0)
      console.log('CustomDialogTest_z will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_z1
     * @tc.name     CustomDialogTest_z1
     * @tc.desc     CustomDialogTest_z1
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_z1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_z1()).assertEqual(0)
      console.log('CustomDialogTest_z1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_A
     * @tc.name     CustomDialogTest_A
     * @tc.desc     CustomDialogTest_A
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_A', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_A()).assertEqual(0)
      console.log('CustomDialogTest_A will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_A1
     * @tc.name     CustomDialogTest_A1
     * @tc.desc     CustomDialogTest_A1
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_A1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_A1()).assertEqual(0)
      console.log('CustomDialogTest_A1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_B
     * @tc.name     CustomDialogTest_B
     * @tc.desc     CustomDialogTest_B
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_B', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_B()).assertEqual(0)
      console.log('CustomDialogTest_B will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_B1
     * @tc.name     CustomDialogTest_B1
     * @tc.desc     CustomDialogTest_B1
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_B1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_B1()).assertEqual(0)
      console.log('CustomDialogTest_B1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_C
     * @tc.name     CustomDialogTest_C
     * @tc.desc     CustomDialogTest_C
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_C', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_C()).assertEqual(0)
      console.log('CustomDialogTest_C will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_C1
     * @tc.name     CustomDialogTest_C1
     * @tc.desc     CustomDialogTest_C1
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_C1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_C1()).assertEqual(0)
      console.log('CustomDialogTest_C1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_D
     * @tc.name     CustomDialogTest_D
     * @tc.desc     CustomDialogTest_D
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_D', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_D()).assertEqual(0)
      console.log('CustomDialogTest_D will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   CustomDialogTest_D1
     * @tc.name     CustomDialogTest_D1
     * @tc.desc     CustomDialogTest_D1
     * @tc.level    Level.LEVEL0
     */
    it('CustomDialogTest_D1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.CustomDialogTest_D1()).assertEqual(0)
      console.log('CustomDialogTest_D1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

  })
}