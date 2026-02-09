/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import webCode from 'libweberrorcodetest.so'


export default function ActsWebErrorCodeListTest() {
  describe('ActsWebErrorCodeListTest', () => {
    /**
     * @tc.name   testArkWebErrIOPending
     * @tc.number SUB_WEB_NET_ERROR_0100
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_IO_PENDING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrIOPending', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrIOPending start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_IO_PENDING");
        console.info("====>testArkWebErrIOPending result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrIOPending catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrFailed
     * @tc.number SUB_WEB_NET_ERROR_0200
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrFailed start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_FAILED");
        console.info("====>testArkWebErrFailed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrFailed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrAboorted
     * @tc.number SUB_WEB_NET_ERROR_0300
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_ABORTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrAboorted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrAboorted start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_ABORTED");
        console.info("====>testArkWebErrAboorted result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrAboorted catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrInvaliedHandle
     * @tc.number SUB_WEB_NET_ERROR_0400
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_INVALID_HANDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrInvaliedHandle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrInvaliedHandle start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_INVALID_HANDLE");
        console.info("====>testArkWebErrInvaliedHandle result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrInvaliedHandle catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrTimedOut
     * @tc.number SUB_WEB_NET_ERROR_0500
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_TIMED_OUT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrTimedOut', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrTimedOut start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_TIMED_OUT");
        console.info("====>testArkWebErrTimedOut result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrTimedOut catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrFileTooLarge
     * @tc.number SUB_WEB_NET_ERROR_0600
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_FILE_TOO_LARGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrFileTooLarge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrFileTooLarge start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_FILE_TOO_LARGE");
        console.info("====>testArkWebErrFileTooLarge result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrFileTooLarge catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrUnexpected
     * @tc.number SUB_WEB_NET_ERROR_0700
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_UNEXPECTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrUnexpected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrUnexpected start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_UNEXPECTED");
        console.info("====>testArkWebErrUnexpected result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrUnexpected catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrAccessDenied
     * @tc.number SUB_WEB_NET_ERROR_0800
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_ACCESS_DENIED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrAccessDenied', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrAccessDenied start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_ACCESS_DENIED");
        console.info("====>testArkWebErrAccessDenied result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrAccessDenied catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrNotImplemented
     * @tc.number SUB_WEB_NET_ERROR_0900
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_NOT_IMPLEMENTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrNotImplemented', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrNotImplemented start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_NOT_IMPLEMENTED");
        console.info("====>testArkWebErrNotImplemented result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrNotImplemented catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrInsufficientResources
     * @tc.number SUB_WEB_NET_ERROR_1000
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_INSUFFICIENT_RESOURCES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrInsufficientResources', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrInsufficientResources start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_INSUFFICIENT_RESOURCES");
        console.info("====>testArkWebErrInsufficientResources result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrInsufficientResources catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrOutofMemory
     * @tc.number SUB_WEB_NET_ERROR_1100
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_OUT_OF_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrOutofMemory', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrOutofMemory start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_OUT_OF_MEMORY");
        console.info("====>testArkWebErrOutofMemory result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrOutofMemory catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrUploadFileChanged
     * @tc.number SUB_WEB_NET_ERROR_1200
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_UPLOAD_FILE_CHANGED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrUploadFileChanged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrUploadFileChanged start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_UPLOAD_FILE_CHANGED");
        console.info("====>testArkWebErrUploadFileChanged result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrUploadFileChanged catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrSocketNotConnected
     * @tc.number SUB_WEB_NET_ERROR_1300
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SOCKET_NOT_CONNECTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrSocketNotConnected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkWebErrSocketNotConnected start====");
          let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SOCKET_NOT_CONNECTED");
          console.info("====>testArkWebErrSocketNotConnected result====", result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>testArkWebErrSocketNotConnected catch err: " + err);
        }
      })

    /**
     * @tc.name   testArkWebErrFileExists
     * @tc.number SUB_WEB_NET_ERROR_1400
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_FILE_EXISTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrFileExists', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrFileExists start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_FILE_EXISTS");
        console.info("====>testArkWebErrFileExists result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrFileExists catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrFilePathTooLong
     * @tc.number SUB_WEB_NET_ERROR_1500
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_FILE_PATH_TOO_LONG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrFilePathTooLong', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrFilePathTooLong start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_FILE_PATH_TOO_LONG");
        console.info("====>testArkWebErrFilePathTooLong result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrFilePathTooLong catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrFileNoSpace
     * @tc.number SUB_WEB_NET_ERROR_1600
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_FILE_NO_SPACE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrFileNoSpace', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrFileNoSpace start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_FILE_NO_SPACE");
        console.info("====>testArkWebErrFileNoSpace result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrFileNoSpace catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrFileVirusInfected
     * @tc.number SUB_WEB_NET_ERROR_1700
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_FILE_VIRUS_INFECTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrFileVirusInfected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrFileVirusInfected start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_FILE_VIRUS_INFECTED");
        console.info("====>testArkWebErrFileVirusInfected result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrFileVirusInfected catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrBlockedByClient
     * @tc.number SUB_WEB_NET_ERROR_1800
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_BLOCKED_BY_CLIENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrBlockedByClient', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrBlockedByClient start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_BLOCKED_BY_CLIENT");
        console.info("====>testArkWebErrBlockedByClient result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrBlockedByClient catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrNetWorkChanged
     * @tc.number SUB_WEB_NET_ERROR_1900
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_NETWORK_CHANGED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrNetWorkChanged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrNetWorkChanged start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_NETWORK_CHANGED");
        console.info("====>testArkWebErrNetWorkChanged result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrNetWorkChanged catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrBlockedByAdministarator
     * @tc.number SUB_WEB_NET_ERROR_2000
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_BLOCKED_BY_ADMINISTRATOR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrBlockedByAdministarator', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkWebErrBlockedByAdministarator start====");
          let result: number = webCode.webArkWebNetError("ARKWEB_ERR_BLOCKED_BY_ADMINISTRATOR");
          console.info("====>testArkWebErrBlockedByAdministarator result====", result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>testArkWebErrBlockedByAdministarator catch err: " + err);
        }
      })

    /**
     * @tc.name   testArkWebErrSocketConnected
     * @tc.number SUB_WEB_NET_ERROR_2100
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SOCKET_CONNECTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrSocketConnected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrBlockedByAdministarator start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SOCKET_CONNECTED");
        console.info("====>testArkWebErrBlockedByAdministarator result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrBlockedByAdministarator catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrUploadStreamRewindNotSupported
     * @tc.number SUB_WEB_NET_ERROR_2200
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_UPLOAD_STREAM_REWIND_NOT_SUPPORTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrUploadStreamRewindNotSupported', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testArkWebErrUploadStreamRewindNotSupported start====");
          let result: number = webCode.webArkWebNetError("ARKWEB_ERR_UPLOAD_STREAM_REWIND_NOT_SUPPORTED");
          console.info("====>testArkWebErrUploadStreamRewindNotSupported result====", result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>testArkWebErrUploadStreamRewindNotSupported catch err: " + err);
        }
      })

    /**
     * @tc.name   testArkWebErrContextShutDown
     * @tc.number SUB_WEB_NET_ERROR_2300
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CONTEXT_SHUT_DOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrContextShutDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testArkWebErrContextShutDown start====");
          let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CONTEXT_SHUT_DOWN");
          console.info("====>testArkWebErrContextShutDown result====", result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>testArkWebErrContextShutDown catch err: " + err);
        }
      })

    /**
     * @tc.name   testArkWebErrBlockByResponse
     * @tc.number SUB_WEB_NET_ERROR_2400
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_BLOCKED_BY_RESPONSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrBlockByResponse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrBlockByResponse start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_BLOCKED_BY_RESPONSE");
        console.info("====>testArkWebErrBlockByResponse result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrBlockByResponse catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrCleartextNotPermitted
     * @tc.number SUB_WEB_NET_ERROR_2500
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CLEARTEXT_NOT_PERMITTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrCleartextNotPermitted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrCleartextNotPermitted start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CLEARTEXT_NOT_PERMITTED");
        console.info("====>testArkWebErrCleartextNotPermitted result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrCleartextNotPermitted catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrBlockedByCSP
     * @tc.number SUB_WEB_NET_ERROR_2600
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_BLOCKED_BY_CSP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrBlockedByCSP', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrBlockedByCSP start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_BLOCKED_BY_CSP");
        console.info("====>testArkWebErrBlockedByCSP result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrBlockedByCSP catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrH2orQUICRequired
     * @tc.number SUB_WEB_NET_ERROR_2700
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_H2_OR_QUIC_REQUIRED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrH2orQUICRequired', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrH2orQUICRequired start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_H2_OR_QUIC_REQUIRED");
        console.info("====>testArkWebErrH2orQUICRequired result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrH2orQUICRequired catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrBlockedByORB
     * @tc.number SUB_WEB_NET_ERROR_2800
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_BLOCKED_BY_ORB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrBlockedByORB', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrBlockedByORB start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_BLOCKED_BY_ORB");
        console.info("====>testArkWebErrBlockedByORB result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrBlockedByORB catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrConnectionClosed
     * @tc.number SUB_WEB_NET_ERROR_2900
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CONNECTION_CLOSED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrConnectionClosed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrConnectionClosed start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CONNECTION_CLOSED");
        console.info("====>testArkWebErrConnectionClosed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrConnectionClosed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrConnectionReset
     * @tc.number SUB_WEB_NET_ERROR_3000
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CONNECTION_RESET
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrConnectionReset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrConnectionReset start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CONNECTION_RESET");
        console.info("====>testArkWebErrConnectionReset result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrConnectionReset catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrConnectionRefused
     * @tc.number SUB_WEB_NET_ERROR_3100
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CONNECTION_REFUSED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrConnectionRefused', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrConnectionRefused start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CONNECTION_REFUSED");
        console.info("====>testArkWebErrConnectionRefused result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrConnectionRefused catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrConnectionAborted
     * @tc.number SUB_WEB_NET_ERROR_3200
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CONNECTION_ABORTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrConnectionAborted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrConnectionAborted start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CONNECTION_ABORTED");
        console.info("====>testArkWebErrConnectionAborted result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrConnectionAborted catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrConnectionFailed
     * @tc.number SUB_WEB_NET_ERROR_3300
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CONNECTION_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrConnectionFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrConnectionFailed start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CONNECTION_FAILED");
        console.info("====>testArkWebErrConnectionFailed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrConnectionFailed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrNameNotResolved
     * @tc.number SUB_WEB_NET_ERROR_3400
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_NAME_NOT_RESOLVED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrNameNotResolved', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrNameNotResolved start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_NAME_NOT_RESOLVED");
        console.info("====>testArkWebErrNameNotResolved result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrNameNotResolved catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrInternetDisconnected
     * @tc.number SUB_WEB_NET_ERROR_3500
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_INTERNET_DISCONNECTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrInternetDisconnected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrInternetDisconnected start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_INTERNET_DISCONNECTED");
        console.info("====>testArkWebErrInternetDisconnected result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrInternetDisconnected catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrSSLProtocolError
     * @tc.number SUB_WEB_NET_ERROR_3600
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SSL_PROTOCOL_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrSSLProtocolError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrSSLProtocolError start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SSL_PROTOCOL_ERROR");
        console.info("====>testArkWebErrSSLProtocolError result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrSSLProtocolError catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrAddressInvalid
     * @tc.number SUB_WEB_NET_ERROR_3700
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_ADDRESS_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrAddressInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrAddressInvalid start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_ADDRESS_INVALID");
        console.info("====>testArkWebErrAddressInvalid result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrAddressInvalid catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrAddressUnreachable
     * @tc.number SUB_WEB_NET_ERROR_3800
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_ADDRESS_UNREACHABLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrAddressUnreachable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrAddressUnreachable start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_ADDRESS_UNREACHABLE");
        console.info("====>testArkWebErrAddressUnreachable result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrAddressUnreachable catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrSSLClientAuthCertNeeded
     * @tc.number SUB_WEB_NET_ERROR_3900
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SSL_CLIENT_AUTH_CERT_NEEDED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrSSLClientAuthCertNeeded', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrAddretestArkWebErrSSLClientAuthCertNeededssUnreachable start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SSL_CLIENT_AUTH_CERT_NEEDED");
        console.info("====>testArkWebErrSSLClientAuthCertNeeded result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrSSLClientAuthCertNeeded catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrTunnelConnectionFailed
     * @tc.number SUB_WEB_NET_ERROR_4000
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_TUNNEL_CONNECTION_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrTunnelConnectionFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrTunnelConnectionFailed start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_TUNNEL_CONNECTION_FAILED");
        console.info("====>testArkWebErrTunnelConnectionFailed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrTunnelConnectionFailed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrNoSSLVersionsEnabled
     * @tc.number SUB_WEB_NET_ERROR_4100
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_NO_SSL_VERSIONS_ENABLED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrNoSSLVersionsEnabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testArkWebErrNoSSLVersionsEnabled start====");
          let result: number = webCode.webArkWebNetError("ARKWEB_ERR_NO_SSL_VERSIONS_ENABLED");
          console.info("====>testArkWebErrNoSSLVersionsEnabled result====", result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>testArkWebErrNoSSLVersionsEnabled catch err: " + err);
        }
      })

    /**
     * @tc.name   testArkWebErrSSLVersionOrCIPHERMismatch
     * @tc.number SUB_WEB_NET_ERROR_4200
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SSL_VERSION_OR_CIPHER_MISMATCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrSSLVersionOrCIPHERMismatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrSSLVersionOrCIPHERMismatch start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SSL_VERSION_OR_CIPHER_MISMATCH");
        console.info("====>testArkWebErrSSLVersionOrCIPHERMismatch result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrSSLVersionOrCIPHERMismatch catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrSSLRenegotiationRequested
     * @tc.number SUB_WEB_NET_ERROR_4300
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SSL_RENEGOTIATION_REQUESTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrSSLRenegotiationRequested', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrSSLRenegotiationRequested start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SSL_RENEGOTIATION_REQUESTED");
        console.info("====>testArkWebErrSSLRenegotiationRequested result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrSSLRenegotiationRequested catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrProxyAuthUnsupported
     * @tc.number SUB_WEB_NET_ERROR_4400
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_PROXY_AUTH_UNSUPPORTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrProxyAuthUnsupported', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrProxyAuthUnsupported start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_PROXY_AUTH_UNSUPPORTED");
        console.info("====>testArkWebErrProxyAuthUnsupported result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrProxyAuthUnsupported catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrBadSSLClientAuthCert
     * @tc.number SUB_WEB_NET_ERROR_4500
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_BAD_SSL_CLIENT_AUTH_CERT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrBadSSLClientAuthCert', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrBadSSLClientAuthCert start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_BAD_SSL_CLIENT_AUTH_CERT");
        console.info("====>testArkWebErrBadSSLClientAuthCert result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrBadSSLClientAuthCert catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrConnectionTimedOut
     * @tc.number SUB_WEB_NET_ERROR_4600
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CONNECTION_TIMED_OUT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrConnectionTimedOut', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrConnectionTimedOut start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CONNECTION_TIMED_OUT");
        console.info("====>testArkWebErrConnectionTimedOut result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrConnectionTimedOut catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrHostResolverQueueTooLarge
     * @tc.number SUB_WEB_NET_ERROR_4700
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_HOST_RESOLVER_QUEUE_TOO_LARGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrHostResolverQueueTooLarge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrHostResolverQueueTooLarge start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_HOST_RESOLVER_QUEUE_TOO_LARGE");
        console.info("====>testArkWebErrHostResolverQueueTooLarge result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrHostResolverQueueTooLarge catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrSocksConnectionFailed
     * @tc.number SUB_WEB_NET_ERROR_4800
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SOCKS_CONNECTION_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrSocksConnectionFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrSocksConnectionFailed start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SOCKS_CONNECTION_FAILED");
        console.info("====>testArkWebErrSocksConnectionFailed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrSocksConnectionFailed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrSocksConnectionHostUnreachable
     * @tc.number SUB_WEB_NET_ERROR_4900
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SOCKS_CONNECTION_HOST_UNREACHABLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrSocksConnectionHostUnreachable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrSocksConnectionHostUnreachable start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SOCKS_CONNECTION_HOST_UNREACHABLE");
        console.info("====>testArkWebErrSocksConnectionHostUnreachable result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrSocksConnectionHostUnreachable catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrAlpnNegotiationFailed
     * @tc.number SUB_WEB_NET_ERROR_5000
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_ALPN_NEGOTIATION_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrAlpnNegotiationFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrAlpnNegotiationFailed start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_ALPN_NEGOTIATION_FAILED");
        console.info("====>testArkWebErrAlpnNegotiationFailed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrAlpnNegotiationFailed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrSSLNoRenegotiation
     * @tc.number SUB_WEB_NET_ERROR_5100
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SSL_NO_RENEGOTIATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrSSLNoRenegotiation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrSSLNoRenegotiation start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SSL_NO_RENEGOTIATION");
        console.info("====>testArkWebErrSSLNoRenegotiation result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrSSLNoRenegotiation catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrWinsockUnexpectedWrittenBytes
     * @tc.number SUB_WEB_NET_ERROR_5200
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_WINSOCK_UNEXPECTED_WRITTEN_BYTES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrWinsockUnexpectedWrittenBytes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrWinsockUnexpectedWrittenBytes start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_WINSOCK_UNEXPECTED_WRITTEN_BYTES");
        console.info("====>testArkWebErrWinsockUnexpectedWrittenBytes result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrWinsockUnexpectedWrittenBytes catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrSSLDecompressionFailureAlert
     * @tc.number SUB_WEB_NET_ERROR_5300
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SSL_DECOMPRESSION_FAILURE_ALERT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrSSLDecompressionFailureAlert', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrSSLDecompressionFailureAlert start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SSL_DECOMPRESSION_FAILURE_ALERT");
        console.info("====>testArkWebErrSSLDecompressionFailureAlert result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrSSLDecompressionFailureAlert catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrSSLBadRecordMacAlert
     * @tc.number SUB_WEB_NET_ERROR_5400
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SSL_BAD_RECORD_MAC_ALERT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrSSLBadRecordMacAlert', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrSSLBadRecordMacAlert start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SSL_BAD_RECORD_MAC_ALERT");
        console.info("====>testArkWebErrSSLBadRecordMacAlert result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrSSLBadRecordMacAlert catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrProxyAuthRequested
     * @tc.number SUB_WEB_NET_ERROR_5500
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_PROXY_AUTH_REQUESTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrProxyAuthRequested', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrProxyAuthRequested start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_PROXY_AUTH_REQUESTED");
        console.info("====>testArkWebErrProxyAuthRequested result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrProxyAuthRequested catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrProxyConnectionFailed
     * @tc.number SUB_WEB_NET_ERROR_5600
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_PROXY_CONNECTION_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrProxyConnectionFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrProxyConnectionFailed start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_PROXY_CONNECTION_FAILED");
        console.info("====>testArkWebErrProxyConnectionFailed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrProxyConnectionFailed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrProxyConfigurationFailed
     * @tc.number SUB_WEB_NET_ERROR_5700
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_MANDATORY_PROXY_CONFIGURATION_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrProxyConfigurationFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrProxyConfigurationFailed start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_MANDATORY_PROXY_CONFIGURATION_FAILED");
        console.info("====>testArkWebErrProxyConfigurationFailed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrProxyConfigurationFailed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrPreconnectMaxSocketLimit
     * @tc.number SUB_WEB_NET_ERROR_5800
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_PRECONNECT_MAX_SOCKET_LIMIT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrPreconnectMaxSocketLimit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrPreconnectMaxSocketLimit start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_PRECONNECT_MAX_SOCKET_LIMIT");
        console.info("====>testArkWebErrProxyConfigurationFailed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrPreconnectMaxSocketLimit catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrSSLClientAuthPrivateKeyAccessDenied
     * @tc.number SUB_WEB_NET_ERROR_5900
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SSL_CLIENT_AUTH_PRIVATE_KEY_ACCESS_DENIED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrSSLClientAuthPrivateKeyAccessDenied', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrSSLClientAuthPrivateKeyAccessDenied start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SSL_CLIENT_AUTH_PRIVATE_KEY_ACCESS_DENIED");
        console.info("====>testArkWebErrSSLClientAuthPrivateKeyAccessDenied result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrSSLClientAuthPrivateKeyAccessDenied catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrSSLClientAuthCertNoPrivateKey
     * @tc.number SUB_WEB_NET_ERROR_6000
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SSL_CLIENT_AUTH_CERT_NO_PRIVATE_KEY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrSSLClientAuthCertNoPrivateKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrSSLClientAuthCertNoPrivateKey start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SSL_CLIENT_AUTH_CERT_NO_PRIVATE_KEY");
        console.info("====>testArkWebErrSSLClientAuthCertNoPrivateKey result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrSSLClientAuthCertNoPrivateKey catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrProxyCertificateInvalid
     * @tc.number SUB_WEB_NET_ERROR_6100
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_PROXY_CERTIFICATE_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrProxyCertificateInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrProxyCertificateInvalid start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_PROXY_CERTIFICATE_INVALID");
        console.info("====>testArkWebErrProxyCertificateInvalid result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrProxyCertificateInvalid catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrNameResolutionFailed
     * @tc.number SUB_WEB_NET_ERROR_6200
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_NAME_RESOLUTION_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrNameResolutionFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrNameResolutionFailed start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_NAME_RESOLUTION_FAILED");
        console.info("====>testArkWebErrNameResolutionFailed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrNameResolutionFailed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrNetworkAccessDenied
     * @tc.number SUB_WEB_NET_ERROR_6300
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_NETWORK_ACCESS_DENIED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrNetworkAccessDenied', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrNetworkAccessDenied start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_NETWORK_ACCESS_DENIED");
        console.info("====>testArkWebErrNetworkAccessDenied result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrNetworkAccessDenied catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrTemporarilyThrottled
     * @tc.number SUB_WEB_NET_ERROR_6400
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_TEMPORARILY_THROTTLED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrTemporarilyThrottled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebErrTemporarilyThrottled start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_TEMPORARILY_THROTTLED");
        console.info("====>testArkWebErrTemporarilyThrottled result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrTemporarilyThrottled catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebHttpsProxyTunnelResponseRedirect
     * @tc.number SUB_WEB_NET_ERROR_6500
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_HTTPS_PROXY_TUNNEL_RESPONSE_REDIRECT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebHttpsProxyTunnelResponseRedirect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebHttpsProxyTunnelResponseRedirect start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_HTTPS_PROXY_TUNNEL_RESPONSE_REDIRECT");
        console.info("====>testArkWebHttpsProxyTunnelResponseRedirect result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebHttpsProxyTunnelResponseRedirect catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebSSLClientAuthSignatureFailed
     * @tc.number SUB_WEB_NET_ERROR_6600
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SSL_CLIENT_AUTH_SIGNATURE_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebSSLClientAuthSignatureFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebSSLClientAuthSignatureFailed start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SSL_CLIENT_AUTH_SIGNATURE_FAILED");
        console.info("====>testArkWebSSLClientAuthSignatureFailed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebSSLClientAuthSignatureFailed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebMsgTooBig
     * @tc.number SUB_WEB_NET_ERROR_6700
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_MSG_TOO_BIG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebMsgTooBig', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebMsgTooBig start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_MSG_TOO_BIG");
        console.info("====>testArkWebMsgTooBig result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebMsgTooBig catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebWSProtocolError
     * @tc.number SUB_WEB_NET_ERROR_6800
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_WS_PROTOCOL_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebWSProtocolError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebWSProtocolError start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_WS_PROTOCOL_ERROR");
        console.info("====>testArkWebWSProtocolError result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebWSProtocolError catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebAddressInUse
     * @tc.number SUB_WEB_NET_ERROR_6900
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_ADDRESS_IN_USE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebAddressInUse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebAddressInUse start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_ADDRESS_IN_USE");
        console.info("====>testArkWebAddressInUse result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebAddressInUse catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebSSLHandshakeNotCompleted
     * @tc.number SUB_WEB_NET_ERROR_7000
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SSL_HANDSHAKE_NOT_COMPLETED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebSSLHandshakeNotCompleted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebSSLHandshakeNotCompleted start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SSL_HANDSHAKE_NOT_COMPLETED");
        console.info("====>testArkWebSSLHandshakeNotCompleted result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebSSLHandshakeNotCompleted catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebSSLBadPeerPublicKey
     * @tc.number SUB_WEB_NET_ERROR_7100
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SSL_BAD_PEER_PUBLIC_KEY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebSSLBadPeerPublicKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebSSLBadPeerPublicKey start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SSL_BAD_PEER_PUBLIC_KEY");
        console.info("====>testArkWebSSLBadPeerPublicKey result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebSSLBadPeerPublicKey catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebSSLPinnedKeyNotInCERTChain
     * @tc.number SUB_WEB_NET_ERROR_7200
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SSL_PINNED_KEY_NOT_IN_CERT_CHAIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebSSLPinnedKeyNotInCERTChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebSSLPinnedKeyNotInCERTChain start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SSL_PINNED_KEY_NOT_IN_CERT_CHAIN");
        console.info("====>testArkWebSSLPinnedKeyNotInCERTChain result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebSSLPinnedKeyNotInCERTChain catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebClientAuthCERTTypeUnsupported
     * @tc.number SUB_WEB_NET_ERROR_7300
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CLIENT_AUTH_CERT_TYPE_UNSUPPORTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebClientAuthCERTTypeUnsupported', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebClientAuthCERTTypeUnsupported start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CLIENT_AUTH_CERT_TYPE_UNSUPPORTED");
        console.info("====>testArkWebClientAuthCERTTypeUnsupported result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebClientAuthCERTTypeUnsupported catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebSSLDecryptErrorAlert
     * @tc.number SUB_WEB_NET_ERROR_7400
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SSL_DECRYPT_ERROR_ALERT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebSSLDecryptErrorAlert', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebSSLDecryptErrorAlert start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SSL_DECRYPT_ERROR_ALERT");
        console.info("====>testArkWebSSLDecryptErrorAlert result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebSSLDecryptErrorAlert catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebWSThrottleQueueTooLarge
     * @tc.number SUB_WEB_NET_ERROR_7500
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_WS_THROTTLE_QUEUE_TOO_LARGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebWSThrottleQueueTooLarge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebWSThrottleQueueTooLarge start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_WS_THROTTLE_QUEUE_TOO_LARGE");
        console.info("====>testArkWebWSThrottleQueueTooLarge result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebWSThrottleQueueTooLarge catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebSSLServerCertChanged
     * @tc.number SUB_WEB_NET_ERROR_7600
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SSL_SERVER_CERT_CHANGED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebSSLServerCertChanged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebSSLServerCertChanged start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SSL_SERVER_CERT_CHANGED");
        console.info("====>testArkWebSSLServerCertChanged result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebSSLServerCertChanged catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebSSLUnrecognizedNameAlert
     * @tc.number SUB_WEB_NET_ERROR_7700
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SSL_UNRECOGNIZED_NAME_ALERT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebSSLUnrecognizedNameAlert', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebSSLUnrecognizedNameAlert start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SSL_UNRECOGNIZED_NAME_ALERT");
        console.info("====>testArkWebSSLUnrecognizedNameAlert result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebSSLUnrecognizedNameAlert catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebSocketSetReceiveBufferSizeError
     * @tc.number SUB_WEB_NET_ERROR_7800
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SOCKET_SET_RECEIVE_BUFFER_SIZE_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebSocketSetReceiveBufferSizeError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebSocketSetReceiveBufferSizeError start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SOCKET_SET_RECEIVE_BUFFER_SIZE_ERROR");
        console.info("====>testArkWebSocketSetReceiveBufferSizeError result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebSocketSetReceiveBufferSizeError catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebSetSendBufferSizeError
     * @tc.number SUB_WEB_NET_ERROR_7900
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SOCKET_SET_SEND_BUFFER_SIZE_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebSetSendBufferSizeError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebSetSendBufferSizeError start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SOCKET_SET_SEND_BUFFER_SIZE_ERROR");
        console.info("====>testArkWebSetSendBufferSizeError result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebSetSendBufferSizeError catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebSocketReceiveBufferSizeUnchangeable
     * @tc.number SUB_WEB_NET_ERROR_8000
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SOCKET_RECEIVE_BUFFER_SIZE_UNCHANGEABLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebSocketReceiveBufferSizeUnchangeable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebSocketReceiveBufferSizeUnchangeable start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SOCKET_RECEIVE_BUFFER_SIZE_UNCHANGEABLE");
        console.info("====>testArkWebSocketReceiveBufferSizeUnchangeable result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebSocketReceiveBufferSizeUnchangeable catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebSocketSendBufferSizeUnchangeable
     * @tc.number SUB_WEB_NET_ERROR_8100
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SOCKET_SEND_BUFFER_SIZE_UNCHANGEABLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebSocketSendBufferSizeUnchangeable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebSocketSendBufferSizeUnchangeable start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SOCKET_SEND_BUFFER_SIZE_UNCHANGEABLE");
        console.info("====>testArkWebSocketSendBufferSizeUnchangeable result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebSocketSendBufferSizeUnchangeable catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebSSLClientAuthCertBadFormat
     * @tc.number SUB_WEB_NET_ERROR_8200
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SSL_CLIENT_AUTH_CERT_BAD_FORMAT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebSSLClientAuthCertBadFormat', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebSSLClientAuthCertBadFormat start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SSL_CLIENT_AUTH_CERT_BAD_FORMAT");
        console.info("====>testArkWebSSLClientAuthCertBadFormat result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebSSLClientAuthCertBadFormat catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebICANNNameCollision
     * @tc.number SUB_WEB_NET_ERROR_8300
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_ICANN_NAME_COLLISION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebICANNNameCollision', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebICANNNameCollision start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_ICANN_NAME_COLLISION");
        console.info("====>testArkWebICANNNameCollision result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebICANNNameCollision catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebSSLServerCertBadFormat
     * @tc.number SUB_WEB_NET_ERROR_8400
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SSL_SERVER_CERT_BAD_FORMAT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebSSLServerCertBadFormat', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebSSLServerCertBadFormat start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SSL_SERVER_CERT_BAD_FORMAT");
        console.info("====>testArkWebSSLServerCertBadFormat result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebSSLServerCertBadFormat catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCTSthParsingFailed
     * @tc.number SUB_WEB_NET_ERROR_8500
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CT_STH_PARSING_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCTSthParsingFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebCTSthParsingFailed start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CT_STH_PARSING_FAILED");
        console.info("====>testArkWebCTSthParsingFailed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCTSthParsingFailed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCTSthIncomplete
     * @tc.number SUB_WEB_NET_ERROR_8600
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CT_STH_INCOMPLETE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCTSthIncomplete', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebCTSthIncomplete start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CT_STH_INCOMPLETE");
        console.info("====>testArkWebCTSthIncomplete result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCTSthIncomplete catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebUnableToReuseConnectionForProxyAuth
     * @tc.number SUB_WEB_NET_ERROR_8700
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_UNABLE_TO_REUSE_CONNECTION_FOR_PROXY_AUTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebUnableToReuseConnectionForProxyAuth', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebUnableToReuseConnectionForProxyAuth start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_UNABLE_TO_REUSE_CONNECTION_FOR_PROXY_AUTH");
        console.info("====>testArkWebUnableToReuseConnectionForProxyAuth result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebUnableToReuseConnectionForProxyAuth catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCTConsistencyProofParsingFailed
     * @tc.number SUB_WEB_NET_ERROR_8800
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CT_CONSISTENCY_PROOF_PARSING_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCTConsistencyProofParsingFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebCTConsistencyProofParsingFailed start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CT_CONSISTENCY_PROOF_PARSING_FAILED");
        console.info("====>testArkWebCTConsistencyProofParsingFailed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCTConsistencyProofParsingFailed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebSSLObsoleteCipher
     * @tc.number SUB_WEB_NET_ERROR_8900
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SSL_OBSOLETE_CIPHER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebSSLObsoleteCipher', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebSSLObsoleteCipher start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SSL_OBSOLETE_CIPHER");
        console.info("====>testArkWebSSLObsoleteCipher result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebSSLObsoleteCipher catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebWSUpgrade
     * @tc.number SUB_WEB_NET_ERROR_9000
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_WS_UPGRADE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebWSUpgrade', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebWSUpgrade start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_WS_UPGRADE");
        console.info("====>testArkWebWSUpgrade result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebWSUpgrade catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebReadIfReadyNotImplemented
     * @tc.number SUB_WEB_NET_ERROR_9100
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_READ_IF_READY_NOT_IMPLEMENTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebReadIfReadyNotImplemented', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebReadIfReadyNotImplemented start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_READ_IF_READY_NOT_IMPLEMENTED");
        console.info("====>testArkWebReadIfReadyNotImplemented result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebReadIfReadyNotImplemented catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebNoBufferSpace
     * @tc.number SUB_WEB_NET_ERROR_9200
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_NO_BUFFER_SPACE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebNoBufferSpace', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebNoBufferSpace start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_NO_BUFFER_SPACE");
        console.info("====>testArkWebNoBufferSpace result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebNoBufferSpace catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebSSLClientAuthNoCommonAlgorithms
     * @tc.number SUB_WEB_NET_ERROR_9300
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SSL_CLIENT_AUTH_NO_COMMON_ALGORITHMS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebSSLClientAuthNoCommonAlgorithms', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebSSLClientAuthNoCommonAlgorithms start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SSL_CLIENT_AUTH_NO_COMMON_ALGORITHMS");
        console.info("====>testArkWebSSLClientAuthNoCommonAlgorithms result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebSSLClientAuthNoCommonAlgorithms catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebEarlyDataRejected
     * @tc.number SUB_WEB_NET_ERROR_9400
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_EARLY_DATA_REJECTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebEarlyDataRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebEarlyDataRejected start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_EARLY_DATA_REJECTED");
        console.info("====>testArkWebEarlyDataRejected result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebEarlyDataRejected catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebWrongVersionOnEarlyData
     * @tc.number SUB_WEB_NET_ERROR_9500
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_WRONG_VERSION_ON_EARLY_DATA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebWrongVersionOnEarlyData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testArkWebWrongVersionOnEarlyData start====");
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_WRONG_VERSION_ON_EARLY_DATA");
        console.info("====>testArkWebWrongVersionOnEarlyData result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebWrongVersionOnEarlyData catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebTLS13DowngradeDetected
     * @tc.number SUB_WEB_NET_ERROR_9600
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_TLS13_DOWNGRADE_DETECTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebTLS13DowngradeDetected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_TLS13_DOWNGRADE_DETECTED");
        console.info("====>testArkWebTLS13DowngradeDetected result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebTLS13DowngradeDetected catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebSSLKeyUsageIncompatible
     * @tc.number SUB_WEB_NET_ERROR_9700
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SSL_KEY_USAGE_INCOMPATIBLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebSSLKeyUsageIncompatible', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SSL_KEY_USAGE_INCOMPATIBLE");
        console.info("====>testArkWebSSLKeyUsageIncompatible result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebSSLKeyUsageIncompatible catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebInvaliedECHConfigList
     * @tc.number SUB_WEB_NET_ERROR_9800
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_INVALID_ECH_CONFIG_LIST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebInvaliedECHConfigList', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_INVALID_ECH_CONFIG_LIST");
        console.info("====>testArkWebInvaliedECHConfigList result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebInvaliedECHConfigList catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebECHNotNegotiated
     * @tc.number SUB_WEB_NET_ERROR_9900
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_ECH_NOT_NEGOTIATED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebECHNotNegotiated', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_ECH_NOT_NEGOTIATED");
        console.info("====>testArkWebECHNotNegotiated result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebECHNotNegotiated catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebECHFallbackCertificateInvalid
     * @tc.number SUB_WEB_NET_ERROR_10000
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_ECH_FALLBACK_CERTIFICATE_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebECHFallbackCertificateInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_ECH_FALLBACK_CERTIFICATE_INVALID");
        console.info("====>testArkWebECHFallbackCertificateInvalid result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebECHFallbackCertificateInvalid catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCERTCommonNameInvalid
     * @tc.number SUB_WEB_NET_ERROR_10100
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CERT_COMMON_NAME_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCERTCommonNameInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CERT_COMMON_NAME_INVALID");
        console.info("====>testArkWebCERTCommonNameInvalid result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCERTCommonNameInvalid catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCERTDateInvalid
     * @tc.number SUB_WEB_NET_ERROR_10200
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CERT_DATE_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCERTDateInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CERT_DATE_INVALID");
        console.info("====>testArkWebCERTDateInvalid result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCERTDateInvalid catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCERTAuthorityInvalid
     * @tc.number SUB_WEB_NET_ERROR_10300
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CERT_AUTHORITY_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCERTAuthorityInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CERT_AUTHORITY_INVALID");
        console.info("====>testArkWebCERTAuthorityInvalid result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCERTAuthorityInvalid catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCERTContainsErrors
     * @tc.number SUB_WEB_NET_ERROR_10400
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CERT_CONTAINS_ERRORS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCERTContainsErrors', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CERT_CONTAINS_ERRORS");
        console.info("====>testArkWebCERTContainsErrors result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCERTContainsErrors catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCERTNoRevocationMechanism
     * @tc.number SUB_WEB_NET_ERROR_10500
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CERT_NO_REVOCATION_MECHANISM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCERTNoRevocationMechanism', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CERT_NO_REVOCATION_MECHANISM");
        console.info("====>testArkWebCERTNoRevocationMechanism result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCERTNoRevocationMechanism catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCERTUnableToCheckRevocation
     * @tc.number SUB_WEB_NET_ERROR_10600
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CERT_UNABLE_TO_CHECK_REVOCATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCERTUnableToCheckRevocation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CERT_UNABLE_TO_CHECK_REVOCATION");
        console.info("====>testArkWebCERTUnableToCheckRevocation result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCERTUnableToCheckRevocation catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCERTRevoked
     * @tc.number SUB_WEB_NET_ERROR_10700
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CERT_REVOKED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCERTRevoked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CERT_REVOKED");
        console.info("====>testArkWebCERTRevoked result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCERTRevoked catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCERTInvalid
     * @tc.number SUB_WEB_NET_ERROR_10800
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CERT_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCERTInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CERT_INVALID");
        console.info("====>testArkWebCERTInvalid result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCERTInvalid catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCERTWeakSignatureAlgorithm
     * @tc.number SUB_WEB_NET_ERROR_10900
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CERT_WEAK_SIGNATURE_ALGORITHM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCERTWeakSignatureAlgorithm', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CERT_WEAK_SIGNATURE_ALGORITHM");
        console.info("====>testArkWebCERTWeakSignatureAlgorithm result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCERTWeakSignatureAlgorithm catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCERTNonUniqueName
     * @tc.number SUB_WEB_NET_ERROR_11000
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CERT_NON_UNIQUE_NAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCERTNonUniqueName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CERT_NON_UNIQUE_NAME");
        console.info("====>testArkWebCERTNonUniqueName result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCERTNonUniqueName catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCERTWeakKey
     * @tc.number SUB_WEB_NET_ERROR_11100
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CERT_WEAK_KEY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCERTWeakKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CERT_WEAK_KEY");
        console.info("====>testArkWebCERTWeakKey result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCERTWeakKey catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCERTNameConstraintViolation
     * @tc.number SUB_WEB_NET_ERROR_11200
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CERT_NAME_CONSTRAINT_VIOLATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCERTNameConstraintViolation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CERT_NAME_CONSTRAINT_VIOLATION");
        console.info("====>testArkWebCERTNameConstraintViolation result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCERTNameConstraintViolation catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCERTValidityTooLong
     * @tc.number SUB_WEB_NET_ERROR_11300
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CERT_VALIDITY_TOO_LONG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCERTValidityTooLong', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CERT_VALIDITY_TOO_LONG");
        console.info("====>testArkWebCERTValidityTooLong result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCERTValidityTooLong catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCeritificateTransparencyRequired
     * @tc.number SUB_WEB_NET_ERROR_11400
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CERTIFICATE_TRANSPARENCY_REQUIRED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCeritificateTransparencyRequired', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CERTIFICATE_TRANSPARENCY_REQUIRED");
        console.info("====>testArkWebCeritificateTransparencyRequired result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCeritificateTransparencyRequired catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCERTSymantecLegacy
     * @tc.number SUB_WEB_NET_ERROR_11500
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CERT_SYMANTEC_LEGACY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCERTSymantecLegacy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CERT_SYMANTEC_LEGACY");
        console.info("====>testArkWebCERTSymantecLegacy result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCERTSymantecLegacy catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCERTKnowInterceptionBlocked
     * @tc.number SUB_WEB_NET_ERROR_11600
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CERT_KNOWN_INTERCEPTION_BLOCKED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCERTKnowInterceptionBlocked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CERT_KNOWN_INTERCEPTION_BLOCKED");
        console.info("====>testArkWebCERTKnowInterceptionBlocked result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCERTKnowInterceptionBlocked catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebSSLObsoleteVersionOrCipher
     * @tc.number SUB_WEB_NET_ERROR_11700
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SSL_OBSOLETE_VERSION_OR_CIPHER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebSSLObsoleteVersionOrCipher', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SSL_OBSOLETE_VERSION_OR_CIPHER");
        console.info("====>testArkWebSSLObsoleteVersionOrCipher result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebSSLObsoleteVersionOrCipher catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebErrCERTEnd
     * @tc.number SUB_WEB_NET_ERROR_11800
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CERT_END
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebErrCERTEnd', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CERT_END");
        console.info("====>testArkWebErrCERTEnd result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebErrCERTEnd catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebInvalidURL
     * @tc.number SUB_WEB_NET_ERROR_11900
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_INVALID_URL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebInvalidURL', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_INVALID_URL");
        console.info("====>testArkWebInvalidURL result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebInvalidURL catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebDisallowedUrlScheme
     * @tc.number SUB_WEB_NET_ERROR_12000
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_DISALLOWED_URL_SCHEME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebDisallowedUrlScheme', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_DISALLOWED_URL_SCHEME");
        console.info("====>testArkWebDisallowedUrlScheme result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebDisallowedUrlScheme catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebUnknownUrlScheme
     * @tc.number SUB_WEB_NET_ERROR_12100
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_UNKNOWN_URL_SCHEME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebUnknownUrlScheme', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_UNKNOWN_URL_SCHEME");
        console.info("====>testArkWebUnknownUrlScheme result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebUnknownUrlScheme catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebInvalidRedirect
     * @tc.number SUB_WEB_NET_ERROR_12200
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_INVALID_REDIRECT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebInvalidRedirect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_INVALID_REDIRECT");
        console.info("====>testArkWebInvalidRedirect result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebInvalidRedirect catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebTooManyRedirects
     * @tc.number SUB_WEB_NET_ERROR_12300
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_TOO_MANY_REDIRECTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebTooManyRedirects', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_TOO_MANY_REDIRECTS");
        console.info("====>testArkWebTooManyRedirects result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebTooManyRedirects catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebUnsafeRedirect
     * @tc.number SUB_WEB_NET_ERROR_12400
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_UNSAFE_REDIRECT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebUnsafeRedirect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_UNSAFE_REDIRECT");
        console.info("====>testArkWebUnsafeRedirect result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebUnsafeRedirect catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebUnsafePort
     * @tc.number SUB_WEB_NET_ERROR_12500
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_UNSAFE_PORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebUnsafePort', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_UNSAFE_PORT");
        console.info("====>testArkWebUnsafePort result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebUnsafePort catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebInvalidResponse
     * @tc.number SUB_WEB_NET_ERROR_12600
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_INVALID_RESPONSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebInvalidResponse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_INVALID_RESPONSE");
        console.info("====>testArkWebInvalidResponse result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebInvalidResponse catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebInvalidChunkedEncoding
     * @tc.number SUB_WEB_NET_ERROR_12700
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_INVALID_CHUNKED_ENCODING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebInvalidChunkedEncoding', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_INVALID_CHUNKED_ENCODING");
        console.info("====>testArkWebInvalidChunkedEncoding result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebInvalidChunkedEncoding catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebMethodUnsupported
     * @tc.number SUB_WEB_NET_ERROR_12800
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_METHOD_UNSUPPORTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebMethodUnsupported', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_METHOD_UNSUPPORTED");
        console.info("====>testArkWebMethodUnsupported result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebMethodUnsupported catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebUnexpectedProxyAuth
     * @tc.number SUB_WEB_NET_ERROR_12900
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_UNEXPECTED_PROXY_AUTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebUnexpectedProxyAuth', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_UNEXPECTED_PROXY_AUTH");
        console.info("====>testArkWebUnexpectedProxyAuth result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebUnexpectedProxyAuth catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebEmptyResponse
     * @tc.number SUB_WEB_NET_ERROR_13000
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_EMPTY_RESPONSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebEmptyResponse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_EMPTY_RESPONSE");
        console.info("====>testArkWebEmptyResponse result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebEmptyResponse catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebResponseHeadersTooBig
     * @tc.number SUB_WEB_NET_ERROR_13100
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_RESPONSE_HEADERS_TOO_BIG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResponseHeadersTooBig', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_RESPONSE_HEADERS_TOO_BIG");
        console.info("====>testArkWebResponseHeadersTooBig result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResponseHeadersTooBig catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebPacScriptFailed
     * @tc.number SUB_WEB_NET_ERROR_13200
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_PAC_SCRIPT_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebPacScriptFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_PAC_SCRIPT_FAILED");
        console.info("====>testArkWebPacScriptFailed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebPacScriptFailed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebRequestRangeNotSatisfiable
     * @tc.number SUB_WEB_NET_ERROR_13300
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_REQUEST_RANGE_NOT_SATISFIABLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebRequestRangeNotSatisfiable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_REQUEST_RANGE_NOT_SATISFIABLE");
        console.info("====>testArkWebRequestRangeNotSatisfiable result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebRequestRangeNotSatisfiable catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebMalformedIdentity
     * @tc.number SUB_WEB_NET_ERROR_13400
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_MALFORMED_IDENTITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebMalformedIdentity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_MALFORMED_IDENTITY");
        console.info("====>testArkWebMalformedIdentity result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebMalformedIdentity catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebContentDecodingFailed
     * @tc.number SUB_WEB_NET_ERROR_13500
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CONTENT_DECODING_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebContentDecodingFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CONTENT_DECODING_FAILED");
        console.info("====>testArkWebContentDecodingFailed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebContentDecodingFailed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebNetworkIoSuspended
     * @tc.number SUB_WEB_NET_ERROR_13600
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_NETWORK_IO_SUSPENDED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebNetworkIoSuspended', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_NETWORK_IO_SUSPENDED");
        console.info("====>testArkWebNetworkIoSuspended result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebNetworkIoSuspended catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebSynReplyNotReceived
     * @tc.number SUB_WEB_NET_ERROR_13700
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SYN_REPLY_NOT_RECEIVED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebSynReplyNotReceived', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SYN_REPLY_NOT_RECEIVED");
        console.info("====>testArkWebSynReplyNotReceived result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebSynReplyNotReceived catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebEncodingConversionFailed
     * @tc.number SUB_WEB_NET_ERROR_13800
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_ENCODING_CONVERSION_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebEncodingConversionFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_ENCODING_CONVERSION_FAILED");
        console.info("====>testArkWebEncodingConversionFailed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebEncodingConversionFailed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebUnrecognizedFtpDirectoryListingFormat
     * @tc.number SUB_WEB_NET_ERROR_13900
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebUnrecognizedFtpDirectoryListingFormat', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_UNRECOGNIZED_FTP_DIRECTORY_LISTING_FORMAT");
        console.info("====>testArkWebUnrecognizedFtpDirectoryListingFormat result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebUnrecognizedFtpDirectoryListingFormat catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebNoSupportedProxies
     * @tc.number SUB_WEB_NET_ERROR_14000
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_NO_SUPPORTED_PROXIES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebNoSupportedProxies', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_NO_SUPPORTED_PROXIES");
        console.info("====>testArkWebNoSupportedProxies result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebNoSupportedProxies catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebHttp2ProtocolError
     * @tc.number SUB_WEB_NET_ERROR_14100
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_HTTP2_PROTOCOL_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebHttp2ProtocolError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_HTTP2_PROTOCOL_ERROR");
        console.info("====>testArkWebHttp2ProtocolError result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebHttp2ProtocolError catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebInvalidAuthCredentials
     * @tc.number SUB_WEB_NET_ERROR_14200
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_INVALID_AUTH_CREDENTIALS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebInvalidAuthCredentials', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_INVALID_AUTH_CREDENTIALS");
        console.info("====>testArkWebInvalidAuthCredentials result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebInvalidAuthCredentials catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebUnsupportedAuthScheme
     * @tc.number SUB_WEB_NET_ERROR_14300
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_UNSUPPORTED_AUTH_SCHEME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebUnsupportedAuthScheme', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_UNSUPPORTED_AUTH_SCHEME");
        console.info("====>testArkWebUnsupportedAuthScheme result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebUnsupportedAuthScheme catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebEncodingDetectionFailed
     * @tc.number SUB_WEB_NET_ERROR_14400
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_ENCODING_DETECTION_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebEncodingDetectionFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_ENCODING_DETECTION_FAILED");
        console.info("====>testArkWebEncodingDetectionFailed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebEncodingDetectionFailed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebMissingAuthCredentials
     * @tc.number SUB_WEB_NET_ERROR_14500
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_MISSING_AUTH_CREDENTIALS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebMissingAuthCredentials', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_MISSING_AUTH_CREDENTIALS");
        console.info("====>testArkWebMissingAuthCredentials result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebMissingAuthCredentials catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebUnexpectedSecurityLibraryStatus
     * @tc.number SUB_WEB_NET_ERROR_14600
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebUnexpectedSecurityLibraryStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_UNEXPECTED_SECURITY_LIBRARY_STATUS");
        console.info("====>testArkWebUnexpectedSecurityLibraryStatus result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebUnexpectedSecurityLibraryStatus catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebMisconfiguredAuthEnvironment
     * @tc.number SUB_WEB_NET_ERROR_14700
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_MISCONFIGURED_AUTH_ENVIRONMENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebMisconfiguredAuthEnvironment', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_MISCONFIGURED_AUTH_ENVIRONMENT");
        console.info("====>testArkWebMisconfiguredAuthEnvironment result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebMisconfiguredAuthEnvironment catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebUndocumentedSecurityLibraryStatus
     * @tc.number SUB_WEB_NET_ERROR_14800
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_UNDOCUMENTED_SECURITY_LIBRARY_STATUS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebUndocumentedSecurityLibraryStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_UNDOCUMENTED_SECURITY_LIBRARY_STATUS");
        console.info("====>testArkWebUndocumentedSecurityLibraryStatus result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebUndocumentedSecurityLibraryStatus catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebResponseBodyTooBigToDrain
     * @tc.number SUB_WEB_NET_ERROR_14900
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResponseBodyTooBigToDrain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_RESPONSE_BODY_TOO_BIG_TO_DRAIN");
        console.info("====>testArkWebResponseBodyTooBigToDrain result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResponseBodyTooBigToDrain catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebResponseHeadersMultipleContentLength
     * @tc.number SUB_WEB_NET_ERROR_15000
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_LENGTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResponseHeadersMultipleContentLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_LENGTH");
        console.info("====>testArkWebResponseHeadersMultipleContentLength result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResponseHeadersMultipleContentLength catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebIncompleteHttp2Headers
     * @tc.number SUB_WEB_NET_ERROR_15100
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_INCOMPLETE_HTTP2_HEADERS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebIncompleteHttp2Headers', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_INCOMPLETE_HTTP2_HEADERS");
        console.info("====>testArkWebIncompleteHttp2Headers result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebIncompleteHttp2Headers catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebPacNotInDhcp
     * @tc.number SUB_WEB_NET_ERROR_15200
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_PAC_NOT_IN_DHCP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebPacNotInDhcp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_PAC_NOT_IN_DHCP");
        console.info("====>testArkWebPacNotInDhcp result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebPacNotInDhcp catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebResponseHeadersMultipleContentDisposition
     * @tc.number SUB_WEB_NET_ERROR_15300
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResponseHeadersMultipleContentDisposition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_RESPONSE_HEADERS_MULTIPLE_CONTENT_DISPOSITION");
        console.info("====>testArkWebResponseHeadersMultipleContentDisposition result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResponseHeadersMultipleContentDisposition catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebResponseHeadersMultipleLocation
     * @tc.number SUB_WEB_NET_ERROR_15400
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResponseHeadersMultipleLocation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_RESPONSE_HEADERS_MULTIPLE_LOCATION");
        console.info("====>testArkWebResponseHeadersMultipleLocation result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResponseHeadersMultipleLocation catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebHttp2ServerRefusedStream
     * @tc.number SUB_WEB_NET_ERROR_15500
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_HTTP2_SERVER_REFUSED_STREAM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebHttp2ServerRefusedStream', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_HTTP2_SERVER_REFUSED_STREAM");
        console.info("====>testArkWebHttp2ServerRefusedStream result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebHttp2ServerRefusedStream catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebHttp2PingFailed
     * @tc.number SUB_WEB_NET_ERROR_15600
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_HTTP2_PING_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebHttp2PingFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_HTTP2_PING_FAILED");
        console.info("====>testArkWebHttp2PingFailed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebHttp2PingFailed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebContentLengthMismatch
     * @tc.number SUB_WEB_NET_ERROR_15700
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CONTENT_LENGTH_MISMATCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebContentLengthMismatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CONTENT_LENGTH_MISMATCH");
        console.info("====>testArkWebContentLengthMismatch result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebContentLengthMismatch catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebIncompleteChunkedEncoding
     * @tc.number SUB_WEB_NET_ERROR_15800
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_INCOMPLETE_CHUNKED_ENCODING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebIncompleteChunkedEncoding', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_INCOMPLETE_CHUNKED_ENCODING");
        console.info("====>testArkWebIncompleteChunkedEncoding result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebIncompleteChunkedEncoding catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebQuicProtocolError
     * @tc.number SUB_WEB_NET_ERROR_15900
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_QUIC_PROTOCOL_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebQuicProtocolError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_QUIC_PROTOCOL_ERROR");
        console.info("====>testArkWebQuicProtocolError result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebQuicProtocolError catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebResponseHeadersTruncated
     * @tc.number SUB_WEB_NET_ERROR_16000
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_RESPONSE_HEADERS_TRUNCATED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebResponseHeadersTruncated', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_RESPONSE_HEADERS_TRUNCATED");
        console.info("====>testArkWebResponseHeadersTruncated result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebResponseHeadersTruncated catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebQuicHandshakeFailed
     * @tc.number SUB_WEB_NET_ERROR_16100
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_QUIC_HANDSHAKE_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebQuicHandshakeFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_QUIC_HANDSHAKE_FAILED");
        console.info("====>testArkWebQuicHandshakeFailed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebQuicHandshakeFailed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebHttp2InadequateTransportSecurity
     * @tc.number SUB_WEB_NET_ERROR_16200
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebHttp2InadequateTransportSecurity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_HTTP2_INADEQUATE_TRANSPORT_SECURITY");
        console.info("====>testArkWebHttp2InadequateTransportSecurity result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebHttp2InadequateTransportSecurity catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebHttp2FlowControlError
     * @tc.number SUB_WEB_NET_ERROR_16300
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_HTTP2_FLOW_CONTROL_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebHttp2FlowControlError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_HTTP2_FLOW_CONTROL_ERROR");
        console.info("====>testArkWebHttp2FlowControlError result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebHttp2FlowControlError catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebHttp2FrameSizeError
     * @tc.number SUB_WEB_NET_ERROR_16400
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_HTTP2_FRAME_SIZE_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebHttp2FrameSizeError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_HTTP2_FRAME_SIZE_ERROR");
        console.info("====>testArkWebHttp2FrameSizeError result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebHttp2FrameSizeError catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebHttp2CompressionError
     * @tc.number SUB_WEB_NET_ERROR_16500
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_HTTP2_COMPRESSION_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebHttp2CompressionError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_HTTP2_COMPRESSION_ERROR");
        console.info("====>testArkWebHttp2CompressionError result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebHttp2CompressionError catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebProxyAuthRequestedWithNoConnection
     * @tc.number SUB_WEB_NET_ERROR_16600
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebProxyAuthRequestedWithNoConnection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_PROXY_AUTH_REQUESTED_WITH_NO_CONNECTION");
        console.info("====>testArkWebProxyAuthRequestedWithNoConnection result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebProxyAuthRequestedWithNoConnection catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebHttp11Required
     * @tc.number SUB_WEB_NET_ERROR_16700
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_HTTP_1_1_REQUIRED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebHttp11Required', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_HTTP_1_1_REQUIRED");
        console.info("====>testArkWebHttp11Required result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebHttp11Required catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebProxyHttp11Required
     * @tc.number SUB_WEB_NET_ERROR_16800
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_PROXY_HTTP_1_1_REQUIRED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebProxyHttp11Required', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_PROXY_HTTP_1_1_REQUIRED");
        console.info("====>testArkWebProxyHttp11Required result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebProxyHttp11Required catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebPacScriptTerminated
     * @tc.number SUB_WEB_NET_ERROR_16900
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_PAC_SCRIPT_TERMINATED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebPacScriptTerminated', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_PAC_SCRIPT_TERMINATED");
        console.info("====>testArkWebPacScriptTerminated result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebPacScriptTerminated catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebInvalidHttpResponse
     * @tc.number SUB_WEB_NET_ERROR_17000
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_INVALID_HTTP_RESPONSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebInvalidHttpResponse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_INVALID_HTTP_RESPONSE");
        console.info("====>testArkWebInvalidHttpResponse result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebInvalidHttpResponse catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebContentDecodingInitFailed
     * @tc.number SUB_WEB_NET_ERROR_17100
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CONTENT_DECODING_INIT_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebContentDecodingInitFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CONTENT_DECODING_INIT_FAILED");
        console.info("====>testArkWebContentDecodingInitFailed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebContentDecodingInitFailed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebHttp2RstStreamNoErrorReceived
     * @tc.number SUB_WEB_NET_ERROR_17200
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_HTTP2_RST_STREAM_NO_ERROR_RECEIVED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebHttp2RstStreamNoErrorReceived', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_HTTP2_RST_STREAM_NO_ERROR_RECEIVED");
        console.info("====>testArkWebHttp2RstStreamNoErrorReceived result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebHttp2RstStreamNoErrorReceived catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebHttp2PushedStreamNotAvailable
     * @tc.number SUB_WEB_NET_ERROR_17300
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_HTTP2_PUSHED_STREAM_NOT_AVAILABLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebHttp2PushedStreamNotAvailable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_HTTP2_PUSHED_STREAM_NOT_AVAILABLE");
        console.info("====>testArkWebHttp2PushedStreamNotAvailable result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebHttp2PushedStreamNotAvailable catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebHttp2ClaimedPushedStreamResetByServer
     * @tc.number SUB_WEB_NET_ERROR_17400
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_HTTP2_CLAIMED_PUSHED_STREAM_RESET_BY_SERVER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebHttp2ClaimedPushedStreamResetByServer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_HTTP2_CLAIMED_PUSHED_STREAM_RESET_BY_SERVER");
        console.info("====>testArkWebHttp2ClaimedPushedStreamResetByServer result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebHttp2ClaimedPushedStreamResetByServer catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebTooManyRetries
     * @tc.number SUB_WEB_NET_ERROR_17500
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_TOO_MANY_RETRIES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebTooManyRetries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_TOO_MANY_RETRIES");
        console.info("====>testArkWebTooManyRetries result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebTooManyRetries catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebHttp2StreamClosed
     * @tc.number SUB_WEB_NET_ERROR_17600
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_HTTP2_STREAM_CLOSED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebHttp2StreamClosed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_HTTP2_STREAM_CLOSED");
        console.info("====>testArkWebHttp2StreamClosed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebHttp2StreamClosed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebHttp2ClientRefusedStream
     * @tc.number SUB_WEB_NET_ERROR_17700
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_HTTP2_CLIENT_REFUSED_STREAM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebHttp2ClientRefusedStream', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_HTTP2_CLIENT_REFUSED_STREAM");
        console.info("====>testArkWebHttp2ClientRefusedStream result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebHttp2ClientRefusedStream catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebHttp2PushedResponseDoesNotMatch
     * @tc.number SUB_WEB_NET_ERROR_17800
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_HTTP2_PUSHED_RESPONSE_DOES_NOT_MATCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebHttp2PushedResponseDoesNotMatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_HTTP2_PUSHED_RESPONSE_DOES_NOT_MATCH");
        console.info("====>testArkWebHttp2PushedResponseDoesNotMatch result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebHttp2PushedResponseDoesNotMatch catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebHttpResponseCodeFailure
     * @tc.number SUB_WEB_NET_ERROR_17900
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_HTTP_RESPONSE_CODE_FAILURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebHttpResponseCodeFailure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_HTTP_RESPONSE_CODE_FAILURE");
        console.info("====>testArkWebHttpResponseCodeFailure result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebHttpResponseCodeFailure catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebQuicUnknownCertRoot
     * @tc.number SUB_WEB_NET_ERROR_18000
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_QUIC_UNKNOWN_CERT_ROOT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebQuicUnknownCertRoot', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_QUIC_UNKNOWN_CERT_ROOT");
        console.info("====>testArkWebQuicUnknownCertRoot result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebQuicUnknownCertRoot catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebQuicGoawayRequestCanBeRetried
     * @tc.number SUB_WEB_NET_ERROR_18100
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_QUIC_GOAWAY_REQUEST_CAN_BE_RETRIED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebQuicGoawayRequestCanBeRetried', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_QUIC_GOAWAY_REQUEST_CAN_BE_RETRIED");
        console.info("====>testArkWebQuicGoawayRequestCanBeRetried result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebQuicGoawayRequestCanBeRetried catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebTooManyAcceptChRestarts
     * @tc.number SUB_WEB_NET_ERROR_18200
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_TOO_MANY_ACCEPT_CH_RESTARTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebTooManyAcceptChRestarts', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_TOO_MANY_ACCEPT_CH_RESTARTS");
        console.info("====>testArkWebTooManyAcceptChRestarts result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebTooManyAcceptChRestarts catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebInconsistentIpAddressSpace
     * @tc.number SUB_WEB_NET_ERROR_18300
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_INCONSISTENT_IP_ADDRESS_SPACE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebInconsistentIpAddressSpace', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_INCONSISTENT_IP_ADDRESS_SPACE");
        console.info("====>testArkWebInconsistentIpAddressSpace result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebInconsistentIpAddressSpace catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCachedIpAddressSpaceBlockedByLocalNetworkAccessPolicy
     * @tc.number SUB_WEB_NET_ERROR_18400
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CACHED_IP_ADDRESS_SPACE_BLOCKED_BY_LOCAL_NETWORK_ACCESS_POLICY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCachedIpAddressSpaceBlockedByLocalNetworkAccessPolicy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CACHED_IP_ADDRESS_SPACE_BLOCKED_BY_LOCAL_NETWORK_ACCESS_POLICY");
        console.info("====>testArkWebCachedIpAddressSpaceBlockedByLocalNetworkAccessPolicy result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCachedIpAddressSpaceBlockedByLocalNetworkAccessPolicy catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCacheMiss
     * @tc.number SUB_WEB_NET_ERROR_18500
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CACHE_MISS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCacheMiss', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CACHE_MISS");
        console.info("====>testArkWebCacheMiss result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCacheMiss catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCacheWriteFailure
     * @tc.number SUB_WEB_NET_ERROR_18600
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CACHE_WRITE_FAILURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCacheWriteFailure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CACHE_WRITE_FAILURE");
        console.info("====>testArkWebCacheWriteFailure result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCacheWriteFailure catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCacheOperationUnsupported
     * @tc.number SUB_WEB_NET_ERROR_18700
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CACHE_OPERATION_UNSUPPORTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCacheOperationUnsupported', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CACHE_OPERATION_UNSUPPORTED");
        console.info("====>testArkWebCacheOperationUnsupported result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCacheOperationUnsupported catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCacheOpenFailure
     * @tc.number SUB_WEB_NET_ERROR_18800
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CACHE_OPEN_FAILURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCacheOpenFailure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CACHE_OPEN_FAILURE");
        console.info("====>testArkWebCacheOpenFailure result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCacheOpenFailure catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCacheCreateFailure
     * @tc.number SUB_WEB_NET_ERROR_18900
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CACHE_CREATE_FAILURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCacheCreateFailure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CACHE_CREATE_FAILURE");
        console.info("====>testArkWebCacheCreateFailure result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCacheCreateFailure catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCacheRace
     * @tc.number SUB_WEB_NET_ERROR_19000
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CACHE_RACE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCacheRace', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CACHE_RACE");
        console.info("====>testArkWebCacheRace result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCacheRace catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCacheChecksumReadFailure
     * @tc.number SUB_WEB_NET_ERROR_19100
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CACHE_CHECKSUM_READ_FAILURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCacheChecksumReadFailure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CACHE_CHECKSUM_READ_FAILURE");
        console.info("====>testArkWebCacheChecksumReadFailure result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCacheChecksumReadFailure catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCacheChecksumMismatch
     * @tc.number SUB_WEB_NET_ERROR_19200
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CACHE_CHECKSUM_MISMATCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCacheChecksumMismatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CACHE_CHECKSUM_MISMATCH");
        console.info("====>testArkWebCacheChecksumMismatch result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCacheChecksumMismatch catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCacheLockTimeout
     * @tc.number SUB_WEB_NET_ERROR_19300
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CACHE_LOCK_TIMEOUT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCacheLockTimeout', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CACHE_LOCK_TIMEOUT");
        console.info("====>testArkWebCacheLockTimeout result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCacheLockTimeout catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCacheAuthFailureAfterRead
     * @tc.number SUB_WEB_NET_ERROR_19400
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CACHE_AUTH_FAILURE_AFTER_READ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCacheAuthFailureAfterRead', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CACHE_AUTH_FAILURE_AFTER_READ");
        console.info("====>testArkWebCacheAuthFailureAfterRead result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCacheAuthFailureAfterRead catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCacheEntryNotSuitable
     * @tc.number SUB_WEB_NET_ERROR_19500
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CACHE_ENTRY_NOT_SUITABLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCacheEntryNotSuitable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CACHE_ENTRY_NOT_SUITABLE");
        console.info("====>testArkWebCacheEntryNotSuitable result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCacheEntryNotSuitable catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCacheDoomFailure
     * @tc.number SUB_WEB_NET_ERROR_19600
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CACHE_DOOM_FAILURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCacheDoomFailure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CACHE_DOOM_FAILURE");
        console.info("====>testArkWebCacheDoomFailure result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCacheDoomFailure catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCacheOpenOrCreateFailure
     * @tc.number SUB_WEB_NET_ERROR_19700
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CACHE_OPEN_OR_CREATE_FAILURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCacheOpenOrCreateFailure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CACHE_OPEN_OR_CREATE_FAILURE");
        console.info("====>testArkWebCacheOpenOrCreateFailure result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCacheOpenOrCreateFailure catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebInsecureResponse
     * @tc.number SUB_WEB_NET_ERROR_19800
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_INSECURE_RESPONSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebInsecureResponse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_INSECURE_RESPONSE");
        console.info("====>testArkWebInsecureResponse result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebInsecureResponse catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebNoPrivateKeyForCert
     * @tc.number SUB_WEB_NET_ERROR_19900
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_NO_PRIVATE_KEY_FOR_CERT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebNoPrivateKeyForCert', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_NO_PRIVATE_KEY_FOR_CERT");
        console.info("====>testArkWebNoPrivateKeyForCert result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebNoPrivateKeyForCert catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebAddUserCertFailed
     * @tc.number SUB_WEB_NET_ERROR_20000
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_ADD_USER_CERT_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebAddUserCertFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_ADD_USER_CERT_FAILED");
        console.info("====>testArkWebAddUserCertFailed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebAddUserCertFailed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebInvalidSignedExchange
     * @tc.number SUB_WEB_NET_ERROR_20100
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_INVALID_SIGNED_EXCHANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebInvalidSignedExchange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_INVALID_SIGNED_EXCHANGE");
        console.info("====>testArkWebInvalidSignedExchange result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebInvalidSignedExchange catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebInvalidWebBundle
     * @tc.number SUB_WEB_NET_ERROR_20200
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_INVALID_WEB_BUNDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebInvalidWebBundle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_INVALID_WEB_BUNDLE");
        console.info("====>testArkWebInvalidWebBundle result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebInvalidWebBundle catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebTrustTokenOperationFailed
     * @tc.number SUB_WEB_NET_ERROR_20300
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_TRUST_TOKEN_OPERATION_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebTrustTokenOperationFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_TRUST_TOKEN_OPERATION_FAILED");
        console.info("====>testArkWebTrustTokenOperationFailed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebTrustTokenOperationFailed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebTrustTokenOperationSuccessWithoutSendingRequest
     * @tc.number SUB_WEB_NET_ERROR_20400
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_TRUST_TOKEN_OPERATION_SUCCESS_WITHOUT_SENDING_REQUEST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebTrustTokenOperationSuccessWithoutSendingRequest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_TRUST_TOKEN_OPERATION_SUCCESS_WITHOUT_SENDING_REQUEST");
        console.info("====>testArkWebTrustTokenOperationSuccessWithoutSendingRequest result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebTrustTokenOperationSuccessWithoutSendingRequest catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebFtpFailed
     * @tc.number SUB_WEB_NET_ERROR_20500
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_FTP_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebFtpFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_FTP_FAILED");
        console.info("====>testArkWebFtpFailed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebFtpFailed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebFtpServiceUnavailable
     * @tc.number SUB_WEB_NET_ERROR_20600
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_FTP_SERVICE_UNAVAILABLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebFtpServiceUnavailable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_FTP_SERVICE_UNAVAILABLE");
        console.info("====>testArkWebFtpServiceUnavailable result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebFtpServiceUnavailable catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebFtpTransferAborted
     * @tc.number SUB_WEB_NET_ERROR_20700
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_FTP_TRANSFER_ABORTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebFtpTransferAborted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_FTP_TRANSFER_ABORTED");
        console.info("====>testArkWebFtpTransferAborted result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebFtpTransferAborted catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebFtpFileBusy
     * @tc.number SUB_WEB_NET_ERROR_20800
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_FTP_FILE_BUSY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebFtpFileBusy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_FTP_FILE_BUSY");
        console.info("====>testArkWebFtpFileBusy result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebFtpFileBusy catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebFtpSyntaxError
     * @tc.number SUB_WEB_NET_ERROR_20900
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_FTP_SYNTAX_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebFtpSyntaxError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_FTP_SYNTAX_ERROR");
        console.info("====>testArkWebFtpSyntaxError result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebFtpSyntaxError catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebFtpCommandUnsupported
     * @tc.number SUB_WEB_NET_ERROR_21000
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_FTP_COMMAND_UNSUPPORTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebFtpCommandUnsupported', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_FTP_COMMAND_UNSUPPORTED");
        console.info("====>testArkWebFtpCommandUnsupported result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebFtpCommandUnsupported catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebFtpBadCommandSequence
     * @tc.number SUB_WEB_NET_ERROR_21100
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_FTP_BAD_COMMAND_SEQUENCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebFtpBadCommandSequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_FTP_BAD_COMMAND_SEQUENCE");
        console.info("====>testArkWebFtpBadCommandSequence result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebFtpBadCommandSequence catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebPkcs12ImportBadPassword
     * @tc.number SUB_WEB_NET_ERROR_21200
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_PKCS12_IMPORT_BAD_PASSWORD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebPkcs12ImportBadPassword', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_PKCS12_IMPORT_BAD_PASSWORD");
        console.info("====>testArkWebPkcs12ImportBadPassword result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebPkcs12ImportBadPassword catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebPkcs12ImportFailed
     * @tc.number SUB_WEB_NET_ERROR_21300
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_PKCS12_IMPORT_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebPkcs12ImportFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_PKCS12_IMPORT_FAILED");
        console.info("====>testArkWebPkcs12ImportFailed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebPkcs12ImportFailed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebImportCaCertNotCa
     * @tc.number SUB_WEB_NET_ERROR_21400
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_IMPORT_CA_CERT_NOT_CA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebImportCaCertNotCa', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_IMPORT_CA_CERT_NOT_CA");
        console.info("====>testArkWebImportCaCertNotCa result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebImportCaCertNotCa catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebImportCertAlreadyExists
     * @tc.number SUB_WEB_NET_ERROR_21500
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_IMPORT_CERT_ALREADY_EXISTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebImportCertAlreadyExists', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_IMPORT_CERT_ALREADY_EXISTS");
        console.info("====>testArkWebImportCertAlreadyExists result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebImportCertAlreadyExists catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebImportCaCertFailed
     * @tc.number SUB_WEB_NET_ERROR_21600
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_IMPORT_CA_CERT_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebImportCaCertFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_IMPORT_CA_CERT_FAILED");
        console.info("====>testArkWebImportCaCertFailed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebImportCaCertFailed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebImportServerCertFailed
     * @tc.number SUB_WEB_NET_ERROR_21700
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_IMPORT_SERVER_CERT_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebImportServerCertFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_IMPORT_SERVER_CERT_FAILED");
        console.info("====>testArkWebImportServerCertFailed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebImportServerCertFailed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebPkcs12ImportInvalidMac
     * @tc.number SUB_WEB_NET_ERROR_21800
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_PKCS12_IMPORT_INVALID_MAC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebPkcs12ImportInvalidMac', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_PKCS12_IMPORT_INVALID_MAC");
        console.info("====>testArkWebPkcs12ImportInvalidMac result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebPkcs12ImportInvalidMac catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebPkcs12ImportInvalidFile
     * @tc.number SUB_WEB_NET_ERROR_21900
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_PKCS12_IMPORT_INVALID_FILE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebPkcs12ImportInvalidFile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_PKCS12_IMPORT_INVALID_FILE");
        console.info("====>testArkWebPkcs12ImportInvalidFile result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebPkcs12ImportInvalidFile catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebPkcs12ImportUnsupported
     * @tc.number SUB_WEB_NET_ERROR_22000
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_PKCS12_IMPORT_UNSUPPORTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebPkcs12ImportUnsupported', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_PKCS12_IMPORT_UNSUPPORTED");
        console.info("====>testArkWebPkcs12ImportUnsupported result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebPkcs12ImportUnsupported catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebKeyGenerationFailed
     * @tc.number SUB_WEB_NET_ERROR_22100
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_KEY_GENERATION_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebKeyGenerationFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_KEY_GENERATION_FAILED");
        console.info("====>testArkWebKeyGenerationFailed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebKeyGenerationFailed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebPrivateKeyExportFailed
     * @tc.number SUB_WEB_NET_ERROR_22200
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_PRIVATE_KEY_EXPORT_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebPrivateKeyExportFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_PRIVATE_KEY_EXPORT_FAILED");
        console.info("====>testArkWebPrivateKeyExportFailed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebPrivateKeyExportFailed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebSelfSignedCertGenerationFailed
     * @tc.number SUB_WEB_NET_ERROR_22300
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_SELF_SIGNED_CERT_GENERATION_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebSelfSignedCertGenerationFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_SELF_SIGNED_CERT_GENERATION_FAILED");
        console.info("====>testArkWebSelfSignedCertGenerationFailed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebSelfSignedCertGenerationFailed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCertDatabaseChanged
     * @tc.number SUB_WEB_NET_ERROR_22400
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CERT_DATABASE_CHANGED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCertDatabaseChanged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CERT_DATABASE_CHANGED");
        console.info("====>testArkWebCertDatabaseChanged result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCertDatabaseChanged catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebCertVerifierChanged
     * @tc.number SUB_WEB_NET_ERROR_22500
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_CERT_VERIFIER_CHANGED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebCertVerifierChanged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CERT_VERIFIER_CHANGED");
        console.info("====>testArkWebCertVerifierChanged result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebCertVerifierChanged catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebDnsMalformedResponse
     * @tc.number SUB_WEB_NET_ERROR_22600
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_DNS_MALFORMED_RESPONSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebDnsMalformedResponse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_DNS_MALFORMED_RESPONSE");
        console.info("====>testArkWebDnsMalformedResponse result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebDnsMalformedResponse catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebDnsServerRequiresTcp
     * @tc.number SUB_WEB_NET_ERROR_22700
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_DNS_SERVER_REQUIRES_TCP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebDnsServerRequiresTcp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_DNS_SERVER_REQUIRES_TCP");
        console.info("====>testArkWebDnsServerRequiresTcp result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebDnsServerRequiresTcp catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebDnsServerFailed
     * @tc.number SUB_WEB_NET_ERROR_22800
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_DNS_SERVER_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebDnsServerFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_DNS_SERVER_FAILED");
        console.info("====>testArkWebDnsServerFailed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebDnsServerFailed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebDnsTimedOut
     * @tc.number SUB_WEB_NET_ERROR_22900
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_DNS_TIMED_OUT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebDnsTimedOut', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_DNS_TIMED_OUT");
        console.info("====>testArkWebDnsTimedOut result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebDnsTimedOut catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebDnsCacheMiss
     * @tc.number SUB_WEB_NET_ERROR_23000
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_DNS_CACHE_MISS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebDnsCacheMiss', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_DNS_CACHE_MISS");
        console.info("====>testArkWebDnsCacheMiss result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebDnsCacheMiss catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebDnsSearchEmpty
     * @tc.number SUB_WEB_NET_ERROR_23100
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_DNS_SEARCH_EMPTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebDnsSearchEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_DNS_SEARCH_EMPTY");
        console.info("====>testArkWebDnsSearchEmpty result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebDnsSearchEmpty catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebDnsSortError
     * @tc.number SUB_WEB_NET_ERROR_23200
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_DNS_SORT_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebDnsSortError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_DNS_SORT_ERROR");
        console.info("====>testArkWebDnsSortError result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebDnsSortError catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebDnsSecureResolverHostnameResolutionFailed
     * @tc.number SUB_WEB_NET_ERROR_23300
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_DNS_SECURE_RESOLVER_HOSTNAME_RESOLUTION_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebDnsSecureResolverHostnameResolutionFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_DNS_SECURE_RESOLVER_HOSTNAME_RESOLUTION_FAILED");
        console.info("====>testArkWebDnsSecureResolverHostnameResolutionFailed result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebDnsSecureResolverHostnameResolutionFailed catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebDnsNameHttpsOnly
     * @tc.number SUB_WEB_NET_ERROR_23400
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_DNS_NAME_HTTPS_ONLY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebDnsNameHttpsOnly', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_DNS_NAME_HTTPS_ONLY");
        console.info("====>testArkWebDnsNameHttpsOnly result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebDnsNameHttpsOnly catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebDnsRequestCanceled
     * @tc.number SUB_WEB_NET_ERROR_23500
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_DNS_REQUEST_CANCELED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebDnsRequestCanceled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_DNS_REQUEST_CANCELED");
        console.info("====>testArkWebDnsRequestCanceled result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebDnsRequestCanceled catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebDnsNoMatchingSupportedAlpn
     * @tc.number SUB_WEB_NET_ERROR_23600
     * @tc.desc   test ArkWeb_NetError Test ARKWEB_ERR_DNS_NO_MATCHING_SUPPORTED_ALPN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArkWebDnsNoMatchingSupportedAlpn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_DNS_NO_MATCHING_SUPPORTED_ALPN");
        console.info("====>testArkWebDnsNoMatchingSupportedAlpn result====", result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>testArkWebDnsNoMatchingSupportedAlpn catch err: " + err);
      }
    })

    /**
     * @tc.name   testArkWebResponse_GetError_ARKWEB_NET_OK
     * @tc.number SUB_WEB_NET_ERROR_23700
     * @tc.desc   test OH_ArkWebResponse_GetError return ARKWEB_NET_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testArkWebResponse_GetError_ARKWEB_NET_OK', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_NET_OK");
        console.info("====>testArkWebResponse_GetError_ARKWEB_NET_OK result====", result);
        expect(result).assertEqual(0);
      } catch (err) {
        expect(0).assertEqual(1);
        console.error("====>testArkWebResponse_GetError_ARKWEB_NET_OK catch err: " + err);
      }
      done();
    })

    /**
     * @tc.name   testArkWebResponse_GetError_ARKWEB_ERR_INVALID_ARGUMENT
     * @tc.number SUB_WEB_NET_ERROR_23800
     * @tc.desc   test OH_ArkWebResponse_GetError return ARKWEB_ERR_INVALID_ARGUMENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkWebResponse_GetError_ARKWEB_ERR_INVALID_ARGUMENT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_INVALID_ARGUMENT");
        console.info("====>testArkWebResponse_GetError_ARKWEB_ERR_INVALID_ARGUMENT result====", result);
        expect(result).assertEqual(0);
      } catch (err) {
        expect(0).assertEqual(1);
        console.error("====>testArkWebResponse_GetError_ARKWEB_ERR_INVALID_ARGUMENT catch err: " + err);
      }
      done();
    })

    /**
     * @tc.name   testArkWebResponse_GetError_ARKWEB_ERR_FILE_NOT_FOUND
     * @tc.number SUB_WEB_NET_ERROR_23900
     * @tc.desc   test OH_ArkWebResponse_GetError return ARKWEB_ERR_FILE_NOT_FOUND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArkWebResponse_GetError_ARKWEB_ERR_FILE_NOT_FOUND', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let result: number = webCode.webArkWebNetError("ARKWEB_ERR_FILE_NOT_FOUND");
        console.info("====>testArkWebResponse_GetError_ARKWEB_ERR_FILE_NOT_FOUND result====", result);
        expect(result).assertEqual(0);
      } catch (err) {
        expect(0).assertEqual(1);
        console.error("====>testArkWebResponse_GetError_ARKWEB_ERR_FILE_NOT_FOUND catch err: " + err);
      }
      done();
    })

     /**
      * @tc.name   testArkWebResponse_GetError_ARKWEB_ERR_CACHE_READ_FAILURE
      * @tc.number SUB_WEB_NET_ERROR_24000
      * @tc.desc   test OH_ArkWebResponse_GetError return ARKWEB_ERR_CACHE_READ_FAILURE
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('testArkWebResponse_GetError_ARKWEB_ERR_CACHE_READ_FAILURE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
       try {
         let result: number = webCode.webArkWebNetError("ARKWEB_ERR_CACHE_READ_FAILURE");
         console.info("====>testArkWebResponse_GetError_ARKWEB_ERR_CACHE_READ_FAILURE result====", result);
         expect(result).assertEqual(0);
       } catch (err) {
         expect(0).assertEqual(1);
         console.error("====>testArkWebResponse_GetError_ARKWEB_ERR_CACHE_READ_FAILURE catch err: " + err);
       }
       done();
     })

  })
}