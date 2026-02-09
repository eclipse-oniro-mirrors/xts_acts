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
import brightness from '@ohos.brightness'

let domain: int = 0x0000;
let tag: string = 'BrightnessStaticTest';

export default function BrightnessTest() {

  describe("BrightnessTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   testBrightnessTest_static_0100
     * @tc.number SUB_PowerSystem_ErrorCodeTest_ETSTest_0010
     * @tc.desc   Test the third-party application call setValue will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testBrightnessTest_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBrightnessTest_static_0100';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let value: int = 200;
          brightness.setValue(value);
        } catch (e) {
          e = e as BusinessError;
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.name   testBrightnessTest_static_0200
     * @tc.number SUB_PowerSystem_ErrorCodeTest_ETSTest_0020
     * @tc.desc   Test the third-party application call setValue will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBrightnessTest_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBrightnessTest_static_0200';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let value: int = 30;
          brightness.setValue(value, true);
        } catch (e) {
          e = e as BusinessError;
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.name   testBrightnessTest_static_0300
     * @tc.number SUB_PowerSystem_ErrorCodeTest_ETSTest_0030
     * @tc.desc   Test the third-party application call setValue will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBrightnessTest_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBrightnessTest_static_0300';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let value: int = 255;
          brightness.setValue(value, false);
        } catch (e) {
          e = e as BusinessError;
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(202);
          done();
        }
      })
  })
}