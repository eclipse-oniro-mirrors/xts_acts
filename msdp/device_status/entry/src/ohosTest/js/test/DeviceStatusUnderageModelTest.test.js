/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import userStatus from "@ohos.multimodalAwareness.userStatus";
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

export default function DeviceStatusUnderageModelTest() {
  describe('DeviceStatusUnderageModelTest', function () {
    console.log("*************UnderageModel API Test Begin*************");
    beforeAll(async function (done) {
      console.info('msdp UnderageModel test beforeAll called');
      done();
    })

    afterAll(function() {
      console.info('msdp UnderageModel test afterAll called')
    })

    beforeEach(function() {
      console.info('msdp UnderageModel test beforeEach called')
    })

    afterEach(function() {
      console.info('msdp UnderageModel test afterEach called')
    })

    const userStatusCallback = (data) => {
      userStatus.UserClassification.ageGroup;
      userStatus.UserClassification.confidence;
      sleep(1000);
      console.info('callback success, ageGroup:' + data.ageGroup + ', confidence: ' + data.confidence);
    }

    /*
     * @tc.number     : SUB_MSDP_DeviceStatus_API_UnderageModel_0100
     * @tc.name       : SUB_MSDP_DeviceStatus_API_UnderageModel_0100
     * @tc.desc       : UnderageModel callback interface test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('SUB_MSDP_DeviceStatus_API_UnderageModel_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info(`SUB_MSDP_DeviceStatus_API_UnderageModel_0100 enter`);
      try {
        userStatus.off('userAgeGroupDetected');
      } catch (error) {
        console.info(`SUB_MSDP_DeviceStatus_API_UnderageModel_0100: ${JSON.stringify(error, ['code', 'message'])}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect(error.code).assertEqual(33900003);
        }
      }
    })

    /*
     * @tc.number     : SUB_MSDP_DeviceStatus_API_UnderageModel_0200
     * @tc.name       : SUB_MSDP_DeviceStatus_API_UnderageModel_0200
     * @tc.desc       : UnderageModel callback interface test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('SUB_MSDP_DeviceStatus_API_UnderageModel_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      console.info(`SUB_MSDP_DeviceStatus_API_UnderageModel_0200 enter`);
      console.info('UserAgeGroup.OTHERS is: ' + userStatus.UserAgeGroup.OTHERS);
      console.info('UserAgeGroup.CHILD is: ' + userStatus.UserAgeGroup.CHILD);
      try {
        userStatus.on('userAgeGroupDetected', userStatusCallback);
        console.info(`SUB_MSDP_DeviceStatus_API_UnderageModel_0200 success`);
        done();
      } catch (error) {
        console.info(`SUB_MSDP_DeviceStatus_API_UnderageModel_0200: ${JSON.stringify(error, ['code', 'message'])}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect(error.code).assertEqual(33900002);
        }
        done();
      }
    })

    /*
     * @tc.number     : SUB_MSDP_DeviceStatus_API_UnderageModel_0300
     * @tc.name       : SUB_MSDP_DeviceStatus_API_UnderageModel_0300
     * @tc.desc       : UnderageModel callback interface test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('SUB_MSDP_DeviceStatus_API_UnderageModel_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info(`SUB_MSDP_DeviceStatus_API_UnderageModel_0300 enter`);
      try {
        userStatus.on('userAgeGroupDetected', null);
      } catch (error) {
        console.info(`SUB_MSDP_DeviceStatus_API_UnderageModel_0300: ${JSON.stringify(error, ['code', 'message'])}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect(error.code).assertEqual(401);
        }
      }
    })

    /*
     * @tc.number     : SUB_MSDP_DeviceStatus_API_UnderageModel_0400
     * @tc.name       : SUB_MSDP_DeviceStatus_API_UnderageModel_0400
     * @tc.desc       : UnderageModel callback interface test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('SUB_MSDP_DeviceStatus_API_UnderageModel_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
      console.info(`SUB_MSDP_DeviceStatus_API_UnderageModel_0400 enter`);
      try {
        userStatus.off('userAgeGroupDetected', null);
      } catch (error) {
        console.info(`SUB_MSDP_DeviceStatus_API_UnderageModel_0400: ${JSON.stringify(error, ['code', 'message'])}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect(error.code).assertEqual(401);
        }
      }
    })

    /*
     * @tc.number     : SUB_MSDP_DeviceStatus_API_UnderageModel_0500
     * @tc.name       : SUB_MSDP_DeviceStatus_API_UnderageModel_0500
     * @tc.desc       : UnderageModel callback interface test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('SUB_MSDP_DeviceStatus_API_UnderageModel_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      console.info(`SUB_MSDP_DeviceStatus_API_UnderageModel_0500 enter`);
      try {
        userStatus.on('userAgeGroupDetected', (data) => {});
        sleep(1000);
        userStatus.off('userAgeGroupDetected');
        console.info(`SUB_MSDP_DeviceStatus_API_UnderageModel_0500 success`);
        done();
      } catch (error) {
        console.info(`SUB_MSDP_DeviceStatus_API_UnderageModel_0500: ${JSON.stringify(error, ['code', 'message'])}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect(error.code).assertEqual(33900002);
        }
        done();
      }
    })

    /*
     * @tc.number     : SUB_MSDP_DeviceStatus_API_UnderageModel_0600
     * @tc.name       : SUB_MSDP_DeviceStatus_API_UnderageModel_0600
     * @tc.desc       : UnderageModel callback interface test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('SUB_MSDP_DeviceStatus_API_UnderageModel_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
      console.info(`SUB_MSDP_DeviceStatus_API_UnderageModel_0600 enter`);
      try {
        userStatus.off('userAgeGroupDetected');
        done();
      } catch (error) {
        console.info(`SUB_MSDP_DeviceStatus_API_UnderageModel_0600: ${JSON.stringify(error, ['code', 'message'])}`);
        if(error.code == 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect(error.code).assertEqual(33900001);
        }
        done();
      }
    })
  })
}
