/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with License.
 * You may obtain a copy of License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by: applicable law or agreed to in writing, software
 * distributed under License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import wifiext from '@ohos.wifiext';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
const NOT_PERMISSION = 201;
export default function wifiExtNop() {

  describe('wifiExtNop', () => {

    beforeAll(async (done: Function) => {
      console.info('beforeAll case');
      done();
    })

    beforeEach(() => {
    })

    afterEach(() => {
    })

    afterAll(async (done: Function) => {
      console.info('AfterAll case');
      done();
    })

    /**
     * @tc.name   Sub_Communication_WiFiExt_EnableHotspot_Nop
     * @tc.number Sub_Communication_WiFiExt_EnableHotspot_Nop
     * @tc.desc   Test enableHotspot API without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiExt_EnableHotspot_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiExt_EnableHotspot_Nop'
        console.info(`${caseName} test start`);
        try {
          let result = wifiext.enableHotspot();
          console.log(`${caseName} get result success `, result);
          done();
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          if (error.code === 801) {
            console.info('[bluetooth_js]descriptorWrite is not support');
            expect(801).assertEqual(error.code);
          } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          }
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFiExt_DisableHotspot_Nop
     * @tc.number Sub_Communication_WiFiExt_DisableHotspot_Nop
     * @tc.desc   Test disableHotspot API without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiExt_DisableHotspot_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiExt_DisableHotspot_Nop'
        console.info(`${caseName} test start`);
        try {
          let result = wifiext.disableHotspot();
          console.log(`${caseName} get result success `, result);
          done();
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          if (error.code === 801) {
            console.info('[bluetooth_js]descriptorWrite is not support');
            expect(801).assertEqual(error.code);
          } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          }
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFiExt_SetPowerModel_Nop
     * @tc.number Sub_Communication_WiFiExt_SetPowerModel_Nop
     * @tc.desc   Test setPowerModel API without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiExt_SetPowerModel_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiExt_SetPowerModel_Nop'
        console.info(`${caseName} test start`);
        try {
          let result = wifiext.setPowerModel(wifiext.PowerModel.GENERAL);
          console.log(`${caseName} get result success `, result);
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error.code));
          if (error.code === 801) {
            console.info('[bluetooth_js]descriptorWrite is not support');
            expect(801).assertEqual(error.code);
          } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          }
        }
        console.info(`${caseName} test end`);
        done();
      });
  })
}
