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

    /**
     * @tc.name   TextPickerCascadeTest_a
     * @tc.number TextPickerCascadeTest_a
     * @tc.desc   TextPickerCascadeTest_a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerCascadeTest_a',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_a()).assertEqual(0)
      console.log('TextPickerCascadeTest_a will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   TextPickerCascadeTest_a1
     * @tc.number TextPickerCascadeTest_a1
     * @tc.desc   TextPickerCascadeTest_a1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerCascadeTest_a1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_a1()).assertEqual(0)
      console.log('TextPickerCascadeTest_a1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   TextPickerCascadeTest_a2
     * @tc.number TextPickerCascadeTest_a2
     * @tc.desc   TextPickerCascadeTest_a2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerCascadeTest_a2',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_a2()).assertEqual(0)
      console.log('TextPickerCascadeTest_a2 will drag and check:: ')
      await Utils.sleep(200)     
      done()
    })

    /**
     * @tc.name   TextPickerCascadeTest_b
     * @tc.number TextPickerCascadeTest_b
     * @tc.desc   TextPickerCascadeTest_b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerCascadeTest_b',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_b()).assertEqual(0)
      console.log('TextPickerCascadeTest_b will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   TextPickerCascadeTest_b1
     * @tc.number TextPickerCascadeTest_b1
     * @tc.desc   TextPickerCascadeTest_b1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerCascadeTest_b1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_b1()).assertEqual(0)
      console.log('TextPickerCascadeTest_b1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

      /**
     * @tc.name   TextPickerCascadeTest_b2
     * @tc.number TextPickerCascadeTest_b2
     * @tc.desc   TextPickerCascadeTest_b2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerCascadeTest_b2',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_b2()).assertEqual(0)
      console.log('TextPickerCascadeTest_b2 will drag and check:: ')
      await Utils.sleep(200)   
      done()
    })

    /**
     * @tc.name   TextPickerCascadeTest_c
     * @tc.number TextPickerCascadeTest_c
     * @tc.desc   TextPickerCascadeTest_c
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerCascadeTest_c',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_c()).assertEqual(0)
      console.log('TextPickerCascadeTest_c will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   TextPickerCascadeTest_c1
     * @tc.number TextPickerCascadeTest_c1
     * @tc.desc   TextPickerCascadeTest_c1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerCascadeTest_c1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_c1()).assertEqual(0)
      console.log('TextPickerCascadeTest_c1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   TextPickerCascadeTest_c2
     * @tc.number TextPickerCascadeTest_c2
     * @tc.desc   TextPickerCascadeTest_c2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerCascadeTest_c2',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_c2()).assertEqual(0)
      console.log('TextPickerCascadeTest_c2 will drag and check:: ')
      await Utils.sleep(200)      
      done()
    })

    /**
     * @tc.name   TextPickerCascadeTest_d
     * @tc.number TextPickerCascadeTest_d
     * @tc.desc   TextPickerCascadeTest_d
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerCascadeTest_d',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_d()).assertEqual(0)
      console.log('TextPickerCascadeTest_d will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   TextPickerCascadeTest_d1
     * @tc.number TextPickerCascadeTest_d1
     * @tc.desc   TextPickerCascadeTest_d1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerCascadeTest_d1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_d1()).assertEqual(0)
      console.log('TextPickerCascadeTest_d1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   TextPickerCascadeTest_d2
     * @tc.number TextPickerCascadeTest_d2
     * @tc.desc   TextPickerCascadeTest_d2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerCascadeTest_d2',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_d2()).assertEqual(0)
      console.log('TextPickerCascadeTest_d2 will drag and check:: ')
      await Utils.sleep(200)     
      done()
    })

    /**
     * @tc.name   TextPickerCascadeTest_e
     * @tc.number TextPickerCascadeTest_e
     * @tc.desc   TextPickerCascadeTest_e
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerCascadeTest_e',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_e()).assertEqual(0)
      console.log('TextPickerCascadeTest_e will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   TextPickerCascadeTest_e1
     * @tc.number TextPickerCascadeTest_e1
     * @tc.desc   TextPickerCascadeTest_e1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerCascadeTest_e1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_e1()).assertEqual(0)
      console.log('TextPickerCascadeTest_e1 will drag and check:: ')
      await Utils.sleep(200)
    
      done()
    })

    /**
     * @tc.name   TextPickerCascadeTest_e2
     * @tc.number TextPickerCascadeTest_e2
     * @tc.desc   TextPickerCascadeTest_e2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerCascadeTest_e2',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_e2()).assertEqual(0)
      console.log('TextPickerCascadeTest_e2 will drag and check:: ')
      await Utils.sleep(200)   
      done()
    })

    /**
     * @tc.name   TextPickerCascadeTest_f
     * @tc.number TextPickerCascadeTest_f
     * @tc.desc   TextPickerCascadeTest_f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerCascadeTest_f',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_f()).assertEqual(0)
      console.log('TextPickerCascadeTest_f will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   TextPickerCascadeTest_f1
     * @tc.number TextPickerCascadeTest_f1
     * @tc.desc   TextPickerCascadeTest_f1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerCascadeTest_f1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_f1()).assertEqual(0)
      console.log('TextPickerCascadeTest_f1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   TextPickerCascadeTest_f2
     * @tc.number TextPickerCascadeTest_f2
     * @tc.desc   TextPickerCascadeTest_f2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerCascadeTest_f2',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_f2()).assertEqual(0)
      console.log('TextPickerCascadeTest_f2 will drag and check:: ')
      await Utils.sleep(200)    
      done()
    })

    /**
     * @tc.name   TextPickerCascadeTest_f3
     * @tc.number TextPickerCascadeTest_f3
     * @tc.desc   TextPickerCascadeTest_f3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextPickerCascadeTest_f3',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.TextPickerCascadeTest_f3()).assertEqual(0)
      console.log('TextPickerCascadeTest_f3 will drag and check:: ')
      await Utils.sleep(200)     
      done()
    })
  })
}