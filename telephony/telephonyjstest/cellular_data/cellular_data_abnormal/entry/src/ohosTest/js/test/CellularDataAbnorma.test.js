/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium'
export default function ActsCellularDataAbnormalTest() {
describe("ActsCellularDataAbnormalTest", function () {
    const ERR_SLOT_ID = 3;

      /*
      * @tc.number: SUB_Telephony_CellularData_isCellularDataEnabled_Async_0100
      * @tc.name  : testTelephonyCellularDataisCellularDataEnabledAsync_0100
      * @tc.desc  : verify that the isCellularDataEnabled takes effect 
      * @tc.size  : MediumTest
      * @tc.type  : Function
      * @tc.level : Level 0
      */
    it("testTelephonyCellularDataisCellularDataEnabledAsync_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async function (done) {
        cellular.isCellularDataEnabled((err, data) => {
            if (err) {
                expect().assertFail();
                console.log("Telephony_CellularData_isCellularDataEnabled_Async_0100 fail");
                done();
                return;
            }
            console.log("Telephony_CellularData_isCellularDataEnabled_Async_0100 finish");
            done();
        })
    })

      /*
      * @tc.number: SUB_Telephony_CellularData_getCellularDataState_Async_0100
      * @tc.name  : testTelephonyCellularDataGetCellularDataStateAsync0100
      * @tc.desc  : verify that the getCellularDataState takes effect 
      * @tc.size  : MediumTest
      * @tc.type  : Function
      * @tc.level : Level 0
      */
    it("testTelephonyCellularDataGetCellularDataStateAsync0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        cellular.getCellularDataState((err, data) => {
            if (err) {
                expect().assertFail();
                console.log("Telephony_CellularData_getCellularDataState_Async_0100 fail");
                done();
                return;
            }
            console.log("Telephony_CellularData_getCellularDataState_Async_0100 finish");
            done();
        })
    })

     /*
      * @tc.number: SUB_Telephony_CellularData_getCellularDataFlowType_Async_0100
      * @tc.name  : testTelephonyCellularDataGetCellularDataFlowTypeAsync0100
      * @tc.desc  : verify that the getCellularDataFlowType takes effect 
      * @tc.size  : MediumTest
      * @tc.type  : Function
      * @tc.level : Level 0
      */
    it("testTelephonyCellularDataGetCellularDataFlowTypeAsync0100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        cellular.getCellularDataFlowType((err, data) => {
            if (err) {
                expect().assertFail();
                console.log("Telephony_CellularData_getCellularDataFlowType_Async_0100 fail");
                done();
                return;
            }
            console.log("Telephony_CellularData_getCellularDataFlowType_Async_0100 finish");
            done();
        })
    })

      /*
      * @tc.number: SUB_Telephony_CellularData_isCellularDataRoamingEnabled_Async_0200
      * @tc.name  : testTelephonyCellularDataisCellularDataRoamingEnabledAsync_0200
      * @tc.desc  : verify that the isCellularDataRoamingEnabled takes effect 
      * @tc.size  : MediumTest
      * @tc.type  : Function
      * @tc.level : Level 0
      */
    it("testTelephonyCellularDataisCellularDataRoamingEnabledAsync_0200",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        cellular.isCellularDataRoamingEnabled(ERR_SLOT_ID, (err) => {
            if (err) {
                console.log("Telephony_CellularData_isCellularDataRoamingEnabled_Async_0200 finish");
                done();
                return;
            }
            expect().assertFail();
            console.log("Telephony_CellularData_isCellularDataRoamingEnabled_Async_0200 fail");
            done();
        })
    })

     /*
      * @tc.number: SUB_Telephony_CellularData_getDefaultCellularDataSlotId_Async_0500
      * @tc.name  : testTelephonyCellularDataGetDefaultCellularDataSlotIdAsync0500
      * @tc.desc  : verify that the getDefaultCellularDataSlotId takes effect 
      * @tc.size  : MediumTest
      * @tc.type  : Function
      * @tc.level : Level 0
      */
    it("testTelephonyCellularDataGetDefaultCellularDataSlotIdAsync0500",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        cellular.getDefaultCellularDataSlotId((err) => {
            if (!err) {
                expect(true).assertTrue();
                console.info("Telephony_CellularData_getDefaultCellularDataSlotId_Async_0500 finish");
                done();
            } else {
                console.info("Telephony_CellularData_getDefaultCellularDataSlotId_Async_0500 finish");
                done();
            }
        })
    })

      /*
      * @tc.number: SUB_Telephony_CellularData_isCellularDataEnabled_Promise_0100
      * @tc.name  : testTelephonyCellularDataisCellularDataEnabledPromise_0100
      * @tc.desc  : verify that the isCellularDataEnabled takes effect 
      * @tc.size  : MediumTest
      * @tc.type  : Function
      * @tc.level : Level 0
      */
    it("testTelephonyCellularDataisCellularDataEnabledPromise_0100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        try {
            await cellular.isCellularDataEnabled();
            console.log("Telephony_CellularData_isCellularDataEnabled_Promise_0100 finish");
            done();
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_isCellularDataEnabled_Promise_0100 fail");
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
    it("testTelephonyCellularDataGetCellularDataStatePromise_0100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        try {
            await cellular.getCellularDataState();
            console.log("Telephony_CellularData_getCellularDataState_Promise_0100 finish");
            done();
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_getCellularDataState_Promise_0100 fail");
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
    it("testTelephonyCellularDataGetCellularDataFlowTypePromise_0100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        try {
            await cellular.getCellularDataFlowType();
            console.log("Telephony_CellularData_getCellularDataFlowType_Promise_0100 finish");
            done();
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_getCellularDataFlowType_Promise_0100 fail");
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
    it("testTelephonyCellularDataisCellularDataRoamingEnabledPromise_0200",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        try {
            await cellular.isCellularDataRoamingEnabled(ERR_SLOT_ID);
            expect().assertFail();
            console.log("Telephony_CellularData_isCellularDataRoamingEnabled_Promise_0200 fail");
            done();
        } catch (err) {
            console.log("Telephony_CellularData_isCellularDataRoamingEnabled_Promise_0200 finish");
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
    it("testTelephonyCellularDataGetDefaultCellularDataSlotIdPromise_0500",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        try {
            await cellular.getDefaultCellularDataSlotId();
            console.info("Telephony_CellularData_getDefaultCellularDataSlotId_Promise_0500 finish");
            done();
        } catch (err) {
            expect(true).assertTrue();
            console.info("Telephony_CellularData_getDefaultCellularDataSlotId_Promise_0500 finish");
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
    it("testTelephonyCellularDataGetDefaultCellularDataSlotIdSync_0100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let data = cellular.getDefaultCellularDataSlotIdSync();
        console.info("testTelephonyCellularDataGetDefaultCellularDataSlotIdSync_0100 " + JSON.stringify(data));
        expect(data == 0 || data == 1).assertTrue;
        done();
        });
});
}
