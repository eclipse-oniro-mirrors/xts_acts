/*
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

import { expect, describe, it, beforeEach, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function AtomicServiceMenuBarSetVisibleTest(){

  describe('AtomicServiceMenuBarSetVisibleTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.number      TestAtomicServiceMenuBarSetVisible01
     * @tc.name        TestAtomicServiceMenuBarSetVisible01
     * @tc.desc        testing ContainerPicker SubComponent
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('TestAtomicServiceMenuBarSetVisible01', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestAtomicServiceMenuBarSetVisible01()).assertEqual(0)
      done();
    });

  })
}