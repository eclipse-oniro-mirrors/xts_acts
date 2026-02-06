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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import testNapi from 'libentry.so';

const TAG = 'SUB_Ability_AbilityRuntime_StartSelfUIAbilityTest';

export default function NdkNotifyPageChangedTest() {
  describe('NdkNotifyPageChangedTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NotifyPageChanged_0400
     * @tc.number SUB_Ability_AbilityRuntime_NotifyPageChanged_0400
     * @tc.desc   To verify use OH_AbilityRuntime_ApplicationContextNotifyPageChanged with null targetPageName.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_NotifyPageChanged_0400', Level.LEVEL3, async (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NotifyPageChanged_0400';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.notifyPageChanged_0400();
      expect(result).assertEqual(401);
      done();
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NotifyPageChanged_0500
     * @tc.number SUB_Ability_AbilityRuntime_NotifyPageChanged_0500
     * @tc.desc   To verify use OH_AbilityRuntime_ApplicationContextNotifyPageChanged with targetPageNameLength is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_NotifyPageChanged_0500', Level.LEVEL3, async (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NotifyPageChanged_0500';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.notifyPageChanged_0500();
      expect(result).assertEqual(401);
      done();
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NotifyPageChanged_0600
     * @tc.number SUB_Ability_AbilityRuntime_NotifyPageChanged_0600
     * @tc.desc   To verify use OH_AbilityRuntime_ApplicationContextNotifyPageChanged with windowId is 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_NotifyPageChanged_0600', Level.LEVEL3, async (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NotifyPageChanged_0600';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.notifyPageChanged_0600();
      expect(result).assertEqual(401);
      done();
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NotifyPageChanged_0700
     * @tc.number SUB_Ability_AbilityRuntime_NotifyPageChanged_0700
     * @tc.desc   To verify use OH_AbilityRuntime_ApplicationContextNotifyPageChanged with testWindowId is-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_NotifyPageChanged_0700', Level.LEVEL3, async (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NotifyPageChanged_0700';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.notifyPageChanged_0700();
      expect(result).assertEqual(401);
      done();
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NotifyPageChanged_0800
     * @tc.number SUB_Ability_AbilityRuntime_NotifyPageChanged_0800
     * @tc.desc   To verify use OH_AbilityRuntime_ApplicationContextNotifyPageChanged with testPageNameLen is 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_NotifyPageChanged_0800', Level.LEVEL3, async (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_NotifyPageChanged_0800';
      hilog.info(0x0000, TAG, '%{public}s', ` ${TEST_SUITE_NAME} ========= START`);
      let result = testNapi.notifyPageChanged_0800();
      expect(result).assertEqual(401);
      done();
    })

  })
}