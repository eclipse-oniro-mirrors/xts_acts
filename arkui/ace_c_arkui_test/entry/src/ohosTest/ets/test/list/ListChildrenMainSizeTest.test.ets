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

export default function listChildrenMainSizeTest() {

  describe('ListChildrenMainSizeTest', () => {

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_CHILDREN_MAIN_SIZE_0001
     * @tc.name       : testListChildrenMainSize001
     * @tc.desc       : testing children main size for list with OH_ArkUI_ListChildrenMainSizeOption_Create result
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListChildrenMainSize001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildrenMainSize001()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_CHILDREN_MAIN_SIZE_0002
     * @tc.name       : testListChildrenMainSize002
     * @tc.desc       : testing children main size for list with nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('testListChildrenMainSize002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildrenMainSize002()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_CHILDREN_MAIN_SIZE_0003
     * @tc.name       : testListChildrenMainSize003
     * @tc.desc       : testing children main size for list with OH_ArkUI_ListChildrenMainSizeOption_Dispose
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListChildrenMainSize003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildrenMainSize003()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_CHILDREN_MAIN_SIZE_0004
     * @tc.name       : testListChildrenMainSize004
     * @tc.desc       : testing children main size for list with set and get DefaultMainSize normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListChildrenMainSize004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildrenMainSize004()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_CHILDREN_MAIN_SIZE_0005
     * @tc.name       : testListChildrenMainSize005
     * @tc.desc       : testing children main size for list with set and get DefaultMainSize large value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListChildrenMainSize005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildrenMainSize005()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_CHILDREN_MAIN_SIZE_0006
     * @tc.name       : testListChildrenMainSize006
     * @tc.desc       : testing children main size for list with set and get DefaultMainSize 0 value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListChildrenMainSize006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildrenMainSize006()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_CHILDREN_MAIN_SIZE_0007
     * @tc.name       : testListChildrenMainSize007
     * @tc.desc       : testing children main size for list with set and get DefaultMainSize -100 value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListChildrenMainSize007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildrenMainSize007()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_CHILDREN_MAIN_SIZE_0008
     * @tc.name       : testListChildrenMainSize008
     * @tc.desc       : testing children main size for list with set and get DefaultMainSize while option is nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListChildrenMainSize008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildrenMainSize008()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_CHILDREN_MAIN_SIZE_0009
     * @tc.name       : testListChildrenMainSize009
     * @tc.desc       : testing children main size for list with OH_ArkUI_ListChildrenMainSizeOption_Resize(-1)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListChildrenMainSize009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildrenMainSize009()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_CHILDREN_MAIN_SIZE_0010
     * @tc.name       : testListChildrenMainSize010
     * @tc.desc       : testing children main size for list with OH_ArkUI_ListChildrenMainSizeOption_Resize(0)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListChildrenMainSize010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildrenMainSize010()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_CHILDREN_MAIN_SIZE_0011
     * @tc.name       : testListChildrenMainSize011
     * @tc.desc       : testing children main size for list with OH_ArkUI_ListChildrenMainSizeOption_Resize(10)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListChildrenMainSize011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildrenMainSize011()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_CHILDREN_MAIN_SIZE_0012
     * @tc.name       : testListChildrenMainSize012
     * @tc.desc       : testing children main size for list with Resize while option is nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListChildrenMainSize012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildrenMainSize012()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_CHILDREN_MAIN_SIZE_0013
     * @tc.name       : testListChildrenMainSize013
     * @tc.desc       : testing children main size for list with set and get UpdateSize 0,0 value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListChildrenMainSize013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildrenMainSize013()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_CHILDREN_MAIN_SIZE_0014
     * @tc.name       : testListChildrenMainSize014
     * @tc.desc       : testing children main size for list with set and get UpdateSize 10,10 value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListChildrenMainSize014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildrenMainSize014()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_CHILDREN_MAIN_SIZE_0015
     * @tc.name       : testListChildrenMainSize015
     * @tc.desc       : testing children main size for list with set and get UpdateSize -1,10 value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListChildrenMainSize015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildrenMainSize015()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_CHILDREN_MAIN_SIZE_0016
     * @tc.name       : testListChildrenMainSize016
     * @tc.desc       : testing children main size for list with set and get UpdateSize 10,-1 value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListChildrenMainSize016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildrenMainSize016()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_CHILDREN_MAIN_SIZE_0017
     * @tc.name       : testListChildrenMainSize017
     * @tc.desc       : testing children main size for list with set and get UpdateSize 100000,10 value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListChildrenMainSize017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildrenMainSize017()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_CHILDREN_MAIN_SIZE_0018
     * @tc.name       : testListChildrenMainSize018
     * @tc.desc       : testing children main size for list with Splice 0,10,0 value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListChildrenMainSize018', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildrenMainSize018()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_CHILDREN_MAIN_SIZE_0019
     * @tc.name       : testListChildrenMainSize019
     * @tc.desc       : testing children main size for list with Splice -1,10,0 value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListChildrenMainSize019', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildrenMainSize019()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_CHILDREN_MAIN_SIZE_0020
     * @tc.name       : testListChildrenMainSize020
     * @tc.desc       : testing children main size for list with Splice 100000,10,0 value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListChildrenMainSize020', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildrenMainSize020()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_CHILDREN_MAIN_SIZE_0021
     * @tc.name       : testListChildrenMainSize021
     * @tc.desc       : testing children main size for list with Splice 0,0,0 value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListChildrenMainSize021', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildrenMainSize021()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_CHILDREN_MAIN_SIZE_0022
     * @tc.name       : testListChildrenMainSize022
     * @tc.desc       : testing children main size for list with Splice 0,-1,0 value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListChildrenMainSize022', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildrenMainSize022()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_CHILDREN_MAIN_SIZE_0023
     * @tc.name       : testListChildrenMainSize023
     * @tc.desc       : testing children main size for list with Splice 0,100000,0 value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListChildrenMainSize023', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildrenMainSize023()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_CHILDREN_MAIN_SIZE_0024
     * @tc.name       : testListChildrenMainSize024
     * @tc.desc       : testing children main size for list with Splice 0,0,10 value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListChildrenMainSize024', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildrenMainSize024()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_CHILDREN_MAIN_SIZE_0025
     * @tc.name       : testListChildrenMainSize025
     * @tc.desc       : testing children main size for list with Splice 0,0,-1 value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListChildrenMainSize025', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildrenMainSize025()).assertEqual(0)
      done()
    })
    /*
     * @tc.number     : SUB_ARKUI_CAPI_LIST_CHILDREN_MAIN_SIZE_0026
     * @tc.name       : testListChildrenMainSize026
     * @tc.desc       : testing children main size for list with Splice 0,0,100000 value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testListChildrenMainSize026', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testListChildrenMainSize026()).assertEqual(0)
      done()
    })

  })
}
