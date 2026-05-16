/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import formAgent from '@ohos.app.form.formAgent';
import Utils from './Util.test';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base'


const DOMAIN: int = 0x0000;
const TAG: string = 'testTag formAgentTest';

const ERROR_CODE202: int = 202;

export default function formAgentTest() {
  describe("formAgentTest", (): void => {
    hilog.info(DOMAIN, TAG, 'formAgentTest describe start');

    /**
     * @tc.name   formAgentTest001
     * @tc.number formAgentTest001
     * @tc.desc   check requestPublishForm callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("formAgentTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      hilog.info(DOMAIN, TAG, 'formAgentTest001 start');

      let want: Want = {
        bundleName: 'com.ohos.exampledemo'
      };
      try {
        formAgent.requestPublishForm(want, (error: BusinessError|null, data: string|undefined) => {
          if (error?.code !== 0) {
            hilog.error(DOMAIN, TAG, `formAgent requestPublishForm callback error, code: ${error?.code}, message: ${error?.message})`);
            expect(error?.code).assertEqual(ERROR_CODE202);
            done();
            return;
          }
          hilog.info(DOMAIN, TAG, `formAgent requestPublishForm success`);
          expect().assertFail();
          done();
        });
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        hilog.error(DOMAIN, TAG, `formAgent requestPublishForm catch error, code: ${code}, message: ${message})`);
        expect().assertFail();
        done();
      }
      hilog.info(DOMAIN, TAG, 'formAgentTest001 end');
    })

    /**
     * @tc.name   formAgentTest002
     * @tc.number formAgentTest002
     * @tc.desc   check requestPublishForm promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("formAgentTest002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      hilog.info(DOMAIN, TAG, 'formAgentTest002 start');

      let want: Want = {
        bundleName: 'com.ohos.exampledemo'
      };
      try {
        formAgent.requestPublishForm(want).then((data: string) => {
          hilog.info(DOMAIN, TAG, `formAgent requestPublishForm success`);
          expect().assertFail();
          done();
        }).catch((error: Error) => {
          let code = (error as BusinessError).code;
          let message = (error as BusinessError).message;
          hilog.error(DOMAIN, TAG, `formAgent requestPublishForm promise error, code: ${code}, message: ${message})`);
          expect(code).assertEqual(ERROR_CODE202);
          done();
        });
      } catch (error) {
        let code = (error as BusinessError).code;
        let message = (error as BusinessError).message;
        hilog.error(DOMAIN, TAG, `formAgent requestPublishForm catch error, code: ${code}, message: ${message})`);
        expect().assertFail();
        done();
      }
      hilog.info(DOMAIN, TAG, 'formAgentTest002 end');
    })
  })
}