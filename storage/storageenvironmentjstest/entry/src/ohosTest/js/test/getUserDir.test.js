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
import { describe, it, expect, environment, isString, isIntNum } from './Common';
import { Level } from '@ohos/hypium';

export default function getUserDir() {
  describe('environment_getUserDir_test', function () {

    /**
     * @tc.name   environment_test_getUserDesktopDir_001
     * @tc.number SUB_BASIC_FM_FileAPI_Environment_getUserDesktopDir_0100
     * @tc.desc   Test getDesktopDir() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('environment_test_getUserDesktopDir_001', Level.LEVEL0, async function () {
      try {
        let path = environment.getUserDesktopDir();
        expect(isString(path)).assertTrue();
      } catch (e) {
        console.info('environment_test_getUserDesktopDir_001 has failed for ' + e.message + ',code:' + e.code);
        if (e.code == 801) {
          expect(e.code == 801 && e.message == "The device doesn't support this api").assertTrue();
        }else{
          expect(false).assertTrue();
        }
      }
    });

    /**
     * @tc.name   environment_test_getUserDesktopDir_002
     * @tc.number SUB_BASIC_FM_FileAPI_Environment_getUserDesktopDir_0200
     * @tc.desc   Test getDesktopDir() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('environment_test_getUserDesktopDir_002', Level.LEVEL0, async function () {
      try {
        let path = environment.getUserDesktopDir("123%$&^");
        expect(false).assertTrue();
      } catch (e) {
        console.info('environment_test_getUserDesktopDir_002 has failed for ' + e.message + ',code:' + e.code);
        if (e.code == 801) {
          expect(e.code == 801 && e.message == "The device doesn't support this api").assertTrue();
        } else {
          expect(e.code == 401 && e.message == "The input parameter is invalid").assertTrue();
        }
      }
    });

    /**
     * @tc.name   environment_test_getUserDesktopDir_003
     * @tc.number SUB_BASIC_FM_FileAPI_Environment_getUserDesktopDir_0300
     * @tc.desc   Test getUserDesktopDir() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('environment_test_getUserDesktopDir_003', Level.LEVEL0, async function () {
      try {
        let path = environment.getUserDesktopDir(true);
        expect(false).assertTrue();
      } catch (e) {
        console.info('environment_test_getUserDesktopDir_003 has failed for ' + e.message + ',code:' + e.code);
        if (e.code == 801) {
          expect(e.code == 801 && e.message == "The device doesn't support this api").assertTrue();
        } else {
          expect(e.code == 401 && e.message == "The input parameter is invalid").assertTrue();
        }
      }
    });

    /**
     * @tc.name   environment_test_getUserDocumentDir_001
     * @tc.number SUB_BASIC_FM_FileAPI_Environment_getUserDocumentDir_0100
     * @tc.desc   Test getUserDocumentDir() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('environment_test_getUserDocumentDir_001', Level.LEVEL0, async function () {
      try {
        let path = environment.getUserDocumentDir();
        expect(isString(path)).assertTrue();
      } catch (e) {
        console.info('environment_test_getUserDocumentDir_001 has failed for ' + e.message + ',code:' + e.code);
        if (e.code == 801) {
          expect(e.message == "The device doesn't support this api").assertTrue();
        }else{
          expect(false).assertTrue();
        }
      }
    });

    /**
     * @tc.name   environment_test_getUserDocumentDir_002
     * @tc.number SUB_BASIC_FM_FileAPI_Environment_getUserDocumentDir_0200
     * @tc.desc   Test getUserDocumentDir() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('environment_test_getUserDocumentDir_002', Level.LEVEL0, async function () {
      try {
        let path = environment.getUserDocumentDir("123%$&^");
        expect(false).assertTrue();
      } catch (e) {
        console.info('environment_test_getUserDocumentDir_002 has failed for ' + e.message + ',code:' + e.code);
        if (e.code == 801) {
          expect(e.message == "The device doesn't support this api").assertTrue();
        } else {
          expect(e.code == 401).assertTrue();
        }
      }
    });

    /**
     * @tc.name   environment_test_getUserDocumentDir_003
     * @tc.number SUB_BASIC_FM_FileAPI_Environment_getUserDocumentDir_0300
     * @tc.desc   Test getUserDocumentDir() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('environment_test_getUserDocumentDir_003', Level.LEVEL0, async function () {
      try {
        let path = environment.getUserDocumentDir(true);
        expect(false).assertTrue();
      } catch (e) {
        console.info('environment_test_getUserDocumentDir_003 has failed for ' + e.message + ',code:' + e.code);
        if (e.code == 801) {
          expect(e.message == "The device doesn't support this api").assertTrue();
        } else {
          expect(e.code == 401).assertTrue();
        }
      }
    });

    /**
     * @tc.name   environment_test_getUserDownloadDir_001
     * @tc.number SUB_BASIC_FM_FileAPI_Environment_getUserDownloadDir_0100
     * @tc.desc   Test getUserDownloadDir() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('environment_test_getUserDownloadDir_001', Level.LEVEL0, async function () {
      try {
        let path = environment.getUserDownloadDir();
        expect(isString(path)).assertTrue();
      } catch (e) {
        console.info('environment_test_getUserDownloadDir_001 has failed for ' + e.message + ',code:' + e.code);
        if (e.code == 801) {
          expect(e.message == "The device doesn't support this api").assertTrue();
        }else{
          expect(false).assertTrue();
        }
      }
    });

    /**
     * @tc.name   environment_test_getUserDownloadDir_002
     * @tc.number SUB_BASIC_FM_FileAPI_Environment_getUserDownloadDir_0200
     * @tc.desc   Test getUserDownloadDir() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('environment_test_getUserDownloadDir_002', Level.LEVEL0, async function () {
      try {
        let path = environment.getUserDownloadDir("123%$&^");
        expect(false).assertTrue();
      } catch (e) {
        console.info('environment_test_getUserDownloadDir_002 has failed for ' + e.message + ',code:' + e.code);
        if (e.code == 801) {
          expect(e.message == "The device doesn't support this api").assertTrue();
        } else {
          expect(e.code == 401).assertTrue();
        }
      }
    });

    /**
     * @tc.name   environment_test_getUserDownloadDir_003
     * @tc.number SUB_BASIC_FM_FileAPI_Environment_getUserDownloadDir_0300
     * @tc.desc   Test getUserDownloadDir() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('environment_test_getUserDownloadDir_003', Level.LEVEL0, async function () {
      try {
        let path = environment.getUserDownloadDir(true);
        expect(false).assertTrue();
      } catch (e) {
        console.info('environment_test_getUserDownloadDir_003 has failed for ' + e.message + ',code:' + e.code);
        if (e.code == 801) {
          expect(e.message == "The device doesn't support this api").assertTrue();
        } else {
          expect(e.code == 401).assertTrue();
        }
      }
    });
  });
}