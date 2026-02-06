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
     * @tc.level     : Level 0
     */
    it("testTelephonyEsimIsSupported0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.level     : Level 1
     */
    it("testTelephonyEsimIsSupported0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.level     : Level 1
     */
    it("testTelephonyEsimIsSupported0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.level     : Level 1
     */
    it("testTelephonyEsimIsSupported0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.level     : Level 1
     */
    it("testTelephonyEsimIsSupported0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.level     : Level 1
     */
    it("testTelephonyEsimIsSupported0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.level     : Level 0
     */
    it("testTelephonyEsimAddProfile0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimAddProfile0700';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.addProfile(profile);
        console.info(`${caseName} success : the data is:${data}`);
        expect(true).assertTrue();
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
          expect(err.code).assertEqual(3120002);
          console.info(`${caseName} test end`);
          done();
        }
      }
    });

    /**
     * @tc.number    : SUB_Telephony_Esim_AddProfile_0800
     * @tc.name      : testTelephonyEsimAddProfile0800
     * @tc.desc      : Starts a page through an ability, on which users can touch the button to download a profile.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("testTelephonyEsimAddProfile0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonyEsimAddProfile0800';
      console.info(`${caseName} test start`);
      try {
        let data = await eSIM.addProfile(null);
        console.info(`${caseName} success : the data is:${data}`);
        expect(true).assertTrue();
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
          expect(err.code).assertEqual(401);
          console.info(`${caseName} test end`);
          done();
          }
      }
    });
  })
}