/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level } from '@ohos/hypium';
import webview from '@ohos.web.webview';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver } from '@kit.TestKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let driver: Driver = Driver.create();

export default function WebDownloadErrorCodeEnumTest() {
  describe('WebDownloadErrorCodeEnumTest', () => {
    beforeAll(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      done()
    });

    /**
     * @tc.name   testWebDownloadErrorCodeErrorUnknown
     * @tc.number SUB_WEBVIEW_WebDownloadErrorCode_ERROR_UNKNOWN
     * @tc.desc   test WebDownloadErrorCode ERROR_UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadErrorCodeErrorUnknown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeErrorUnknown start')
        try {
            expect(webview.WebDownloadErrorCode.ERROR_UNKNOWN).assertEqual(0)
        } catch(error) {
            console.error('testWebDownloadErrorCodeErrorUnknown error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeErrorUnknown end')
        done()
    })


    /**
     * @tc.name   testWebDownloadErrorCodeFileFailed
     * @tc.number SUB_WEBVIEW_WebDownloadErrorCode_FILE_FAILED
     * @tc.desc   test WebDownloadErrorCode FILE_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadErrorCodeFileFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeFileFailed start')
        try {
            expect(webview.WebDownloadErrorCode.FILE_FAILED).assertEqual(1)
        } catch(error) {
            console.error('testWebDownloadErrorCodeFileFailed error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeFileFailed end')
        done()
    })

    /**
     * @tc.name   testWebDownloadErrorCodeFileAccessDenied
     * @tc.number SUB_WEBVIEW_WebDownloadErrorCode_FILE_ACCESS_DENIED
     * @tc.desc   test WebDownloadErrorCode FILE_ACCESS_DENIED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadErrorCodeFileAccessDenied', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeFileAccessDenied start')
        try {
            expect(webview.WebDownloadErrorCode.FILE_ACCESS_DENIED).assertEqual(2)
        } catch(error) {
            console.error('testWebDownloadErrorCodeFileAccessDenied error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeFileAccessDenied end')
        done()
    })

    /**
     * @tc.name   testWebDownloadErrorCodeFileNoSpace
     * @tc.number SUB_WEBVIEW_WebDownloadErrorCode_FILE_NO_SPACE
     * @tc.desc   test WebDownloadErrorCode FILE_NO_SPACE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadErrorCodeFileNoSpace', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeFileNoSpace start')
        try {
            expect(webview.WebDownloadErrorCode.FILE_NO_SPACE).assertEqual(3)
        } catch(error) {
            console.error('testWebDownloadErrorCodeFileNoSpace error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeFileNoSpace end')
        done()
    })

    /**
     * @tc.name   testWebDownloadErrorCodeFileNameTooLong
     * @tc.number SUB_WEBVIEW_WebDownloadErrorCode_FILE_NAME_TOO_LONG
     * @tc.desc   test WebDownloadErrorCode FILE_NAME_TOO_LONG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadErrorCodeFileNameTooLong', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeFileNameTooLong start')
        try {
            expect(webview.WebDownloadErrorCode.FILE_NAME_TOO_LONG).assertEqual(5)
        } catch(error) {
            console.error('testWebDownloadErrorCodeFileNameTooLong error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeFileNameTooLong end')
        done()
    })

    /**
     * @tc.name   testWebDownloadErrorCodeFileNameTooLarge
     * @tc.number SUB_WEBVIEW_WebDownloadErrorCode_FILE_TOO_LARGE
     * @tc.desc   test WebDownloadErrorCode FILE_TOO_LARGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadErrorCodeFileNameTooLarge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeFileNameTooLarge start')
        try {
            expect(webview.WebDownloadErrorCode.FILE_TOO_LARGE).assertEqual(6)
        } catch(error) {
            console.error('testWebDownloadErrorCodeFileNameTooLarge error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeFileNameTooLarge end')
        done()
    })

    /**
     * @tc.name   testWebDownloadErrorCodeFileTransientError
     * @tc.number SUB_WEBVIEW_WebDownloadErrorCode_FILE_TRANSIENT_ERROR
     * @tc.desc   test WebDownloadErrorCode FILE_TRANSIENT_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadErrorCodeFileTransientError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeFileTransientError start')
        try {
            expect(webview.WebDownloadErrorCode.FILE_TRANSIENT_ERROR).assertEqual(10)
        } catch(error) {
            console.error('testWebDownloadErrorCodeFileTransientError error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeFileTransientError end')
        done()
    })

    /**
     * @tc.name   testWebDownloadErrorCodeFileBlocked
     * @tc.number SUB_WEBVIEW_WebDownloadErrorCode_FILE_BLOCKED
     * @tc.desc   test WebDownloadErrorCode FILE_BLOCKED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadErrorCodeFileBlocked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeFileBlocked start')
        try {
            expect(webview.WebDownloadErrorCode.FILE_BLOCKED).assertEqual(11)
        } catch(error) {
            console.error('testWebDownloadErrorCodeFileBlocked error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeFileBlocked end')
        done()
    })

    /**
     * @tc.name   testWebDownloadErrorCodeFileTooShort
     * @tc.number SUB_WEBVIEW_WebDownloadErrorCode_FILE_TOO_SHORT
     * @tc.desc   test WebDownloadErrorCode FILE_TOO_SHORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadErrorCodeFileTooShort', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeFileTooShort start')
        try {
            expect(webview.WebDownloadErrorCode.FILE_TOO_SHORT).assertEqual(13)
        } catch(error) {
            console.error('testWebDownloadErrorCodeFileTooShort error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeFileTooShort end')
        done()
    })

    /**
     * @tc.name   testWebDownloadErrorCodeFileHashMismatch
     * @tc.number SUB_WEBVIEW_WebDownloadErrorCode_FILE_HASH_MISMATCH
     * @tc.desc   test WebDownloadErrorCode FILE_HASH_MISMATCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadErrorCodeFileHashMismatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeFileHashMismatch start')
        try {
            expect(webview.WebDownloadErrorCode.FILE_HASH_MISMATCH).assertEqual(14)
        } catch(error) {
            console.error('testWebDownloadErrorCodeFileHashMismatch error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeFileHashMismatch end')
        done()
    })

    /**
     * @tc.name   testWebDownloadErrorCodeFileSameAsSource
     * @tc.number SUB_WEBVIEW_WebDownloadErrorCode_FILE_SAME_AS_SOURCE
     * @tc.desc   test WebDownloadErrorCode FILE_SAME_AS_SOURCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadErrorCodeFileSameAsSource', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeFileSameAsSource start')
        try {
            expect(webview.WebDownloadErrorCode.FILE_SAME_AS_SOURCE).assertEqual(15)
        } catch(error) {
            console.error('testWebDownloadErrorCodeFileSameAsSource error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeFileSameAsSource end')
        done()
    })

    /**
     * @tc.name   testWebDownloadErrorCodeNetworkTimeout
     * @tc.number SUB_WEBVIEW_WebDownloadErrorCode_NETWORK_TIMEOUT
     * @tc.desc   test WebDownloadErrorCode NETWORK_TIMEOUT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadErrorCodeNetworkTimeout', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeNetworkTimeout start')
        try {
            expect(webview.WebDownloadErrorCode.NETWORK_TIMEOUT).assertEqual(21)
        } catch(error) {
            console.error('testWebDownloadErrorCodeNetworkTimeout error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeNetworkTimeout end')
        done()
    })

    /**
     * @tc.name   testWebDownloadErrorCodeNetworkDisconnected
     * @tc.number SUB_WEBVIEW_WebDownloadErrorCode_NETWORK_DISCONNECTED
     * @tc.desc   test WebDownloadErrorCode NETWORK_DISCONNECTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadErrorCodeNetworkDisconnected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeNetworkDisconnected start')
        try {
            expect(webview.WebDownloadErrorCode.NETWORK_DISCONNECTED).assertEqual(22)
        } catch(error) {
            console.error('testWebDownloadErrorCodeNetworkDisconnected error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeNetworkDisconnected end')
        done()
    })

    /**
     * @tc.name   testWebDownloadErrorCodeNetworkServerDown
     * @tc.number SUB_WEBVIEW_WebDownloadErrorCode_NETWORK_SERVER_DOWN
     * @tc.desc   test WebDownloadErrorCode NETWORK_SERVER_DOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadErrorCodeNetworkServerDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeNetworkServerDown start')
        try {
            expect(webview.WebDownloadErrorCode.NETWORK_SERVER_DOWN).assertEqual(23)
        } catch(error) {
            console.error('testWebDownloadErrorCodeNetworkServerDown error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeNetworkServerDown end')
        done()
    })

    /**
     * @tc.name   testWebDownloadErrorCodeNetworkInvalidRequest
     * @tc.number SUB_WEBVIEW_WebDownloadErrorCode_NETWORK_INVALID_REQUEST
     * @tc.desc   test WebDownloadErrorCode NETWORK_INVALID_REQUEST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadErrorCodeNetworkInvalidRequest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeNetworkInvalidRequest start')
        try {
            expect(webview.WebDownloadErrorCode.NETWORK_INVALID_REQUEST).assertEqual(24)
        } catch(error) {
            console.error('testWebDownloadErrorCodeNetworkInvalidRequest error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeNetworkInvalidRequest end')
        done()
    })

    /**
     * @tc.name   testWebDownloadErrorCodeServerFailed
     * @tc.number SUB_WEBVIEW_WebDownloadErrorCode_SERVER_FAILED
     * @tc.desc   test WebDownloadErrorCode SERVER_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadErrorCodeServerFailed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeServerFailed start')
        try {
            expect(webview.WebDownloadErrorCode.SERVER_FAILED).assertEqual(30)
        } catch(error) {
            console.error('testWebDownloadErrorCodeServerFailed error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeServerFailed end')
        done()
    })

    /**
     * @tc.name   testWebDownloadErrorCodeServerNoRange
     * @tc.number SUB_WEBVIEW_WebDownloadErrorCode_SERVER_NO_RANGE
     * @tc.desc   test WebDownloadErrorCode SERVER_NO_RANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadErrorCodeServerNoRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeServerNoRange start')
        try {
            expect(webview.WebDownloadErrorCode.SERVER_NO_RANGE).assertEqual(31)
        } catch(error) {
            console.error('testWebDownloadErrorCodeServerNoRange error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeServerNoRange end')
        done()
    })

    /**
     * @tc.name   testWebDownloadErrorCodeServerBadContent
     * @tc.number SUB_WEBVIEW_WebDownloadErrorCode_SERVER_BAD_CONTENT
     * @tc.desc   test WebDownloadErrorCode SERVER_BAD_CONTENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadErrorCodeServerBadContent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeServerBadContent start')
        try {
            expect(webview.WebDownloadErrorCode.SERVER_BAD_CONTENT).assertEqual(33)
        } catch(error) {
            console.error('testWebDownloadErrorCodeServerBadContent error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeServerBadContent end')
        done()
    })

    /**
     * @tc.name   testWebDownloadErrorCodeServerUnauthorized
     * @tc.number SUB_WEBVIEW_WebDownloadErrorCode_SERVER_UNAUTHORIZED
     * @tc.desc   test WebDownloadErrorCode SERVER_UNAUTHORIZED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadErrorCodeServerUnauthorized', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeServerUnauthorized start')
        try {
            expect(webview.WebDownloadErrorCode.SERVER_UNAUTHORIZED).assertEqual(34)
        } catch(error) {
            console.error('testWebDownloadErrorCodeServerUnauthorized error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeServerUnauthorized end')
        done()
    })

    /**
     * @tc.name   testWebDownloadErrorCodeServerCertProblem
     * @tc.number SUB_WEBVIEW_WebDownloadErrorCode_SERVER_CERT_PROBLEM
     * @tc.desc   test WebDownloadErrorCode SERVER_CERT_PROBLEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadErrorCodeServerCertProblem', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeServerCertProblem start')
        try {
            expect(webview.WebDownloadErrorCode.SERVER_CERT_PROBLEM).assertEqual(35)
        } catch(error) {
            console.error('testWebDownloadErrorCodeServerCertProblem error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeServerCertProblem end')
        done()
    })

    /**
     * @tc.name   testWebDownloadErrorCodeServerForbidden
     * @tc.number SUB_WEBVIEW_WebDownloadErrorCode_SERVER_FORBIDDEN
     * @tc.desc   test WebDownloadErrorCode SERVER_FORBIDDEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadErrorCodeServerForbidden', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeServerForbidden start')
        try {
            expect(webview.WebDownloadErrorCode.SERVER_FORBIDDEN).assertEqual(36)
        } catch(error) {
            console.error('testWebDownloadErrorCodeServerForbidden error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeServerForbidden end')
        done()
    })

    /**
     * @tc.name   testWebDownloadErrorCodeServerUnreachable
     * @tc.number SUB_WEBVIEW_WebDownloadErrorCode_SERVER_UNREACHABLE
     * @tc.desc   test WebDownloadErrorCode SERVER_UNREACHABLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadErrorCodeServerUnreachable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeServerUnreachable start')
        try {
            expect(webview.WebDownloadErrorCode.SERVER_UNREACHABLE).assertEqual(37)
        } catch(error) {
            console.error('testWebDownloadErrorCodeServerUnreachable error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeServerUnreachable end')
        done()
    })

    /**
     * @tc.name   testWebDownloadErrorCodeServerContentLengthMismatch
     * @tc.number SUB_WEBVIEW_WebDownloadErrorCode_SERVER_CONTENT_LENGTH_MISMATCH
     * @tc.desc   test WebDownloadErrorCode SERVER_CONTENT_LENGTH_MISMATCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadErrorCodeServerContentLengthMismatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeServerContentLengthMismatch start')
        try {
            expect(webview.WebDownloadErrorCode.SERVER_CONTENT_LENGTH_MISMATCH).assertEqual(38)
        } catch(error) {
            console.error('testWebDownloadErrorCodeServerContentLengthMismatch error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeServerContentLengthMismatch end')
        done()
    })

    /**
     * @tc.name   testWebDownloadErrorCodeServerCrossOriginRedirect
     * @tc.number SUB_WEBVIEW_WebDownloadErrorCode_SERVER_CROSS_ORIGIN_REDIRECT
     * @tc.desc   test WebDownloadErrorCode SERVER_CROSS_ORIGIN_REDIRECT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadErrorCodeServerCrossOriginRedirect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeServerCrossOriginRedirect start')
        try {
            expect(webview.WebDownloadErrorCode.SERVER_CROSS_ORIGIN_REDIRECT).assertEqual(39)
        } catch(error) {
            console.error('testWebDownloadErrorCodeServerCrossOriginRedirect error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeServerCrossOriginRedirect end')
        done()
    })

    /**
     * @tc.name   testWebDownloadErrorCodeUserCanceled
     * @tc.number SUB_WEBVIEW_WebDownloadErrorCode_USER_CANCELED
     * @tc.desc   test WebDownloadErrorCode USER_CANCELED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadErrorCodeUserCanceled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeUserCanceled start')
        try {
            expect(webview.WebDownloadErrorCode.USER_CANCELED).assertEqual(40)
        } catch(error) {
            console.error('testWebDownloadErrorCodeUserCanceled error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeUserCanceled end')
        done()
    })

    /**
     * @tc.name   testWebDownloadErrorCodeUserShutdown
     * @tc.number SUB_WEBVIEW_WebDownloadErrorCode_USER_SHUTDOWN
     * @tc.desc   test WebDownloadErrorCode USER_SHUTDOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadErrorCodeUserShutdown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeUserShutdown start')
        try {
            expect(webview.WebDownloadErrorCode.USER_SHUTDOWN).assertEqual(41)
        } catch(error) {
            console.error('testWebDownloadErrorCodeUserShutdown error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeUserShutdown end')
        done()
    })

    /**
     * @tc.name   testWebDownloadErrorCodeCrash
     * @tc.number SUB_WEBVIEW_WebDownloadErrorCode_CRASH
     * @tc.desc   test WebDownloadErrorCode CRASH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebDownloadErrorCodeCrash', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebDownloadErrorCodeCrash start')
        try {
            expect(webview.WebDownloadErrorCode.CRASH).assertEqual(50)
        } catch(error) {
            console.error('testWebDownloadErrorCodeCrash error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebDownloadErrorCodeCrash end')
        done()
    })

  })
}