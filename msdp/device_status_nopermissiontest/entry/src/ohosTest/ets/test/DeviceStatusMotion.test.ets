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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'


export default function DeviceStatusNoPermissionTest() {
  describe('DeviceStatusNoPermissionTest', () => {
    console.log("*************Motion API Test Begin*************");
    beforeAll(() => {
      console.info('msdp motion test beforeAll called');
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
     * @tc.name   SUB_MSDP_DeviceStatus_API_NoPermission_0100
     * @tc.number SUB_MSDP_DeviceStatus_API_NoPermission_0100
     * @tc.desc   motion callback interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_NoPermission_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(`SUB_MSDP_DeviceStatus_API_NoPermission_0100 enter`);
      try {
        motion.off('holdingHandChanged');
        expect().assertFail()
      } catch (error) {
        console.info(`SUB_MSDP_DeviceStatus_API_NoPermission_0100: ${JSON.stringify(error, ['code', 'message'])}`);
        if(error.code === 31500003) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect(error.code).assertEqual(201);
        }
      }
    })

    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_NoPermission_0200
     * @tc.number SUB_MSDP_DeviceStatus_API_NoPermission_0200
     * @tc.desc   motion callback interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_NoPermission_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info(`SUB_MSDP_DeviceStatus_API_NoPermission_0200 enter`);
      try {
        motion.off('operatingHandChanged');
        expect().assertFail()
      } catch (error) {
        console.info(`SUB_MSDP_DeviceStatus_API_NoPermission_0200: ${JSON.stringify(error, ['code', 'message'])}`);
        if(error.code === 31500003) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect(error.code).assertEqual(201);
        }
      }
    })

    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_NoPermission_0300
     * @tc.number SUB_MSDP_DeviceStatus_API_NoPermission_0300
     * @tc.desc   motion callback interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_NoPermission_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done:Function) => {
      console.info(`SUB_MSDP_DeviceStatus_API_NoPermission_0300 enter`);
      try {
        let data = motion.getRecentOperatingHandStatus();
        console.info(`SUB_MSDP_DeviceStatus_API_NoPermission_0300 success`);
        done();
        expect().assertFail()
      } catch (error) {
        console.info(`SUB_MSDP_DeviceStatus_API_NoPermission_0300: ${JSON.stringify(error, ['code', 'message'])}`);
        if(error.code === 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect(error.code).assertEqual(201);
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_NoPermission_0400
     * @tc.number SUB_MSDP_DeviceStatus_API_NoPermission_0400
     * @tc.desc   motion callback interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_NoPermission_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done:Function) => {
      console.info(`SUB_MSDP_DeviceStatus_API_NoPermission_0400 enter`);
      try {
        motion.on('operatingHandChanged', (data) => {});
        console.info(`SUB_MSDP_DeviceStatus_API_NoPermission_0400 success`);
        done();
        expect().assertFail()
      } catch (error) {
        console.info(`SUB_MSDP_DeviceStatus_API_NoPermission_0400: ${JSON.stringify(error, ['code', 'message'])}`);
        if(error.code === 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect(error.code).assertEqual(201);
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_MSDP_DeviceStatus_API_NoPermission_0500
     * @tc.number SUB_MSDP_DeviceStatus_API_NoPermission_0500
     * @tc.desc   motion callback interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MSDP_DeviceStatus_API_NoPermission_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done:Function) => {
      console.info(`SUB_MSDP_DeviceStatus_API_NoPermission_0500 enter`);
      try {
        motion.on('holdingHandChanged', (data) => {});
        console.info(`SUB_MSDP_DeviceStatus_API_NoPermission_0500 success`);
        done();
        expect().assertFail()
      } catch (error) {
        console.info(`SUB_MSDP_DeviceStatus_API_NoPermission_0500: ${JSON.stringify(error, ['code', 'message'])}`);
        if(error.code === 801) {
          expect(error.message == "The device does not support this API.");
        } else {
          expect(error.code).assertEqual(201);
        }
        done();
      }
    })

  })
}
