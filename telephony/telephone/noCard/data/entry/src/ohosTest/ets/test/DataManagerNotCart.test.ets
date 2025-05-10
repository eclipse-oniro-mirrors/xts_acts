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

import { describe, it, expect, TestType, Size, Level  } from '@ohos/hypium';
import data from '@ohos.telephony.data';
import { BusinessError } from '@ohos.base';
import sim from '@ohos.telephony.sim';


const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

export default function dataManagerNotCartTest() {
  describe('DataManagerNotCartTest', () => {
    /* *
     * @tc.number: SUB_Telephony_Data_GetCellularDataFlowType_0500
     * @tc.name  : testTelephonyDataGetCellularDataFlowType0500
     * @tc.desc  : Obtain the uplink and downlink status of cellular data services.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 0
    */
    it('testTelephonyDataGetCellularDataFlowType0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetCellularDataFlowType0500';
      console.info(`${caseName} test start `);
      // There is no SIM card inserted.
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        ExpectTrue(hasSim === false);
        data.getCellularDataFlowType((err: BusinessError, data: data.DataFlowType) => {
          if (err) {
            console.info(`${caseName} err->${JSON.stringify(err)}`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} data->${JSON.stringify(data)} ${typeof data}`);
            ExpectTrue(data === 0);
            done();
          }
        });
      } catch (error) {
        console.info(`${caseName} err->${JSON.stringify(error)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_Telephony_Data_GetCellularDataFlowType_0900
     * @tc.name  : testTelephonyDataGetCellularDataFlowType0900
     * @tc.desc  : Obtain the uplink and downlink status of cellular data services.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 0
    */
    it('testTelephonyDataGetCellularDataFlowType0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetCellularDataFlowType0900';
      console.info(`${caseName} test start `);
      // There is no SIM card inserted.
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        ExpectTrue(hasSim === false);
        data.getCellularDataFlowType().then((data: data.DataFlowType) => {
          console.info(`${caseName} data->${JSON.stringify(data)}`);
          ExpectTrue(data === 0);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err->${JSON.stringify(err)}`);
          ExpectTrue(false);
          done();
        });
      } catch (error) {
        console.info(`${caseName} err->${JSON.stringify(error)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
      * @tc.number: SUB_Telephony_Data_GetCellularDataState_0400
      * @tc.name  : testTelephonyDataGetCellularDataState0400
      * @tc.desc  : Get the connection status of a packet switched domain (PS domain).
      * @tc.size  : MediumTest
      * @tc.type  : Function
      * @tc.level : level 3
     */
    it('testTelephonyDataGetCellularDataState0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetCellularDataState0400';
      console.info(`${caseName} test start `);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        ExpectTrue(hasSim === false);
        data.getCellularDataState((err: BusinessError, data: data.DataConnectState) => {
          if (err) {
            console.info(`${caseName} err->${JSON.stringify(err)}`);
            ExpectTrue(false);
          } else {
            console.info(`${caseName} data->${JSON.stringify(data)}`);
            ExpectTrue(true);
          }
          done();
        });
      } catch (error) {
        console.info(`${caseName} catcherr->${JSON.stringify(error)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_Telephony_Data_GetCellularDataState_0800
     * @tc.name  : testTelephonyDataGetCellularDataState0800
     * @tc.desc  : Get the connection status of a packet switched domain (PS domain).
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyDataGetCellularDataState0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetCellularDataState0800';
      console.info(`${caseName} test start `);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        ExpectTrue(hasSim === false);
        data.getCellularDataState().then((data: data.DataConnectState) => {
          console.info(`${caseName} data->${JSON.stringify(data)}`);
          ExpectTrue(true);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err->${JSON.stringify(err)}`);
          ExpectTrue(false);
          done();
        });
      } catch (error) {
        console.info(`${caseName} catcherr->${JSON.stringify(error)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_Telephony_Data_IsCellularDataRoamingEnabled_0600
     * @tc.name  : testTelephonyDataIsCellularDataRoamingEnabled0600
     * @tc.desc  : Check whether roaming is enabled for cellular data services.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyDataIsCellularDataRoamingEnabled0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyDataIsCellularDataRoamingEnabled0600';
      console.info(`${caseName} test start `);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        ExpectTrue(hasSim === false);
        data.isCellularDataRoamingEnabled(0, (err: BusinessError, data: boolean) => {
          if (err) {
            console.info(`${caseName} err->${JSON.stringify(err)}`);
            ExpectTrue(err.code === 8300003);
            done();
          } else {
            console.info(`${caseName} data ${JSON.stringify(data)}`);
            ExpectTrue(false);
            done();
          }
        });
      } catch (error) {
        console.info(`${caseName} catcherr->${JSON.stringify(error)}`);
        ExpectTrue(error.code === 8300003);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
     * @tc.number: SUB_Telephony_Data_IsCellularDataRoamingEnabled_1200
     * @tc.name  : testTelephonyDataIsCellularDataRoamingEnabled1200
     * @tc.desc  : Check whether roaming is enabled for cellular data services.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyDataIsCellularDataRoamingEnabled1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyDataIsCellularDataRoamingEnabled1200';
      console.info(`${caseName} test start `);
      try {
        let hasSim: boolean = sim.hasSimCardSync(0);
        ExpectTrue(hasSim === false);
        data.isCellularDataRoamingEnabled(0).then((data: boolean) => {
          console.info(`${caseName} ${JSON.stringify(data)}`);
          ExpectTrue(false);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err.code->${JSON.stringify(err)}`);
          ExpectTrue(err.code === 8300003);
          done();
        });
      } catch (error) {
        console.info(`${caseName} err->${JSON.stringify(error)}`);
        ExpectTrue(error.code === 8300003);
        done();
      }
      console.info(`${caseName} test end `);
    });
  }
  );
}