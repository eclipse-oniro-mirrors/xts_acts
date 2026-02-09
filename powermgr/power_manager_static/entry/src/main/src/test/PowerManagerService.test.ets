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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import { BusinessError } from '@ohos.base'
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import ohos_power from '@ohos.power'

let domain: int = 0x0000;
let tag: string = 'powerManagerTest';

export default function powerManagerTest() {

  describe("powerManagerTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    
    /**
     * @tc.name   testPowerManagerTest_static_0100
     * @tc.number testPowerManagerTest_static_0100
     * @tc.desc   PowerManagerService stop test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testPowerManagerTest_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testPowerManagerTest_static_0100';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          ohos_power.registerShutdownCallback((isReboot: boolean) => {
            hilog.info(domain, tag, `${TAG} isReboot:${isReboot}`);
          });
          expect().assertFail();
        } catch (error) {
          error = error as BusinessError;
          hilog.error(domain, tag, `${TAG} error: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(4900101);
        } finally {
          hilog.info(domain, tag, `${TAG} finally`);
          done();
        }
      })

    /**
     * @tc.name   testPowerManagerTest_static_0200
     * @tc.number testPowerManagerTest_static_0200
     * @tc.desc   PowerManagerService stop test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testPowerManagerTest_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testPowerManagerTest_static_0200';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          ohos_power.unregisterShutdownCallback(() => {
            hilog.info(domain, tag, `${TAG} unregisterShutdownCallback`);
          });
          expect().assertFail();
        } catch (error) {
          error = error as BusinessError;
          hilog.error(domain, tag, `${TAG} error: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(4900101);
        } finally {
          hilog.info(domain, tag, `${TAG} finally`);
          done();
        }
      })
  });
}