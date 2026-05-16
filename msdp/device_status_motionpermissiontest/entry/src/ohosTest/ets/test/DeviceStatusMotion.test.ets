/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { abilityAccessCtrl, common, PermissionRequestResult } from '@kit.AbilityKit';
import { Driver, ON } from '@kit.TestKit';


let context: common.UIAbilityContext | undefined;
let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
const MONTION_PERMISSION = 'ohos.permission.ACTIVITY_MOTION';
async function requestPermission() {
  try {
      console.info(`msdp getPermission is start`);
      context= AppStorage.get('context') as common.UIAbilityContext;
      atManager.requestPermissionsFromUser(context, [MONTION_PERMISSION], (err: BusinessError, data: PermissionRequestResult) => {
        console.info('requestPermissionsFromUser success data is' + JSON.stringify(data));
        console.info('requestPermissionsFromUser failed err is' + JSON.stringify(err));
  })
  } catch (err) {
      console.error('msdp requestPermissionsFromUser fail:' + JSON.stringify(err));
  }
}

async function driveFn() {
  try {
      let driver = await Driver.create();
      console.info(`msdp motion test come in driveFn`);
      console.info(`msdp motion test driver is ${JSON.stringify(driver)}`);
      let button = await driver.findComponent(ON.text('允许'));
      console.info(`button is ${JSON.stringify(button)}`);
      await button.click();
      await sleep(1000);
  } catch (err) {
      console.info('msdp motion test err code is ' + err);
      return;
  }
}

export default function DeviceStatusMotionPermissionTest() {
  describe('DeviceStatusMotionPermissionTest', () => {
    console.log("*************Motion API Test Begin*************");
    beforeAll(async (done:Function) => {
      console.info('-----------------msdp motion test beforeAll begin-----------------');
      await requestPermission();
      console.info('msdp requestPermission success');
      await driveFn();
      console.info('-----------------msdp motion test beforeAll end-----------------');
      done();
    })

    afterAll(() => {
      console.info('msdp motion test afterAll called')
    })

    beforeEach(() => {
      console.info('msdp motion test beforeEach called')
    })

    afterEach(() => {
      console.info('msdp motion test afterEach called')
    })

    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_MotionPermission_0100
     * @tc.number SUB_MSDP_DeviceStatus_API_MotionPermission_0100
     * @tc.desc   motion callback interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_MotionPermission_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done:Function) => {
      console.info(`SUB_MSDP_DeviceStatus_API_MotionPermission_0100 enter`);
      try {
        motion.on('operatingHandChanged', (data) => {});
        sleep(1000);
        motion.off('operatingHandChanged');
        console.info(`SUB_MSDP_DeviceStatus_API_MotionPermission_0100 success`);
        done();
      } catch (error) {
        console.info(`SUB_MSDP_DeviceStatus_API_MotionPermission_0100: ${JSON.stringify(error, ['code', 'message'])}`);
        if(error.code === 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect().assertFail()
        }
        done();
      }
    })


    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_MotionPermission_0200
     * @tc.number SUB_MSDP_DeviceStatus_API_MotionPermission_0200
     * @tc.desc   motion callback interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_MotionPermission_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done:Function) => {
      console.info(`SUB_MSDP_DeviceStatus_API_MotionPermission_0200 enter`);
      try {
        let data = motion.getRecentOperatingHandStatus();
        expect(data == motion.OperatingHandStatus.UNKNOWN_STATUS || data == motion.OperatingHandStatus.LEFT_HAND_OPERATED ||
          data == motion.OperatingHandStatus.RIGHT_HAND_OPERATED).assertTrue();
        console.info(`SUB_MSDP_DeviceStatus_API_MotionPermission_0200 success`);
        done();
      } catch (error) {
        console.info(`SUB_MSDP_DeviceStatus_API_MotionPermission_0200: ${JSON.stringify(error, ['code', 'message'])}`);
        if(error.code === 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect().assertFail()
        }
        done();
      }
    })

  })
}

function sleep(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms));
}

