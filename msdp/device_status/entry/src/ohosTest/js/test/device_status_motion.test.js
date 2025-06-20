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
import motion from "@ohos.multimodalAwareness.motion";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import { UiDriver, BY } from '@ohos.UiTest'
import featureAbility from '@ohos.ability.featureAbility';

async function sleep(time) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve()
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`);
  })
}

async function requestPermission() {
  try {
      console.info(`msdp getPermission is start`);
      let context = featureAbility.getContext();
      await context.requestPermissionsFromUser(['ohos.permission.ACTIVITY_MOTION'], 0, (data) => {
        console.info("msdp requestPermission success data: " + JSON.stringify(data));
      });
  } catch (err) {
      console.error('msdp requestPermissionsFromUser fail:' + JSON.stringify(err));
  }
}

async function driveFn() {
  try {
      let driver = await UiDriver.create();
      console.info(`msdp motion test come in driveFn`);
      console.info(`msdp motion test driver is ${JSON.stringify(driver)}`);
      let button = await driver.findComponent(BY.text('允许'));
      console.info(`button is ${JSON.stringify(button)}`);
      await button.click();
      await sleep(1000);
  } catch (err) {
      console.info('msdp motion test err code is ' + err);
      return;
  }
}


export default function DeviceStatusMotionTest() {
  describe('DeviceStatusMotionTest', function () {
    console.log("*************Motion API Test Begin*************");
    beforeAll(async function (done) {
      console.info('-----------------msdp motion test beforeAll begin-----------------');
      await requestPermission();
      console.info('msdp requestPermission success');
      await driveFn();
      console.info('-----------------msdp motion test beforeAll end-----------------');
      done();
    })

    afterAll(function() {
      console.info('msdp motion test afterAll called')
    })

    beforeEach(function() {
      console.info('msdp motion test beforeEach called')
    })

    afterEach(function() {
      console.info('msdp motion test afterEach called')
    })

    /*
     * @tc.number     : SUB_MSDP_DeviceStatus_API_Motion_0100
     * @tc.name       : SUB_MSDP_DeviceStatus_API_Motion_0100
     * @tc.desc       : motion callback interface test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('SUB_MSDP_DeviceStatus_API_Motion_0100', 0, function () {
      console.info(`SUB_MSDP_DeviceStatus_API_Motion_0100 enter`);
      try {
        motion.off('operatingHandChanged');
      } catch (error) {
        console.info(`SUB_MSDP_DeviceStatus_API_Motion_0100: ${JSON.stringify(error, ['code', 'message'])}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect(error.code).assertEqual(31500003);
        }
      }
    })

    /*
     * @tc.number     : SUB_MSDP_DeviceStatus_API_Motion_0200
     * @tc.name       : SUB_MSDP_DeviceStatus_API_Motion_0200
     * @tc.desc       : motion callback interface test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('SUB_MSDP_DeviceStatus_API_Motion_0200', 0, function (done) {
      console.info(`SUB_MSDP_DeviceStatus_API_Motion_0200 enter`);
      try {
        motion.on('operatingHandChanged', (data) => {});
        done();
      } catch (error) {
        console.info(`SUB_MSDP_DeviceStatus_API_Motion_0200: ${JSON.stringify(error, ['code', 'message'])}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect(error.code).assertEqual(201);
        }
        done();
      }
    })

    /*
     * @tc.number     : SUB_MSDP_DeviceStatus_API_Motion_0300
     * @tc.name       : SUB_MSDP_DeviceStatus_API_Motion_0300
     * @tc.desc       : motion callback interface test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('SUB_MSDP_DeviceStatus_API_Motion_0300', 0, function () {
      console.info(`SUB_MSDP_DeviceStatus_API_Motion_0300 enter`);
      try {
        motion.on(10, null);
      } catch (error) {
        console.info(`SUB_MSDP_DeviceStatus_API_Motion_0300: ${JSON.stringify(error, ['code', 'message'])}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect(error.code).assertEqual(401);
        }
      }
    })

    /*
     * @tc.number     : SUB_MSDP_DeviceStatus_API_Motion_0400
     * @tc.name       : SUB_MSDP_DeviceStatus_API_Motion_0400
     * @tc.desc       : motion callback interface test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('SUB_MSDP_DeviceStatus_API_Motion_0400', 0, function () {
      console.info(`SUB_MSDP_DeviceStatus_API_Motion_0400 enter`);
      try {
        motion.off(10, null);
      } catch (error) {
        console.info(`SUB_MSDP_DeviceStatus_API_Motion_0400: ${JSON.stringify(error, ['code', 'message'])}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect(error.code).assertEqual(401);
        }
      }
    })

    /*
     * @tc.number     : SUB_MSDP_DeviceStatus_API_Motion_0500
     * @tc.name       : SUB_MSDP_DeviceStatus_API_Motion_0500
     * @tc.desc       : motion callback interface test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('SUB_MSDP_DeviceStatus_API_Motion_0500', 0, function (done) {
      console.info(`SUB_MSDP_DeviceStatus_API_Motion_0500 enter`);
      try {
        motion.on('operatingHandChanged', (data) => {});
        sleep(1000);
        motion.off('operatingHandChanged');
        console.info(`SUB_MSDP_DeviceStatus_API_Motion_0500 success`);
        done();
      } catch (error) {
        console.info(`SUB_MSDP_DeviceStatus_API_Motion_0500: ${JSON.stringify(error, ['code', 'message'])}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect(error.code).assertEqual(201);
        }
        done();
      }
    })

    /*
     * @tc.number     : SUB_MSDP_DeviceStatus_API_Motion_0600
     * @tc.name       : SUB_MSDP_DeviceStatus_API_Motion_0600
     * @tc.desc       : motion callback interface test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('SUB_MSDP_DeviceStatus_API_Motion_0600', 0, function (done) {
      console.info(`SUB_MSDP_DeviceStatus_API_Motion_0600 enter`);
      try {
        motion.off('operatingHandChanged', (data) => {});
        done();
      } catch (error) {
        console.info(`SUB_MSDP_DeviceStatus_API_Motion_0600: ${JSON.stringify(error, ['code', 'message'])}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect(error.code).assertEqual(31500001);
        }
        done();
      }
    })

    /*
     * @tc.number     : SUB_MSDP_DeviceStatus_API_Motion_0700
     * @tc.name       : SUB_MSDP_DeviceStatus_API_Motion_0700
     * @tc.desc       : motion callback interface test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('SUB_MSDP_DeviceStatus_API_Motion_0700', 0, function (done) {
      console.info(`SUB_MSDP_DeviceStatus_API_Motion_0700 enter`);
      console.info('OperatingHandStatus.UNKNOWN_STATUS is: ' + motion.OperatingHandStatus.UNKNOWN_STATUS);
      console.info('OperatingHandStatus.LEFT_HAND_OPERATED is: ' + motion.OperatingHandStatus.LEFT_HAND_OPERATED);
      console.info('OperatingHandStatus.RIGHT_HAND_OPERATED is: ' + motion.OperatingHandStatus.RIGHT_HAND_OPERATED);
      try {
        let data = motion.getRecentOperatingHandStatus();
        expect(data == motion.OperatingHandStatus.UNKNOWN_STATUS || data == motion.OperatingHandStatus.LEFT_HAND_OPERATED ||
          data == motion.OperatingHandStatus.RIGHT_HAND_OPERATED).assertTrue();
        console.info(`SUB_MSDP_DeviceStatus_API_Motion_0700 success`);
        done();
      } catch (error) {
        console.info(`SUB_MSDP_DeviceStatus_API_Motion_0700: ${JSON.stringify(error, ['code', 'message'])}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect(error.code).assertEqual(201);
        }
        done();
      }
    })
  })
}
