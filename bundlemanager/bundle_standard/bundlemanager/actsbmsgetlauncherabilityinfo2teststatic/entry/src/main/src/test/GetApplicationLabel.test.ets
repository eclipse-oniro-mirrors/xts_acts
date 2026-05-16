/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import bundle from '@ohos.bundle.bundleManager';
import { BusinessError } from '@ohos.base';
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
  
export default function getApplicationLabel(): void {
  describe('getApplicationLabel', (): void => {

    /**
     * @tc.name   SUB_BMS_FRAMEWORK_getApplicationLabel_9100
     * @tc.number SUB_BMS_FRAMEWORK_getApplicationLabel_9100
     * @tc.desc   Check getApplicationLabel with invalid appIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BMS_FRAMEWORK_getApplicationLabel_9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          await bundle.getApplicationLabel("ohos.acts.bms.getlauncherabilityinfo2.test.static", 0).then((data: string) => {
            console.info('getApplicationLabelInvalidAppIndex success: ' + JSON.stringify(data));
            expect().assertFail();
            done();
          }).catch((err: Error): void => {
            let message = (err as BusinessError).message;
            let code = (err as BusinessError).code;
            console.info('getApplicationLabelInvalidAppIndex failed: ' + JSON.stringify(err) + code + "==>" + message);
            expect(code).assertEqual(201);
            expect(message).assertEqual('BusinessError 201: Permission denied. An attempt was made to GetApplicationLabel forbidden by permission: ohos.permission.GET_BUNDLE_INFO_PRIVILEGED.')
            done();
          })
        } catch (err) {
          console.info('getApplicationLabelInvalidAppIndex catch error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })
  
  })
}