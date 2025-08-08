/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function ListSwipeChildMinSizeTest() {

  describe('ListSwipeChildMinSizeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_ChildMainSize_0100
     * @tc.name       : testListChildMainSize001
     * @tc.desc       : testing ListChildMainSize create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListChildMainSize001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildMainSize001()).assertEqual(1)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_ChildMainSize_0200
     * @tc.name       : testListChildMainSize002
     * @tc.desc       : testing ListChildMainSize interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
    */
    it('testListChildMainSize002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildMainSize002()).assertEqual(0)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ChildMainSize_0300
    * @tc.name       : testListChildMainSize003
    * @tc.desc       : testing ListChildMainSize interface
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
   */
    it('testListChildMainSize003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildMainSize003()).assertEqual(0)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_ChildMainSize_0400
    * @tc.name       : testListChildMainSize004
    * @tc.desc       : testing ListChildMainSize interface
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
   */
    it('testListChildMainSize004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildMainSize004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_ChildMainSize_0500
     * @tc.name       : testListChildMainSize005
     * @tc.desc       : testing ListChildMainSize interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
    */
    it('testListChildMainSize005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildMainSize005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_ChildMainSize_0600
     * @tc.name       : testListChildMainSize006
     * @tc.desc       : testing ListChildMainSize interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
    */
    it('testListChildMainSize006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildMainSize006()).assertEqual(0)
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_LIST_SwipeAction_0700
    * @tc.name       : testListSwipeOption007
    * @tc.desc       : testing ListSwipeAction interface
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
   */
    it('testListSwipeOption007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListSwipeOption007()).assertEqual(0)
      done()
    })

    /*
   * @tc.number     : SUB_ARKUI_CAPI_LIST_SwipeAction_0800
   * @tc.name       : testListSwipeOption008
   * @tc.desc       : testing ListSwipeAction interface
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 1
  */
    it('testListSwipeOption008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListSwipeOption008()).assertEqual(0)
      done()
    })
     
     /*
     * @tc.number     : SUB_ARKUI_CAPI_NodeUtils_010
     * @tc.name       : testNodeUtils010
     * @tc.desc       : testing NodeUtils interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNodeUtils010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeUtils010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NodeUtils_020
     * @tc.name       : testNodeUtils020
     * @tc.desc       : testing NodeUtils interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
   */
    it('testNodeUtils020', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeUtils020()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NodeUtils_030
     * @tc.name       : testNodeUtils030
     * @tc.desc       : testing NodeUtils interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
    */
    it('testNodeUtils030', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeUtils030()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NodeUtils_040
     * @tc.name       : testNodeUtils040
     * @tc.desc       : testing NodeUtils interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
    */
    it('testNodeUtils040', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeUtils040()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NodeUtils_050
     * @tc.name       : testNodeUtils050
     * @tc.desc       : testing NodeUtils interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
    */
    it('testNodeUtils050', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeUtils050()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_NodeUtils_060
     * @tc.name       : testNodeUtils060
     * @tc.desc       : testing NodeUtils interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
    */
    it('testNodeUtils060', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeUtils060()).assertEqual(0)
      done()
    })

     /*
     * @tc.number     : SUB_ARKUI_CAPI_Accessibility_070
     * @tc.name       : testAccessibility070
     * @tc.desc       : testing Accessibility interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
    */
    it('testAccessibility070', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAccessibility070()).assertEqual(1)
      done()
    })
  
   
    /*
     * @tc.number     : SUB_ARKUI_CAPI_Accessibility_080
     * @tc.name       : testAccessibility080
     * @tc.desc       : testing Accessibility interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
    */
    it('testAccessibility080', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAccessibility080()).assertEqual(1)
      done()
    })

     /*
     * @tc.number     : SUB_ARKUI_CAPI_Accessibility_090
     * @tc.name       : testAccessibility090
     * @tc.desc       : testing Accessibility interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
    */
    it('testAccessibility090', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAccessibility090()).assertEqual(1)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_Accessibility_010
     * @tc.name       : testAccessibility010
     * @tc.desc       : testing Accessibility interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
    */
    it('testAccessibility010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAccessibility010()).assertEqual(1)
      done()
    })

     /*
     * @tc.number     : SUB_ARKUI_CAPI_Accessibility_011
     * @tc.name       : testAccessibility011
     * @tc.desc       : testing Accessibility interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
    */
    it('testAccessibility011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAccessibility011()).assertEqual(1)
      done()
    })
  

  /*
   * @tc.number     : SUB_ARKUI_CAPI_ImageAnimator_0090
   * @tc.name       : testImageAniMator009
   * @tc.desc       : testing testImageAnimator interface
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 1
  */
    it('testImageAniMator009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageAniMator009()).assertEqual(1)
      done()
    })
     
  /*
   * @tc.number     : SUB_ARKUI_CAPI_ImageAnimator_010
   * @tc.name       : testImageAniMator010
   * @tc.desc       : testing testImageAnimator interface
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 1
  */
    it('testImageAniMator010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageAniMator010()).assertEqual(0)
      done()
    })


  /*
   * @tc.number     : SUB_ARKUI_CAPI_ImageAnimator_011
   * @tc.name       : testImageAniMator011
   * @tc.desc       : testing testImageAnimator interface
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 1
  */
    it('testImageAniMator010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageAniMator011()).assertEqual(1)
      done()
    }) 



  })
}
