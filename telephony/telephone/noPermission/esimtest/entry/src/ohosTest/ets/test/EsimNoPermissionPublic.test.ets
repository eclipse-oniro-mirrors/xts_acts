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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import eSIM from '@ohos.telephony.esim';

const SLOT_0: number = 0;
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
        isEsimSupport = eSIM.isSupported(SLOT_0);
        if (isEsimSupport) {
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
     * @tc.number    : SUB_Telephony_Esim_GetEid_0100
     * @tc.name      : testTelephonyEsimGetEid0100
     * @tc.desc      : No permission to get the EID identifying for the eUICC hardware.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetEid0100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetEid0100';
      console.info(`${caseName} test start`);
      try {
        let data: string = await eSIM.getEid(SLOT_0);
        console.info(`${caseName} success : the EID is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} failed`);
        expect(err.code).assertEqual(201);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetOsuStatus_0200
     * @tc.name      : testTelephonyEsimGetOsuStatus0200
     * @tc.desc      : No permission to get the current status of eUICC OS upgrade.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetOsuStatus0200", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetOsuStatus0200';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getOsuStatus(SLOT_0);
        console.info(`${caseName} success : the OsuStatus is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} getOsuStatus failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(201);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_StartOsu_0300
     * @tc.name      : testTelephonyEsimStartOsu0300
     * @tc.desc      : No permission to execute OS upgrade if current OS upgrade is not the latest one.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimStartOsu0300", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimStartOsu0300';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.startOsu(SLOT_0);
        console.info(`${caseName} success : the OsuStatus is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} StartOsu failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(201);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetEuiccProfileInfoList_0400
     * @tc.name      : testTelephonyEsimGetEuiccProfileInfoList0400
     * @tc.desc      : No permission to get a list of all eUICC profile information.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetEuiccProfileInfoList0400", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetEuiccProfileInfoList0400';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getEuiccProfileInfoList(SLOT_0);
        console.info(`${caseName} success : the GetEuiccProfileInfoListResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetEuiccProfileInfoList failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(201);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetEuiccInfo_0500
     * @tc.name      : testTelephonyEsimGetEuiccInfo0500
     * @tc.desc      : No permission to get the eUICC Information.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetEuiccInfo0500", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetEuiccInfo0500';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getEuiccInfo(SLOT_0);
        console.info(`${caseName} success : the EuiccInfo is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetEuiccInfo failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(201);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetDownloadableProfileMetadata_0600
     * @tc.name      : testTelephonyEsimGetDownloadableProfileMetadata0600
     * @tc.desc      : No permission to fill in and get the metadata for a downloadable profile.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetDownloadableProfileMetadata0600", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetDownloadableProfileMetadata0600';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getDownloadableProfileMetadata(SLOT_0, PORT_INDEX, profile, forceDisableProfile);
        console.info(`${caseName} success : the GetDownloadableProfileMetadataResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetDownloadableProfileMetadata failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(201);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetDownloadableProfiles_0700
     * @tc.name      : testTelephonyEsimGetDownloadableProfiles0700
     * @tc.desc      : No permission to get downloadable profile List which are available for download on this device.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetDownloadableProfiles0700", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetDownloadableProfiles0700';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getDownloadableProfiles(SLOT_0, PORT_INDEX, forceDisableProfile);
        console.info(`${caseName} success : the GetDownloadableProfilesResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetDownloadableProfiles failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(201);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_DownloadProfile_0800
     * @tc.name      : testTelephonyEsimDownloadProfile0800
     * @tc.desc      : No permission to download the given downloadable Profile.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimDownloadProfile0800", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimDownloadProfile0800';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.downloadProfile(SLOT_0, PORT_INDEX, profile, configuration);
        console.info(`${caseName} success : the DownloadProfileResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} DownloadProfile failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(201);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_DeleteProfile_0900
     * @tc.name      : testTelephonyEsimDeleteProfile0900
     * @tc.desc      : No permission to delete the given profile from eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimDeleteProfile0900", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimDeleteProfile0900';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.deleteProfile(SLOT_0, iccid);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} DeleteProfile failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(201);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_SwitchToProfile_1001
     * @tc.name      : testTelephonyEsimSwitchToProfile1001
     * @tc.desc      : No permission to switch to (enable) the given profile on the eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimSwitchToProfile1001", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimSwitchToProfile1001';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.switchToProfile(SLOT_0, PORT_INDEX, iccid, forceDisableProfile);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} SwitchToProfile failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(201);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_SetProfileNickname_1100
     * @tc.name      : testTelephonyEsimSetProfileNickname1100
     * @tc.desc      : No permission to add or update the given profile nickname.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimSetProfileNickname1100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimSetProfileNickname1100';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.setProfileNickname(SLOT_0, iccid, nickname);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} SetProfileNickname failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(201);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_ResetMemory_1200
     * @tc.name      : testTelephonyEsimResetMemory1200
     * @tc.desc      : No permission to erase all specific profiles and reset the eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimResetMemory1200", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimResetMemory1200';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.resetMemory(SLOT_0, options);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} ResetMemory failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(201);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_ReserveProfilesForFactoryRestore_1300
     * @tc.name      : testTelephonyEsimReserveProfilesForFactoryRestore1300
     * @tc.desc      : No permission to ensure that profiles will be retained on the next factory reset.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimReserveProfilesForFactoryRestore1300", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimReserveProfilesForFactoryRestore1300';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.reserveProfilesForFactoryRestore(SLOT_0);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} ReserveProfilesForFactoryRestore failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(201);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_SetDefaultSmdpAddress_1400
     * @tc.name      : testTelephonyEsimSetDefaultSmdpAddress1400
     * @tc.desc      : No permission to set or update the default SM-DP+ address stored in an eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimSetDefaultSmdpAddress1400", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimSetDefaultSmdpAddress1400';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.setDefaultSmdpAddress(SLOT_0, address);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} SetDefaultSmdpAddress failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(201);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetDefaultSmdpAddress_1500
     * @tc.name      : testTelephonyEsimGetDefaultSmdpAddress1500
     * @tc.desc      : No permission to get the default SM-DP+ address stored in an eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetDefaultSmdpAddress1500", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetDefaultSmdpAddress1500';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getDefaultSmdpAddress(SLOT_0);
        console.info(`${caseName} success : the default SM-DP+ address is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetDefaultSmdpAddress failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(201);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_CancelSession_1600
     * @tc.name      : testTelephonyEsimCancelSession1600
     * @tc.desc      : No permission to cancel session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimCancelSession1600", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimCancelSession1600';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.cancelSession(SLOT_0, transactionId, cancelReason);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} CancelSession failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(201);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_AddProfile_1700
     * @tc.name      : testTelephonyEsimAddProfile1700
     * @tc.desc      : Starts a page through an ability, on which users can touch the button to download a profile.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimAddProfile1700", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimAddProfile1700';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.addProfile(profile);
        console.info(`${caseName} success : the data is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} AddProfile failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(201);
        console.info(`${caseName} test end`);
        done();
      }
    });
  })
}