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

export default function EsimPublic1() {
  describe('EsimPublic1', () => {
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
     * @tc.number    : SUB_Telephony_Esim_IsSupported_0100
     * @tc.name      : testTelephonyEsimIsSupported0100
     * @tc.desc      : Whether embedded subscriptions are currently supported.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimIsSupported0100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimIsSupported0100';
      console.info(`${caseName} test start`);
      let isEsimSupport: boolean = eSIM.isSupported(SLOT_0);
      if (isEsimSupport) {
        console.info(`eSIM is supported`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } else {
        console.info(`${caseName} eSIM is not supported`);
        expect().assertFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_IsSupported_0200
     * @tc.name      : testTelephonyEsimIsSupported0200
     * @tc.desc      : Whether embedded subscriptions are currently supported.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimIsSupported0200", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimIsSupported0200';
      console.info(`${caseName} test start`);
      try {
        let data: boolean = eSIM.isSupported(SLOT_1);
        console.info(`${caseName} success : the data is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} IsSupported failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_IsSupported_0300
     * @tc.name      : testTelephonyEsimIsSupported0300
     * @tc.desc      : Whether embedded subscriptions are currently supported.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimIsSupported0300", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimIsSupported0300';
      console.info(`${caseName} test start`);
      try {
        let data: boolean = eSIM.isSupported(SLOT_2);
        console.info(`${caseName} success : the data is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} IsSupported failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_IsSupported_0400
     * @tc.name      : testTelephonyEsimIsSupported0400
     * @tc.desc      : Whether embedded subscriptions are currently supported.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimIsSupported0400", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimIsSupported0400';
      console.info(`${caseName} test start`);
      try {
        let data: boolean = eSIM.isSupported(SLOT_3);
        console.info(`${caseName} success : the data is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} IsSupported failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_IsSupported_0500
     * @tc.name      : testTelephonyEsimIsSupported0500
     * @tc.desc      : Whether embedded subscriptions are currently supported.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimIsSupported0500", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimIsSupported0500';
      console.info(`${caseName} test start`);
      try {
        let data: boolean = eSIM.isSupported(SLOT_4);
        console.info(`${caseName} success : the data is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} IsSupported failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_IsSupported_0600
     * @tc.name      : testTelephonyEsimIsSupported0600
     * @tc.desc      : Whether embedded subscriptions are currently supported.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimIsSupported0600", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimIsSupported0600';
      console.info(`${caseName} test start`);
      try {
        let data: boolean = eSIM.isSupported(SLOT_5);
        console.info(`${caseName} success : the data is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} IsSupported failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_AddProfile_0700
     * @tc.name      : testTelephonyEsimAddProfile0700
     * @tc.desc      : Starts a page through an ability, on which users can touch the button to download a profile.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimAddProfile0700", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimAddProfile0700';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.addProfile(profile);
        console.info(`${caseName} success : the data is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} AddProfile failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(3120002);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_AddProfile_0800
     * @tc.name      : testTelephonyEsimAddProfile0800
     * @tc.desc      : Starts a page through an ability, on which users can touch the button to download a profile.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimAddProfile0800", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimAddProfile0800';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.addProfile(null);
        console.info(`${caseName} success : the data is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} AddProfile failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetEid_0900
     * @tc.name      : testTelephonyEsimGetEid0900
     * @tc.desc      : Returns the EID identifying for the eUICC hardware.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetEid0900", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetEid0900';
      console.info(`${caseName} test start`);
      let data: string = await eSIM.getEid(SLOT_0);
      if (data.length != 0) {
        console.info(`${caseName} success : the EID is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } else {
        console.info(`${caseName} err Return an empty EID`);
        expect().assertFail();
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetEid_1000
     * @tc.name      : testTelephonyEsimGetEid1000
     * @tc.desc      : Returns the EID identifying for the eUICC hardware.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetEid1000", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetEid1000';
      console.info(`${caseName} test start`);
      try {
        let data: string = await eSIM.getEid(SLOT_1);
        console.info(`${caseName} success : the EID is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} failed`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetEid_1100
     * @tc.name      : testTelephonyEsimGetEid1100
     * @tc.desc      : Returns the EID identifying for the eUICC hardware.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetEid1100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetEid1100';
      console.info(`${caseName} test start`);
      try {
        let data: string = await eSIM.getEid(SLOT_2);
        console.info(`${caseName} success : the EID is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} failed`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetEid_1200
     * @tc.name      : testTelephonyEsimGetEid1200
     * @tc.desc      : Returns the EID identifying for the eUICC hardware.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetEid1200", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetEid1200';
      console.info(`${caseName} test start`);
      try {
        let data: string = await eSIM.getEid(SLOT_3);
        console.info(`${caseName} success : the EID is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} failed`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetEid_1300
     * @tc.name      : testTelephonyEsimGetEid1300
     * @tc.desc      : Returns the EID identifying for the eUICC hardware.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetEid1300", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetEid1300';
      console.info(`${caseName} test start`);
      try {
        let data: string = await eSIM.getEid(SLOT_4);
        console.info(`${caseName} success : the EID is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} failed`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetEid_1400
     * @tc.name      : testTelephonyEsimGetEid1400
     * @tc.desc      : Returns the EID identifying for the eUICC hardware.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetEid1400", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetEid1400';
      console.info(`${caseName} test start`);
      try {
        let data: string = await eSIM.getEid(SLOT_5);
        console.info(`${caseName} success : the EID is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} failed`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetOsuStatus_1500
     * @tc.name      : testTelephonyEsimGetOsuStatus1500
     * @tc.desc      : Returns the current status of eUICC OS upgrade.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetOsuStatus1500", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetOsuStatus1500';
      console.info(`${caseName} test start`);
      eSIM.getOsuStatus(SLOT_0).then((data: eSIM.OsuStatus) => {
        console.info(`${caseName} success : the OsuStatus is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} getOsuStatus failed, promise: err->${JSON.stringify(err)}`);
        expect().assertFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetOsuStatus_1600
     * @tc.name      : testTelephonyEsimGetOsuStatus1600
     * @tc.desc      : Returns the current status of eUICC OS upgrade.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetOsuStatus1600", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetOsuStatus1600';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getOsuStatus(SLOT_1);
        console.info(`${caseName} success : the OsuStatus is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} getOsuStatus failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetOsuStatus_1700
     * @tc.name      : testTelephonyEsimGetOsuStatus1700
     * @tc.desc      : Returns the current status of eUICC OS upgrade.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetOsuStatus1700", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetOsuStatus1700';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getOsuStatus(SLOT_2);
        console.info(`${caseName} success : the OsuStatus is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} getOsuStatus failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetOsuStatus_1800
     * @tc.name      : testTelephonyEsimGetOsuStatus1800
     * @tc.desc      : Returns the current status of eUICC OS upgrade.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetOsuStatus1800", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetOsuStatus1800';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getOsuStatus(SLOT_3);
        console.info(`${caseName} success : the OsuStatus is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} getOsuStatus failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetOsuStatus_1900
     * @tc.name      : testTelephonyEsimGetOsuStatus1900
     * @tc.desc      : Returns the current status of eUICC OS upgrade.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetOsuStatus1900", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetOsuStatus1900';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getOsuStatus(SLOT_4);
        console.info(`${caseName} success : the OsuStatus is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} getOsuStatus failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(3120001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetOsuStatus_2000
     * @tc.name      : testTelephonyEsimGetOsuStatus2000
     * @tc.desc      : Returns the current status of eUICC OS upgrade.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetOsuStatus2000", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetOsuStatus2000';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getOsuStatus(SLOT_5);
        console.info(`${caseName} success : the OsuStatus is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} getOsuStatus failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_StartOsu_2100
     * @tc.name      : testTelephonyEsimStartOsu2100
     * @tc.desc      : Execute OS upgrade if current OS upgrade is not the latest one.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimStartOsu2100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimStartOsu2100';
      console.info(`${caseName} test start`);
      eSIM.startOsu(SLOT_0).then((data: eSIM.OsuStatus) => {
        console.info(`${caseName} success : the OsuStatus is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} StartOsu failed, promise: err->${JSON.stringify(err)}`);
        expect().assertFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_StartOsu_2200
     * @tc.name      : testTelephonyEsimStartOsu2200
     * @tc.desc      : Execute OS upgrade if current OS upgrade is not the latest one.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimStartOsu2200", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimStartOsu2200';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.startOsu(SLOT_1);
        console.info(`${caseName} success : the OsuStatus is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} StartOsu failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_StartOsu_2300
     * @tc.name      : testTelephonyEsimStartOsu2300
     * @tc.desc      : Execute OS upgrade if current OS upgrade is not the latest one.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimStartOsu2300", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimStartOsu2300';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.startOsu(SLOT_2);
        console.info(`${caseName} success : the OsuStatus is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} StartOsu failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_StartOsu_2400
     * @tc.name      : testTelephonyEsimStartOsu2400
     * @tc.desc      : Execute OS upgrade if current OS upgrade is not the latest one.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimStartOsu2400", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimStartOsu2400';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.startOsu(SLOT_3);
        console.info(`${caseName} success : the OsuStatus is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} StartOsu failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_StartOsu_2500
     * @tc.name      : testTelephonyEsimStartOsu2500
     * @tc.desc      : Execute OS upgrade if current OS upgrade is not the latest one.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimStartOsu2500", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimStartOsu2500';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.startOsu(SLOT_4);
        console.info(`${caseName} success : the OsuStatus is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} StartOsu failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(3120001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_StartOsu_2600
     * @tc.name      : testTelephonyEsimStartOsu2600
     * @tc.desc      : Execute OS upgrade if current OS upgrade is not the latest one.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimStartOsu2600", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimStartOsu2600';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.startOsu(SLOT_5);
        console.info(`${caseName} success : the OsuStatus is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} StartOsu failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetEuiccProfileInfoList_2700
     * @tc.name      : testTelephonyEsimGetEuiccProfileInfoList2700
     * @tc.desc      : Returns a list of all eUICC profile information.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetEuiccProfileInfoList2700", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetEuiccProfileInfoList2700';
      console.info(`${caseName} test start`);
      eSIM.getEuiccProfileInfoList(SLOT_0).then((data: eSIM.GetEuiccProfileInfoListResult) => {
        console.info(`${caseName} success : the GetEuiccProfileInfoListResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} GetEuiccProfileInfoList failed, promise: err->${JSON.stringify(err)}`);
        expect().assertFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetEuiccProfileInfoList_2800
     * @tc.name      : testTelephonyEsimGetEuiccProfileInfoList2800
     * @tc.desc      : Returns a list of all eUICC profile information.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetEuiccProfileInfoList2800", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetEuiccProfileInfoList2800';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getEuiccProfileInfoList(SLOT_1);
        console.info(`${caseName} success : the GetEuiccProfileInfoListResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetEuiccProfileInfoList failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetEuiccProfileInfoList_2900
     * @tc.name      : testTelephonyEsimGetEuiccProfileInfoList2900
     * @tc.desc      : Returns a list of all eUICC profile information.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetEuiccProfileInfoList2900", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetEuiccProfileInfoList2900';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getEuiccProfileInfoList(SLOT_2);
        console.info(`${caseName} success : the GetEuiccProfileInfoListResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetEuiccProfileInfoList failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetEuiccProfileInfoList_3000
     * @tc.name      : testTelephonyEsimGetEuiccProfileInfoList3000
     * @tc.desc      : Returns a list of all eUICC profile information.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetEuiccProfileInfoList3000", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetEuiccProfileInfoList3000';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getEuiccProfileInfoList(SLOT_3);
        console.info(`${caseName} success : the GetEuiccProfileInfoListResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetEuiccProfileInfoList failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetEuiccProfileInfoList_3100
     * @tc.name      : testTelephonyEsimGetEuiccProfileInfoList3100
     * @tc.desc      : Returns a list of all eUICC profile information.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetEuiccProfileInfoList3100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetEuiccProfileInfoList3100';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getEuiccProfileInfoList(SLOT_4);
        console.info(`${caseName} success : the GetEuiccProfileInfoListResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetEuiccProfileInfoList failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(3120001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetEuiccProfileInfoList_3200
     * @tc.name      : testTelephonyEsimGetEuiccProfileInfoList3200
     * @tc.desc      : Returns a list of all eUICC profile information.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetEuiccProfileInfoList3200", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetEuiccProfileInfoList3200';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getEuiccProfileInfoList(SLOT_5);
        console.info(`${caseName} success : the GetEuiccProfileInfoListResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetEuiccProfileInfoList failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetEuiccInfo_3300
     * @tc.name      : testTelephonyEsimGetEuiccInfo3300
     * @tc.desc      : Returns the eUICC Information.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetEuiccInfo3300", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetEuiccInfo3300';
      console.info(`${caseName} test start`);
      eSIM.getEuiccInfo(SLOT_0).then((data: eSIM.EuiccInfo) => {
        console.info(`${caseName} success : the EuiccInfo is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} GetEuiccInfo failed, promise: err->${JSON.stringify(err)}`);
        expect().assertFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetEuiccInfo_3400
     * @tc.name      : testTelephonyEsimGetEuiccInfo3400
     * @tc.desc      : Returns the eUICC Information.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetEuiccInfo3400", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetEuiccInfo3400';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getEuiccInfo(SLOT_1);
        console.info(`${caseName} success : the EuiccInfo is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetEuiccInfo failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetEuiccInfo_3500
     * @tc.name      : testTelephonyEsimGetEuiccInfo3500
     * @tc.desc      : Returns the eUICC Information.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetEuiccInfo3500", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetEuiccInfo3500';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getEuiccInfo(SLOT_2);
        console.info(`${caseName} success : the EuiccInfo is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetEuiccInfo failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetEuiccInfo_3600
     * @tc.name      : testTelephonyEsimGetEuiccInfo3600
     * @tc.desc      : Returns the eUICC Information.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetEuiccInfo3600", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetEuiccInfo3600';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getEuiccInfo(SLOT_3);
        console.info(`${caseName} success : the EuiccInfo is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetEuiccInfo failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetEuiccInfo_3700
     * @tc.name      : testTelephonyEsimGetEuiccInfo3700
     * @tc.desc      : Returns the eUICC Information.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetEuiccInfo3700", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetEuiccInfo3700';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getEuiccInfo(SLOT_4);
        console.info(`${caseName} success : the EuiccInfo is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetEuiccInfo failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(3120001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetEuiccInfo_3800
     * @tc.name      : testTelephonyEsimGetEuiccInfo3800
     * @tc.desc      : Returns the eUICC Information.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetEuiccInfo3800", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetEuiccInfo3800';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getEuiccInfo(SLOT_5);
        console.info(`${caseName} success : the EuiccInfo is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetEuiccInfo failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetDownloadableProfileMetadata_3900
     * @tc.name      : testTelephonyEsimGetDownloadableProfileMetadata3900
     * @tc.desc      : Fills in and gets the metadata for a downloadable profile.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetDownloadableProfileMetadata3900", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetDownloadableProfileMetadata3900';
      console.info(`${caseName} test start`);
      eSIM.getDownloadableProfileMetadata(SLOT_0, PORT_INDEX, profile,
        forceDisableProfile).then((data: eSIM.GetDownloadableProfileMetadataResult) => {
        console.info(`${caseName} success : the GetDownloadableProfileMetadataResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} GetDownloadableProfileMetadata failed, promise: err->${JSON.stringify(err)}`);
        expect().assertFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetDownloadableProfileMetadata_4000
     * @tc.name      : testTelephonyEsimGetDownloadableProfileMetadata4000
     * @tc.desc      : Fills in and gets the metadata for a downloadable profile.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetDownloadableProfileMetadata4000", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetDownloadableProfileMetadata4000';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getDownloadableProfileMetadata(SLOT_1, PORT_INDEX, profile, forceDisableProfile);
        console.info(`${caseName} success : the GetDownloadableProfileMetadataResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetDownloadableProfileMetadata failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetDownloadableProfileMetadata_4100
     * @tc.name      : testTelephonyEsimGetDownloadableProfileMetadata4100
     * @tc.desc      : Fills in and gets the metadata for a downloadable profile.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetDownloadableProfileMetadata4100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetDownloadableProfileMetadata4100';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getDownloadableProfileMetadata(SLOT_2, PORT_INDEX, profile, forceDisableProfile);
        console.info(`${caseName} success : the GetDownloadableProfileMetadataResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetDownloadableProfileMetadata failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetDownloadableProfileMetadata_4200
     * @tc.name      : testTelephonyEsimGetDownloadableProfileMetadata4200
     * @tc.desc      : Fills in and gets the metadata for a downloadable profile.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetDownloadableProfileMetadata4200", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetDownloadableProfileMetadata4200';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getDownloadableProfileMetadata(SLOT_3, PORT_INDEX, profile, forceDisableProfile);
        console.info(`${caseName} success : the GetDownloadableProfileMetadataResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetDownloadableProfileMetadata failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetDownloadableProfileMetadata_4300
     * @tc.name      : testTelephonyEsimGetDownloadableProfileMetadata4300
     * @tc.desc      : Fills in and gets the metadata for a downloadable profile.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetDownloadableProfileMetadata4300", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetDownloadableProfileMetadata4300';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getDownloadableProfileMetadata(SLOT_4, PORT_INDEX, profile, forceDisableProfile);
        console.info(`${caseName} success : the GetDownloadableProfileMetadataResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetDownloadableProfileMetadata failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(3120001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetDownloadableProfileMetadata_4400
     * @tc.name      : testTelephonyEsimGetDownloadableProfileMetadata4400
     * @tc.desc      : Fills in and gets the metadata for a downloadable profile.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetDownloadableProfileMetadata4400", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetDownloadableProfileMetadata4400';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getDownloadableProfileMetadata(SLOT_5, PORT_INDEX, profile, forceDisableProfile);
        console.info(`${caseName} success : the GetDownloadableProfileMetadataResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetDownloadableProfileMetadata failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetDownloadableProfiles_4500
     * @tc.name      : testTelephonyEsimGetDownloadableProfiles4500
     * @tc.desc      : Gets downloadable profile List which are available for download on this device.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetDownloadableProfiles4500", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetDownloadableProfiles4500';
      console.info(`${caseName} test start`);
      eSIM.getDownloadableProfiles(SLOT_0, PORT_INDEX,
        forceDisableProfile).then((data: eSIM.GetDownloadableProfilesResult) => {
        console.info(`${caseName} success : the GetDownloadableProfilesResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} GetDownloadableProfiles failed, promise: err->${JSON.stringify(err)}`);
        expect().assertFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetDownloadableProfiles_4600
     * @tc.name      : testTelephonyEsimGetDownloadableProfiles4600
     * @tc.desc      : Gets downloadable profile List which are available for download on this device.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetDownloadableProfiles4600", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetDownloadableProfiles4600';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getDownloadableProfiles(SLOT_1, PORT_INDEX, forceDisableProfile);
        console.info(`${caseName} success : the GetDownloadableProfilesResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetDownloadableProfiles failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetDownloadableProfiles_4700
     * @tc.name      : testTelephonyEsimGetDownloadableProfiles4700
     * @tc.desc      : Gets downloadable profile List which are available for download on this device.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetDownloadableProfiles4700", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetDownloadableProfiles4700';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getDownloadableProfiles(SLOT_2, PORT_INDEX, forceDisableProfile);
        console.info(`${caseName} success : the GetDownloadableProfilesResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetDownloadableProfiles failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetDownloadableProfiles_4800
     * @tc.name      : testTelephonyEsimGetDownloadableProfiles4800
     * @tc.desc      : Gets downloadable profile List which are available for download on this device.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetDownloadableProfiles4800", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetDownloadableProfiles4800';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getDownloadableProfiles(SLOT_3, PORT_INDEX, forceDisableProfile);
        console.info(`${caseName} success : the GetDownloadableProfilesResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetDownloadableProfiles failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetDownloadableProfiles_4900
     * @tc.name      : testTelephonyEsimGetDownloadableProfiles4900
     * @tc.desc      : Gets downloadable profile List which are available for download on this device.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetDownloadableProfiles4900", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetDownloadableProfiles4900';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getDownloadableProfiles(SLOT_4, PORT_INDEX, forceDisableProfile);
        console.info(`${caseName} success : the GetDownloadableProfilesResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetDownloadableProfiles failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(3120001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_GetDownloadableProfiles_5000
     * @tc.name      : testTelephonyEsimGetDownloadableProfiles5000
     * @tc.desc      : Gets downloadable profile List which are available for download on this device.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimGetDownloadableProfiles5000", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimGetDownloadableProfiles5000';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.getDownloadableProfiles(SLOT_5, PORT_INDEX, forceDisableProfile);
        console.info(`${caseName} success : the GetDownloadableProfilesResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} GetDownloadableProfiles failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_DownloadProfile_5100
     * @tc.name      : testTelephonyEsimDownloadProfile5100
     * @tc.desc      : Attempt to download the given downloadable Profile.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimDownloadProfile5100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimDownloadProfile5100';
      console.info(`${caseName} test start`);
      eSIM.downloadProfile(SLOT_0, PORT_INDEX, profile, configuration).then((data: eSIM.DownloadProfileResult) => {
        console.info(`${caseName} success : the DownloadProfileResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      }).catch((err: BusinessError) => {
        console.info(`${caseName} DownloadProfile failed, promise: err->${JSON.stringify(err)}`);
        expect().assertFail();
        console.info(`${caseName} test end `);
        done();
      });
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_DownloadProfile_5200
     * @tc.name      : testTelephonyEsimDownloadProfile5200
     * @tc.desc      : Attempt to download the given downloadable Profile.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimDownloadProfile5200", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimDownloadProfile5200';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.downloadProfile(SLOT_1, PORT_INDEX, profile, configuration);
        console.info(`${caseName} success : the DownloadProfileResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} DownloadProfile failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_DownloadProfile_5300
     * @tc.name      : testTelephonyEsimDownloadProfile5300
     * @tc.desc      : Attempt to download the given downloadable Profile.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimDownloadProfile5300", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimDownloadProfile5300';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.downloadProfile(SLOT_2, PORT_INDEX, profile, configuration);
        console.info(`${caseName} success : the DownloadProfileResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} DownloadProfile failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_DownloadProfile_5400
     * @tc.name      : testTelephonyEsimDownloadProfile5400
     * @tc.desc      : Attempt to download the given downloadable Profile.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimDownloadProfile5400", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimDownloadProfile5400';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.downloadProfile(SLOT_3, PORT_INDEX, profile, configuration);
        console.info(`${caseName} success : the DownloadProfileResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} DownloadProfile failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_DownloadProfile_5500
     * @tc.name      : testTelephonyEsimDownloadProfile5500
     * @tc.desc      : Attempt to download the given downloadable Profile.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimDownloadProfile5500", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimDownloadProfile5500';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.downloadProfile(SLOT_4, PORT_INDEX, profile, configuration);
        console.info(`${caseName} success : the DownloadProfileResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} DownloadProfile failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(3120001);
        console.info(`${caseName} test end`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_DownloadProfile_5600
     * @tc.name      : testTelephonyEsimDownloadProfile5600
     * @tc.desc      : Attempt to download the given downloadable Profile.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it("testTelephonyEsimDownloadProfile5600", 0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimDownloadProfile5600';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.downloadProfile(SLOT_5, PORT_INDEX, profile, configuration);
        console.info(`${caseName} success : the DownloadProfileResult is:${data}`);
        expect(true).assertTrue();
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.info(`${caseName} DownloadProfile failed, promise: err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        console.info(`${caseName} test end`);
        done();
      }
    });
  })
}