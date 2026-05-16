/**
 * Copyright (C) 2021-2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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
import {describe, it, expect, Level, TestType, Size} from '@ohos/hypium';
import data from '@ohos.telephony.data';


export function toString(data:object) {
  if (typeof data === 'object') {
    return JSON.stringify(data);
  } else {
    return data;
  }
};

export default function dataJsunit() {
  describe('dataTest', ()=> {
    console.log("==========> data Test start ==========>");


    /**
     * @tc.name   Telephony_Data_DataFlowType_DATA_FLOW_TYPE_NONE
     * @tc.number Telephony_Data_DataFlowType_DATA_FLOW_TYPE_NONE
     * @tc.desc   Enum value test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Telephony_Data_DataFlowType_DATA_FLOW_TYPE_NONE", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)=> {
      let caseName = 'Telephony_Data_DataFlowType_DATA_FLOW_TYPE_NONE';
      console.log(`==========> ${caseName} Test start ==========>`);
      expect(0).assertEqual(data.DataFlowType.DATA_FLOW_TYPE_NONE);
      console.log(`==========> ${caseName} Test end ==========>`);
      done();
    });

    /**
     * @tc.name   Telephony_Data_DataFlowType_DATA_FLOW_TYPE_DOWN
     * @tc.number Telephony_Data_DataFlowType_DATA_FLOW_TYPE_DOWN
     * @tc.desc   Enum value test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Telephony_Data_DataFlowType_DATA_FLOW_TYPE_DOWN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)=> {
      let caseName = 'Telephony_Data_DataFlowType_DATA_FLOW_TYPE_DOWN';
      console.log(`==========> ${caseName} Test start ==========>`);
      expect(1).assertEqual(data.DataFlowType.DATA_FLOW_TYPE_DOWN);
      console.log(`==========> ${caseName} Test end ==========>`);
      done();
    });

    /**
     * @tc.name   Telephony_Data_DataFlowType_DATA_FLOW_TYPE_UP
     * @tc.number Telephony_Data_DataFlowType_DATA_FLOW_TYPE_UP
     * @tc.desc   Enum value test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Telephony_Data_DataFlowType_DATA_FLOW_TYPE_UP", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)=> {
      let caseName = 'Telephony_Data_DataFlowType_DATA_FLOW_TYPE_UP';
      console.log(`==========> ${caseName} Test start ==========>`);
      expect(2).assertEqual(data.DataFlowType.DATA_FLOW_TYPE_UP);
      console.log(`==========> ${caseName} Test end ==========>`);
      done();
    });

    /**
     * @tc.name   Telephony_Data_DataFlowType_DATA_FLOW_TYPE_UP_DOWN
     * @tc.number Telephony_Data_DataFlowType_DATA_FLOW_TYPE_UP
     * @tc.desc   Enum value test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Telephony_Data_DataFlowType_DATA_FLOW_TYPE_UP_DOWN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)=> {
      let caseName = 'Telephony_Data_DataFlowType_DATA_FLOW_TYPE_UP_DOWN';
      console.log(`==========> ${caseName} Test start ==========>`);
      expect(3).assertEqual(data.DataFlowType.DATA_FLOW_TYPE_UP_DOWN);
      console.log(`==========> ${caseName} Test end ==========>`);
      done();
    });

    /**
     * @tc.name   Telephony_Data_DataFlowType_DATA_FLOW_TYPE_DORMANT
     * @tc.number Telephony_Data_DataFlowType_DATA_FLOW_TYPE_DORMANT
     * @tc.desc   Enum value test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Telephony_Data_DataFlowType_DATA_FLOW_TYPE_DORMANT", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)=> {
      let caseName = 'Telephony_Data_DataFlowType_DATA_FLOW_TYPE_DORMANT';
      console.log(`==========> ${caseName} Test start ==========>`);
      expect(4).assertEqual(data.DataFlowType.DATA_FLOW_TYPE_DORMANT);
      console.log(`==========> ${caseName} Test end ==========>`);
      done();
    });

    /**
     * @tc.name   Telephony_Data_DataConnectState_DATA_STATE_UNKNOWN
     * @tc.number Telephony_Data_DataConnectState_DATA_STATE_UNKNOWN
     * @tc.desc   Enum value test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Telephony_Data_DataConnectState_DATA_STATE_UNKNOWN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)=> {
      let caseName = 'Telephony_Data_DataConnectState_DATA_DATA_STATE_UNKNOWN';
      console.log(`==========> ${caseName} Test start ==========>`);
      expect(-1).assertEqual(data.DataConnectState.DATA_STATE_UNKNOWN);
      console.log(`==========> ${caseName} Test end ==========>`);
      done();
    });

    /**
     * @tc.name   Telephony_Data_DataConnectState_DATA_STATE_DISCONNECTED
     * @tc.number Telephony_Data_DataConnectState_DATA_STATE_DISCONNECTED
     * @tc.desc   Enum value test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Telephony_Data_DataConnectState_DATA_STATE_DISCONNECTED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)=> {
      let caseName = 'Telephony_Data_DataConnectState_DATA_DATA_STATE_DISCONNECTED';
      console.log(`==========> ${caseName} Test start ==========>`);
      expect(0).assertEqual(data.DataConnectState.DATA_STATE_DISCONNECTED);
      console.log(`==========> ${caseName} Test end ==========>`);
      done();
    });

    /**
     * @tc.name   Telephony_Data_DataConnectState_DATA_STATE_CONNECTING
     * @tc.number Telephony_Data_DataConnectState_DATA_STATE_CONNECTING
     * @tc.desc   Enum value test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Telephony_Data_DataConnectState_DATA_STATE_CONNECTING", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)=> {
      let caseName = 'Telephony_Data_DataConnectState_DATA_STATE_CONNECTING';
      console.log(`==========> ${caseName} Test start ==========>`);
      expect(1).assertEqual(data.DataConnectState.DATA_STATE_CONNECTING);
      console.log(`==========> ${caseName} Test end ==========>`);
      done();
    });

    /**
     * @tc.name   Telephony_Data_DataConnectState_DATA_STATE_CONNECTED
     * @tc.number Telephony_Data_DataConnectState_DATA_STATE_CONNECTED
     * @tc.desc   Enum value test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Telephony_Data_DataConnectState_DATA_STATE_CONNECTED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)=> {
      let caseName = 'Telephony_Data_DataConnectState_DATA_STATE_CONNECTED';
      console.log(`==========> ${caseName} Test start ==========>`);
      expect(2).assertEqual(data.DataConnectState.DATA_STATE_CONNECTED);
      console.log(`==========> ${caseName} Test end ==========>`);
      done();
    });

    /**
     * @tc.name   Telephony_Data_DataConnectState_DATA_STATE_SUSPENDED
     * @tc.number Telephony_Data_DataConnectState_DATA_STATE_SUSPENDED
     * @tc.desc   Enum value test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Telephony_Data_DataConnectState_DATA_STATE_SUSPENDED", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)=> {
      let caseName = 'Telephony_Data_DataConnectState_DATA_STATE_SUSPENDED';
      console.log(`==========> ${caseName} Test start ==========>`);
      expect(3).assertEqual(data.DataConnectState.DATA_STATE_SUSPENDED);
      console.log(`==========> ${caseName} Test end ==========>`);
      done();
    });

    /**
     * @tc.name   Telephony_Data_DefaultCellularDataSimId_DATA_GET_SimId
     * @tc.number Telephony_Data_DefaultCellularDataSimId_DATA_GET_SimId
     * @tc.desc   Enum value test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Telephony_Data_DefaultCellularDataSimId_DATA_GET_SimId", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)=> {
      let caseName = 'Telephony_Data_DefaultCellularDataSimId_DATA_GET_SimId';
      console.log(`==========> ${caseName} Test start ==========>`);
      console.log("Result: "+ data.getDefaultCellularDataSimId());
      expect(true).assertTrue();
      console.log(`==========> ${caseName} Test end ==========>`);
      done();
    });

  });
}


