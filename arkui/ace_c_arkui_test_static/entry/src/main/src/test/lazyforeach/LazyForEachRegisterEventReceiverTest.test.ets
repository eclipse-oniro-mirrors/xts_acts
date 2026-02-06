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

import { beforeEach, describe, expect, it, Level, beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import { LibUtil } from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'

let libUtil: LibUtil = new LibUtil();

export default function lazyForEachRegisterEventReceiverTest() {

  describe('LazyForEachRegisterEventReceiverTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });


    
    /**
     * @tc.number   testLazyForEachRegisterEventReceiver001
     * @tc.name     testLazyForEachRegisterEventReceiver001
     * @tc.desc     testLazyForEachRegisterEventReceiver001
     * @tc.level    Level.LEVEL1
     */
    it('testLazyForEachRegisterEventReceiver001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLazyForEachRegisterEventReceiver001()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testLazyForEachRegisterEventReceiver002
     * @tc.name     testLazyForEachRegisterEventReceiver002
     * @tc.desc     testLazyForEachRegisterEventReceiver002
     * @tc.level    Level.LEVEL1
     */
    it('testLazyForEachRegisterEventReceiver002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLazyForEachRegisterEventReceiver002()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testLazyForEachRegisterEventReceiver003
     * @tc.name     testLazyForEachRegisterEventReceiver003
     * @tc.desc     testLazyForEachRegisterEventReceiver003
     * @tc.level    Level.LEVEL1
     */
    it('testLazyForEachRegisterEventReceiver003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLazyForEachRegisterEventReceiver003()).assertEqual(0)
      done()
    })


    
    /**
     * @tc.number   testLazyForEachRegisterEventReceiver004
     * @tc.name     testLazyForEachRegisterEventReceiver004
     * @tc.desc     testLazyForEachRegisterEventReceiver004
     * @tc.level    Level.LEVEL1
     */
    it('testLazyForEachRegisterEventReceiver004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLazyForEachRegisterEventReceiver004()).assertEqual(0)
      done()
    })

  })
}