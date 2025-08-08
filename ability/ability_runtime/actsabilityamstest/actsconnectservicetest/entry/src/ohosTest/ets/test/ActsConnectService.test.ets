/*
 * Copyright (C) 2024 HiHope Open Source Organization.
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
import { describe, beforeAll, afterEach, it, expect } from '@ohos/hypium';
import { common, Want } from '@kit.AbilityKit';

let testAbilityContext: common.UIAbilityContext;

const TAG = 'AbilityRuntime';
const TEST_SUITE_NAME: string = 'AbilityContext';
let errorCode = 16000001;

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function actsConnectServiceTest() {
  describe('ActsConnectServiceTest', () => {

    beforeAll(() => {
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
    })

    afterEach(async () => {
      await sleep(2000);
    })

    /**
     * @tc.number SUB_Ability_AbilityRuntime_Context_AbilityContext_1600
     * @tc.name test connectServiceExtension function
     * @tc.desc test want as undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_Context_AbilityContext_1600', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_Context_AbilityContext_1600';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      let connection: number;
      let options: common.ConnectOptions = {
        async onConnect(elementName, remote) {
          if (remote === null) {
            hilog.info(0x0000, TAG, `onConnect remote is null`);
            return;
          }
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect==${elementName}`);
        },
        onDisconnect(elementName) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onDisconnect, : ${elementName}`);
        },
        async onFailed(code) {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onFailed, : ${JSON.stringify(code)}`);
          expect(code).assertEqual(errorCode);
          await testAbilityContext.disconnectServiceExtensionAbility(connection);
          done();
        },
      };
      let want: undefined = undefined
      try {
        connection = testAbilityContext.connectServiceExtensionAbility(want, options)
      } catch (err) {
        hilog.error(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} errorCode: ${err.code}, errorMsg:${err.message}`);
        expect().assertFail();
        done();
      };
    });

    /**
     * @tc.number SUB_Ability_AbilityRuntime_Context_AbilityContext_1700
     * @tc.name test connectServiceExtension function
     * @tc.desc test want as empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_Context_AbilityContext_1700', 0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_Context_AbilityContext_1700';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test begin`);
      let options: common.ConnectOptions = {
        onConnect(elementName, remote) {
          // 通过接口调用的方式进行通信，屏蔽了RPC通信的细节，简洁明了
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onConnect==${elementName}`);
        },
        onDisconnect(elementName) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onDisconnect, : ${elementName}`);
        },
        async onFailed(code) {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} onFailed, : ${JSON.stringify(code)}`);
          expect(code).assertEqual(errorCode);
          await testAbilityContext.disconnectServiceExtensionAbility(connection)
          done();
        },
      };
      let connection: number;
      let want: Want = {};
      try {
        connection = testAbilityContext.connectServiceExtensionAbility(want, options);
      } catch (err) {
        hilog.error(0x0000, TAG, '%{public}s',
          `${TEST_SUITE_NAME}#${TEST_CASE_NAME} errorCode: ${err.code}, errorMsg:${err.message}`);
        expect().assertFail();
        done();
      };
    });

  })
}