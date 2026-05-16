/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import { describe, it, expect, TestType, Size, Level } from '../../../hypium/index';
import insightIntentProvider from '@ohos.app.ability.insightIntentProvider'
import insightIntent from '@ohos.app.ability.insightIntent'
import { BusinessError, RecordData } from '@ohos.base';

const DOMAIN: Int = 0x0000;
const TAG: string = 'ActsInsightIntentDecoratorStaticTest';

export default function abilityTest() {
  describe('ActsInsightIntentDecoratorStaticTest', () => {

    /**
     * @tc.name   SUB_Ability_AbilityRunTime_InsightIntentProvider_Static_4800
     * @tc.number SUB_Ability_AbilityRunTime_InsightIntentProvider_Static_4800
     * @tc.desc   Test sendExecuteResult with instanceId is -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRunTime_InsightIntentProvider_Static_4800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'SUB_Ability_AbilityRunTime_InsightIntentProvider_Static_4800';
        hilog.info(DOMAIN, TAG, `[${caseName}] create`);
        try {
          let result: insightIntent.ExecuteResult = {
            code: 404,
            result: {
              'message': 'Nothing',
            } as Record<string, RecordData>
          };
          insightIntentProvider.sendExecuteResult(-1, result).then(() => {
            try {expect().assertFail();} catch (err) {}
            done();
          }).catch((err: Error): void => {
            try {expect(err?.code).assertEqual(16000003);} catch (err) {}
            done();
          })
        } catch (err) {
          let error = err as BusinessError;
          hilog.error(DOMAIN, TAG, `[${caseName}]: error` + error.code + error.message);
          expect().assertFail();
          done();
        }
        hilog.info(DOMAIN, TAG, `[${caseName}]: end`);
      })

    /**
     * @tc.name   SUB_Ability_AbilityRunTime_InsightIntentProvider_Static_4900
     * @tc.number SUB_Ability_AbilityRunTime_InsightIntentProvider_Static_4900
     * @tc.desc   Test sendIntentResult error code 16000003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRunTime_InsightIntentProvider_Static_4900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName = 'SUB_Ability_AbilityRunTime_InsightIntentProvider_Static_4900';
        hilog.info(DOMAIN, TAG, `${caseName} start`);
        const instanceId: int = -1;
        const result: insightIntent.IntentResult<string> ={
          "code": 0,
          result: 'success'
        }
        try {
          insightIntentProvider.sendIntentResult(instanceId, result).then(() => {
            hilog.info(DOMAIN, TAG, `${caseName} sendIntentResult success`);
            expect().assertFail();
            done();
            hilog.info(DOMAIN, TAG, `${caseName} end`);
          }).catch((e) => {
            hilog.info(DOMAIN, TAG, `${caseName} sendIntentResult fail`);
            const err = e as BusinessError;
            expect(`${err?.code}`).assertEqual('16000003');
            expect(e?.message).assertEqual('The specified ID does not exist.');
            done();
            hilog.info(DOMAIN, TAG, `${caseName} end`);
          })
        } catch (e) {
          expect().assertFail();
          done();
          hilog.info(DOMAIN, TAG, `${caseName} end`);
        }
      })
  })
}
