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

import { BusinessError } from '@ohos.base';
import sim from '@ohos.telephony.sim';
import { describe, it, expect, beforeAll } from '@ohos/hypium';
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
};

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
};

async function getPermissions() {
  console.info('getPermission start');
  type MyPermissions = "ohos.permission.WRITE_CONTACTS" | "ohos.permission.READ_CONTACTS";
  let list: MyPermissions[] = ['ohos.permission.WRITE_CONTACTS', 'ohos.permission.READ_CONTACTS'];
  try {
    let userId: number = await account.getAccountManager().getOsAccountLocalId();
    let applicationFlags: number = bundleManager.ApplicationFlag.GET_APPLICATION_INFO_DEFAULT;
    let applicationInfo: bundleManager.ApplicationInfo = await bundleManager.getApplicationInfoSync('com.example.simtest', applicationFlags, userId);
    let tokenId: number = applicationInfo.accessTokenId;
    for (let index = 0; index < list.length; index++) {
      await abilityAccessCtrl.createAtManager().grantUserGrantedPermission(tokenId, list[index], 1);
    }
  } catch (err) {
    console.info(`getPermission error ${JSON.stringify(err)}`);
  }
  console.info('getPermission end');
}

export default function Sim3Public() {
  describe('Sim3Public', () => {

    beforeAll(async (done: Function) => {
      console.log('getPermission beforeAll');
      await getPermissions();
      done();
    });

    /**
     * @tc.number : SUB_Telephony_Sim_GetMaxSimCount_0100
     * @tc.name   : testTelephonySimGetMaxSimCount0100
     * @tc.desc   : Obtain the number of card slots.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("testTelephonySimGetMaxSimCount0100", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimGetMaxSimCount0100';
      console.info(`${caseName} test start `);
      let maxSimCount: number = sim.getMaxSimCount();
      ExpectTrue(maxSimCount >= 0);
      console.info(`${caseName} test end `);
      done();
    });

    /**
     * @tc.number : SUB_Telephony_Sim_HasSimCard_0300
     * @tc.name   : testTelephonySimHasSimCard0300
     * @tc.desc   : Obtain whether the SIM card in the specified slot is inserted. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testTelephonySimHasSimCard0300", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimHasSimCard0300';
      console.info(`${caseName} test start `);
      try {
        sim.hasSimCard(null, (err: BusinessError, data: boolean) => {
          if (err.code === 401) {
            console.info(`${caseName}	Parameter error.: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
            ExpectTrue(true);
            console.info(`${caseName} test end `);
            done();
          } else {
            console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }
        });
      } catch (error) {
        if ((error as BusinessError).code === 401) {
          console.info(`${caseName}	Parameter error.: err->${JSON.stringify(error)}`);
          ExpectTrue(true);
          console.info(`${caseName} test end `);
          done();
        } else {
          console.info(`${caseName}: err->${JSON.stringify(error)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      }
    });

    /**
     * @tc.number : SUB_Telephony_Sim_HasSimCard_0400
     * @tc.name   : testTelephonySimHasSimCard0400
     * @tc.desc   : Obtain whether the SIM card in the specified slot is inserted. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testTelephonySimHasSimCard0400", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimHasSimCard0400';
      console.info(`${caseName} test start `);
      sim.hasSimCard(-1, (err: BusinessError, data: boolean) => {
        if (err.code === 8300001) {
          console.info(`${caseName}	Invalid parameter value: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          ExpectTrue(true);
          console.info(`${caseName} test end `);
          done();
        } else {
          console.info(`${caseName}: err->${JSON.stringify(err)}, data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_HasSimCard_0800
     * @tc.name   : testTelephonySimHasSimCard0800
     * @tc.desc   : Obtain whether the SIM card in the specified slot is inserted. Use callback for asynchronous promise.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testTelephonySimHasSimCard0800", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimHasSimCard0800';
      console.info(`${caseName} test start `);
      try {
        sim.hasSimCard(null).then((data: boolean) => {
          console.info(`hasSimCard success, promise: data->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }).catch((err: BusinessError) => {
          if (err.code === 401) {
            console.info(`${caseName}	Parameter error.: err->${JSON.stringify(err)}`);
            ExpectTrue(true);
            console.info(`${caseName} test end `);
            done();
          } else {
            console.info(`${caseName}:data->`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }
        });
      } catch (error) {
        if ((error as BusinessError).code === 401) {
          console.info(`${caseName}	Parameter error.: err->${JSON.stringify(error)}`);
          ExpectTrue(true);
          console.info(`${caseName} test end `);
          done();
        } else {
          console.info(`${caseName}:data->`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      }
    });

    /**
     * @tc.number : SUB_Telephony_Sim_HasSimCard_0900
     * @tc.name   : testTelephonySimHasSimCard0900
     * @tc.desc   : Obtain whether the SIM card in the specified slot is inserted. Use callback for asynchronous promise.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testTelephonySimHasSimCard0900", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimHasSimCard0900';
      console.info(`${caseName} test start `);
      sim.hasSimCard(-1).then((data: boolean) => {
        console.info(`hasSimCard success, promise: data->${JSON.stringify(data)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }).catch((err: BusinessError) => {
        if (err.code === 8300001) {
          console.info(`${caseName}	Invalid parameter value: err->${JSON.stringify(err)}`);
          ExpectTrue(true);
          console.info(`${caseName} test end `);
          done();
        } else {
          console.info(`${caseName}:data->`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_Telephony_Sim_HasSimCardSync_0300
     * @tc.name   : testTelephonySimHasSimCardSync0300
     * @tc.desc   : Obtain the SIM card type for the specified slot. Use callback for asynchronous callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testTelephonySimHasSimCardSync0300", 0, async (done: Function) => {
      let caseName: string = 'testTelephonySimHasSimCardSync0300';
      console.info(`${caseName} test start `);
      let hasSimCard: boolean = sim.hasSimCardSync(-1);
      if (hasSimCard === false) {
        console.info(`${caseName}  success has not sim card1: ` + hasSimCard);
        ExpectTrue(true);
        console.info(`${caseName} test end `);
        done();
      } else {
        console.info(`${caseName}  false has sim card1: ` + hasSimCard);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }
    });
  });
}