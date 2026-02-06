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

const ColorGreen: string = '#FF00FF00'
const SleepTime: number = 2000

export default function lazyForEachGetHostNodeTest() {

  describe('LazyForEachGetHostNodeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testLazyForEachGetHostNode001
     * @tc.number SUB_ARKUI_CAPI_LAZYFOREACH_GETHOSTNODE_0100
     * @tc.desc   testing getHostNode for lazyForEach with normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLazyForEachGetHostNode001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`lazyforeach/LazyForEachGetHostNodeTest`)
      await Utils.sleep(SleepTime)
      expect(Utils.getComponentInfoByKey('gridHostNode').$attrs.backgroundColor).assertEqual(ColorGreen)
      done()
    })

    /**
     * @tc.name   testLazyForEachGetHostNode002
     * @tc.number SUB_ARKUI_CAPI_LAZYFOREACH_GETHOSTNODE_0200
     * @tc.desc   testing getHostNode for lazyForEach with normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLazyForEachGetHostNode002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testLazyForEachGetHostNode002()).assertEqual(0)
      done()
    })

  })
}