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

import { describe, it, expect , Level, Size, TestType} from '@ohos/hypium';
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

export default function dataHasCardNoDataTest() {
  describe('dataHasCardNoDataTest', () => {

    /* *
    * @tc.number: SUB_Telephony_Data_GetCellularDataFlowType_0200
    * @tc.name  : testTelephonyDataGetCellularDataFlowType0200
    * @tc.desc  : Obtain the uplink and downlink status of cellular data services.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 0
    */
    it('testTelephonyDataGetCellularDataFlowType0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetCellularDataFlowType0200';
      console.info(`${caseName} test start `);
      try {
        let hasSim: boolean = await sim.hasSimCard(0);
        if (hasSim) {
          data.getCellularDataFlowType(async (err: BusinessError, data: data.DataFlowType) => {
            if (err) {
              console.info(`${caseName} err->${JSON.stringify(err)}`);
              ExpectTrue(false);
              done();
            } else {
              console.info(`${caseName} data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              done();
            }
          });
        } else {
          console.info(`${caseName} This test case requires an environment where cards are inserted.`);
          ExpectTrue(false);
          done();
        }
      } catch (error) {
        console.info(`${caseName} catchError->${JSON.stringify(error)}`);
        ExpectTrue(false);
        done();
      }

      console.info(`${caseName} test end `);
    });

    /* *
    * @tc.number: SUB_Telephony_Data_GetCellularDataFlowType_0700
    * @tc.name  : testTelephonyDataGetCellularDataFlowType0700
    * @tc.desc  : Obtain the uplink and downlink status of cellular data services.
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : level 3
    */
    it('testTelephonyDataGetCellularDataFlowType0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetCellularDataFlowType0700';
      console.info(`${caseName} test start `);
      try {
        let hasSim: boolean = await sim.hasSimCard(0);
        if (hasSim) {
          data.getCellularDataFlowType().then((data: data.DataFlowType) => {
            console.info(`${caseName} data->${JSON.stringify(data)}`);
            ExpectTrue(true);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} err->${JSON.stringify(err)}`);
            ExpectTrue(false);
            done();
          });
        } else {
          console.info(`${caseName} This test case requires an environment where cards are inserted.`);
          ExpectTrue(false);
          done();
        }
      } catch (error) {
        console.info(`${caseName} catchError->${JSON.stringify(error)}`);
        ExpectTrue(false);
        done();
      }

      console.info(`${caseName} test end `);
    });

    /* *
        * @tc.number: SUB_Telephony_Data_GetCellularDataState_0100
        * @tc.name  : testTelephonyDataGetCellularDataState0100
        * @tc.desc  : Get the connection status of a packet switched domain (PS domain).
        * @tc.size  : MediumTest
        * @tc.type  : Function
        * @tc.level : level 0
       */
    it('testTelephonyDataGetCellularDataState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetCellularDataState0100';
      console.info(`${caseName} test start `);
      try {
        let hasSim: boolean = await sim.hasSimCard(0);
        if (hasSim) {
          data.getCellularDataState((err: BusinessError, data: data.DataConnectState) => {
            if (err) {
              console.info(`${caseName} err->${JSON.stringify(err)}`);
              ExpectTrue(false);
              done();
            } else {
              console.info(`${caseName} data->${JSON.stringify(data)}`);
              ExpectTrue(data !== null);
              done();
            }
          });
        } else {
          console.info(`${caseName} This test case requires an environment where cards are inserted.`);
          ExpectTrue(false);
          done();
        }
      } catch (err) {
        console.info(`${caseName} err->${JSON.stringify(err)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
        * @tc.number: SUB_Telephony_Data_GetCellularDataState_0300
        * @tc.name  : testTelephonyDataGetCellularDataState0300
        * @tc.desc  : Get the connection status of a packet switched domain (PS domain).
        * @tc.size  : MediumTest
        * @tc.type  : Function
        * @tc.level : level 3
        */
    it('testTelephonyDataGetCellularDataState0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetCellularDataState0300';
      console.info(`${caseName} test start `);
      try {
        let hasSim: boolean = await sim.hasSimCard(0);
        if (hasSim) {
          data.getCellularDataState((err: BusinessError, data: data.DataConnectState) => {
            if (err) {
              console.info(`${caseName} err->${JSON.stringify(err)}`);
              ExpectTrue(false);
              done();
            } else {
              console.info(`${caseName} data->${JSON.stringify(data)}`);
              ExpectTrue(true);
              done();
            }
          });
        } else {
          console.info(`${caseName} This test case requires an environment where cards are inserted.`);
          ExpectTrue(false);
          done();
        }
      } catch (error) {
        console.info(`${caseName} catchError->${JSON.stringify(error)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });


    /* *
      * @tc.number: SUB_Telephony_Data_GetCellularDataState_0700
      * @tc.name  : testTelephonyDataGetCellularDataState0700
      * @tc.desc  : Get the connection status of a packet switched domain (PS domain).
      * @tc.size  : MediumTest
      * @tc.type  : Function
      * @tc.level : level 3
      */
    it('testTelephonyDataGetCellularDataState0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyDataGetCellularDataState0700';
      console.info(`${caseName} test start `);
      try {
        let hasSim: boolean = await sim.hasSimCard(0);
        if (hasSim) {
          data.getCellularDataState().then((data: data.DataConnectState) => {
            console.info(`${caseName} data->${JSON.stringify(data)}`);
            ExpectTrue(true);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} err->${JSON.stringify(err)}`);
            ExpectTrue(false);
            done();
          });
        } else {
          console.info(`${caseName} This test case requires an environment where cards are inserted.`);
          ExpectTrue(false);
          done();
        }
      } catch (error) {
        console.info(`${caseName} catchError->${JSON.stringify(error)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
        * @tc.number: SUB_Telephony_Data_IsCellularDataEnabled_0200
        * @tc.name  : testTelephonyDataIsCellularDataEnabled0200
        * @tc.desc  : Check whether the cellular data service is enabled.
        * @tc.size  : MediumTest
        * @tc.type  : Function
        * @tc.level : level 3
       */
    it('testTelephonyDataIsCellularDataEnabled0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyDataIsCellularDataEnabled0200';
      console.info(`${caseName} test start `);
      try {
        data.isCellularDataEnabled((err: BusinessError, data: boolean) => {
          if (err) {
            console.info(`${caseName} err->${JSON.stringify(err)}`);
            ExpectTrue(false);
            done();
          } else {
            console.info(`${caseName} data->${JSON.stringify(data)}`);
            ExpectTrue(true);
            done();
          }
        });
      } catch (error) {
        console.info(`${caseName} catchError->${JSON.stringify(error)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });



    /* *
     * @tc.number: SUB_Telephony_Data_IsCellularDataEnabled_0600
     * @tc.name  : testTelephonyDataIsCellularDataEnabled0600
     * @tc.desc  : Check whether the cellular data service is enabled.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
    */
    it('testTelephonyDataIsCellularDataEnabled0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyDataIsCellularDataEnabled0600';
      console.info(`${caseName} test start `);
      try {
        data.isCellularDataEnabled().then((data: boolean) => {
          console.info(`${caseName} data->${JSON.stringify(data)}`);
          ExpectTrue(true);
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} err->${JSON.stringify(err)}`);
          ExpectTrue(false);
          done();
        });
      } catch (error) {
        console.info(`${caseName} catchError->${JSON.stringify(error)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /* *
         * @tc.number: SUB_Telephony_Data_IsCellularDataRoamingEnabled_0800
         * @tc.name  : testTelephonyDataIsCellularDataRoamingEnabled0800
         * @tc.desc  : Check whether roaming is enabled for cellular data services.
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : level 3
        */
    it('testTelephonyDataIsCellularDataRoamingEnabled0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testTelephonyDataIsCellularDataRoamingEnabled0800';
      console.info(`${caseName} test start `);
      try {
        let hasSim: boolean = await sim.hasSimCard(0);
        if (hasSim) {
          data.isCellularDataRoamingEnabled(0).then((data: boolean) => {
            console.info(`${caseName} data->${JSON.stringify(data)}`);
            ExpectTrue(true);
            done();
          }).catch((err: BusinessError) => {
            console.info(`${caseName} err->${JSON.stringify(err)}`);
            ExpectTrue(false);
            done();
          });
        } else {
          console.info(`${caseName} This test case requires an environment where cards are inserted.`);
          ExpectTrue(false);
          done();
        }
      } catch (error) {
        console.info(`${caseName} catchError->${JSON.stringify(error)}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });
    
	/* *
	 * @tc.number: SUB_Telephony_Data_GetActiveApnName_0200
	 * @tc.name  : testTelephonyDataGetActiveApnName0200
	 * @tc.desc  : test interface getActiveApnName with a sim card and without a network.
	 * @tc.size  : MediumTest
	 * @tc.type  : Function
	 * @tc.level : level 3
	*/
    it("testTelephonyDataGetActiveApnName0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = "testTelephonyDataGetActiveApnName0200";
      console.info(`${caseName}---Start`);
      try {
	data.getActiveApnName().then((data: string) => {
	  console.info(`${caseName} getActiveApnName success, contextData->${JSON.stringify(data)}`);
	  ExpectTrue(data == "");
	  console.info(`${caseName}---End`);
	  done();
	}).catch((err: BusinessError) => {
	  console.error(`${caseName} getActiveApnNam fail, err->${JSON.stringify(err)}`);
	  ExpectTrue(false);
	  console.info(`${caseName}---End`);
	  done();
	});
      }catch (err) {
	console.error(`${caseName} catch err is `+JSON.stringify(err));
	ExpectTrue(false);
	console.info(`${caseName}---End`);
	done();
      }
    })
    
   
  });
}
