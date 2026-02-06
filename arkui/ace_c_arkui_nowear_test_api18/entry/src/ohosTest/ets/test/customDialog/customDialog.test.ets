/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { expect, describe, it, afterEach, beforeEach, Level } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import router from '@ohos.router';
import nativeRender from 'libnativerender.so'
import Utils from '../common/Utils';


export default function CustomDialogTest(){
  describe('CustomDialogTest',  () =>{

    afterEach(async (done: Function) => {
      await Utils.sleep(100)
      done()
    })

    it('CustomDialogTest_g1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_g1()).assertEqual(0)
      console.log('CustomDialogTest_g 1will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_a',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_a()).assertEqual(0)
      console.log('CustomDialogTest_a will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_a1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_a1()).assertEqual(0)
      console.log('CustomDialogTest_a1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_b',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_b()).assertEqual(0)
      console.log('CustomDialogTest_b will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_b1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_b1()).assertEqual(0)
      console.log('CustomDialogTest_b1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_c',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_c()).assertEqual(0)
      console.log('CustomDialogTest_c will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })


    it('CustomDialogTest_c1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_c1()).assertEqual(0)
      console.log('CustomDialogTest_c1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })
    it('CustomDialogTest_d',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_d()).assertEqual(0)
      console.log('CustomDialogTest_d will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })
    it('CustomDialogTest_d1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_d1()).assertEqual(0)
      console.log('CustomDialogTest_d1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_e',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_e()).assertEqual(0)
      console.log('CustomDialogTest_e will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_e1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_e1()).assertEqual(0)
      console.log('CustomDialogTest_e1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_f',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_f()).assertEqual(0)
      console.log('CustomDialogTest_f will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_f1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_f1()).assertEqual(0)
      console.log('CustomDialogTest_f1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_g',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_g()).assertEqual(0)
      console.log('CustomDialogTest_g will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_h',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_h()).assertEqual(0)
      console.log('CustomDialogTest_h will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_h1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_h1()).assertEqual(0)
      console.log('CustomDialogTest_h1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_i',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_i()).assertEqual(0)
      console.log('CustomDialogTest_i will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_i1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_i1()).assertEqual(0)
      console.log('CustomDialogTest_i1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_j',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_j()).assertEqual(0)
      console.log('CustomDialogTest_j will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_j1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_j1()).assertEqual(0)
      console.log('CustomDialogTest_j1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_k',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_k()).assertEqual(0)
      console.log('CustomDialogTest_k will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_k1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_k1()).assertEqual(0)
      console.log('CustomDialogTest_k1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_l',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_l()).assertEqual(0)
      console.log('CustomDialogTest_l will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_l1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_l1()).assertEqual(0)
      console.log('CustomDialogTest_l1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_m',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_m()).assertEqual(0)
      console.log('CustomDialogTest_m will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_m1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_m1()).assertEqual(0)
      console.log('CustomDialogTest_m1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_n',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_n()).assertEqual(0)
      console.log('CustomDialogTest_n will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_n1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_n1()).assertEqual(0)
      console.log('CustomDialogTest_n1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_o',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_o()).assertEqual(0)
      console.log('CustomDialogTest_o will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_o1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_o1()).assertEqual(0)
      console.log('CustomDialogTest_o1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_p',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_p()).assertEqual(0)
      console.log('CustomDialogTest_p will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_p1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_p1()).assertEqual(0)
      console.log('CustomDialogTest_p1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_q',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_q()).assertEqual(0)
      console.log('CustomDialogTest_q will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_q1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_q1()).assertEqual(0)
      console.log('CustomDialogTest_q1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_r',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_r()).assertEqual(0)
      console.log('CustomDialogTest_r will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_r1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_r1()).assertEqual(0)
      console.log('CustomDialogTest_r1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_s',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_s()).assertEqual(0)
      console.log('CustomDialogTest_s will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_s1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_s1()).assertEqual(0)
      console.log('CustomDialogTest_s1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_t',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_t()).assertEqual(0)
      console.log('CustomDialogTest_t will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_t1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_t1()).assertEqual(0)
      console.log('CustomDialogTest_t1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_u',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_u()).assertEqual(0)
      console.log('CustomDialogTest_u will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_u1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_u1()).assertEqual(0)
      console.log('CustomDialogTest_u1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_v',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_v()).assertEqual(0)
      console.log('CustomDialogTest_v will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_v1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_v1()).assertEqual(0)
      console.log('CustomDialogTest_v1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_w',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_w()).assertEqual(0)
      console.log('CustomDialogTest_w will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_w1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_w1()).assertEqual(0)
      console.log('CustomDialogTest_w1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_x',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_x()).assertEqual(0)
      console.log('CustomDialogTest_x will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_x1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_x1()).assertEqual(0)
      console.log('CustomDialogTest_x1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_y',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_y()).assertEqual(0)
      console.log('CustomDialogTest_y will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_y1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_y1()).assertEqual(0)
      console.log('CustomDialogTest_y1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_z',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_z()).assertEqual(0)
      console.log('CustomDialogTest_z will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_z1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_z1()).assertEqual(0)
      console.log('CustomDialogTest_z1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_A',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_A()).assertEqual(0)
      console.log('CustomDialogTest_A will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_A1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_A1()).assertEqual(0)
      console.log('CustomDialogTest_A1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_B',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_B()).assertEqual(0)
      console.log('CustomDialogTest_B will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_B1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_B1()).assertEqual(0)
      console.log('CustomDialogTest_B1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_C',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_C()).assertEqual(0)
      console.log('CustomDialogTest_C will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_C1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_C1()).assertEqual(0)
      console.log('CustomDialogTest_C1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_D',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_D()).assertEqual(0)
      console.log('CustomDialogTest_D will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('CustomDialogTest_D1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CustomDialogTest_D1()).assertEqual(0)
      console.log('CustomDialogTest_D1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

  })
}