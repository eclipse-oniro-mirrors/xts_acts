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
  describe('AVSessionERRCodeTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
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

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_UNSPECIFIED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_SERVICE_EXCEPTION
     * @tc.desc      : Testing get error callMetadata - promise
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_UNSPECIFIED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_UNSPECIFIED
      if (err_code == 6611000) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_UNSPECIFIED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_REMOTE_ERROR_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_REMOTE_ERROR
     * @tc.desc      : Testing get error callMetadata - promise
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_REMOTE_ERROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_REMOTE_ERROR
      if (err_code == 6611001) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_REMOTE_ERROR", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_BEHIND_LIVE_WINDOW_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_BEHIND_LIVE_WINDOW
     * @tc.desc      : Testing get error callMetadata - promise
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_BEHIND_LIVE_WINDOW_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_BEHIND_LIVE_WINDOW
      if (err_code == 6611002) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_BEHIND_LIVE_WINDOW", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_TIMEOUT_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_TIMEOUT
     * @tc.desc      : Testing get error callMetadata - promise
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_TIMEOUT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_TIMEOUT
      if (err_code == 6611003) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_TIMEOUT", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_RUNTIME_CHECK_FAILED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_RUNTIME_CHECK_FAILED
     * @tc.desc      : Testing get error callMetadata - promise
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_RUNTIME_CHECK_FAILED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_RUNTIME_CHECK_FAILED
      if (err_code == 6611004) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_RUNTIME_CHECK_FAILED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_PLAYER_NOT_WORKING_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_PLAYER_NOT_WORKING
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_PLAYER_NOT_WORKING_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_PLAYER_NOT_WORKING
      if (err_code == 6611100) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_PLAYER_NOT_WORKING", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_SEEK_MODE_UNSUPPORTED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_SEEK_MODE_UNSUPPORTED
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_SEEK_MODE_UNSUPPORTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_SEEK_MODE_UNSUPPORTED
      if (err_code == 6611101) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_SEEK_MODE_UNSUPPORTED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_ILLEGAL_SEEK_TARGET_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_ILLEGAL_SEEK_TARGET
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_ILLEGAL_SEEK_TARGET_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_ILLEGAL_SEEK_TARGET
      if (err_code == 6611102) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_ILLEGAL_SEEK_TARGET", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_PLAY_MODE_UNSUPPORTED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_PLAY_MODE_UNSUPPORTED
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_PLAY_MODE_UNSUPPORTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_PLAY_MODE_UNSUPPORTED
      if (err_code == 6611103) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_PLAY_MODE_UNSUPPORTED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_PLAY_SPEED_UNSUPPORTED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_PLAY_SPEED_UNSUPPORTED
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_PLAY_SPEED_UNSUPPORTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_PLAY_SPEED_UNSUPPORTED
      if (err_code == 6611104) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_PLAY_SPEED_UNSUPPORTED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DEVICE_MISSING_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DEVICE_MISSING
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DEVICE_MISSING_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DEVICE_MISSING
      if (err_code == 6611105) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_DEVICE_MISSING", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_INVALID_PARAM_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_INVALID_PARAM
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_INVALID_PARAM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_INVALID_PARAM
      if (err_code == 6611106) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_INVALID_PARAM", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_NO_MEMORY_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_NO_MEMORY
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_NO_MEMORY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_NO_MEMORY
      if (err_code == 6611107) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_NO_MEMORY", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_OPERATION_NOT_ALLOWED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_OPERATION_NOT_ALLOWED
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_OPERATION_NOT_ALLOWED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_OPERATION_NOT_ALLOWED
      if (err_code == 6611108) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_OPERATION_NOT_ALLOWED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_UNSPECIFIED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_UNSPECIFIED
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_UNSPECIFIED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_UNSPECIFIED
      if (err_code == 6612000) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_IO_UNSPECIFIED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_FAILED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_FAILED
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_FAILED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
        let err_code: avSession.AVSessionErrorCode =
          avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_FAILED
        if (err_code == 6612001) {
          expect(true).assertTrue();
        } else {
          console.info("ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_FAILED", err_code, typeof err_code);
          expect(false).assertTrue();
        }
        done();
      })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_TIMEOUT_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_TIMEOUT
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_TIMEOUT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 ,async (done: Function) => {
        let err_code: avSession.AVSessionErrorCode =
          avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_TIMEOUT
        if (err_code == 6612002) {
          expect(true).assertTrue();
        } else {
          console.info("ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_TIMEOUT", err_code, typeof err_code);
          expect(false).assertTrue();
        }
        done();
      })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_INVALID_HTTP_CONTENT_TYPE_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_INVALID_HTTP_CONTENT_TYPE
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_INVALID_HTTP_CONTENT_TYPE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
        let err_code: avSession.AVSessionErrorCode =
          avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_INVALID_HTTP_CONTENT_TYPE
        if (err_code == 6612003) {
          expect(true).assertTrue();
        } else {
          console.info("ERR_CODE_CAST_CONTROL_IO_INVALID_HTTP_CONTENT_TYPE", err_code, typeof err_code);
          expect(false).assertTrue();
        }
        done();
      })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_BAD_HTTP_STATUS_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_BAD_HTTP_STATUS
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_BAD_HTTP_STATUS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_BAD_HTTP_STATUS
      if (err_code == 6612004) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_IO_BAD_HTTP_STATUS", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_FILE_NOT_FOUND_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_FILE_NOT_FOUND
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_FILE_NOT_FOUND_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_FILE_NOT_FOUND
      if (err_code == 6612005) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_IO_FILE_NOT_FOUND", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_NO_PERMISSION_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_NO_PERMISSION
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_NO_PERMISSION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_NO_PERMISSION
      if (err_code == 6612006) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_IO_NO_PERMISSION", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_CLEARTEXT_NOT_PERMITTED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_CLEARTEXT_NOT_PERMITTED
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_CLEARTEXT_NOT_PERMITTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_CLEARTEXT_NOT_PERMITTED
      if (err_code == 6612007) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_IO_CLEARTEXT_NOT_PERMITTED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_READ_POSITION_OUT_OF_RANGE_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_READ_POSITION_OUT_OF_RANGE
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_READ_POSITION_OUT_OF_RANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 ,async (done: Function) => {
        let err_code: avSession.AVSessionErrorCode =
          avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_READ_POSITION_OUT_OF_RANGE
        if (err_code == 6612008) {
          expect(true).assertTrue();
        } else {
          console.info("ERR_CODE_CAST_CONTROL_IO_READ_POSITION_OUT_OF_RANGE", err_code, typeof err_code);
          expect(false).assertTrue();
        }
        done();
      })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_NO_CONTENTS_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_NO_CONTENTS
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_NO_CONTENTS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_NO_CONTENTS
      if (err_code == 6612100) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_IO_NO_CONTENTS", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_READ_ERROR_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_READ_ERROR
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_READ_ERROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_READ_ERROR
      if (err_code == 6612101) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_IO_READ_ERROR", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_CONTENT_BUSY_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_CONTENT_BUSY
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_CONTENT_BUSY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_CONTENT_BUSY
      if (err_code == 6612102) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_IO_CONTENT_BUSY", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_CONTENT_EXPIRED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_CONTENT_EXPIRED
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_CONTENT_EXPIRED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_CONTENT_EXPIRED
      if (err_code == 6612103) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_IO_CONTENT_EXPIRED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_USE_FORBIDDEN_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_USE_FORBIDDEN
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_USE_FORBIDDEN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_USE_FORBIDDEN
      if (err_code == 6612104) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_IO_USE_FORBIDDEN", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_NOT_VERIFIED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_NOT_VERIFIED
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_NOT_VERIFIED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_NOT_VERIFIED
      if (err_code == 6612105) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_IO_NOT_VERIFIED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_EXHAUSTED_ALLOWED_USES_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_EXHAUSTED_ALLOWED_USES
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_EXHAUSTED_ALLOWED_USES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_EXHAUSTED_ALLOWED_USES
      if (err_code == 6612106) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_IO_EXHAUSTED_ALLOWED_USES", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_NETWORK_PACKET_SENDING_FAILED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_NETWORK_PACKET_SENDING_FAILED
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_IO_NETWORK_PACKET_SENDING_FAILED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 ,async (done: Function) => {
        let err_code: avSession.AVSessionErrorCode =
          avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_IO_NETWORK_PACKET_SENDING_FAILED
        if (err_code == 6612107) {
          expect(true).assertTrue();
        } else {
          console.info("ERR_CODE_CAST_CONTROL_IO_NETWORK_PACKET_SENDING_FAILED", err_code, typeof err_code);
          expect(false).assertTrue();
        }
        done();
      })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_PARSING_UNSPECIFIED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_PARSING_UNSPECIFIED
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_PARSING_UNSPECIFIED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_PARSING_UNSPECIFIED
      if (err_code == 6613000) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_PARSING_UNSPECIFIED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_MALFORMED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_MALFORMED
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_MALFORMED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_MALFORMED
      if (err_code == 6613001) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_MALFORMED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_MALFORMED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_MALFORMED
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_MALFORMED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_MALFORMED
      if (err_code == 6613002) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_MALFORMED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_UNSUPPORTED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_UNSUPPORTED
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_UNSUPPORTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 ,async (done: Function) => {
        let err_code: avSession.AVSessionErrorCode =
          avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_UNSUPPORTED
        if (err_code == 6613003) {
          expect(true).assertTrue();
        } else {
          console.info("ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_UNSUPPORTED", err_code, typeof err_code);
          expect(false).assertTrue();
        }
        done();
      })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_UNSUPPORTED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_UNSUPPORTED
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_UNSUPPORTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
        let err_code: avSession.AVSessionErrorCode =
          avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_UNSUPPORTED
        if (err_code == 6613004) {
          expect(true).assertTrue();
        } else {
          console.info("ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_UNSUPPORTED", err_code, typeof err_code);
          expect(false).assertTrue();
        }
        done();
      })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DECODING_UNSPECIFIED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DECODING_UNSPECIFIED
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DECODING_UNSPECIFIED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DECODING_UNSPECIFIED
      if (err_code == 6614000) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_DECODING_UNSPECIFIED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DECODING_INIT_FAILED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DECODING_INIT_FAILED
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DECODING_INIT_FAILED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DECODING_INIT_FAILED
      if (err_code == 6614001) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_DECODING_INIT_FAILED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DECODING_QUERY_FAILED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DECODING_QUERY_FAILED
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DECODING_QUERY_FAILED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DECODING_QUERY_FAILED
      if (err_code == 6614002) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_DECODING_QUERY_FAILED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DECODING_FAILED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DECODING_FAILED
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DECODING_FAILED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DECODING_FAILED
      if (err_code == 6614003) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_DECODING_FAILED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_EXCEEDS_CAPABILITIES_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DECODING_FORMAT_EXCEEDS_CAPABILITIES
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_EXCEEDS_CAPABILITIES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
        let err_code: avSession.AVSessionErrorCode =
          avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DECODING_FORMAT_EXCEEDS_CAPABILITIES
        if (err_code == 6614004) {
          expect(true).assertTrue();
        } else {
          console.info("ERR_CODE_CAST_CONTROL_DECODING_FORMAT_EXCEEDS_CAPABILITIES", err_code, typeof err_code);
          expect(false).assertTrue();
        }
        done();
      })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_UNSUPPORTED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DECODING_FORMAT_UNSUPPORTED
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_UNSUPPORTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DECODING_FORMAT_UNSUPPORTED
      if (err_code == 6614005) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_DECODING_FORMAT_UNSUPPORTED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_UNSPECIFIED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_UNSPECIFIED
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_UNSPECIFIED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_UNSPECIFIED
      if (err_code == 6615000) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_UNSPECIFIED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_INIT_FAILED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_INIT_FAILED
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_INIT_FAILED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_INIT_FAILED
      if (err_code == 6615001) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_INIT_FAILED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_WRITE_FAILED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_WRITE_FAILED
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_WRITE_FAILED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_WRITE_FAILED
      if (err_code == 6615002) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_WRITE_FAILED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DRM_UNSPECIFIED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DRM_UNSPECIFIED
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DRM_UNSPECIFIED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DRM_UNSPECIFIED
      if (err_code == 6616000) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_DRM_UNSPECIFIED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DRM_SCHEME_UNSUPPORTED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DRM_SCHEME_UNSUPPORTED
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DRM_SCHEME_UNSUPPORTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DRM_SCHEME_UNSUPPORTED
      if (err_code == 6616001) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_DRM_SCHEME_UNSUPPORTED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DRM_PROVISIONING_FAILED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DRM_PROVISIONING_FAILED
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DRM_PROVISIONING_FAILED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DRM_PROVISIONING_FAILED
      if (err_code == 6616002) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_DRM_PROVISIONING_FAILED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DRM_CONTENT_ERROR_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DRM_CONTENT_ERROR
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DRM_CONTENT_ERROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DRM_CONTENT_ERROR
      if (err_code == 6616003) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_DRM_CONTENT_ERROR", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DRM_LICENSE_ACQUISITION_FAILED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DRM_LICENSE_ACQUISITION_FAILED
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DRM_LICENSE_ACQUISITION_FAILED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
        let err_code: avSession.AVSessionErrorCode =
          avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DRM_LICENSE_ACQUISITION_FAILED
        if (err_code == 6616004) {
          expect(true).assertTrue();
        } else {
          console.info("ERR_CODE_CAST_CONTROL_DRM_LICENSE_ACQUISITION_FAILED", err_code, typeof err_code);
          expect(false).assertTrue();
        }
        done();
      })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DRM_DISALLOWED_OPERATION_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DRM_DISALLOWED_OPERATION
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DRM_DISALLOWED_OPERATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DRM_DISALLOWED_OPERATION
      if (err_code == 6616005) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_DRM_DISALLOWED_OPERATION", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DRM_SYSTEM_ERROR_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DRM_SYSTEM_ERROR
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DRM_SYSTEM_ERROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DRM_SYSTEM_ERROR
      if (err_code == 6616006) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_DRM_SYSTEM_ERROR", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DRM_DEVICE_REVOKED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DRM_DEVICE_REVOKED
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DRM_DEVICE_REVOKED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode = avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DRM_DEVICE_REVOKED
      if (err_code == 6616007) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_DRM_DEVICE_REVOKED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DRM_LICENSE_EXPIRED_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DRM_LICENSE_EXPIRED
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DRM_LICENSE_EXPIRED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let err_code: avSession.AVSessionErrorCode =
        avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DRM_LICENSE_EXPIRED
      if (err_code == 6616008) {
        expect(true).assertTrue();
      } else {
        console.info("ERR_CODE_CAST_CONTROL_DRM_LICENSE_EXPIRED", err_code, typeof err_code);
        expect(false).assertTrue();
      }
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DRM_PROVIDE_KEY_RESPONSE_ERROR_0100
     * @tc.name      : AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DRM_PROVIDE_KEY_RESPONSE_ERROR
     * @tc.desc      : Testing get error code
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ERR_CODE_CAST_CONTROL_DRM_PROVIDE_KEY_RESPONSE_ERROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
        let err_code: avSession.AVSessionErrorCode =
          avSession.AVSessionErrorCode.ERR_CODE_CAST_CONTROL_DRM_PROVIDE_KEY_RESPONSE_ERROR
        if (err_code == 6616100) {
          expect(true).assertTrue();
        } else {
          console.info("ERR_CODE_CAST_CONTROL_DRM_PROVIDE_KEY_RESPONSE_ERROR", err_code, typeof err_code);
          expect(false).assertTrue();
        }
        done();
      })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_DECODERTYPE_ENUM_0100
     * @tc.name      : SUB_MULTIMEDIA_AVSESSION_DECODERTYPE_ENUM_0100
     * @tc.desc      : Testing DecoderType: video/avc enum
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_DECODERTYPE_ENUM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
        let decoderType = avSession.DecoderType.OH_AVCODEC_MIMETYPE_VIDEO_AVC;
        if (decoderType == "video/avc") {
          expect(true).assertTrue();
        } else {
          console.info(`DecoderType_video/avc enum :${decoderType}`);
          expect(false).assertTrue();
        }
        done();
      })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_DECODERTYPE_ENUM_0200
     * @tc.name      : SUB_MULTIMEDIA_AVSESSION_DECODERTYPE_ENUM_0200
     * @tc.desc      : Testing DecoderType: video/hevc enum
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_DECODERTYPE_ENUM_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
        let decoderType = avSession.DecoderType.OH_AVCODEC_MIMETYPE_VIDEO_HEVC;
        if (decoderType == "video/hevc") {
          expect(true).assertTrue();
        } else {
          console.info(`DecoderType_video/hevc enum :${decoderType}`);
          expect(false).assertTrue();
        }
        done();
      })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_DECODERTYPE_ENUM_0300
     * @tc.name      : SUB_MULTIMEDIA_AVSESSION_DECODERTYPE_ENUM_0300
     * @tc.desc      : Testing DecoderType: audio/av3a enum
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_DECODERTYPE_ENUM_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
        let decoderType = avSession.DecoderType.OH_AVCODEC_MIMETYPE_AUDIO_VIVID;
        if (decoderType == "audio/av3a") {
          expect(true).assertTrue();
        } else {
          console.info(`DecoderType_audio/av3a enum :${decoderType}`);
          expect(false).assertTrue();
        }
        done();
      })


  })
}





