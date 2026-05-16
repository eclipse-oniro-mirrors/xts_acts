/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import filemanagement from 'libfilemanagement.so';

const ERR_OK = 0;
const ERR_INVALID_PARAMETER = 401;
const ERR_DEVICE_NOT_SUPPORTED = 801;

export default function FileManagementEnvironment(){
  describe('FileManagementEnvironment', async () => {

    /**
     * @tc.name   EnvironmentErrCodeErrOk001
     * @tc.number SUB_ENVIRONMENT_ERRCODE_ERR_OK_0100
     * @tc.desc   test ERR_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EnvironmentErrCodeErrOk001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>EnvironmentErrCodeErrOk001 start====");
        let result : number = filemanagement.EnvironmentErrCodeErrOK();
        console.info("====>EnvironmentErrCodeErrOk001 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>EnvironmentErrCodeErrOk001 catch err: " + err);
      }
    });

    /**
     * @tc.name   EnvironmentErrCodeErrInvalidParameter001
     * @tc.number SUB_ENVIRONMENT_ERRCODE_ERR_INVALIDPARAMETER_0100
     * @tc.desc   test ERR_INVALID_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EnvironmentErrCodeErrInvalidParameter001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>EnvironmentErrCodeErrInvalidParameter001 start====");
        let result : number = filemanagement.EnvironmentErrCodeErrInvalidParameter();
        console.info("====>EnvironmentErrCodeErrInvalidParameter001 result: " + result);
        expect(result).assertEqual(ERR_OK);
        done()
      } catch (err) {
        console.error("====>EnvironmentErrCodeErrInvalidParameter001 catch err: " + err);
      }
    });

    /**
     * @tc.name   EnvironmentErrCodeErrDeviceNotSupported001
     * @tc.number SUB_ENVIRONMENT_ERRCODE_ERR_DEVICENOTSUPPORTED_0100
     * @tc.desc   test ERR_DEVICE_NOT_SUPPORTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EnvironmentErrCodeErrDeviceNotSupported001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>EnvironmentErrCodeErrDeviceNotSupported001 start====");
        let result : number = filemanagement.EnvironmentErrCodeErrDeviceNotSupported();
        console.info("====>EnvironmentErrCodeErrDeviceNotSupported001 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>EnvironmentErrCodeErrDeviceNotSupported001 catch err: " + err);
      }
    });

    /**
     * @tc.name   EnvironmentGetUserDownloadDir001
     * @tc.number SUB_ENVIRONMENT_GETUSERDOWNLOADDIR_0100
     * @tc.desc   test EnvironmentGetUserDownloadDir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EnvironmentGetUserDownloadDir001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>EnvironmentGetUserDownloadDir001 start====");
        let result : number = filemanagement.EnvironmentGetUserDownloadDir("ERR_OK", true);
        console.info("====>EnvironmentGetUserDownloadDir001 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>EnvironmentGetUserDownloadDir001 catch err: " + err);
      }
    });

    /**
     * @tc.name   EnvironmentGetUserDownloadDir002
     * @tc.number SUB_ENVIRONMENT_GETUSERDOWNLOADDIR_0200
     * @tc.desc   test EnvironmentGetUserDownloadDir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EnvironmentGetUserDownloadDir002', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>EnvironmentGetUserDownloadDir002 start====");
        let result : number = filemanagement.EnvironmentGetUserDownloadDir("ERR_INVALID_PARAMETER", false);
        console.info("====>EnvironmentGetUserDownloadDir002 result: " + result);
        expect(result).assertEqual(ERR_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>EnvironmentGetUserDownloadDir002 catch err: " + err);
      }
    });

    /**
     * @tc.name   EnvironmentGetUserDownloadDir003
     * @tc.number SUB_ENVIRONMENT_GETUSERDOWNLOADDIR_0300
     * @tc.desc   test EnvironmentGetUserDownloadDir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EnvironmentGetUserDownloadDir003', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>EnvironmentGetUserDownloadDir003 start====");
        let result : number = filemanagement.EnvironmentGetUserDownloadDir("ERR_DEVICE_NOT_SUPPORTED", true);
        console.info("====>EnvironmentGetUserDownloadDir003 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>EnvironmentGetUserDownloadDir003 catch err: " + err);
      }
    });

    /**
     * @tc.name   EnvironmentGetUserDesktopDir001
     * @tc.number SUB_ENVIRONMENT_GETUSERDESKTOPDIR_0100
     * @tc.desc   test EnvironmentGetUserDesktopDir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EnvironmentGetUserDesktopDir001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>EnvironmentGetUserDesktopDir001 start====");
        let result : number = filemanagement.EnvironmentGetUserDesktopDir("ERR_OK", true);
        console.info("====>EnvironmentGetUserDesktopDir001 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>EnvironmentGetUserDesktopDir001 catch err: " + err);
      }
    });

    /**
     * @tc.name   EnvironmentGetUserDesktopDir002
     * @tc.number SUB_ENVIRONMENT_GETUSERDESKTOPDIR_0200
     * @tc.desc   test EnvironmentGetUserDesktopDir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EnvironmentGetUserDesktopDir002', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>EnvironmentGetUserDesktopDir002 start====");
        let result : number = filemanagement.EnvironmentGetUserDesktopDir("ERR_INVALID_PARAMETER", false);
        console.info("====>EnvironmentGetUserDesktopDir002 result: " + result);
        expect(result).assertEqual(ERR_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>EnvironmentGetUserDesktopDir002 catch err: " + err);
      }
    });

    /**
     * @tc.name   EnvironmentGetUserDesktopDir003
     * @tc.number SUB_ENVIRONMENT_GETUSERDESKTOPDIR_0300
     * @tc.desc   test EnvironmentGetUserDesktopDir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EnvironmentGetUserDesktopDir003', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>EnvironmentGetUserDesktopDir003 start====");
        let result : number = filemanagement.EnvironmentGetUserDesktopDir("ERR_DEVICE_NOT_SUPPORTED", true);
        console.info("====>EnvironmentGetUserDesktopDir003 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>EnvironmentGetUserDesktopDir003 catch err: " + err);
      }
    });

    /**
     * @tc.name   EnvironmentGetUserDocumentDir001
     * @tc.number SUB_ENVIRONMENT_GETUSERDOCUMENTDIR_0100
     * @tc.desc   test EnvironmentGetUserDocumentDir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EnvironmentGetUserDocumentDir001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>EnvironmentGetUserDocumentDir001 start====");
        let result : number = filemanagement.EnvironmentGetUserDocumentDir("ERR_OK", true);
        console.info("====>EnvironmentGetUserDocumentDir001 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>EnvironmentGetUserDocumentDir001 catch err: " + err);
      }
    });

    /**
     * @tc.name   EnvironmentGetUserDocumentDir002
     * @tc.number SUB_ENVIRONMENT_GETUSERDOCUMENTDIR_0200
     * @tc.desc   test EnvironmentGetUserDocumentDir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EnvironmentGetUserDocumentDir002', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>EnvironmentGetUserDocumentDir002 start====");
        let result : number = filemanagement.EnvironmentGetUserDocumentDir("ERR_INVALID_PARAMETER", false);
        console.info("====>EnvironmentGetUserDocumentDir002 result: " + result);
        expect(result).assertEqual(ERR_INVALID_PARAMETER);
        done()
      } catch (err) {
        console.error("====>EnvironmentGetUserDocumentDir002 catch err: " + err);
      }
    });

    /**
     * @tc.name   EnvironmentGetUserDocumentDir003
     * @tc.number SUB_ENVIRONMENT_GETUSERDOCUMENTDIR_0300
     * @tc.desc   test EnvironmentGetUserDocumentDir
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('EnvironmentGetUserDocumentDir003', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>EnvironmentGetUserDocumentDir003 start====");
        let result : number = filemanagement.EnvironmentGetUserDocumentDir("ERR_DEVICE_NOT_SUPPORTED", true);
        console.info("====>EnvironmentGetUserDocumentDir003 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>EnvironmentGetUserDocumentDir003 catch err: " + err);
      }
    });
  });
}