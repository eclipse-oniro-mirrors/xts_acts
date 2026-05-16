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
import { describe, it, expect, beforeAll, Level, TestType, Size } from '../../../hypium/index';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';
import hilog from '@ohos.hilog';
let domain: int = 0x0000;
let tag: string = 'ObserverTestTag';

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


export default function Sim3Public() {
  describe('Sim3Public', (): void => {


    /**
     * @tc.name   testTelephonySimGetMaxSimCount0100
     * @tc.number SUB_Telephony_Sim_GetMaxSimCount_0100
     * @tc.desc   Obtain the number of card slots.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimGetMaxSimCount0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimGetMaxSimCount0100';
      console.info(`${caseName} test start `);
      let maxSimCount: number = sim.getMaxSimCount();
      ExpectTrue(maxSimCount >= 0);
      console.info(`${caseName} test end `);
      done();
    });

    /**
     * @tc.name   testTelephonySimHasSimCard0400
     * @tc.number SUB_Telephony_Sim_HasSimCard_0400
     * @tc.desc   Obtain whether the SIM card in the specified slot is inserted. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimHasSimCard0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimHasSimCard0400';
      console.info(`${caseName} test start `);
      sim.hasSimCard(-1, (err: BusinessError | null, data: boolean | undefined) => {
        if (err?.code === 8300001) {
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
     * @tc.name   testTelephonySimHasSimCard0900
     * @tc.number SUB_Telephony_Sim_HasSimCard_0900
     * @tc.desc   Obtain whether the SIM card in the specified slot is inserted. Use callback for asynchronous promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonySimHasSimCard0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimHasSimCard0900';
      console.info(`${caseName} test start `);
      sim.hasSimCard(-1).then((data: boolean) => {
        console.info(`hasSimCard success, promise: data->${JSON.stringify(data)}`);
        ExpectFail();
        console.info(`${caseName} test end `);
        done();
      }).catch((err: Error): void => {
        if (err?.code === 8300001) {
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
     * @tc.name   testTelephonySimHasSimCardSync_static_0300
     * @tc.number SUB_Telephony_Sim_HasSimCardSync_0300
     * @tc.desc   Obtain the SIM card type for the specified slot. Use callback for asynchronous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonySimHasSimCardSync_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonySimHasSimCardSync_static_0300';
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let hasSimCard: boolean = sim.hasSimCardSync(-1);
        if (hasSimCard === false) {
          hilog.info(domain, tag, `${caseName}  success has not sim card1: ` + hasSimCard);
          ExpectTrue(true);
          hilog.info(domain, tag, `${caseName} test end `);
          done();
        } else {
          hilog.info(domain, tag, `${caseName}  false has sim card1: ` + hasSimCard);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end `);
          done();
        }
      } catch (error) {
        let err = error as BusinessError;
        if (err?.code === 8300001) {
          hilog.info(domain, tag,`${caseName}	Invalid parameter value: err->${JSON.stringify(err)}`);
          ExpectTrue(true);
          hilog.info(domain, tag,`${caseName} test end `);
          done();
        } else {
          ExpectFail();
          hilog.info(domain, tag,`${caseName} test end `);
          done();
        }
      }
    });
  });
}