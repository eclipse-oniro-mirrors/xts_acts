/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import avSession from '@ohos.multimedia.avsession';

export default function abilityTest() {
  describe('AVSessionEnum', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    let TAG: string = "[AVSessionEnum]";

    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_UNSPECIFIED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_UNSPECIFIED_0100
     * @tc.desc   Testing get error callMetadata - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_UNSPECIFIED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_UNSPECIFIED
      if (err_code != 6611000) {
        console.info("ERR_CODE_CAST_CONTROL_UNSPECIFIED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_REMOTE_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_REMOTE_ERROR_0100
     * @tc.desc   Testing get error callMetadata - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_REMOTE_ERROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_REMOTE_ERROR
      if (err_code != 6611001) {
        console.info("ERR_CODE_CAST_CONTROL_REMOTE_ERROR", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_BEHIND_LIVE_WINDOW_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_BEHIND_LIVE_WINDOW_0100
     * @tc.desc   Testing get error callMetadata - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_BEHIND_LIVE_WINDOW_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_BEHIND_LIVE_WINDOW
      if (err_code != 6611002) {
        console.info("ERR_CODE_CAST_CONTROL_BEHIND_LIVE_WINDOW", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_TIMEOUT_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_TIMEOUT_0100
     * @tc.desc   Testing get error callMetadata - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_TIMEOUT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_TIMEOUT
      if (err_code != 6611003) {
        console.info("ERR_CODE_CAST_CONTROL_TIMEOUT", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_RUNTIME_CHECK_FAILED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_RUNTIME_CHECK_FAILED_0100
     * @tc.desc   Testing get error callMetadata - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_RUNTIME_CHECK_FAILED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_RUNTIME_CHECK_FAILED
      if (err_code != 6611004) {
        console.info("ERR_CODE_CAST_CONTROL_RUNTIME_CHECK_FAILED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_PLAYER_NOT_WORKING_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_PLAYER_NOT_WORKING_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_PLAYER_NOT_WORKING_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_PLAYER_NOT_WORKING
      if (err_code != 6611100) {
        console.info("ERR_CODE_CAST_CONTROL_PLAYER_NOT_WORKING", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_SEEK_MODE_UNSUPPORTED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_SEEK_MODE_UNSUPPORTED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_SEEK_MODE_UNSUPPORTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_SEEK_MODE_UNSUPPORTED
      if (err_code != 6611101) {
        console.info("ERR_CODE_CAST_CONTROL_SEEK_MODE_UNSUPPORTED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_ILLEGAL_SEEK_TARGET_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_ILLEGAL_SEEK_TARGET_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_ILLEGAL_SEEK_TARGET_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_ILLEGAL_SEEK_TARGET
      if (err_code != 6611102) {
        console.info("ERR_CODE_CAST_CONTROL_ILLEGAL_SEEK_TARGET", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_PLAY_MODE_UNSUPPORTED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_PLAY_MODE_UNSUPPORTED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_PLAY_MODE_UNSUPPORTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_PLAY_MODE_UNSUPPORTED
      if (err_code != 6611103) {
        console.info("ERR_CODE_CAST_CONTROL_PLAY_MODE_UNSUPPORTED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_PLAY_SPEED_UNSUPPORTED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_PLAY_SPEED_UNSUPPORTED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_PLAY_SPEED_UNSUPPORTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_PLAY_SPEED_UNSUPPORTED
      if (err_code != 6611104) {
        console.info("ERR_CODE_CAST_CONTROL_PLAY_SPEED_UNSUPPORTED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DEVICE_MISSING_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DEVICE_MISSING_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DEVICE_MISSING_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DEVICE_MISSING
      if (err_code != 6611105) {
        console.info("ERR_CODE_CAST_CONTROL_DEVICE_MISSING", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_INVALID_PARAM_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_INVALID_PARAM_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_INVALID_PARAM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_INVALID_PARAM
      if (err_code != 6611106) {
        console.info("ERR_CODE_CAST_CONTROL_INVALID_PARAM", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_NO_MEMORY_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_NO_MEMORY_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_NO_MEMORY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_NO_MEMORY
      if (err_code != 6611107) {
        console.info("ERR_CODE_CAST_CONTROL_NO_MEMORY", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_OPERATION_NOT_ALLOWED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_OPERATION_NOT_ALLOWED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_OPERATION_NOT_ALLOWED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_OPERATION_NOT_ALLOWED
      if (err_code != 6611108) {
        console.info("ERR_CODE_CAST_CONTROL_OPERATION_NOT_ALLOWED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_UNSPECIFIED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_UNSPECIFIED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_UNSPECIFIED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_UNSPECIFIED
      if (err_code != 6612000) {
        console.info("ERR_CODE_CAST_CONTROL_IO_UNSPECIFIED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_FAILED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_FAILED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_FAILED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
        let err_code: avSession.AVSessionErrorCode =
          avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_FAILED
        if (err_code != 6612001) {
          console.info("ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_FAILED", err_code, typeof err_code);
          expect(false).assertTrue();
        }
        done();
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_TIMEOUT_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_TIMEOUT_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_TIMEOUT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 ,async (done: Function) => {
        let err_code: avSession.AVSessionErrorCode =
          avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_TIMEOUT
        if (err_code != 6612002) {
          console.info("ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_TIMEOUT", err_code, typeof err_code);
          expect(false).assertTrue();
        }
        done();
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_INVALID_HTTP_CONTENT_TYPE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_INVALID_HTTP_CONTENT_TYPE_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_INVALID_HTTP_CONTENT_TYPE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
        let err_code: avSession.AVSessionErrorCode =
          avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_INVALID_HTTP_CONTENT_TYPE
        if (err_code != 6612003) {
          console.info("ERR_CODE_CAST_CONTROL_IO_INVALID_HTTP_CONTENT_TYPE", err_code, typeof err_code);
          expect(false).assertTrue();
        }
        done();
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_BAD_HTTP_STATUS_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_BAD_HTTP_STATUS_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_BAD_HTTP_STATUS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_BAD_HTTP_STATUS
      if (err_code != 6612004) {
        console.info("ERR_CODE_CAST_CONTROL_IO_BAD_HTTP_STATUS", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_FILE_NOT_FOUND_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_FILE_NOT_FOUND_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_FILE_NOT_FOUND_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_FILE_NOT_FOUND
      if (err_code != 6612005) {
        console.info("ERR_CODE_CAST_CONTROL_IO_FILE_NOT_FOUND", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_NO_PERMISSION_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_NO_PERMISSION_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_NO_PERMISSION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_NO_PERMISSION
      if (err_code != 6612006) {
        console.info("ERR_CODE_CAST_CONTROL_IO_NO_PERMISSION", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_CLEARTEXT_NOT_PERMITTED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_CLEARTEXT_NOT_PERMITTED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_CLEARTEXT_NOT_PERMITTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_CLEARTEXT_NOT_PERMITTED
      if (err_code != 6612007) {
        console.info("ERR_CODE_CAST_CONTROL_IO_CLEARTEXT_NOT_PERMITTED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_READ_POSITION_OUT_OF_RANGE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_READ_POSITION_OUT_OF_RANGE_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_READ_POSITION_OUT_OF_RANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 ,async (done: Function) => {
        let err_code: avSession.AVSessionErrorCode =
          avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_READ_POSITION_OUT_OF_RANGE
        if (err_code != 6612008) {
          console.info("ERR_CODE_CAST_CONTROL_IO_READ_POSITION_OUT_OF_RANGE", err_code, typeof err_code);
          expect(false).assertTrue();
        }
        done();
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_NO_CONTENTS_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_NO_CONTENTS_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_NO_CONTENTS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_NO_CONTENTS
      if (err_code != 6612100) {
        console.info("ERR_CODE_CAST_CONTROL_IO_NO_CONTENTS", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_READ_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_READ_ERROR_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_READ_ERROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_READ_ERROR
      if (err_code != 6612101) {
        console.info("ERR_CODE_CAST_CONTROL_IO_READ_ERROR", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_CONTENT_BUSY_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_CONTENT_BUSY_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_CONTENT_BUSY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_CONTENT_BUSY
      if (err_code != 6612102) {
        console.info("ERR_CODE_CAST_CONTROL_IO_CONTENT_BUSY", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_CONTENT_EXPIRED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_CONTENT_EXPIRED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_CONTENT_EXPIRED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_CONTENT_EXPIRED
      if (err_code != 6612103) {
        console.info("ERR_CODE_CAST_CONTROL_IO_CONTENT_EXPIRED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_USE_FORBIDDEN_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_USE_FORBIDDEN_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_USE_FORBIDDEN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_USE_FORBIDDEN
      if (err_code != 6612104) {
        console.info("ERR_CODE_CAST_CONTROL_IO_USE_FORBIDDEN", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_NOT_VERIFIED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_NOT_VERIFIED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_NOT_VERIFIED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_NOT_VERIFIED
      if (err_code != 6612105) {
        console.info("ERR_CODE_CAST_CONTROL_IO_NOT_VERIFIED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_EXHAUSTED_ALLOWED_USES_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_EXHAUSTED_ALLOWED_USES_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_EXHAUSTED_ALLOWED_USES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_EXHAUSTED_ALLOWED_USES
      if (err_code != 6612106) {
        console.info("ERR_CODE_CAST_CONTROL_IO_EXHAUSTED_ALLOWED_USES", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_NETWORK_PACKET_SENDING_FAILED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_NETWORK_PACKET_SENDING_FAILED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_IO_NETWORK_PACKET_SENDING_FAILED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 ,async (done: Function) => {
        let err_code: avSession.AVSessionErrorCode =
          avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_NETWORK_PACKET_SENDING_FAILED
        if (err_code != 6612107) {
          console.info("ERR_CODE_CAST_CONTROL_IO_NETWORK_PACKET_SENDING_FAILED", err_code, typeof err_code);
          expect(false).assertTrue();
        }
        done();
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_PARSING_UNSPECIFIED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_PARSING_UNSPECIFIED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_PARSING_UNSPECIFIED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_PARSING_UNSPECIFIED
      if (err_code != 6613000) {
        console.info("ERR_CODE_CAST_CONTROL_PARSING_UNSPECIFIED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_MALFORMED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_MALFORMED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_MALFORMED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_MALFORMED
      if (err_code != 6613001) {
        console.info("ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_MALFORMED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_MALFORMED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_MALFORMED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_MALFORMED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_MALFORMED
      if (err_code != 6613002) {
        console.info("ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_MALFORMED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_UNSUPPORTED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_UNSUPPORTED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_UNSUPPORTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 ,async (done: Function) => {
        let err_code: avSession.AVSessionErrorCode =
          avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_UNSUPPORTED
        if (err_code != 6613003) {
          console.info("ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_UNSUPPORTED", err_code, typeof err_code);
          expect(false).assertTrue();
        }
        done();
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_UNSUPPORTED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_UNSUPPORTED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_UNSUPPORTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
        let err_code: avSession.AVSessionErrorCode =
          avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_UNSUPPORTED
        if (err_code != 6613004) {
          console.info("ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_UNSUPPORTED", err_code, typeof err_code);
          expect(false).assertTrue();
        }
        done();
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DECODING_UNSPECIFIED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DECODING_UNSPECIFIED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DECODING_UNSPECIFIED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DECODING_UNSPECIFIED
      if (err_code != 6614000) {
        console.info("ERR_CODE_CAST_CONTROL_DECODING_UNSPECIFIED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DECODING_INIT_FAILED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DECODING_INIT_FAILED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DECODING_INIT_FAILED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DECODING_INIT_FAILED
      if (err_code != 6614001) {
        console.info("ERR_CODE_CAST_CONTROL_DECODING_INIT_FAILED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DECODING_QUERY_FAILED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DECODING_QUERY_FAILED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DECODING_QUERY_FAILED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DECODING_QUERY_FAILED
      if (err_code != 6614002) {
        console.info("ERR_CODE_CAST_CONTROL_DECODING_QUERY_FAILED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DECODING_FAILED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DECODING_FAILED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DECODING_FAILED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DECODING_FAILED
      if (err_code != 6614003) {
        console.info("ERR_CODE_CAST_CONTROL_DECODING_FAILED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_EXCEEDS_CAPABILITIES_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_EXCEEDS_CAPABILITIES_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_EXCEEDS_CAPABILITIES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
        let err_code: avSession.AVSessionErrorCode =
          avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DECODING_FORMAT_EXCEEDS_CAPABILITIES
        if (err_code != 6614004) {
          console.info("ERR_CODE_CAST_CONTROL_DECODING_FORMAT_EXCEEDS_CAPABILITIES", err_code, typeof err_code);
          expect(false).assertTrue();
        }
        done();
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_UNSUPPORTED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_UNSUPPORTED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_UNSUPPORTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DECODING_FORMAT_UNSUPPORTED
      if (err_code != 6614005) {
        console.info("ERR_CODE_CAST_CONTROL_DECODING_FORMAT_UNSUPPORTED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_UNSPECIFIED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_UNSPECIFIED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_UNSPECIFIED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_UNSPECIFIED
      if (err_code != 6615000) {
        console.info("ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_UNSPECIFIED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_INIT_FAILED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_INIT_FAILED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_INIT_FAILED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_INIT_FAILED
      if (err_code != 6615001) {
        console.info("ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_INIT_FAILED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_WRITE_FAILED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_WRITE_FAILED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_WRITE_FAILED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_WRITE_FAILED
      if (err_code != 6615002) {
        console.info("ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_WRITE_FAILED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DRM_UNSPECIFIED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DRM_UNSPECIFIED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DRM_UNSPECIFIED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DRM_UNSPECIFIED
      if (err_code != 6616000) {
        console.info("ERR_CODE_CAST_CONTROL_DRM_UNSPECIFIED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DRM_SCHEME_UNSUPPORTED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DRM_SCHEME_UNSUPPORTED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DRM_SCHEME_UNSUPPORTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DRM_SCHEME_UNSUPPORTED
      if (err_code != 6616001) {
        console.info("ERR_CODE_CAST_CONTROL_DRM_SCHEME_UNSUPPORTED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DRM_PROVISIONING_FAILED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DRM_PROVISIONING_FAILED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DRM_PROVISIONING_FAILED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DRM_PROVISIONING_FAILED
      if (err_code != 6616002) {
        console.info("ERR_CODE_CAST_CONTROL_DRM_PROVISIONING_FAILED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DRM_CONTENT_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DRM_CONTENT_ERROR_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DRM_CONTENT_ERROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DRM_CONTENT_ERROR
      if (err_code != 6616003) {
        console.info("ERR_CODE_CAST_CONTROL_DRM_CONTENT_ERROR", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DRM_LICENSE_ACQUISITION_FAILED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DRM_LICENSE_ACQUISITION_FAILED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DRM_LICENSE_ACQUISITION_FAILED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
        let err_code: avSession.AVSessionErrorCode =
          avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DRM_LICENSE_ACQUISITION_FAILED
        if (err_code != 6616004) {
          console.info("ERR_CODE_CAST_CONTROL_DRM_LICENSE_ACQUISITION_FAILED", err_code, typeof err_code);
          expect(false).assertTrue();
        }
        done();
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DRM_DISALLOWED_OPERATION_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DRM_DISALLOWED_OPERATION_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DRM_DISALLOWED_OPERATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DRM_DISALLOWED_OPERATION
      if (err_code != 6616005) {
        console.info("ERR_CODE_CAST_CONTROL_DRM_DISALLOWED_OPERATION", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DRM_SYSTEM_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DRM_SYSTEM_ERROR_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DRM_SYSTEM_ERROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DRM_SYSTEM_ERROR
      if (err_code != 6616006) {
        console.info("ERR_CODE_CAST_CONTROL_DRM_SYSTEM_ERROR", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DRM_DEVICE_REVOKED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DRM_DEVICE_REVOKED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DRM_DEVICE_REVOKED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DRM_DEVICE_REVOKED
      if (err_code != 6616007) {
        console.info("ERR_CODE_CAST_CONTROL_DRM_DEVICE_REVOKED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })
   
   
    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DRM_LICENSE_EXPIRED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DRM_LICENSE_EXPIRED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DRM_LICENSE_EXPIRED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DRM_LICENSE_EXPIRED
      if (err_code != 6616008) {
        console.info("ERR_CODE_CAST_CONTROL_DRM_LICENSE_EXPIRED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DRM_PROVIDE_KEY_RESPONSE_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DRM_PROVIDE_KEY_RESPONSE_ERROR_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ENUM_ERR_CODE_CAST_CONTROL_DRM_PROVIDE_KEY_RESPONSE_ERROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
        let err_code: avSession.AVSessionErrorCode =
          avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DRM_PROVIDE_KEY_RESPONSE_ERROR
        if (err_code != 6616100) {
          console.info("ERR_CODE_CAST_CONTROL_DRM_PROVIDE_KEY_RESPONSE_ERROR", err_code, typeof err_code);
          expect(false).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ERR_CODE_DESKTOP_LYRIC_NOT_ENABLED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ERR_CODE_DESKTOP_LYRIC_NOT_ENABLED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_DESKTOP_LYRIC_NOT_ENABLED_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
        let err_code: avSession.AVSessionErrorCode =
          avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_ENABLED;
        if (err_code != 6600110) {
          console.info("ERR_CODE_DESKTOP_LYRIC_NOT_ENABLED", err_code, typeof err_code);
          expect(false).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ERR_CODE_DESKTOP_LYRIC_NOT_SUPPORTED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ERR_CODE_DESKTOP_LYRIC_NOT_SUPPORTED_0100
     * @tc.desc   Testing get error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_DESKTOP_LYRIC_NOT_SUPPORTED_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
        let err_code: avSession.AVSessionErrorCode =
          avSession.AVSessionErrorCode.ERR_CODE_DESKTOP_LYRIC_NOT_SUPPORTED;
        if (err_code != 6600111) {
          console.info("ERR_CODE_DESKTOP_LYRIC_NOT_SUPPORTED", err_code, typeof err_code);
          expect(false).assertTrue();
        }
        done();
      })

      /**
     * @tc.number      SUB_MULTIMEDIA_AVSESSION_CALLTYPE_ENUM_0100
     * @tc.name        SUB_MULTIMEDIA_AVSESSION_CALLTYPE_ENUM_0100
     * @tc.desc        compare all value in CallerType to number value
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_CALLTYPE_ENUM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
      console.info(`TestLog: TYPE_CAST is ${avSession.CallerType.TYPE_CAST}`);
      expect(avSession.CallerType.TYPE_CAST).assertEqual('cast' as avSession.CallerType);
      console.info(`TestLog: TYPE_APP is ${avSession.CallerType.TYPE_APP}`);
      expect(avSession.CallerType.TYPE_APP).assertEqual('app' as avSession.CallerType);
      console.info(`TestLog: TYPE_BLUETOOTH is ${avSession.CallerType.TYPE_BLUETOOTH}`);
      expect(avSession.CallerType.TYPE_BLUETOOTH).assertEqual('bluetooth' as avSession.CallerType);
      console.info(`TestLog: TYPE_NEARLINK is ${avSession.CallerType.TYPE_NEARLINK}`);
      expect(avSession.CallerType.TYPE_NEARLINK).assertEqual('nearlink' as avSession.CallerType);
      done();
    })

  })
}





