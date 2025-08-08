/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import cellular from "@ohos.telephony.data";
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { BusinessError } from "@kit.BasicServicesKit";

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}
const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(` exportFail failed err: ${JSON.stringify(err)}`);
  }
};
export default function ActsCellularDataAbnormalTest() {
  describe("ActsCellularDataAbnormalTest", () => {
    const ERR_SLOT_ID = 3;

    /*
    * @tc.number: SUB_Telephony_CellularData_isCellularDataEnabled_Async_0100
    * @tc.name  : testTelephonyCellularDataisCellularDataEnabledAsync_0100
    * @tc.desc  : verify that the isCellularDataEnabled takes effect
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : Level 0
    */
    it("testTelephonyCellularDataisCellularDataEnabledAsync_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
      let caseName: string = 'testTelephonyCellularDataisCellularDataEnabledAsync_0100';
      console.info(`${caseName} test start `);
      try{
        cellular.isCellularDataEnabled((err, data) => {
          if (err) {
            ExpectFail();
            console.info(`${caseName} get err is `+JSON.stringify(err));
          }else{
            ExpectTrue(data);
            console.info(`${caseName} get success data is `+JSON.stringify(data));
          }
          done();
          console.info(`${caseName}---End`);
        })
      }catch (err) {
        console.info(`${caseName} catch err is :` +JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }

    })

    /*
    * @tc.number: SUB_Telephony_CellularData_getCellularDataState_Async_0100
    * @tc.name  : testTelephonyCellularDataGetCellularDataStateAsync0100
    * @tc.desc  : verify that the getCellularDataState takes effect
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : Level 0
    */
    it("testTelephonyCellularDataGetCellularDataStateAsync0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCellularDataGetCellularDataStateAsync0100';
      console.info(`${caseName} test start `);
      try{
        cellular.getCellularDataState((err, data) => {
          if (err) {
            ExpectFail();
            console.info(`${caseName} get err is `+JSON.stringify(err));
          }else{
            ExpectTrue(true);
            console.info(`${caseName} get success data is `+JSON.stringify(data));
          }
          done();
          console.info(`${caseName}---End`);
        })
      }catch (err) {
        console.info(`${caseName} catch err is :` +JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    })

    /*
     * @tc.number: SUB_Telephony_CellularData_getCellularDataFlowType_Async_0100
     * @tc.name  : testTelephonyCellularDataGetCellularDataFlowTypeAsync0100
     * @tc.desc  : verify that the getCellularDataFlowType takes effect
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 0
     */
    it("testTelephonyCellularDataGetCellularDataFlowTypeAsync0100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCellularDataGetCellularDataFlowTypeAsync0100';
      console.info(`${caseName} test start `);
      try{
        cellular.getCellularDataFlowType((err, data) => {
          if (err) {
            ExpectFail();
            console.info(`${caseName} get err is `+JSON.stringify(err));
          }else{
            ExpectTrue(true);
            console.info(`${caseName} get success data is `+JSON.stringify(data));
          }
          done();
          console.info(`${caseName}---End`);
        })
      }catch (err) {
        console.info(`${caseName} catch err is :` +JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    })

    /*
    * @tc.number: SUB_Telephony_CellularData_isCellularDataRoamingEnabled_Async_0200
    * @tc.name  : testTelephonyCellularDataisCellularDataRoamingEnabledAsync_0200
    * @tc.desc  : verify that the isCellularDataRoamingEnabled takes effect
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : Level 0
    */
    it("testTelephonyCellularDataisCellularDataRoamingEnabledAsync_0200",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCellularDataisCellularDataRoamingEnabledAsync_0200';
      console.info(`${caseName} test start `);
      try{
        cellular.isCellularDataRoamingEnabled(ERR_SLOT_ID, (err) => {
          if (err) {
            ExpectTrue(true);
            console.info(`${caseName} get err is `+JSON.stringify(err));
          }else{
            ExpectFail();
            console.info(`${caseName} isCellularDataRoamingEnabled success :`+ERR_SLOT_ID);
          }
          done();
        })
      }catch (err) {
        console.info(`${caseName} catch err is :` +JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    })

    /*
     * @tc.number: SUB_Telephony_CellularData_getDefaultCellularDataSlotId_Async_0500
     * @tc.name  : testTelephonyCellularDataGetDefaultCellularDataSlotIdAsync0500
     * @tc.desc  : verify that the getDefaultCellularDataSlotId takes effect
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 0
     */
    it("testTelephonyCellularDataGetDefaultCellularDataSlotIdAsync0500",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCellularDataGetDefaultCellularDataSlotIdAsync0500';
      console.info(`${caseName} test start `);
      try{
        cellular.getDefaultCellularDataSlotId((err) => {
          if (!err) {
            ExpectTrue(true);
            console.info(`${caseName} getDefaultCellularDataSlotId success`);
          } else {
            ExpectFail();
            console.info(`${caseName} get err is `+JSON.stringify(err));
          }
          done();
          console.info(`${caseName}---End`);
        })
      }catch (err) {
        console.info(`${caseName} catch err is :` +JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    })

    /*
    * @tc.number: SUB_Telephony_CellularData_isCellularDataEnabled_Promise_0100
    * @tc.name  : testTelephonyCellularDataisCellularDataEnabledPromise_0100
    * @tc.desc  : verify that the isCellularDataEnabled takes effect
    * @tc.size  : MediumTest
    * @tc.type  : Function
    * @tc.level : Level 0
    */
    it("testTelephonyCellularDataisCellularDataEnabledPromise_0100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCellularDataisCellularDataEnabledPromise_0100';
      console.info(`${caseName} test start `);
      try {
        await cellular.isCellularDataEnabled();
        console.log("Telephony_CellularData_isCellularDataEnabled_Promise_0100 finish");
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch err is :` +JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    })

    /*
     * @tc.number: SUB_Telephony_CellularData_getCellularDataState_Promise_0100
     * @tc.name  : testTelephonyCellularDataGetCellularDataStatePromise_0100
     * @tc.desc  : verify that the getCellularDataState takes effect
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 0
     */
    it("testTelephonyCellularDataGetCellularDataStatePromise_0100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCellularDataGetCellularDataStatePromise_0100';
      console.info(`${caseName} test start `);
      try {
        await cellular.getCellularDataState().then((contextData: cellular.DataConnectState)=>{
          console.log(caseName + "Telephony_CellularData_getCellularDataState_Promise_0100 finish");
          ExpectTrue(true);
        });

        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch err is :` +JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    })

    /*
     * @tc.number: SUB_Telephony_CellularData_getCellularDataFlowType_Promise_0100
     * @tc.name  : testTelephonyCellularDataGetCellularDataFlowTypePromise_0100
     * @tc.desc  : verify that the getCellularDataFlowType takes effect
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 0
     */
    it("testTelephonyCellularDataGetCellularDataFlowTypePromise_0100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCellularDataGetCellularDataFlowTypePromise_0100';
      console.info(`${caseName} test start `);
      try {
        await cellular.getCellularDataFlowType().then((dataFlowType)=>{
          console.log(caseName +" getCellularDataFlowType is :"+JSON.stringify(dataFlowType));
          ExpectTrue(dataFlowType != undefined && dataFlowType >=0);
        }).catch((err: BusinessError)=>{
          console.info(`${caseName} get err is `+JSON.stringify(err));
          ExpectFail();
        });
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch err is :` +JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    })

    /*
     * @tc.number: SUB_Telephony_CellularData_isCellularDataRoamingEnabled_Promise_0200
     * @tc.name  : testTelephonyCellularDataisCellularDataRoamingEnabledPromise_0200
     * @tc.desc  : verify that the isCellularDataRoamingEnabled takes effect
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 0
     */
    it("testTelephonyCellularDataisCellularDataRoamingEnabledPromise_0200",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCellularDataisCellularDataRoamingEnabledPromise_0200';
      console.info(`${caseName} test start `);
      try {
        await cellular.isCellularDataRoamingEnabled(ERR_SLOT_ID);
        ExpectFail();
        console.log(caseName+" get isCellularDataRoamingEnabled success ");
        done();
        console.info(`${caseName}---End`);
      } catch (err) {
        console.info(`${caseName} catch err is :` +JSON.stringify(err));
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        done();
      }
    })

    /*
     * @tc.number: SUB_Telephony_CellularData_getDefaultCellularDataSlotId_Promise_0500
     * @tc.name  : testTelephonyCellularDataGetDefaultCellularDataSlotIdPromise_0500
     * @tc.desc  : verify that the getDefaultCellularDataSlotId takes effect
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 0
     */
    it("testTelephonyCellularDataGetDefaultCellularDataSlotIdPromise_0500",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCellularDataGetDefaultCellularDataSlotIdPromise_0500';
      console.info(`${caseName} test start `);
      try {
        await  cellular.getDefaultCellularDataSlotId().then((cellularDataSlotId)=>{
          console.info(caseName + "getDefaultCellularDataSlotId success : "+ cellularDataSlotId );
          ExpectTrue(cellularDataSlotId == 0 || cellularDataSlotId == 1);
        }).catch((err:BusinessError)=>{
          console.info(`${caseName} get err is `+JSON.stringify(err));
          ExpectFail();
        })
        console.info(`${caseName}---End`);
        done();
      } catch (err) {
        console.info(`${caseName} catch err is :` +JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    })

    /*
     * @tc.number: SUB_Telephony_CellularData_getDefaultCellularDataSlotIdSync_0100
     * @tc.name  : testTelephonyCellularDataGetDefaultCellularDataSlotIdSync_0100
     * @tc.desc  : verify that the getCellularDataState takes effect
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : Level 0
     */
    it("testTelephonyCellularDataGetDefaultCellularDataSlotIdSync_0100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTelephonyCellularDataisCellularDataEnabledAsync_0100';
      console.info(`${caseName} test start `);
      try{
        let data = cellular.getDefaultCellularDataSlotIdSync();
        console.info(caseName + " getDefaultCellularDataSlotIdSync :"+ JSON.stringify(data));
        ExpectTrue(data == 0 || data == 1);
        console.info(`${caseName}---End`);
        done();
      }catch (err) {
        console.info(`${caseName} catch err is :` +JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_Telephony_Data_IsCellularDataRoamingEnabledSync_0200
     * @tc.name   : testTelephonyDataIsCellularDataEnabledSync0200
     * @tc.desc   : Sync checks if cellular data roaming service is enabled.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testTelephonyDataIsCellularDataEnabledSync0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      let caseName: string = 'testTelephonyDataIsCellularDataEnabledSync0200';
      console.info(`${caseName} test start `);
      try {
        let isEnabled: boolean = cellular.isCellularDataEnabledSync();
        console.info(`${caseName} isCellularDataEnabledSync :`+ isEnabled);
        ExpectTrue(isEnabled == true);
        done();
        console.info(`${caseName}---End`);
      } catch (error) {
        console.info(`${caseName} catch err is :` +JSON.stringify(error));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_Telephony_Data_IsCellularDataRoamingEnabledSync_0200
     * @tc.name   : testTelephonyDataIsCellularDataRoamingEnabledSync0200
     * @tc.desc   : Sync checks if cellular data roaming service is enabled.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */

    it('testTelephonyDataIsCellularDataRoamingEnabledSync0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      let caseName: string = 'testTelephonyDataIsCellularDataRoamingEnabledSync0200';
      console.info(`${caseName} test start `);
      try {
        let isEnabled: boolean = Boolean(cellular.isCellularDataRoamingEnabledSync(0));
        console.info(`${caseName} success isCellularDataRoamingEnabledSync : `+isEnabled);
        ExpectTrue(isEnabled == false);
        done();
        console.info(`${caseName}---End`);
      } catch (error) {
        console.info(`${caseName} catch err is :` +JSON.stringify(error));
        ExpectFail();
        done();
        console.info(`${caseName}---End`);
      }
    });
  });
}

