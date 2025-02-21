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
const SLOT_1: number = 1;
const SLOT_2: number = 2;
const SLOT_3: number = -1;
const SLOT_4: number = 0.0000099;
const SLOT_5: null = null;
const PORT_INDEX: number = 0;
let isEsimSupport: boolean = false;
let forceDisableProfile: boolean = false;
let iccid: string = 'test';
let nickname: string = 'testName';
let options: eSIM.ResetOption = eSIM?.ResetOption?.DELETE_OPERATIONAL_PROFILES;
let address: string = 'test';
let transactionId: string = '';
let cancelReason: eSIM.CancelReason = eSIM?.CancelReason?.CANCEL_REASON_END_USER_REJECTION;

export default function EsimPublic2() {
  describe('EsimPublic2', () => {
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
     * @tc.number    : SUB_Telephony_Esim_DeleteProfile_0100
     * @tc.name      : testTelephonyEsimDeleteProfile0100
     * @tc.desc      : Deletes the given profile from eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimDeleteProfile0100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimDeleteProfile0100';
      console.info(`${caseName} test start`);
      eSIM.deleteProfile(SLOT_0, iccid).then((data: eSIM.ResultCode) => {
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} DeleteProfile failed, promise: err->${JSON.stringify(err)}`);
        expect().assertFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_DeleteProfile_0200
     * @tc.name      : testTelephonyEsimDeleteProfile0200
     * @tc.desc      : Deletes the given profile from eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimDeleteProfile0200", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimDeleteProfile0200';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.deleteProfile(SLOT_1, iccid);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} DeleteProfile failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_DeleteProfile_0300
     * @tc.name      : testTelephonyEsimDeleteProfile0300
     * @tc.desc      : Deletes the given profile from eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimDeleteProfile0300", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimDeleteProfile0300';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.deleteProfile(SLOT_2, iccid);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} DeleteProfile failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_DeleteProfile_0400
     * @tc.name      : testTelephonyEsimDeleteProfile0400
     * @tc.desc      : Deletes the given profile from eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimDeleteProfile0400", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimDeleteProfile0400';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.deleteProfile(SLOT_3, iccid);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} DeleteProfile failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_DeleteProfile_0500
     * @tc.name      : testTelephonyEsimDeleteProfile0500
     * @tc.desc      : Deletes the given profile from eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimDeleteProfile0500", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimDeleteProfile0500';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.deleteProfile(SLOT_4, iccid);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} DeleteProfile failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(3120001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_DeleteProfile_0600
     * @tc.name      : testTelephonyEsimDeleteProfile0600
     * @tc.desc      : Deletes the given profile from eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimDeleteProfile0600", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimDeleteProfile0600';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.deleteProfile(SLOT_5, iccid);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} DeleteProfile failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_SwitchToProfile_0700
     * @tc.name      : testTelephonyEsimSwitchToProfile0700
     * @tc.desc      : Switch to (enable) the given profile on the eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimSwitchToProfile0700", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimSwitchToProfile0700';
      console.info(`${caseName} test start`);
      eSIM.switchToProfile(SLOT_0, PORT_INDEX, iccid, forceDisableProfile).then((data: eSIM.ResultCode) => {
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} SwitchToProfile failed, promise: err->${JSON.stringify(err)}`);
        expect().assertFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_SwitchToProfile_0800
     * @tc.name      : testTelephonyEsimSwitchToProfile0800
     * @tc.desc      : Switch to (enable) the given profile on the eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimSwitchToProfile0800", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimSwitchToProfile0800';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.switchToProfile(SLOT_1, PORT_INDEX, iccid, forceDisableProfile);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} SwitchToProfile failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_SwitchToProfile_0900
     * @tc.name      : testTelephonyEsimSwitchToProfile0900
     * @tc.desc      : Switch to (enable) the given profile on the eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimSwitchToProfile0900", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimSwitchToProfile0900';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.switchToProfile(SLOT_2, PORT_INDEX, iccid, forceDisableProfile);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} SwitchToProfile failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_SwitchToProfile_1000
     * @tc.name      : testTelephonyEsimSwitchToProfile1000
     * @tc.desc      : Switch to (enable) the given profile on the eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimSwitchToProfile1000", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimSwitchToProfile1000';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.switchToProfile(SLOT_3, PORT_INDEX, iccid, forceDisableProfile);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} SwitchToProfile failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_SwitchToProfile_1100
     * @tc.name      : testTelephonyEsimSwitchToProfile1100
     * @tc.desc      : Switch to (enable) the given profile on the eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimSwitchToProfile1100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimSwitchToProfile1100';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.switchToProfile(SLOT_4, PORT_INDEX, iccid, forceDisableProfile);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} SwitchToProfile failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(3120001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_SwitchToProfile_1200
     * @tc.name      : testTelephonyEsimSwitchToProfile1200
     * @tc.desc      : Switch to (enable) the given profile on the eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimSwitchToProfile1200", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimSwitchToProfile1200';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.switchToProfile(SLOT_5, PORT_INDEX, iccid, forceDisableProfile);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} SwitchToProfile failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_SetProfileNickname_1300
     * @tc.name      : testTelephonyEsimSetProfileNickname1300
     * @tc.desc      : Adds or updates the given profile nickname.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimSetProfileNickname1300", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimSetProfileNickname1300';
      console.info(`${caseName} test start`);
      eSIM.setProfileNickname(SLOT_0, iccid, nickname).then((data: eSIM.ResultCode) => {
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} SetProfileNickname failed, promise: err->${JSON.stringify(err)}`);
        expect().assertFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_SetProfileNickname_1400
     * @tc.name      : testTelephonyEsimSetProfileNickname1400
     * @tc.desc      : Adds or updates the given profile nickname.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimSetProfileNickname1400", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimSetProfileNickname1400';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.setProfileNickname(SLOT_1, iccid, nickname);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} SetProfileNickname failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_SetProfileNickname_1500
     * @tc.name      : testTelephonyEsimSetProfileNickname1500
     * @tc.desc      : Adds or updates the given profile nickname.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimSetProfileNickname1500", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimSetProfileNickname1500';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.setProfileNickname(SLOT_2, iccid, nickname);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} SetProfileNickname failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_SetProfileNickname_1600
     * @tc.name      : testTelephonyEsimSetProfileNickname1600
     * @tc.desc      : Adds or updates the given profile nickname.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimSetProfileNickname1600", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimSetProfileNickname1600';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.setProfileNickname(SLOT_3, iccid, nickname);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} SetProfileNickname failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_SetProfileNickname_1700
     * @tc.name      : testTelephonyEsimSetProfileNickname1700
     * @tc.desc      : Adds or updates the given profile nickname.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimSetProfileNickname1700", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimSetProfileNickname1700';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.setProfileNickname(SLOT_4, iccid, nickname);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} SetProfileNickname failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(3120001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_SetProfileNickname_1800
     * @tc.name      : testTelephonyEsimSetProfileNickname1800
     * @tc.desc      : Adds or updates the given profile nickname.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimSetProfileNickname1800", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimSetProfileNickname1800';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.setProfileNickname(SLOT_5, iccid, nickname);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} SetProfileNickname failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_ResetMemory_1900
     * @tc.name      : testTelephonyEsimResetMemory1900
     * @tc.desc      : Erase all specific profiles and reset the eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimResetMemory1900", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimResetMemory1900';
      console.info(`${caseName} test start`);
      eSIM.resetMemory(SLOT_0, options).then((data: eSIM.ResultCode) => {
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} ResetMemory failed, promise: err->${JSON.stringify(err)}`);
        expect().assertFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_ResetMemory_2000
     * @tc.name      : testTelephonyEsimResetMemory2000
     * @tc.desc      : Erase all specific profiles and reset the eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimResetMemory2000", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimResetMemory2000';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.resetMemory(SLOT_1, options);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} ResetMemory failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_ResetMemory_2100
     * @tc.name      : testTelephonyEsimResetMemory2100
     * @tc.desc      : Erase all specific profiles and reset the eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimResetMemory2100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimResetMemory2100';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.resetMemory(SLOT_2, options);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} ResetMemory failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_ResetMemory_2200
     * @tc.name      : testTelephonyEsimResetMemory2200
     * @tc.desc      : Erase all specific profiles and reset the eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimResetMemory2200", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimResetMemory2200';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.resetMemory(SLOT_3, options);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} ResetMemory failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_ResetMemory_2300
     * @tc.name      : testTelephonyEsimResetMemory2300
     * @tc.desc      : Erase all specific profiles and reset the eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimResetMemory2300", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimResetMemory2300';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.resetMemory(SLOT_4, options);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} ResetMemory failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(3120001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_ResetMemory_2400
     * @tc.name      : testTelephonyEsimResetMemory2400
     * @tc.desc      : Erase all specific profiles and reset the eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimResetMemory2400", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimResetMemory2400';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.resetMemory(SLOT_5, options);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} ResetMemory failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_ReserveProfilesForFactoryRestore_2500
     * @tc.name      : testTelephonyEsimReserveProfilesForFactoryRestore2500
     * @tc.desc      : Ensure that profiles will be retained on the next factory reset.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimReserveProfilesForFactoryRestore2500", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimReserveProfilesForFactoryRestore2500';
      console.info(`${caseName} test start`);
      eSIM.reserveProfilesForFactoryRestore(SLOT_0).then((data: eSIM.ResultCode) => {
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} ReserveProfilesForFactoryRestore failed, promise: err->${JSON.stringify(err)}`);
        expect().assertFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_ReserveProfilesForFactoryRestore_2600
     * @tc.name      : testTelephonyEsimReserveProfilesForFactoryRestore2600
     * @tc.desc      : Ensure that profiles will be retained on the next factory reset.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimReserveProfilesForFactoryRestore2600", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimReserveProfilesForFactoryRestore2600';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.reserveProfilesForFactoryRestore(SLOT_1);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} ReserveProfilesForFactoryRestore failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_ReserveProfilesForFactoryRestore_2700
     * @tc.name      : testTelephonyEsimReserveProfilesForFactoryRestore2700
     * @tc.desc      : Ensure that profiles will be retained on the next factory reset.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimReserveProfilesForFactoryRestore2700", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimReserveProfilesForFactoryRestore2700';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.reserveProfilesForFactoryRestore(SLOT_2);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} ReserveProfilesForFactoryRestore failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_ReserveProfilesForFactoryRestore_2800
     * @tc.name      : testTelephonyEsimReserveProfilesForFactoryRestore2800
     * @tc.desc      : Ensure that profiles will be retained on the next factory reset.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimReserveProfilesForFactoryRestore2800", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimReserveProfilesForFactoryRestore2800';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.reserveProfilesForFactoryRestore(SLOT_3);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} ReserveProfilesForFactoryRestore failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_ReserveProfilesForFactoryRestore_2900
     * @tc.name      : testTelephonyEsimReserveProfilesForFactoryRestore2900
     * @tc.desc      : Ensure that profiles will be retained on the next factory reset.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimReserveProfilesForFactoryRestore2900", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimReserveProfilesForFactoryRestore2900';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.reserveProfilesForFactoryRestore(SLOT_4);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} ReserveProfilesForFactoryRestore failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(3120001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_ReserveProfilesForFactoryRestore_3000
     * @tc.name      : testTelephonyEsimReserveProfilesForFactoryRestore3000
     * @tc.desc      : Ensure that profiles will be retained on the next factory reset.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimReserveProfilesForFactoryRestore3000", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimReserveProfilesForFactoryRestore3000';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.reserveProfilesForFactoryRestore(SLOT_5);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} ReserveProfilesForFactoryRestore failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_SetDefaultSmdpAddress_3100
     * @tc.name      : testTelephonyEsimSetDefaultSmdpAddress3100
     * @tc.desc      : Set or update the default SM-DP+ address stored in an eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimSetDefaultSmdpAddress3100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimSetDefaultSmdpAddress3100';
      console.info(`${caseName} test start`);
      eSIM.setDefaultSmdpAddress(SLOT_0, address).then((data: eSIM.ResultCode) => {
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} SetDefaultSmdpAddress failed, promise: err->${JSON.stringify(err)}`);
        expect().assertFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_SetDefaultSmdpAddress_3200
     * @tc.name      : testTelephonyEsimSetDefaultSmdpAddress3200
     * @tc.desc      : Set or update the default SM-DP+ address stored in an eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimSetDefaultSmdpAddress3200", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimSetDefaultSmdpAddress3200';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.setDefaultSmdpAddress(SLOT_1, address);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} SetDefaultSmdpAddress failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_SetDefaultSmdpAddress_3300
     * @tc.name      : testTelephonyEsimSetDefaultSmdpAddress3300
     * @tc.desc      : Set or update the default SM-DP+ address stored in an eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimSetDefaultSmdpAddress3300", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimSetDefaultSmdpAddress3300';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.setDefaultSmdpAddress(SLOT_2, address);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} SetDefaultSmdpAddress failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_SetDefaultSmdpAddress_3400
     * @tc.name      : testTelephonyEsimSetDefaultSmdpAddress3400
     * @tc.desc      : Set or update the default SM-DP+ address stored in an eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimSetDefaultSmdpAddress3400", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimSetDefaultSmdpAddress3400';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.setDefaultSmdpAddress(SLOT_3, address);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} SetDefaultSmdpAddress failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_SetDefaultSmdpAddress_3500
     * @tc.name      : testTelephonyEsimSetDefaultSmdpAddress3500
     * @tc.desc      : Set or update the default SM-DP+ address stored in an eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimSetDefaultSmdpAddress3500", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimSetDefaultSmdpAddress3500';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.setDefaultSmdpAddress(SLOT_4, address);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} SetDefaultSmdpAddress failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(3120001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_SetDefaultSmdpAddress_3600
     * @tc.name      : testTelephonyEsimSetDefaultSmdpAddress3600
     * @tc.desc      : Set or update the default SM-DP+ address stored in an eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimSetDefaultSmdpAddress3600", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimSetDefaultSmdpAddress3600';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.setDefaultSmdpAddress(SLOT_5, address);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} SetDefaultSmdpAddress failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetDefaultSmdpAddress_3700
     * @tc.name      : testTelephonyEsimGetDefaultSmdpAddress3700
     * @tc.desc      : Gets the default SM-DP+ address stored in an eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetDefaultSmdpAddress3700", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetDefaultSmdpAddress3700';
      console.info(`${caseName} test start`);
      eSIM.getDefaultSmdpAddress(SLOT_0).then((data: string) => {
        console.info(`${caseName} success : the default SM-DP+ address is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} GetDefaultSmdpAddress failed, promise: err->${JSON.stringify(err)}`);
        expect().assertFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetDefaultSmdpAddress_3800
     * @tc.name      : testTelephonyEsimGetDefaultSmdpAddress3800
     * @tc.desc      : Gets the default SM-DP+ address stored in an eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetDefaultSmdpAddress3800", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetDefaultSmdpAddress3800';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getDefaultSmdpAddress(SLOT_1);
        console.info(`${caseName} success : the default SM-DP+ address is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetDefaultSmdpAddress failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetDefaultSmdpAddress_3900
     * @tc.name      : testTelephonyEsimGetDefaultSmdpAddress3900
     * @tc.desc      : Gets the default SM-DP+ address stored in an eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetDefaultSmdpAddress3900", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetDefaultSmdpAddress3900';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getDefaultSmdpAddress(SLOT_2);
        console.info(`${caseName} success : the default SM-DP+ address is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetDefaultSmdpAddress failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetDefaultSmdpAddress_4000
     * @tc.name      : testTelephonyEsimGetDefaultSmdpAddress4000
     * @tc.desc      : Gets the default SM-DP+ address stored in an eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetDefaultSmdpAddress4000", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetDefaultSmdpAddress4000';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getDefaultSmdpAddress(SLOT_3);
        console.info(`${caseName} success : the default SM-DP+ address is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetDefaultSmdpAddress failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetDefaultSmdpAddress_4100
     * @tc.name      : testTelephonyEsimGetDefaultSmdpAddress4100
     * @tc.desc      : Gets the default SM-DP+ address stored in an eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetDefaultSmdpAddress4100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetDefaultSmdpAddress4100';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getDefaultSmdpAddress(SLOT_4);
        console.info(`${caseName} success : the default SM-DP+ address is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetDefaultSmdpAddress failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(3120001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetDefaultSmdpAddress_4200
     * @tc.name      : testTelephonyEsimGetDefaultSmdpAddress4200
     * @tc.desc      : Gets the default SM-DP+ address stored in an eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetDefaultSmdpAddress4200", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetDefaultSmdpAddress4200';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getDefaultSmdpAddress(SLOT_5);
        console.info(`${caseName} success : the default SM-DP+ address is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetDefaultSmdpAddress failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_CancelSession_4300
     * @tc.name      : testTelephonyEsimCancelSession4300
     * @tc.desc      : Cancel session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimCancelSession4300", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimCancelSession4300';
      console.info(`${caseName} test start`);
      eSIM.cancelSession(SLOT_0, transactionId, cancelReason).then((data: eSIM.ResultCode) => {
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} CancelSession failed, promise: err->${JSON.stringify(err)}`);
        expect().assertFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_CancelSession_4400
     * @tc.name      : testTelephonyEsimCancelSession4400
     * @tc.desc      : Cancel session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimCancelSession4400", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimCancelSession4400';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.cancelSession(SLOT_1, transactionId, cancelReason);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} CancelSession failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_CancelSession_4500
     * @tc.name      : testTelephonyEsimCancelSession4500
     * @tc.desc      : Cancel session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimCancelSession4500", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimCancelSession4500';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.cancelSession(SLOT_2, transactionId, cancelReason);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} CancelSession failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_CancelSession_4600
     * @tc.name      : testTelephonyEsimCancelSession4600
     * @tc.desc      : Cancel session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimCancelSession4600", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimCancelSession4600';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.cancelSession(SLOT_3, transactionId, cancelReason);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} CancelSession failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_CancelSession_4700
     * @tc.name      : testTelephonyEsimCancelSession4700
     * @tc.desc      : Cancel session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimCancelSession4700", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimCancelSession4700';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.cancelSession(SLOT_4, transactionId, cancelReason);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} CancelSession failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_CancelSession_4800
     * @tc.name      : testTelephonyEsimCancelSession4800
     * @tc.desc      : Cancel session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimCancelSession4800", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimCancelSession4800';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.cancelSession(SLOT_5, transactionId, cancelReason);
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} CancelSession failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_ResetMemory_4900
     * @tc.name      : testTelephonyEsimResetMemory4900
     * @tc.desc      : Erase all specific profiles and reset the eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimResetMemory4900", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimResetMemory4900';
      console.info(`${caseName} test start`);
      eSIM.resetMemory(SLOT_0, eSIM.ResetOption.DELETE_FIELD_LOADED_TEST_PROFILES).then((data: eSIM.ResultCode) => {
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} ResetMemory failed, promise: err->${JSON.stringify(err)}`);
        expect().assertFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_ResetMemory_5000
     * @tc.name      : testTelephonyEsimResetMemory5000
     * @tc.desc      : Erase all specific profiles and reset the eUICC.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimResetMemory5000", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimResetMemory5000';
      console.info(`${caseName} test start`);
      eSIM.resetMemory(SLOT_0, eSIM.ResetOption.RESET_DEFAULT_SMDP_ADDRESS).then((data: eSIM.ResultCode) => {
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} ResetMemory failed, promise: err->${JSON.stringify(err)}`);
        expect().assertFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_CancelSession_5100
     * @tc.name      : testTelephonyEsimCancelSession5100
     * @tc.desc      : Cancel session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimCancelSession5100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimCancelSession5100';
      console.info(`${caseName} test start`);
      eSIM.cancelSession(SLOT_0, transactionId,
        eSIM.CancelReason.CANCEL_REASON_TIMEOUT).then((data: eSIM.ResultCode) => {
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} CancelSession failed, promise: err->${JSON.stringify(err)}`);
        expect().assertFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_CancelSession_5200
     * @tc.name      : testTelephonyEsimCancelSession5200
     * @tc.desc      : Cancel session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimCancelSession5200", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimCancelSession5200';
      console.info(`${caseName} test start`);
      eSIM.cancelSession(SLOT_0, transactionId,
        eSIM.CancelReason.CANCEL_REASON_PPR_NOT_ALLOWED).then((data: eSIM.ResultCode) => {
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} CancelSession failed, promise: err->${JSON.stringify(err)}`);
        expect().assertFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_CancelSession_5300
     * @tc.name      : testTelephonyEsimCancelSession5300
     * @tc.desc      : Cancel session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimCancelSession5300", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimCancelSession5300';
      console.info(`${caseName} test start`);
      eSIM.cancelSession(SLOT_0, transactionId,
        eSIM.CancelReason.CANCEL_REASON_POSTPONED).then((data: eSIM.ResultCode) => {
        console.info(`${caseName} success : the ResultCode is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} CancelSession failed, promise: err->${JSON.stringify(err)}`);
        expect().assertFail();
        console.info(`${caseName} test end `);
        done();
      });
    });
  })
}