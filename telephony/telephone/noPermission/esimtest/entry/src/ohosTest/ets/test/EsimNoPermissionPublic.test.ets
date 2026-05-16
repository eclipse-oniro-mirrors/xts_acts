/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import eSIM from '@ohos.telephony.esim';

const SLOT_0: number = 0;
const SLOT_1: number = 1;
const PORT_INDEX: number = 0;
let isEsimSupport: boolean = false;
let forceDisableProfile: boolean = false;
let iccid: string = 'test';
let nickname: string = 'testName';
let options: eSIM.ResetOption = eSIM?.ResetOption?.DELETE_OPERATIONAL_PROFILES;
let address: string = 'test';
let transactionId: string = '';
let cancelReason: eSIM.CancelReason = eSIM?.CancelReason?.CANCEL_REASON_END_USER_REJECTION;

let profile: eSIM.DownloadableProfile = {
  activationCode: '123456',
  confirmationCode: '',
  carrierName: '',
  accessRules:[{
    certificateHashHexStr: '',
    packageName: '',
    accessType: 0
  }]
};

let configuration: eSIM.DownloadConfiguration = {
  switchAfterDownload: true,
  forceDisableProfile: true,
  isPprAllowed: true,
};

export default function EsimNoPermissionPublic() {
  describe('EsimNoPermissionPublic', () => {
    beforeAll(async (done: Function) => {
      try {
        let slotId=-1
        if (eSIM.isSupported(SLOT_0)) {
          slotId=0
        } else if(eSIM.isSupported(SLOT_1)) {
          slotId=1
        }
        if (slotId != -1) {
          console.info(`eSIM is supported`);
        }
        done();
      } catch (err) {
        console.info(`an error occurred to check eSIM, ${JSON.stringify(err)}`);
        done();
      }
    });
    beforeEach(() => {
      console.log(`beforeEach come in`);
    })
    afterEach(async () => {
      console.log(`afterEach come in`);
    })
    afterAll(() => {
      console.log(`afterAll come in`);
    })

    /**
     * @tc.name   testTelephonyEsimAddProfile1700
     * @tc.number SUB_Telephony_Esim_AddProfile_1700
     * @tc.desc   Starts a page through an ability, on which users can touch the button to download a profile.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testTelephonyEsimAddProfile1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimAddProfile1700';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.addProfile(profile);
        console.info(`${caseName} success : the data is:${data}`);
        expect().assertFail();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        if (err.code === 801) {
          console.info(`${caseName} The current device type does not, promise: err->${JSON.stringify(err)}`);
          expect(err.code).assertEqual(801);
          console.info(`${caseName} test end`);
          done();
        }
        else{
          console.info(`${caseName} AddProfile failed, promise: err->${JSON.stringify(err)}`);
          expect(err.code).assertEqual(201);
          console.info(`${caseName} test end`);
          done();
        }
      }
    });
  })
}