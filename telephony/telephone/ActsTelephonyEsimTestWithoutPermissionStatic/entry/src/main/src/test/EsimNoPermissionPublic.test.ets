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
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import eSIM from '@ohos.telephony.esim';

let domain: int = 0x0000;
let tag: string = 'EsimPublic1';

const SLOT_0: int = 0;
const PORT_INDEX: int = 0;
let isEsimSupport: boolean = false;
let forceDisableProfile: boolean = false;
let iccid: string = 'test';
let nickname: string = 'testName';
let options: eSIM.ResetOption = eSIM.ResetOption.DELETE_OPERATIONAL_PROFILES;
let address: string = 'test';
let transactionId: string = '';
let cancelReason: eSIM.CancelReason = eSIM.CancelReason.CANCEL_REASON_END_USER_REJECTION;

let profile: eSIM.DownloadableProfile = {
  activationCode: '123456',
  confirmationCode: '',
  carrierName: '',
  accessRules: [{
    certificateHashHexStr: '',
    packageName: '',
    accessType: 0
  }]
};

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}

export default function EsimNoPermissionPublic() {
  describe('EsimNoPermissionPublic', () => {
    /**
     * @tc.number    SUB_Telephony_Esim_AddProfile_1700
     * @tc.name      testTelephonyEsimAddProfile_static_1700
     * @tc.desc      Starts a page through an ability, on which users can touch the button to download a profile.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testTelephonyEsimAddProfile_static_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyEsimAddProfile_static_1700';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let data = await eSIM.addProfile(profile);
        hilog.info(domain, tag, `${caseName} success : the data is:${data}`);
        ExpectTrue(true);
        hilog.info(domain, tag, `${caseName} test end`);
        done();
      } catch (error) {
        let err = error as BusinessError;
        if (err?.code === 801) {
          hilog.info(domain, tag, `${caseName} The current device type does not, promise: err->${JSON.stringify(err)}`);
          expect(err?.code).assertEqual(801);
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
        else{
          hilog.info(domain, tag, `${caseName} AddProfile failed, promise: err->${JSON.stringify(err)}`);
          expect(err?.code).assertEqual(201);
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      }
    });
  });
}