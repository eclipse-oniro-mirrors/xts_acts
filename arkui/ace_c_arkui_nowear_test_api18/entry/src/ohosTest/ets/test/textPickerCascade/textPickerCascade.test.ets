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


export default function TextPickerCascadeTest(){
  describe('TextPickerCascadeTest',  () =>{

    afterEach(async (done: Function) => {
      await Utils.sleep(100)
      done()
    })

    it('TextPickerCascadeTest_a',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_a()).assertEqual(0)
      console.log('TextPickerCascadeTest_a will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('TextPickerCascadeTest_a1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_a1()).assertEqual(0)
      console.log('TextPickerCascadeTest_a1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('TextPickerCascadeTest_b',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_b()).assertEqual(0)
      console.log('TextPickerCascadeTest_b will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('TextPickerCascadeTest_b1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_b1()).assertEqual(0)
      console.log('TextPickerCascadeTest_b1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('TextPickerCascadeTest_c',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_c()).assertEqual(0)
      console.log('TextPickerCascadeTest_c will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('TextPickerCascadeTest_c1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_c1()).assertEqual(0)
      console.log('TextPickerCascadeTest_c1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('TextPickerCascadeTest_d',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_d()).assertEqual(0)
      console.log('TextPickerCascadeTest_d will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('TextPickerCascadeTest_d1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_d1()).assertEqual(0)
      console.log('TextPickerCascadeTest_d1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('TextPickerCascadeTest_e',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_e()).assertEqual(0)
      console.log('TextPickerCascadeTest_e will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('TextPickerCascadeTest_e1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_e1()).assertEqual(0)
      console.log('TextPickerCascadeTest_e1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('TextPickerCascadeTest_f',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_f()).assertEqual(0)
      console.log('TextPickerCascadeTest_f will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    it('TextPickerCascadeTest_f1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_f1()).assertEqual(0)
      console.log('TextPickerCascadeTest_f1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })


  })
}