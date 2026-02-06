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

export default function RenderNodeTest(){

  describe('RenderNodeTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_testRenderNode_0100
     * @tc.name       : testRenderNode001
     * @tc.desc       : Test InitModuleForArkTSEnv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRenderNode001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestRenderNode001()).assertEqual(0)
      done();
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_testRenderNode_0200
    * @tc.name       : testRenderNode002
    * @tc.desc       : Test InitModuleForArkTSEnv
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRenderNode002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestRenderNode002()).assertEqual(0)
      done();
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_testRenderNode_0300
    * @tc.name       : testRenderNode003
    * @tc.desc       : Test InitModuleForArkTSEnv
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRenderNode003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestRenderNode003()).assertEqual(0)
      done();
    })

        /*
    * @tc.number     : SUB_ARKUI_CAPI_testRenderNode_0400
    * @tc.name       : testRenderNode004
    * @tc.desc       : Test InitModuleForArkTSEnv
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRenderNode004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestRenderNode004()).assertEqual(0)
      done();
    })

        /*
    * @tc.number     : SUB_ARKUI_CAPI_testRenderNode_0500
    * @tc.name       : testRenderNode005
    * @tc.desc       : Test InitModuleForArkTSEnv
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRenderNode005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestRenderNode005()).assertEqual(0)
      done();
    })

        /*
    * @tc.number     : SUB_ARKUI_CAPI_testRenderNode_0600
    * @tc.name       : testRenderNode006
    * @tc.desc       : Test InitModuleForArkTSEnv
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRenderNode006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestRenderNode006()).assertEqual(0)
      done();
    })

        /*
    * @tc.number     : SUB_ARKUI_CAPI_testRenderNode_0700
    * @tc.name       : testRenderNode007
    * @tc.desc       : Test InitModuleForArkTSEnv
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRenderNode007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestRenderNode007()).assertEqual(0)
      done();
    })

        /*
    * @tc.number     : SUB_ARKUI_CAPI_testRenderNode_0800
    * @tc.name       : testRenderNode008
    * @tc.desc       : Test InitModuleForArkTSEnv
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRenderNode008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestRenderNode008()).assertEqual(0)
      done();
    })    
  })
}