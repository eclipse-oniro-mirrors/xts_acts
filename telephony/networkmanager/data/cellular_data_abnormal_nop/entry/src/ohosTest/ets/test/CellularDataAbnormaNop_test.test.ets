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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import data from '@ohos.telephony.data';
import { BusinessError } from '@ohos.base';

const PERMISSION_DENIED_CODE = 201;

const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(` exportFail failed err: ${JSON.stringify(err)}`);
  }
};

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(` exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

export default function telephony_data_NopTest() {
  describe('telephony_data_NopTest', () => {
    /**
     * @tc.name   testTelephonyDataNop0100
     * @tc.number SUB_telephony_data_nop0100
     * @tc.desc   Using the isCellularDataEnabled (callback) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonyDataNop0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('--------telephony_data_nop001----before----');
      const caseName: string = "testTelephonyDataNop0100";
      try {
        data.isCellularDataEnabled().then((data: boolean) => {
          ExpectFail();
          console.info(`${caseName} get success data is `+JSON.stringify(data));
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} get err is `+JSON.stringify(err));
          ExpectTrue(err.code === PERMISSION_DENIED_CODE);
          done();
        });
      } catch (err) {
        ExpectFail();
        console.info(`${caseName} catch err is `+JSON.stringify(err));
        done()
      }
    })

    /**
     * @tc.name   testTelephonyDataNop0200
     * @tc.number SUB_telephony_data_nop002
     * @tc.desc   Using the isCellularDataEnabled (callback) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonyDataNop0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('--------telephony_data_nop002----before----');
      const caseName: string = "testTelephonyDataNop0200";
      try {
        data.isCellularDataEnabled((err: BusinessError, data: boolean) => {
          if(err){
            console.info(`${caseName} get err is `+JSON.stringify(err));
            ExpectTrue(err.code === PERMISSION_DENIED_CODE);
            done();
          }else{
            console.info(`${caseName} get success `);
            ExpectFail();
            done();
          }
        });
      } catch (err) {
        ExpectFail();
        console.info(`${caseName} catch err is `+JSON.stringify(err));
        done()
      }
    })

    /**
     * @tc.name   testTelephonyDataNop0300
     * @tc.number SUB_telephony_data_nop003
     * @tc.desc   Using the isCellularDataRoamingEnabled (then) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonyDataNop0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('--------telephony_data_nop003----before----');
      const caseName: string = "testTelephonyDataNop0300";
      try {
        data.isCellularDataRoamingEnabled(0).then((data: boolean) => {
          ExpectFail();
          console.info(`${caseName} get success data is `+JSON.stringify(data));
          done();
        }).catch((err: BusinessError) => {
          console.info(`${caseName} get err is `+JSON.stringify(err));
          ExpectTrue(err.code === PERMISSION_DENIED_CODE);
          done();
        });
      } catch (err) {
        ExpectFail();
        console.info(`${caseName} catch err is `+JSON.stringify(err));
        done()
      }
    })

    /**
     * @tc.name   testTelephonyDataNop0400
     * @tc.number SUB_telephony_data_nop004
     * @tc.desc   Using the isCellularDataRoamingEnabled (callback) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonyDataNop0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('--------telephony_data_nop004----before----');
      const caseName: string = "testTelephonyDataNop0400";
      try {
        data.isCellularDataRoamingEnabled(0,(err: BusinessError, data: boolean) => {
          if(err){
            console.info(`${caseName} get err is `+JSON.stringify(err));
            ExpectTrue(err.code === PERMISSION_DENIED_CODE);
            done();
          }else{
            ExpectFail();
            console.info(`${caseName} get isCellularDataRoamingEnabled success `);
            done();
          }
        });
      } catch (err) {
        ExpectFail();
        console.error("telephony_data_nop004 error:" + JSON.stringify(err));
        done()
      }
    });
    
    /**
     * @tc.name   testTelephonyDataGetActiveApnNameNoP0100
     * @tc.number SUB_Telephony_Data_GetActiveApnName_NoP_0100
     * @tc.desc   Using the getActiveApnName method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyDataGetActiveApnNameNoP0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName: string = "testTelephonyDataGetActiveApnNameNoP0100";
      console.info(`${caseName}---Start`);
      try {
        data.getActiveApnName().then((data: string) => {
          console.info(`${caseName} getActiveApnName success, contextData->${JSON.stringify(data)}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} getActiveApnNam fail, err->${JSON.stringify(err)}`);
          ExpectTrue(err.code == 201);
          console.info(`${caseName}---End`);
          done();
        });
      }catch (err) {
        console.error(`${caseName} catch err is `+JSON.stringify(err));
        ExpectTrue(err.code == 201);
        console.info(`${caseName}---End`);
        done();
      }
    })
    
     /**
 	      * @tc.name   testTelephonyCellularDataGetCellularDataFlowTypeAsyncNop0100
 	      * @tc.number SUB_Telephony_CellularData_getCellularDataFlowType_Async_NoP_0100
 	      * @tc.desc   Using the getCellularDataFlowType(Callback) method without permission
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL1
 	      */
     it("testTelephonyCellularDataGetCellularDataFlowTypeAsyncNop0100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonyCellularDataGetCellularDataFlowTypeAsyncNop0100';
      console.info(`${caseName} test start `);
      try{
        data.getCellularDataFlowType((err, data) => {
          if (err) {
            console.info(`${caseName} get err is `+JSON.stringify(err));
            ExpectTrue(err.code === PERMISSION_DENIED_CODE)
            done();
          }else{
            ExpectFail();
            console.info(`${caseName} get CellularDataFlowType success `+data);
            done();
          }
        });
      }catch (err) {
        ExpectFail();
        console.info(`${caseName} get err is `+JSON.stringify(err));
        done();
      }
    })

     /**
   * @tc.name   testTelephonyCellularDataGetCellularDataFlowTypePromiseNoP0100
   * @tc.number SUB_Telephony_CellularData_getCellularDataFlowType_Promise_NoP_0100
   * @tc.desc   Using the getCellularDataFlowType(Promise) method without permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testTelephonyCellularDataGetCellularDataFlowTypePromiseNoP0100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
    let caseName: string = 'testTelephonyCellularDataGetCellularDataFlowTypePromiseNoP0100';
    console.info(`${caseName} test start `);
    try {
      await data.getCellularDataFlowType().then((dataFlowType)=>{
        console.log(caseName +" getCellularDataFlowType is :"+JSON.stringify(dataFlowType));
        ExpectFail();
        done();
      }).catch((err: BusinessError)=>{
        console.info(`${caseName} get err is `+JSON.stringify(err));
        ExpectTrue(err.code === PERMISSION_DENIED_CODE)
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

     /**
   * @tc.name   testTelephonyCellularDataGetCellularDataStateAsyncNoP0100
   * @tc.number SUB_Telephony_CellularData_getCellularDataState_Async_NoP_0100
   * @tc.desc   Using the getCellularDataState(Callback) method without permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
     it("testTelephonyCellularDataGetCellularDataStateAsyncNoP0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testTelephonyCellularDataGetCellularDataStateAsyncNoP0100';
      console.info(`${caseName} test start `);
      try{
        data.getCellularDataState((err, dat:data.DataConnectState) => {
          if (err) {
            ExpectTrue(err.code === PERMISSION_DENIED_CODE)
            console.info(`${caseName} get err is `+JSON.stringify(err));
          }else{
            console.info(`${caseName} get success dat is `+JSON.stringify(dat));
            ExpectFail();
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

       /**
   * @tc.name   testTelephonyCellularDataGetCellularDataStatePromiseNoP0100
   * @tc.number SUB_Telephony_CellularData_getCellularDataState_Promise_NoP_0100
   * @tc.desc   Using the getCellularDataState(Promise) method without permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it("testTelephonyCellularDataGetCellularDataStatePromiseNoP0100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
    let caseName: string = 'testTelephonyCellularDataGetCellularDataStatePromiseNoP0100';
    console.info(`${caseName} test start `);
    try {
      await data.getCellularDataState().then((contextData: data.DataConnectState)=>{
        console.log(caseName + "Telephony_CellularData_getCellularDataState_Promise_0100 finish contextData: " + JSON.stringify(contextData));
        ExpectFail();
      });
      console.info(`${caseName}---End`);
      done();
    } catch (err) {
      console.info(`${caseName} catch err is :` +JSON.stringify(err));
      ExpectTrue(err.code === PERMISSION_DENIED_CODE)
      console.info(`${caseName}---End`);
      done();
    }
  })

  })
}
