/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import oaid from '@ohos.identifier.oaid';
import { BY, UiDriver } from '@ohos.UiTest';
import abilityAccessCtrl, { Permissions } from "@ohos.abilityAccessCtrl";

const ERR_INVALID_PARAM: number = 401;
const TAG: string = 'OAIDTestTag';
const Domain: number = 0x0000;

function sleep(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms));
}

export default function OAIDTest(abilityContext) {
  describe('ActsOAIDTest', () => {

    beforeAll(async () => {
      console.log(TAG, `beforeAll case`);

      let atManager = abilityAccessCtrl.createAtManager();
      let permissions: Array<Permissions> = ["ohos.permission.APP_TRACKING_CONSENT"];

      try {
        atManager.requestPermissionsFromUser(abilityContext, permissions, (err, data) => {
          console.log(TAG, `getPermission requestPermissionsFromUser ${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.log(TAG, `get permission catch err -> ${JSON.stringify(err)}`);
      }
      await sleep(1000);

      let driver = UiDriver.create();
      await sleep(2000);

      let button = await driver.findComponent(BY.text("允许"));
      await button.click();
      await sleep(2000);

    });

    /**
     * @tc.name   testGetOAIDByPromise
     * @tc.number SUB_CLOUD_OAID_GETOAID_0100
     * @tc.desc   Get oaid by promise is not null.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGetOAIDByPromise", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async () => {
      let oaidResult: string = '';
      try {
        oaidResult = await oaid.getOAID();
      } catch (e) {
        hilog.error(Domain, TAG, 'Promise GetOAID error, error code is %{public}d, error message is %{public}s.', e.code, e.message);
        hilog.error(Domain, TAG, `Promise1 GetOAID error, error code is: ${e.code}, error message is: ${e.message}`);
        expect().assertFail();
      }
      expect(oaidResult.length > 0).assertEqual(true);
    })

    /**
     * @tc.name   testGetOAIDByCallback
     * @tc.number SUB_CLOUD_OAID_GETOAID_0200
     * @tc.desc   Get oaid by callback is not null.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGetOAIDByCallback", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        oaid.getOAID((error, result) => {
          expect(result.length > 0).assertEqual(true);
          done();
        });
      } catch (e) {
        hilog.error(Domain, TAG, 'Callback GetOAID error, error code is %{public}d, error message is %{public}s.', e.code, e.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testRepeatGetOAID
     * @tc.number SUB_CLOUD_OAID_GETOAID_0300
     * @tc.desc   Repeat get oaid, result is equal.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL1
     */
    it("testRepeatGetOAID", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      try {
        let oaidResult1 = await oaid.getOAID();
        let oaidResult2 = await oaid.getOAID();
        expect(oaidResult1).assertEqual(oaidResult2);
      } catch (e) {
        hilog.error(Domain, TAG, 'RepeatGetOAID error, error code is %{public}d, error message is %{public}s.', e.code, e.message);
        expect(e.code).assertEqual(ERR_INVALID_PARAM);
      }
    })

    /**
     * @tc.name   testResetOAID
     * @tc.number SUB_CLOUD_OAID_RESETOAID_0400
     * @tc.desc   Reset OAID.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL1
     */
    it("testResetOAID", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, () => {
      try {
        oaid.resetOAID();
      } catch (e) {
        hilog.error(Domain, TAG, 'ResetOAID error, error code is %{public}d, error message is %{public}s.', e.code, e.message);
        expect().assertFail();
      }
    })

  })
}