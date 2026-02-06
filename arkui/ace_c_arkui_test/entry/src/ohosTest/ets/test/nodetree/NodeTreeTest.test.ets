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

export default function nodeTreeTest() {

  describe('NodeTreeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testNodeTree001
     * @tc.number SUB_ARKUI_CAPI_NODE_TREE_0100
     * @tc.desc   testing createNode with nomral value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeTree001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeTree001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testNodeTree002
     * @tc.number SUB_ARKUI_CAPI_NODE_TREE_0200
     * @tc.desc   testing disposeNode with nomral value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeTree002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeTree002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testNodeTree003
     * @tc.number SUB_ARKUI_CAPI_NODE_TREE_0300
     * @tc.desc   testing addChild with nomral value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeTree003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeTree003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testNodeTree004
     * @tc.number SUB_ARKUI_CAPI_NODE_TREE_0400
     * @tc.desc   testing removeChild with nomral value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeTree004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeTree004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testNodeTree005
     * @tc.number SUB_ARKUI_CAPI_NODE_TREE_0500
     * @tc.desc   testing removeAllChildren with nomral value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeTree005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeTree005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testNodeTree006
     * @tc.number SUB_ARKUI_CAPI_NODE_TREE_0600
     * @tc.desc   testing insertChildAfter with nomral value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeTree006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeTree006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testNodeTree007
     * @tc.number SUB_ARKUI_CAPI_NODE_TREE_0700
     * @tc.desc   testing insertChildBefore with nomral value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeTree007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeTree007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testNodeTree008
     * @tc.number SUB_ARKUI_CAPI_NODE_TREE_0800
     * @tc.desc   testing insertChildAt with nomral value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeTree008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeTree008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testNodeTree009
     * @tc.number SUB_ARKUI_CAPI_NODE_TREE_0900
     * @tc.desc   testing getParent with nomral value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeTree009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeTree009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testNodeTree010
     * @tc.number SUB_ARKUI_CAPI_NODE_TREE_1000
     * @tc.desc   testing addchild with abnomral value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeTree010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeTree010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testNodeTree011
     * @tc.number SUB_ARKUI_CAPI_NODE_TREE_1100
     * @tc.desc   testing removeChild with abnomral value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeTree011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeTree011()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testNodeTree012
     * @tc.number SUB_ARKUI_CAPI_NODE_TREE_1200
     * @tc.desc   testing removeAllChildren with abnomral value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeTree012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeTree012()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testNodeTree013
     * @tc.number SUB_ARKUI_CAPI_NODE_TREE_1300
     * @tc.desc   testing insertChildAfter with abnomral value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeTree013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeTree013()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testNodeTree014
     * @tc.number SUB_ARKUI_CAPI_NODE_TREE_1400
     * @tc.desc   testing insertChildBefore with abnomral value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeTree014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeTree014()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testNodeTree015
     * @tc.number SUB_ARKUI_CAPI_NODE_TREE_1500
     * @tc.desc   testing insertChildAt with abnomral value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeTree015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeTree015()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testNodeTree016
     * @tc.number SUB_ARKUI_CAPI_NODE_TREE_1600
     * @tc.desc   testing createNode with abnomral value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeTree016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeTree016()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testNodeTree017
     * @tc.number SUB_ARKUI_CAPI_NODE_TREE_1700
     * @tc.desc   testing getParent with abnomral value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeTree017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeTree017()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testNodeTree018
     * @tc.number SUB_ARKUI_CAPI_NODE_TREE_1800
     * @tc.desc   testing addChild with abnomral value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeTree018', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeTree018()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testNodeTree019
     * @tc.number SUB_ARKUI_CAPI_NODE_TREE_1900
     * @tc.desc   testing removeChild with abnomral value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeTree019', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeTree019()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testNodeTree020
     * @tc.number SUB_ARKUI_CAPI_NODE_TREE_2000
     * @tc.desc   testing insertChildAfter with abnomral value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeTree020', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeTree020()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testNodeTree021
     * @tc.number SUB_ARKUI_CAPI_NODE_TREE_2100
     * @tc.desc   testing insertChildBefore with abnomral value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeTree021', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeTree021()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testNodeTree022
     * @tc.number SUB_ARKUI_CAPI_NODE_TREE_2200
     * @tc.desc   testing insertChildAt with abnomral value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeTree022', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testNodeTree022()).assertEqual(0)
      done()
    })
  })
}