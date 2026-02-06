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

import { beforeEach, describe, expect, it, Level,beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import {LibUtil} from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'
let libUtil:LibUtil = new LibUtil();

export default function ListSwipeChildMinSizeTest() {

  describe('ListSwipeChildMinSizeTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testListChildMainSize001
     * @tc.name     testListChildMainSize001
     * @tc.desc     testListChildMainSize001
     * @tc.level    Level.LEVEL1
     */
    it('testListChildMainSize001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListChildMainSize001()).assertEqual(1)
      done()
    })

    
    
/**
     * @tc.number   testListChildMainSize002
     * @tc.name     testListChildMainSize002
     * @tc.desc     testListChildMainSize002
     * @tc.level    Level.LEVEL1
     */
    it('testListChildMainSize002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListChildMainSize002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListChildMainSize003
     * @tc.name     testListChildMainSize003
     * @tc.desc     testListChildMainSize003
     * @tc.level    Level.LEVEL1
     */
    it('testListChildMainSize003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListChildMainSize003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListChildMainSize004
     * @tc.name     testListChildMainSize004
     * @tc.desc     testListChildMainSize004
     * @tc.level    Level.LEVEL1
     */
    it('testListChildMainSize004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListChildMainSize004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListChildMainSize005
     * @tc.name     testListChildMainSize005
     * @tc.desc     testListChildMainSize005
     * @tc.level    Level.LEVEL1
     */
    it('testListChildMainSize005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListChildMainSize005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListChildMainSize006
     * @tc.name     testListChildMainSize006
     * @tc.desc     testListChildMainSize006
     * @tc.level    Level.LEVEL1
     */
    it('testListChildMainSize006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListChildMainSize006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListSwipeOption007
     * @tc.name     testListSwipeOption007
     * @tc.desc     testListSwipeOption007
     * @tc.level    Level.LEVEL1
     */
    it('testListSwipeOption007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListSwipeOption007()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListSwipeOption008
     * @tc.name     testListSwipeOption008
     * @tc.desc     testListSwipeOption008
     * @tc.level    Level.LEVEL1
     */
    it('testListSwipeOption008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListSwipeOption008()).assertEqual(0)
      done()
    })
     
     
    
/**
     * @tc.number   testNodeUtils010
     * @tc.name     testNodeUtils010
     * @tc.desc     testNodeUtils010
     * @tc.level    Level.LEVEL1
     */
    it('testNodeUtils010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testNodeUtils010()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testNodeUtils020
     * @tc.name     testNodeUtils020
     * @tc.desc     testNodeUtils020
     * @tc.level    Level.LEVEL1
     */
    it('testNodeUtils020', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testNodeUtils020()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testNodeUtils030
     * @tc.name     testNodeUtils030
     * @tc.desc     testNodeUtils030
     * @tc.level    Level.LEVEL1
     */
    it('testNodeUtils030', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testNodeUtils030()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testNodeUtils040
     * @tc.name     testNodeUtils040
     * @tc.desc     testNodeUtils040
     * @tc.level    Level.LEVEL1
     */
    it('testNodeUtils040', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testNodeUtils040()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testNodeUtils050
     * @tc.name     testNodeUtils050
     * @tc.desc     testNodeUtils050
     * @tc.level    Level.LEVEL1
     */
    it('testNodeUtils050', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testNodeUtils050()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testNodeUtils060
     * @tc.name     testNodeUtils060
     * @tc.desc     testNodeUtils060
     * @tc.level    Level.LEVEL1
     */
    it('testNodeUtils060', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testNodeUtils060()).assertEqual(0)
      done()
    })

     
    
/**
     * @tc.number   testAccessibility070
     * @tc.name     testAccessibility070
     * @tc.desc     testAccessibility070
     * @tc.level    Level.LEVEL1
     */
    it('testAccessibility070', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAccessibility070()).assertEqual(1)
      done()
    })
  
   
    
    
/**
     * @tc.number   testAccessibility080
     * @tc.name     testAccessibility080
     * @tc.desc     testAccessibility080
     * @tc.level    Level.LEVEL1
     */
    it('testAccessibility080', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAccessibility080()).assertEqual(1)
      done()
    })

     
    
/**
     * @tc.number   testAccessibility090
     * @tc.name     testAccessibility090
     * @tc.desc     testAccessibility090
     * @tc.level    Level.LEVEL1
     */
    it('testAccessibility090', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAccessibility090()).assertEqual(1)
      done()
    })

    
    
/**
     * @tc.number   testAccessibility010
     * @tc.name     testAccessibility010
     * @tc.desc     testAccessibility010
     * @tc.level    Level.LEVEL1
     */
    it('testAccessibility010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAccessibility010()).assertEqual(1)
      done()
    })

     
    
/**
     * @tc.number   testAccessibility011
     * @tc.name     testAccessibility011
     * @tc.desc     testAccessibility011
     * @tc.level    Level.LEVEL1
     */
    it('testAccessibility011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAccessibility011()).assertEqual(1)
      done()
    })
  

  
    
/**
     * @tc.number   testImageAniMator009
     * @tc.name     testImageAniMator009
     * @tc.desc     testImageAniMator009
     * @tc.level    Level.LEVEL1
     */
    it('testImageAniMator009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageAniMator009()).assertEqual(1)
      done()
    })
     
  
    
/**
     * @tc.number   testImageAniMator010
     * @tc.name     testImageAniMator010
     * @tc.desc     testImageAniMator010
     * @tc.level    Level.LEVEL1
     */
    it('testImageAniMator010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageAniMator010()).assertEqual(0)
      done()
    })


  
    
/**
     * @tc.number   testImageAniMator010
     * @tc.name     testImageAniMator010
     * @tc.desc     testImageAniMator010
     * @tc.level    Level.LEVEL1
     */
    it('testImageAniMator010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageAniMator011()).assertEqual(1)
      done()
    }) 



  })
}
