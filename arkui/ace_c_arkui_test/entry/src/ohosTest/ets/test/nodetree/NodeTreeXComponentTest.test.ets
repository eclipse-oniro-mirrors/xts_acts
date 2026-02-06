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

import { afterEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';

export default function nodeTreeXComponentTest() {

  describe('NodeTreeXComponentTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(1000);
      done();
    })

    /**
     * @tc.name   testNodeTreeXComponent001
     * @tc.number SUB_ARKUI_CAPI_NODE_TREE_XCOMPONENT_0100
     * @tc.desc   testing AttachNativeRootNode with nomral value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeTreeXComponent001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'NodeTreeXComponentTest';
      await Utils.pushPage(`nodetree/${PAGE_TAG}`);
      await Utils.clickComponent('NodeTreeXComponent');
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('NodeTreeXComponent').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /**
     * @tc.name   testNodeTreeXComponent002
     * @tc.number SUB_ARKUI_CAPI_NODE_TREE_XCOMPONENT_0200
     * @tc.desc   testing DetachNativeRootNode with nomral value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeTreeXComponent002', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'NodeTreeXComponentDetachTest';
      await Utils.pushPage(`nodetree/${PAGE_TAG}`);
      await Utils.clickComponent('NodeTreeXComponentDetach');
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('NodeTreeXComponentDetach').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /**
     * @tc.name   testNodeTreeXComponent003
     * @tc.number SUB_ARKUI_CAPI_NODE_TREE_XCOMPONENT_0300
     * @tc.desc   testing AttachNativeRootNode with abnomral value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeTreeXComponent003', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'NodeTreeXComponent401Test';
      await Utils.pushPage(`nodetree/${PAGE_TAG}`);
      await Utils.clickComponent('NodeTreeXComponent401');
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('NodeTreeXComponent401').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /**
     * @tc.name   testNodeTreeXComponent004
     * @tc.number SUB_ARKUI_CAPI_NODE_TREE_XCOMPONENT_0400
     * @tc.desc   testing DetachNativeRootNode with abnomral value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeTreeXComponent004', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'NodeTreeXComponentDetach401Test';
      await Utils.pushPage(`nodetree/${PAGE_TAG}`);
      await Utils.clickComponent('NodeTreeXComponentDetach401');
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('NodeTreeXComponentDetach401').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })
  })
}