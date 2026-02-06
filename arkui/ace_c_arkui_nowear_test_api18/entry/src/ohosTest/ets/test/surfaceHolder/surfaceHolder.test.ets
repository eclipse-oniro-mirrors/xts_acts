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


export default function SurfaceHolderTest(){
  describe('SurfaceHolderTest',  () =>{

    afterEach(async (done: Function) => {
      await Utils.sleep(100)
      done()
    })

    it('SurfaceHolderTest_a',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SurfaceHolderTest_a()).assertEqual(0)
      console.log('SurfaceHolderTest_a will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('SurfaceHolderTest_a1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SurfaceHolderTest_a1()).assertEqual(0)
      console.log('SurfaceHolderTest_a1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('SurfaceHolderTest_b',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SurfaceHolderTest_b()).assertEqual(0)
      console.log('SurfaceHolderTest_b will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('SurfaceHolderTest_c',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SurfaceHolderTest_c()).assertEqual(0)
      console.log('SurfaceHolderTest_c will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('SurfaceHolderTest_c1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SurfaceHolderTest_c1()).assertEqual(0)
      console.log('SurfaceHolderTest_c1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('SurfaceHolderTest_d',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SurfaceHolderTest_d()).assertEqual(0)
      console.log('SurfaceHolderTest_d will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('SurfaceHolderTest_e',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SurfaceHolderTest_e()).assertEqual(0)
      console.log('SurfaceHolderTest_e will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('SurfaceHolderTest_e1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SurfaceHolderTest_e1()).assertEqual(0)
      console.log('SurfaceHolderTest_e1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('SurfaceHolderTest_f',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SurfaceHolderTest_f()).assertEqual(0)
      console.log('SurfaceHolderTest_f will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('SurfaceHolderTest_f1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SurfaceHolderTest_f1()).assertEqual(0)
      console.log('SurfaceHolderTest_f1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('SurfaceHolderTest_g',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SurfaceHolderTest_g()).assertEqual(0)
      console.log('SurfaceHolderTest_g will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('SurfaceHolderTest_g1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SurfaceHolderTest_g1()).assertEqual(0)
      console.log('SurfaceHolderTest_g1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('SurfaceHolderTest_h',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SurfaceHolderTest_h()).assertEqual(0)
      console.log('SurfaceHolderTest_h will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('SurfaceHolderTest_h1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SurfaceHolderTest_h1()).assertEqual(0)
      console.log('SurfaceHolderTest_h1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })


  })
}