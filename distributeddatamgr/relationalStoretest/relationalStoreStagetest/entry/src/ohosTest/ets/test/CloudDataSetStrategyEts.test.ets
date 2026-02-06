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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import { cloudData } from '@kit.ArkData';
import deviceInfo from '@ohos.deviceInfo';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = "[CloudData_SetStratgey_Ets_test]";

export default function cloudDataSetStrategyEtsTest() {
  describe('cloudDataSetStrategyEtsTest', () => {
    let currentDeviceIsWatch = false;
    beforeAll(async (done: Function) => {
      console.info('window_layout_test beforeAll begin');
      let deviceTypeInfo = deviceInfo.deviceType;
      currentDeviceIsWatch = deviceTypeInfo === 'wearable' ? true : false;
      console.info('the value of the deviceType is :' + deviceInfo.deviceType)
      console.info('window_layout_test beforeAll end');
    });

    beforeEach(async () => {
    });

    afterEach(async () => {
    });

    afterAll(async () => {
    });

    console.log(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.name setCloudStrategyTest001
     * @tc.number SUB_DistributedData_CloudData_SDK_SetCloudStrategyTest_0100
     * @tc.desc Test Js Api setCloudStrategy with null args.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('setCloudStrategyTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* setCloudStrategyTest001 start *************");
      try {
        cloudData.setCloudStrategy(null).then(() => {
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(TAG + `setCloudStrategyTest001, errcode:${JSON.stringify(err)}`);
          expect().assertFail();
        })
      } catch (err) {
        console.error(TAG + `setCloudStrategyTest001, errcode:${JSON.stringify(err)}`);
        expect(err.code == 401).assertTrue();
      }
      done();
      console.log(TAG + "************* setCloudStrategyTest001 end *************");
    })

    /**
     * @tc.name setCloudStrategyTest002
     * @tc.number SUB_DistributedData_CloudData_SDK_SetCloudStrategyTest_0200
     * @tc.desc Test Js Api setCloudStrategy with undefined args.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('setCloudStrategyTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* setCloudStrategyTest002 start *************");
      try {
        cloudData.setCloudStrategy(undefined).then(() => {
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(TAG + `setCloudStrategyTest002, errcode:${JSON.stringify(err)}`);
          expect().assertFail();
        })
      } catch (err) {
        console.error(TAG + `setCloudStrategyTest002, errcode:${JSON.stringify(err)}`);
        expect(err.code == 401).assertTrue();
      }
      done();
      console.log(TAG + "************* setCloudStrategyTest002 end *************");
    })

    /**
     * @tc.name setCloudStrategyTest003
     * @tc.number SUB_DistributedData_CloudData_SDK_SetCloudStrategyTest_0300
     * @tc.desc Test Js Api setCloudStrategy with undefined args.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('setCloudStrategyTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* setCloudStrategyTest003 start *************");
      try {
        cloudData.setCloudStrategy(cloudData.StrategyType.NETWORK, [undefined, "test"]).then(() => {
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(TAG + `setCloudStrategyTest003, errcode:${JSON.stringify(err)}`);
          expect().assertFail();
        })
      } catch (err) {
        console.error(TAG + `setCloudStrategyTest003, errcode:${JSON.stringify(err)}`);
        expect(err.code == 401).assertTrue();
      }
      done();
      console.log(TAG + "************* setCloudStrategyTest003 end *************");
    })

    /**
     * @tc.name setCloudStrategyTest004
     * @tc.number SUB_DistributedData_CloudData_SDK_SetCloudStrategyTest_0400
     * @tc.desc Test Js Api setCloudStrategy with error param args.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('setCloudStrategyTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* setCloudStrategyTest004 start *************");
      try {
        cloudData.setCloudStrategy(cloudData.StrategyType.NETWORK, [cloudData.NetWorkStrategy.WIFI, "test"]).then(() => {
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(TAG + `setCloudStrategyTest004, errcode:${JSON.stringify(err)}`);
          expect().assertFail();
        })
      } catch (err) {
        console.error(TAG + `setCloudStrategyTest004, errcode:${JSON.stringify(err)}`);
        expect(err.code == 401).assertTrue();
      }
      done();
      console.log(TAG + "************* setCloudStrategyTest004 end *************");
    })

    /**
     * @tc.name setCloudStrategyTest005
     * @tc.number SUB_DistributedData_CloudData_SDK_SetCloudStrategyTest_0500
     * @tc.desc Test Js Api setCloudStrategy with WIFI args.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('setCloudStrategyTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* setCloudStrategyTest005 start *************");
      try {
        cloudData.setCloudStrategy(cloudData.StrategyType.NETWORK, [cloudData.NetWorkStrategy.WIFI]).then(() => {
          console.info(TAG + `setCloudStrategyTest005, setCloudStrategy success`);
        }).catch((err: BusinessError) => {
          if(currentDeviceIsWatch && err.code == 801){
            expect(err.code == 801).assertTrue();
          } else {
            console.error(TAG + `setCloudStrategyTest005, errcode:${JSON.stringify(err)}`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `setCloudStrategyTest005, errcode:${JSON.stringify(err)}`);
        expect().assertFail();
      }
      done();
      console.log(TAG + "************* setCloudStrategyTest005 end *************");
    })

    /**
     * @tc.name setCloudStrategyTest006
     * @tc.number SUB_DistributedData_CloudData_SDK_SetCloudStrategyTest_0600
     * @tc.desc Test Js Api setCloudStrategy with CELLULAR args.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('setCloudStrategyTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* setCloudStrategyTest006 start *************");
      try {
        cloudData.setCloudStrategy(cloudData.StrategyType.NETWORK, [cloudData.NetWorkStrategy.CELLULAR, cloudData.NetWorkStrategy.WIFI]).then(() => {
          console.info(TAG + `setCloudStrategyTest006, setCloudStrategy success`);
        }).catch((err: BusinessError) => {
          if(currentDeviceIsWatch && err.code == 801){
            expect(err.code == 801).assertTrue();
          } else {
            console.error(TAG + `setCloudStrategyTest006, errcode:${JSON.stringify(err)}`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `setCloudStrategyTest006, errcode:${JSON.stringify(err)}`);
        expect().assertFail();
      }
      done();
      console.log(TAG + "************* setCloudStrategyTest006 end *************");
    })

    /**
     * @tc.name setCloudStrategyTest007
     * @tc.number SUB_DistributedData_CloudData_SDK_SetCloudStrategyTest_0700
     * @tc.desc Test Js Api setCloudStrategy with args.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('setCloudStrategyTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* setCloudStrategyTest007 start *************");
      try {
        cloudData.setCloudStrategy(cloudData.StrategyType.NETWORK).then(() => {
          console.info(TAG + `setCloudStrategyTest007, setCloudStrategy success`);
        }).catch((err: BusinessError) => {
          if(currentDeviceIsWatch && err.code == 801){
            expect(err.code == 801).assertTrue();
          } else {
            console.error(TAG + `setCloudStrategyTest007, errcode:${JSON.stringify(err)}`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `setCloudStrategyTest007, errcode:${JSON.stringify(err)}`);
        expect().assertFail();
      }
      done();
      console.log(TAG + "************* setCloudStrategyTest007 end *************");
    })

    /**
     * @tc.name setCloudStrategyTest008
     * @tc.number SUB_DistributedData_CloudData_SDK_SetCloudStrategyTest_0800
     * @tc.desc Test Js Api setCloudStrategy with undefined param args.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('setCloudStrategyTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* setCloudStrategyTest008 start *************");
      try {
        cloudData.setCloudStrategy(cloudData.StrategyType.NETWORK, undefined).then(() => {
          console.info(TAG + `setCloudStrategyTest008, setCloudStrategy success`);
        }).catch((err: BusinessError) => {
          if(currentDeviceIsWatch && err.code == 801){
            expect(err.code == 801).assertTrue();
          } else {
            console.error(TAG + `setCloudStrategyTest008, errcode:${JSON.stringify(err)}`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `setCloudStrategyTest008, errcode:${JSON.stringify(err)}`);
        expect().assertFail();
      }
      done();
      console.log(TAG + "************* setCloudStrategyTest008 end *************");
    })

    /**
     * @tc.name setCloudStrategyTest009
     * @tc.number SUB_DistributedData_CloudData_SDK_SetCloudStrategyTest_0900
     * @tc.desc Test Js Api setCloudStrategy with null param args.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('setCloudStrategyTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* setCloudStrategyTest009 start *************");
      try {
        cloudData.setCloudStrategy(cloudData.StrategyType.NETWORK, null).then(() => {
          console.info(TAG + `setCloudStrategyTest009, setCloudStrategy success`);
        }).catch((err: BusinessError) => {
          if(currentDeviceIsWatch && err.code == 801){
            expect(err.code == 801).assertTrue();
          } else {
            console.error(TAG + `setCloudStrategyTest009, errcode:${JSON.stringify(err)}`);
            expect().assertFail();
          }
        });
      } catch (err) {
        console.error(TAG + `setCloudStrategyTest009, errcode:${JSON.stringify(err)}`);
        expect().assertFail();
      }
      done();
      console.log(TAG + "************* setCloudStrategyTest009 end *************");
    })

    console.log(TAG + "*************Unit Test End*************");
  })}
