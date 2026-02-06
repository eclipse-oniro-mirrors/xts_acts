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


export default function AccessibilityValueTest(){
  describe('AccessibilityValueTest',  () =>{

    afterEach(async (done: Function) => {
      await Utils.sleep(100)
      done()
    })

    it('AccessibilityValueTest_a',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_a()).assertEqual(0)
      console.log('AccessibilityValueTest_a will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('AccessibilityValueTest_a1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_a1()).assertEqual(0)
      console.log('AccessibilityValueTest_a1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('AccessibilityValueTest_b',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_b()).assertEqual(0)
      console.log('AccessibilityValueTest_b will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('AccessibilityValueTest_b1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_b1()).assertEqual(0)
      console.log('AccessibilityValueTest_b1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('AccessibilityValueTest_c',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_c()).assertEqual(0)
      console.log('AccessibilityValueTest_c will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('AccessibilityValueTest_c1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_c1()).assertEqual(0)
      console.log('AccessibilityValueTest_c1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('AccessibilityValueTest_d',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_d()).assertEqual(0)
      console.log('AccessibilityValueTest_d will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('AccessibilityValueTest_d1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_d1()).assertEqual(0)
      console.log('AccessibilityValueTest_d1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('AccessibilityValueTest_e',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_e()).assertEqual(0)
      console.log('AccessibilityValueTest_e will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('AccessibilityValueTest_e1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_e1()).assertEqual(0)
      console.log('AccessibilityValueTest_e1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('AccessibilityValueTest_f',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_f()).assertEqual(0)
      console.log('AccessibilityValueTest_f will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('AccessibilityValueTest_f1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_f1()).assertEqual(0)
      console.log('AccessibilityValueTest_f1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('AccessibilityValueTest_g',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_g()).assertEqual(0)
      console.log('AccessibilityValueTest_g will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('AccessibilityValueTest_g1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_g1()).assertEqual(0)
      console.log('AccessibilityValueTest_g1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('AccessibilityValueTest_h',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_h()).assertEqual(0)
      console.log('AccessibilityValueTest_h will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('AccessibilityValueTest_h1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_h1()).assertEqual(0)
      console.log('AccessibilityValueTest_h1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('AccessibilityValueTest_i',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_i()).assertEqual(0)
      console.log('AccessibilityValueTest_i will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('AccessibilityValueTest_i1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_i1()).assertEqual(0)
      console.log('AccessibilityValueTest_i1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('AccessibilityValueTest_j',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_j()).assertEqual(0)
      console.log('AccessibilityValueTest_j will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('AccessibilityValueTest_j1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_j1()).assertEqual(0)
      console.log('AccessibilityValueTest_j1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('AccessibilityValueTest_k1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_k1()).assertEqual(0)
      console.log('AccessibilityValueTest_k1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('AccessibilityValueTest_l',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_l()).assertEqual(0)
      console.log('AccessibilityValueTest_l will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('AccessibilityValueTest_l1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_l1()).assertEqual(0)
      console.log('AccessibilityValueTest_l1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('AccessibilityValueTest_m',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_m()).assertEqual(0)
      console.log('AccessibilityValueTest_m will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('AccessibilityValueTest_m1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_m1()).assertEqual(0)
      console.log('AccessibilityValueTest_m1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('AccessibilityValueTest_n',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_n()).assertEqual(0)
      console.log('AccessibilityValueTest_n will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('AccessibilityValueTest_n1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_n1()).assertEqual(0)
      console.log('AccessibilityValueTest_n1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('AccessibilityValueTest_o',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_o()).assertEqual(0)
      console.log('AccessibilityValueTest_o will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('AccessibilityValueTest_o1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_o1()).assertEqual(0)
      console.log('AccessibilityValueTest_o1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('AccessibilityValueTest_p',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_p()).assertEqual(0)
      console.log('AccessibilityValueTest_p will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('AccessibilityValueTest_p1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.AccessibilityValueTest_p1()).assertEqual(0)
      console.log('AccessibilityValueTest_p1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })


  })
}