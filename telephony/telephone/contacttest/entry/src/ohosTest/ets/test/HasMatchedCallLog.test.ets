/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, it, expect, Level, Size, TestType } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import contact from '@ohos.contact';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';

function sleep (ms :number = 66): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve();
      }, ms)
  })
}

async function getPermissions() {
  console.info('getPermission start');
  type MyPermissions = "ohos.permission.WRITE_CONTACTS" | "ohos.permission.READ_CONTACTS";
  let list: MyPermissions[] = ['ohos.permission.WRITE_CONTACTS', 'ohos.permission.READ_CONTACTS'];
  try {
    let userId: number = await account.getAccountManager().getOsAccountLocalId();
    let applicationFlags: number = bundleManager.ApplicationFlag.GET_APPLICATION_INFO_DEFAULT;
    let applicationInfo: bundleManager.ApplicationInfo = await bundleManager.getApplicationInfoSync('com.example.contacttest', applicationFlags, userId);
    let tokenId: number = applicationInfo.accessTokenId;
    for (let index = 0; index < list.length; index++) {
      await abilityAccessCtrl.createAtManager().grantUserGrantedPermission(tokenId, list[index], 1);
    }
  } catch (err) {
    console.info(`getPermission error ${JSON.stringify(err)}`);
  }
  console.info('getPermission end');
}

