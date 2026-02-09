/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import deviceStatus from "@ohos.multimodalAwareness.deviceStatus";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

async function sleep(time) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve()
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`);
  })
}

export default function DeviceStatusDeviceStatusTest() {
  describe('DeviceStatusDeviceStatusTest', function () {
    console.log("*************DeviceStatus API Test Begin*************");
    beforeAll(async function (done) {
      console.info('-----------------msdp DeviceStatus test beforeAll called-----------------');
      done();
    })

    afterAll(function() {
      console.info('msdp DeviceStatus test afterAll called')
    })

    beforeEach(function() {
      console.info('msdp DeviceStatus test beforeEach called')
    })

    afterEach(function() {
      console.info('msdp DeviceStatus test afterEach called')
    })

    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_DeviceStatus_0100
     * @tc.number SUB_MSDP_DeviceStatus_API_DeviceStatus_0100
     * @tc.desc   DeviceStatus callback interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_DeviceStatus_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_0100 enter`);
      try {
        deviceStatus.off('steadyStandingDetect');
        done();
      } catch (error) {
        console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_0100: ${JSON.stringify(error, ['code', 'message'])}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect(error.code).assertEqual(32500003);
        }
        done();
      }
      console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_0100 end`);
    })

    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_DeviceStatus_0200
     * @tc.number SUB_MSDP_DeviceStatus_API_DeviceStatus_0200
     * @tc.desc   DeviceStatus callback interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_DeviceStatus_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_0200 enter`);
      try {
        deviceStatus.on('steadyStandingDetect', (data) => {});
        console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_0200 success`);
        done();
      } catch (error) {
        console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_0200: ${JSON.stringify(error, ['code', 'message'])}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        }
        done();
      }
      console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_0200 end`);
    })

    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_DeviceStatus_0300
     * @tc.number SUB_MSDP_DeviceStatus_API_DeviceStatus_0300
     * @tc.desc   DeviceStatus callback interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_DeviceStatus_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_0300 enter`);
      try {
        deviceStatus.on('testType', (data) => {});
        done();
      } catch (error) {
        console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_0300: ${JSON.stringify(error, ['code', 'message'])}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect(error.code).assertEqual(401);
        }
        done();
      }
      console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_0300 end`);
    })

    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_DeviceStatus_0400
     * @tc.number SUB_MSDP_DeviceStatus_API_DeviceStatus_0400
     * @tc.desc   DeviceStatus callback interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_DeviceStatus_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_0400 enter`);
      try {
        deviceStatus.off('testType', (data) => {});
        done();
      } catch (error) {
        console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_0400: ${JSON.stringify(error, ['code', 'message'])}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect(error.code).assertEqual(401);
        }
        done();
      }
      console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_0400 end`);
    })

    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_DeviceStatus_0500
     * @tc.number SUB_MSDP_DeviceStatus_API_DeviceStatus_0500
     * @tc.desc   DeviceStatus callback interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_DeviceStatus_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_0500 enter`);
      console.info('SteadyStandingStatus.STATUS_EXIT is: ' + deviceStatus.SteadyStandingStatus.STATUS_EXIT);
      console.info('SteadyStandingStatus.STATUS_ENTER is: ' + deviceStatus.SteadyStandingStatus.STATUS_ENTER);
      try {
        deviceStatus.on('steadyStandingDetect', (data) => {
          console.info('steadyStandingDetect callback data: ' + data);
          expect(data == deviceStatus.SteadyStandingStatus.STATUS_EXIT ||
            data == deviceStatus.SteadyStandingStatus.STATUS_ENTER).assertTrue();
        });
        sleep(3000);
        deviceStatus.off('steadyStandingDetect');
        console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_0500 success`);
        done();
      } catch (error) {
        console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_0500: ${JSON.stringify(error, ['code', 'message'])}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        }
        done();
      }
      console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_0500 end`);
    })

    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_DeviceStatus_0600
     * @tc.number SUB_MSDP_DeviceStatus_API_DeviceStatus_0600
     * @tc.desc   DeviceStatus callback interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_DeviceStatus_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_0600 enter`);
      try {
        deviceStatus.off('steadyStandingDetect', (data) => {});
        done();
      } catch (error) {
        console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_0600: ${JSON.stringify(error, ['code', 'message'])}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect(error.code).assertEqual(32500001);
        }
        done();
      }
      console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_0600 end`);
    })

    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_DeviceStatus_0700
     * @tc.number SUB_MSDP_DeviceStatus_API_DeviceStatus_0700
     * @tc.desc   DeviceStatus callback interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_DeviceStatus_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_0700 enter`);
      try {
        let type = "test".repeat(200);
        deviceStatus.on(type, (data) => {});
        done();
      } catch (error) {
        console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_0700: ${JSON.stringify(error, ['code', 'message'])}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect(error.code).assertEqual(32500002);
        }
        done();
      }
      console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_0700 end`);
    })

    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_DeviceStatus_0800
     * @tc.number SUB_MSDP_DeviceStatus_API_DeviceStatus_0800
     * @tc.desc   DeviceStatus callback interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_DeviceStatus_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_0800 enter`);
      try {
        let callback = (data) => {};
        deviceStatus.on('steadyStandingDetect', callback);
        deviceStatus.on('steadyStandingDetect', callback);
        done();
      } catch (error) {
        console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_0800: ${JSON.stringify(error, ['code', 'message'])}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect(error.code).assertEqual(32500001);
        }
        done();
      }
      console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_0800 end`);
    })

    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_DeviceStatus_0900
     * @tc.number SUB_MSDP_DeviceStatus_API_DeviceStatus_0900
     * @tc.desc   DeviceStatus callback interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_DeviceStatus_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_0900 enter`);
      try {
        deviceStatus.on('steadyStandingDetect', null);
        done();
      } catch (error) {
        console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_0900: ${JSON.stringify(error, ['code', 'message'])}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect(error.code).assertEqual(401);
        }
        done();
      }
      console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_0900 end`);
    })

    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_DeviceStatus_1000
     * @tc.number SUB_MSDP_DeviceStatus_API_DeviceStatus_1000
     * @tc.desc   DeviceStatus callback interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_DeviceStatus_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_1000 enter`);
      try {
        deviceStatus.off('steadyStandingDetect', null);
        done();
      } catch (error) {
        console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_1000: ${JSON.stringify(error, ['code', 'message'])}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect(error.code).assertEqual(401);
        }
        done();
      }
      console.info(`SUB_MSDP_DeviceStatus_API_DeviceStatus_1000 end`);
    })
  })
}
