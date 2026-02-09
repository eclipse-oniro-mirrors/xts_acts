/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file expect in compliance with the License.
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
import { BusinessError } from '@ohos.base';
import bundleManager from '@ohos.bundle.bundleManager';
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach} from "../../../hypium/index";

let domain: int = 0x0000;
let tag: string = 'testTag';
let bundleName: string = 'ohos.acts.bundlemanagererrcode.test';

export default function ErrcodeTest() {
  describe('ErrcodeTest', () => {

    /**
     * @tc.name   getLaunchWant_static_17700072
     * @tc.number Sub_Bms_getLaunchWant_static_17700072
     * @tc.desc   test errCode 17700072 when call getLaunchWant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getLaunchWant_static_17700072', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "getLaunchWant_static_17700072 start");
      try {
        let want = bundleManager.getLaunchWant();
        hilog.info(domain, tag, `getLaunchWant_static_17700072 successfully bundleName:${want.bundleName} abilityName:${want.abilityName}`);
        expect().assertFail();
        done();
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, `getLaunchWant_static_17700072 catch failed errCode:${err.code} message:${err.message}`);
        expect(err.code).assertEqual(17700072);
        done();
      }
    });

  })
}