export default function HasMatchedCallLogTest() {
    describe('HasMatchedCallLogTest', async (done: Function) => {
    beforeAll(async (done: Function) => {
      console.info("HasMatchedCallLogTest beforeAll case");
      await getPermissions();
      done();
    });

    /**
     * @tc.name   testHasMatchedCallLog0100
     * @tc.number SUB_Telephony_Contact_HasMatchedCallLog_0100
     * @tc.desc   Test hasMatchedCallLog with all parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHasMatchedCallLog0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testHasMatchedCallLog0100';
      console.info(`${caseName} test start`);

      try {
        let context: Context = AppStorage.get('context') as Context;
        let phoneNumber = "13800000000";
        let minDuration = 10;
        let withinTime = 400;
        let result = await contact.hasMatchedCallLog(context, phoneNumber, minDuration, withinTime);
        console.info(`${caseName} result: ${result}`);
        expect(result).assertFalse();
        done();
      } catch (error) {
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testHasMatchedCallLog0200
     * @tc.number SUB_Telephony_Contact_HasMatchedCallLog_0200
     * @tc.desc   Test hasMatchedCallLog without optional withinTime parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHasMatchedCallLog0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testHasMatchedCallLog0200';
      console.info(`${caseName} test start`);

      try {
        let context: Context = AppStorage.get('context') as Context;
        let phoneNumber = "13800000000";
        let minDuration = 10;

        let result = await contact.hasMatchedCallLog(context, phoneNumber, minDuration);
        console.info(`${caseName} result: ${result}`);
        expect(result).assertFalse();
        done();
      } catch (error) {
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testHasMatchedCallLog0300
     * @tc.number SUB_Telephony_Contact_HasMatchedCallLog_0300
     * @tc.desc   Test hasMatchedCallLog with empty phoneNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHasMatchedCallLog0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testHasMatchedCallLog0300';
      console.info(`${caseName} test start`);

      try {
        let context: Context = AppStorage.get('context') as Context;
        let minDuration = 10;

        let result = await contact.hasMatchedCallLog(context, null, minDuration);
        console.info(`${caseName} should throw error but not`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        expect(error.code === 16700002).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testHasMatchedCallLog0700
     * @tc.number SUB_Telephony_Contact_HasMatchedCallLog_0700
     * @tc.desc   Test hasMatchedCallLog with undefined phoneNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHasMatchedCallLog0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testHasMatchedCallLog0700';
      console.info(`${caseName} test start`);

      try {
        let context: Context = AppStorage.get('context') as Context;
        let minDuration = 10;

        let result = await contact.hasMatchedCallLog(context, undefined, minDuration);
        console.info(`${caseName} should throw error but not`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        expect(error.code === 16700002).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testHasMatchedCallLog1400
     * @tc.number SUB_Telephony_Contact_HasMatchedCallLog_1400
     * @tc.desc   Test hasMatchedCallLog with undefined phoneNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHasMatchedCallLog1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testHasMatchedCallLog1400';
      console.info(`${caseName} test start`);

      try {
        let context: Context = AppStorage.get('context') as Context;
        let minDuration = 10;

        let result = await contact.hasMatchedCallLog(context, undefined, minDuration, 400);
        console.info(`${caseName} should throw error but not`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        expect(error.code === 16700002).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testHasMatchedCallLog1600
     * @tc.number SUB_Telephony_Contact_HasMatchedCallLog_1600
     * @tc.desc   Test hasMatchedCallLog with undefined phoneNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHasMatchedCallLog1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testHasMatchedCallLog1600';
      console.info(`${caseName} test start`);

      try {
        let context: Context = AppStorage.get('context') as Context;
        let minDuration = 10;

        let result = await contact.hasMatchedCallLog(context, null, minDuration, 400);
        console.info(`${caseName} should throw error but not`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        expect(error.code === 16700002).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testHasMatchedCallLog0400
     * @tc.number SUB_Telephony_Contact_HasMatchedCallLog_0400
     * @tc.desc   Test hasMatchedCallLog with invalid minDuration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHasMatchedCallLog0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testHasMatchedCallLog0400';
      console.info(`${caseName} test start`);

      try {
        let context: Context = AppStorage.get('context') as Context;
        let phoneNumber = "13800000000";

        let result = await contact.hasMatchedCallLog(context, phoneNumber, null);
        console.info(`${caseName} should throw error but not`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        expect(error.code === 16700002).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testHasMatchedCallLog0800
     * @tc.number SUB_Telephony_Contact_HasMatchedCallLog_0800
     * @tc.desc   Test hasMatchedCallLog with undefined minDuration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHasMatchedCallLog0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testHasMatchedCallLog0800';
      console.info(`${caseName} test start`);

      try {
        let context: Context = AppStorage.get('context') as Context;
        let phoneNumber = "13800000000";

        let result = await contact.hasMatchedCallLog(context, phoneNumber, undefined);
        console.info(`${caseName} should throw error but not`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        expect(error.code === 16700002).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testHasMatchedCallLog1500
     * @tc.number SUB_Telephony_Contact_HasMatchedCallLog_1500
     * @tc.desc   Test hasMatchedCallLog with undefined minDuration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHasMatchedCallLog1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testHasMatchedCallLog1500';
      console.info(`${caseName} test start`);

      try {
        let context: Context = AppStorage.get('context') as Context;
        let phoneNumber = "13800000000";

        let result = await contact.hasMatchedCallLog(context, phoneNumber, undefined, 400);
        console.info(`${caseName} should throw error but not`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        expect(error.code === 16700002).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testHasMatchedCallLog1700
     * @tc.number SUB_Telephony_Contact_HasMatchedCallLog_1700
     * @tc.desc   Test hasMatchedCallLog with undefined minDuration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHasMatchedCallLog1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testHasMatchedCallLog1700';
      console.info(`${caseName} test start`);

      try {
        let context: Context = AppStorage.get('context') as Context;
        let phoneNumber = "13800000000";

        let result = await contact.hasMatchedCallLog(context, phoneNumber, null, 400);
        console.info(`${caseName} should throw error but not`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        expect(error.code === 16700002).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testHasMatchedCallLog0500
     * @tc.number SUB_Telephony_Contact_HasMatchedCallLog_0500
     * @tc.desc   Test hasMatchedCallLog with invalid withinTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHasMatchedCallLog0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testHasMatchedCallLog0500';
      console.info(`${caseName} test start`);

      try {
        let context: Context = AppStorage.get('context') as Context;
        let phoneNumber = "13800000000";
        let minDuration = 10;

        let result = await contact.hasMatchedCallLog(context, phoneNumber, minDuration, null);
        console.info(`${caseName} should throw error but not`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        expect(error.code === 16700002).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testHasMatchedCallLog0900
     * @tc.number SUB_Telephony_Contact_HasMatchedCallLog_0900
     * @tc.desc   Test hasMatchedCallLog with undefined withinTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHasMatchedCallLog0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testHasMatchedCallLog0900';
      console.info(`${caseName} test start`);

      try {
        let context: Context = AppStorage.get('context') as Context;
        let phoneNumber = "13800000000";
        let minDuration = 10;

        let result = await contact.hasMatchedCallLog(context, phoneNumber, minDuration, undefined);
        console.info(`${caseName} should throw error but not`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        expect(error.code === 16700002).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testHasMatchedCallLog1000
     * @tc.number SUB_Telephony_Contact_HasMatchedCallLog_1000
     * @tc.desc   Test hasMatchedCallLog with null context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHasMatchedCallLog1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testHasMatchedCallLog1000';
      console.info(`${caseName} test start`);

      try {
        let context: Context = AppStorage.get('context') as Context;
        let phoneNumber = "13800000000";
        let minDuration = 10;

        let result = await contact.hasMatchedCallLog(null, phoneNumber, minDuration);
        console.info(`${caseName} result: ${result}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        expect(error.code === 201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testHasMatchedCallLog1100
     * @tc.number SUB_Telephony_Contact_HasMatchedCallLog_1100
     * @tc.desc   Test hasMatchedCallLog with undefined context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHasMatchedCallLog1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testHasMatchedCallLog1100';
      console.info(`${caseName} test start`);

      try {
        let context: Context = AppStorage.get('context') as Context;
        let phoneNumber = "13800000000";
        let minDuration = 10;

        let result = await contact.hasMatchedCallLog(undefined, phoneNumber, minDuration);
        console.info(`${caseName} result: ${result}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        expect(error.code === 201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testHasMatchedCallLog1200
     * @tc.number SUB_Telephony_Contact_HasMatchedCallLog_1200
     * @tc.desc   Test hasMatchedCallLog with null context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHasMatchedCallLog1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testHasMatchedCallLog1200';
      console.info(`${caseName} test start`);

      try {
        let context: Context = AppStorage.get('context') as Context;
        let phoneNumber = "13800000000";
        let minDuration = 10;

        let result = await contact.hasMatchedCallLog(null, phoneNumber, minDuration, 400);
        console.info(`${caseName} result: ${result}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        expect(error.code === 201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testHasMatchedCallLog1300
     * @tc.number SUB_Telephony_Contact_HasMatchedCallLog_1300
     * @tc.desc   Test hasMatchedCallLog with null context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHasMatchedCallLog1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testHasMatchedCallLog1300';
      console.info(`${caseName} test start`);

      try {
        let context: Context = AppStorage.get('context') as Context;
        let phoneNumber = "13800000000";
        let minDuration = 10;

        let result = await contact.hasMatchedCallLog(undefined, phoneNumber, minDuration, 400);
        console.info(`${caseName} result: ${result}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        expect(error.code === 201).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testHasMatchedCallLog1800
     * @tc.number SUB_Telephony_Contact_HasMatchedCallLog_1800
     * @tc.desc   Test hasMatchedCallLog with null context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHasMatchedCallLog1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testHasMatchedCallLog1800';
      console.info(`${caseName} test start`);

      try {
        let context: Context = AppStorage.get('context') as Context;
        let phoneNumber = "13800000000";
        let minDuration = 10;

        let result = await contact.hasMatchedCallLog(context, "", minDuration, 400);
        console.info(`${caseName} should throw error but not`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        expect(error.code === 16700002).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testHasMatchedCallLog1900
     * @tc.number SUB_Telephony_Contact_HasMatchedCallLog_1900
     * @tc.desc   Test hasMatchedCallLog with null context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHasMatchedCallLog1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testHasMatchedCallLog1900';
      console.info(`${caseName} test start`);

      try {
        let context: Context = AppStorage.get('context') as Context;
        let phoneNumber = "13800000000";
        let minDuration = 10;

        let result = await contact.hasMatchedCallLog(context, "", minDuration);
        console.info(`${caseName} should throw error but not`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        expect(error.code === 16700002).assertTrue();
        done();
      }
    });

  })
}

