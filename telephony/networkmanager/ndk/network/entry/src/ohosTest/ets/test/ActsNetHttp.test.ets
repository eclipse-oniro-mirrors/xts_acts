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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import NetHttpTest from 'libnethttptest.so'

const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;
const CASE_INDEX_5 = 4;
const CASE_INDEX_6 = 6;
const CASE_INDEX_7 = 7;
const CASE_INDEX_8 = 8;
const CASE_INDEX_9 = 9;
const CASE_INDEX_10 = 10;
const CASE_INDEX_11 = 11;
const CASE_INDEX_12 = 12;
const CASE_INDEX_13 = 13;
const CASE_INDEX_14 = 14;

const OH_HTTP_OK = 0;
const OH_HTTP_RESULT_OK = 0;
const NETCONN_PERMISSION_DENIED = 201;
const OH_HTTP_PARAMETER_ERROR = 401;
const OH_HTTP_OUT_OF_MEMORY = 2300027;
const NETCONN_INTERNAL_ERROR = 2100003;

export default function ActsNetHttpTest() {
  describe('ActsNetHttpTest', () => {

    /**
     * @tc.number  : SUB_NetworkManager_Http_CreateHeaders_0100
     * @tc.name    : testNetworkManagerHttpCreateHeaders0100
     * @tc.desc    : Verify creation of HTTP headers
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpCreateHeaders0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpCreateHeaders0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_CreateHeaders();
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }

    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_SetHeaderValue_0100
     * @tc.name    : testNetworkManagerHttpSetHeaderValue0100
     * @tc.desc    : Verify setting a header value in HTTP headers
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */

    it('testNetworkManagerHttpSetHeaderValue0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpSetHeaderValue0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_SetHeaderValue(CASE_INDEX_1);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_PARAMETER_ERROR);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_SetHeaderValue_0200
     * @tc.name    : testNetworkManagerHttpSetHeaderValue0200
     * @tc.desc    : Verify setting a header value in HTTP headers
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpSetHeaderValue0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpSetHeaderValue0200';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_SetHeaderValue(CASE_INDEX_2);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_PARAMETER_ERROR);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_SetHeaderValue_0300
     * @tc.name    : testNetworkManagerHttpSetHeaderValue0300
     * @tc.desc    : Verify setting a header value in HTTP headers
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpSetHeaderValue0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpSetHeaderValue0300';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_SetHeaderValue(CASE_INDEX_3);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_SetHeaderValue_0400
     * @tc.name    : testNetworkManagerHttpSetHeaderValue0400
     * @tc.desc    : Verify setting a header value in HTTP headers
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpSetHeaderValue0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpSetHeaderValue0400';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_SetHeaderValue(CASE_INDEX_4);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_PARAMETER_ERROR);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_SetHeaderValue_0500
     * @tc.name    : testNetworkManagerHttpSetHeaderValue0500
     * @tc.desc    : Verify setting a header value in HTTP headers
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpSetHeaderValue0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpSetHeaderValue0500';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_SetHeaderValue(CASE_INDEX_5);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_PARAMETER_ERROR);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_SetHeaderValue_0600
     * @tc.name    : testNetworkManagerHttpSetHeaderValue0600
     * @tc.desc    : Verify setting a header value in HTTP headers
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpSetHeaderValue0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpSetHeaderValue0600';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_SetHeaderValue(CASE_INDEX_6);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_PARAMETER_ERROR);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_GetHeaderValue_0100
     * @tc.name    : testNetworkManagerHttpGetHeaderValue0100
     * @tc.desc    : Verify getting a header value in HTTP headers
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpGetHeaderValue0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpGetHeaderValue0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_GetHeaderValue(CASE_INDEX_1);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })
    /**
     * @tc.number  : SUB_NetworkManager_Http_GetHeaderValue_0200
     * @tc.name    : testNetworkManagerHttpGetHeaderValue0200
     * @tc.desc    : Verify getting a header value in HTTP headers
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpGetHeaderValue0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpGetHeaderValue0200';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_GetHeaderValue(CASE_INDEX_2);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }

    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_GetHeaderValue_0300
     * @tc.name    : testNetworkManagerHttpGetHeaderValue0300
     * @tc.desc    : Verify getting a header value in HTTP headers
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpGetHeaderValue0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpGetHeaderValue0300';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_GetHeaderValue(CASE_INDEX_3);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_GetHeaderValue_0400
     * @tc.name    : testNetworkManagerHttpGetHeaderValue0400
     * @tc.desc    : Verify getting a header value in HTTP headers
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpGetHeaderValue0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpGetHeaderValue0400';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_GetHeaderValue(CASE_INDEX_4);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }

    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_GetHeaderEntries_0100
     * @tc.name    : testNetworkManagerHttpGetHeaderEntries0100
     * @tc.desc    : Verify getting header entries in HTTP headers
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpGetHeaderEntries0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpGetHeaderEntries0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_GetHeaderEntries(CASE_INDEX_1);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_GetHeaderEntries_0200
     * @tc.name    : testNetworkManagerHttpGetHeaderEntries0200
     * @tc.desc    : Verify getting header entries in HTTP headers
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpGetHeaderEntries0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpGetHeaderEntries0200';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_GetHeaderEntries(CASE_INDEX_2);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }

    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_DestroyHeaderEntries_0100
     * @tc.name    : testNetworkManagerHttpDestroyHeaderEntries0100
     * @tc.desc    : Verify proper cleanup of HTTP header entries
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpDestroyHeaderEntries0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpDestroyHeaderEntries0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_DestroyHeaderEntries(CASE_INDEX_1);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_DestroyHeaderEntries_0200
     * @tc.name    : testNetworkManagerHttpDestroyHeaderEntries0200
     * @tc.desc    : Verify proper cleanup of HTTP header entries
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpDestroyHeaderEntries0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpDestroyHeaderEntries0200';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_DestroyHeaderEntries(CASE_INDEX_2);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /*
      * @tc.number  : SUB_NetworkManager_Http_CreateRequest_0100
      * @tc.name    : testNetworkManagerHttpCreateRequest0100
      * @tc.desc    : Verify creation of HTTP request
      * @tc.level   : Level2
      * @tc.size    : SmallTest
      * @tc.type    : Function
      */

    it('testNetworkManagerHttpCreateRequest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpCreateRequest0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_CreateRequest("");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }

    })

    /*
    * @tc.number  : SUB_NetworkManager_Http_CreateRequest_0200
    * @tc.name    : testNetworkManagerHttpCreateRequest0200
    * @tc.desc    : Verify creation of HTTP request
    * @tc.level   : Level2
    * @tc.size    : SmallTest
    * @tc.type    : Function
    */

    it('testNetworkManagerHttpCreateRequest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpCreateRequest0200';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_CreateRequest("https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_0100
     * @tc.name    : testNetworkManagerHttpRequest0100
     * @tc.desc    : Verify HTTP request execution
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpRequest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequest0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_RequestRequest(CASE_INDEX_1, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_0200
     * @tc.name    : testNetworkManagerHttpRequest0200
     * @tc.desc    : Verify HTTP request execution with invalid URL
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpRequest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequest0200';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_RequestRequest(CASE_INDEX_2, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OUT_OF_MEMORY);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_0300
     * @tc.name    : testNetworkManagerHttpRequest0300
     * @tc.desc    : Verify HTTP request execution with invalid URL
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpRequest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequest0300';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_RequestRequest(CASE_INDEX_3, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OUT_OF_MEMORY);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_0400
     * @tc.name    : testNetworkManagerHttpRequest0400
     * @tc.desc    : Verify HTTP request execution with invalid URL
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpRequest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequest0400';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_RequestRequest(CASE_INDEX_4, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OUT_OF_MEMORY);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Destroy_0100
     * @tc.name    : testNetworkManagerHttpDestroy0100
     * @tc.desc    : Verify proper cleanup of HTTP resources
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpDestroy0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpDestroy0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Destroy(CASE_INDEX_1, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Destroy_0200
     * @tc.name    : testNetworkManagerHttpDestroy0200
     * @tc.desc    : Verify proper cleanup of HTTP resources
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpDestroy0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpDestroy0200';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Destroy(CASE_INDEX_2, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_ErrCode_0100
     * @tc.name    : testNetworkManagerHttpErrCode0100
     * @tc.desc    : Verify retrieval of error codes from HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpErrCode0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpErrCode0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_ErrCodeErrCode(CASE_INDEX_1, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_ErrCode_0200
     * @tc.name    : testNetworkManagerHttpErrCode0200
     * @tc.desc    : Verify retrieval of error codes from HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpErrCode0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpErrCode0200';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_ErrCodeErrCode(CASE_INDEX_2, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_PARAMETER_ERROR);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })


    /**
     * @tc.number  : SUB_NetworkManager_Http_ErrCode_0300
     * @tc.name    : testNetworkManagerHttpErrCode0300
     * @tc.desc    : Verify retrieval of error codes from HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpErrCode0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpErrCode0300';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_ErrCodeErrCode(CASE_INDEX_3, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OUT_OF_MEMORY);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Buffer_0100
     * @tc.name    : testNetworkManagerHttpBuffer0100
     * @tc.desc    : Verify retrieval of buffer from HTTP response
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpBuffer0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpBuffer0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_BufferBuffer("https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_AddressFamilyType_0100
     * @tc.name    : testNetworkManagerHttpAddressFamilyType0100
     * @tc.desc    : Verify retrieval of address family type from HTTP response
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpAddressFamilyType0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpAddressFamilyType0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Address_FamilyType(CASE_INDEX_1, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_AddressFamilyType_0200
     * @tc.name    : testNetworkManagerHttpAddressFamilyType0200
     * @tc.desc    : Verify retrieval of address family type from HTTP response
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpAddressFamilyType0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpAddressFamilyType0200';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Address_FamilyType(CASE_INDEX_2, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_AddressFamilyType_0300
     * @tc.name    : testNetworkManagerHttpAddressFamilyType0300
     * @tc.desc    : Verify retrieval of address family type from HTTP response
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpAddressFamilyType0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpAddressFamilyType0300';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Address_FamilyType(CASE_INDEX_3, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_HttpProtocol_0100
     * @tc.name    : testNetworkManagerHttpHttpProtocol0100
     * @tc.desc    : Verify retrieval of HTTP protocol from HTTP response
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpHttpProtocol0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpHttpProtocol0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Http_Protocol(CASE_INDEX_1, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_HttpProtocol_0200
     * @tc.name    : testNetworkManagerHttpHttpProtocol0200
     * @tc.desc    : Verify retrieval of HTTP protocol from HTTP response
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpHttpProtocol0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpHttpProtocol0200';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Http_Protocol(CASE_INDEX_2, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_HttpProtocol_0300
     * @tc.name    : testNetworkManagerHttpHttpProtocol0300
     * @tc.desc    : Verify retrieval of HTTP protocol from HTTP response
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpHttpProtocol0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpHttpProtocol0300';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Http_Protocol(CASE_INDEX_3, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_HttpProtocol_0400
     * @tc.name    : testNetworkManagerHttpHttpProtocol0400
     * @tc.desc    : Verify retrieval of HTTP protocol from HTTP response
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpHttpProtocol0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpHttpProtocol0400';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Http_Protocol(CASE_INDEX_4, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_CertType_0100
     * @tc.name    : testNetworkManagerHttpCertType0100
     * @tc.desc    : Verify retrieval of certificate type from HTTP response
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpCertType0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpCertType0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Cert_Type(CASE_INDEX_1, "https://www.baidu.com", "TEST");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_CertType_0200
     * @tc.name    : testNetworkManagerHttpCertType0200
     * @tc.desc    : Verify retrieval of certificate type from HTTP response
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpCertType0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpCertType0200';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Cert_Type(CASE_INDEX_2, "https://www.baidu.com", "TEST");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_CertType_0300
     * @tc.name    : testNetworkManagerHttpCertType0300
     * @tc.desc    : Verify retrieval of certificate type from HTTP response
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpCertType0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpCertType0300';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Cert_Type(CASE_INDEX_3, "https://www.baidu.com", "TEST");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_HeaderValue_0100
     * @tc.name    : testNetworkManagerHttpHeaderValue0100
     * @tc.desc    : Verify setting a header value in HTTP headers
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpHeaderValue0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpHeaderValue0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Header_Value("https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_HeaderEntry_0100
     * @tc.name    : testNetworkManagerHttpHeaderEntry0100
     * @tc.desc    : Verify setting a header value in HTTP headers
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpHeaderEntry0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpHeaderEntry0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Header_Entry("https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_ClientCert_0100
     * @tc.name    : testNetworkManagerHttpClientCert0100
     * @tc.desc    : Verify setting client certificate in HTTP headers
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpClientCert0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpClientCert0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Client_Cert("https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_ProxyType_0100
     * @tc.name    : testNetworkManagerHttpProxyType0100
     * @tc.desc    : Verify setting proxy type in HTTP headers
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpProxyType0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpProxyType0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Proxy_Type(CASE_INDEX_1, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_ProxyType_0200
     * @tc.name    : testNetworkManagerHttpProxyType0200
     * @tc.desc    : Verify setting proxy type in HTTP headers
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpProxyType0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpProxyType0200';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Proxy_Type(CASE_INDEX_2, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_ProxyType_0300
     * @tc.name    : testNetworkManagerHttpProxyType0300
     * @tc.desc    : Verify setting proxy type in HTTP headers
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpProxyType0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpProxyType0300';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Proxy_Type(CASE_INDEX_3, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Custom_Proxy_0100
     * @tc.name    : testNetworkManagerHttpCustomProxy0100
     * @tc.desc    : Test Http_Custom_Proxy interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpCustomProxy0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpCustomProxy0100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetHttpTest.Http_Custom_Proxy(CASE_INDEX_1, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Custom_Proxy_0200
     * @tc.name    : testNetworkManagerHttpCustomProxy0200
     * @tc.desc    : Test Http_Custom_Proxy interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpCustomProxy0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpCustomProxy0200';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetHttpTest.Http_Custom_Proxy(CASE_INDEX_2, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })
    /**
     * @tc.number  : SUB_NetworkManager_Http_Custom_Proxy_0300
     * @tc.name    : testNetworkManagerHttpCustomProxy0300
     * @tc.desc    : Test Http_Custom_Proxy interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpCustomProxy0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpCustomProxy0300';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetHttpTest.Http_Custom_Proxy(CASE_INDEX_3, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Proxy_0100
     * @tc.name    : testNetworkManagerHttpProxy0100
     * @tc.desc    : Test Http_Proxy interface.
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpProxy0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpProxy0100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetHttpTest.Http_ProxyProxy("https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

      /**
       * @tc.number  : SUB_NetworkManager_Http_Performance_Timing_0100
       * @tc.name    : testNetworkManagerHttpPerformanceTiming0100
       * @tc.desc    : Verify performance timing of HTTP requests
       * @tc.level   : Level2
       * @tc.size    : SmallTest
       * @tc.type    : Function
       */
      /
    it('testNetworkManagerHttpPerformanceTiming0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpPerformanceTiming0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Performance_Timing(CASE_INDEX_1, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Performance_Timing_0200
     * @tc.name    : testNetworkManagerHttpPerformanceTiming0200
     * @tc.desc    : Verify performance timing of HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpPerformanceTiming0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpPerformanceTiming0200';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Performance_Timing(CASE_INDEX_2, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })
    /**
     * @tc.number  : SUB_NetworkManager_Http_Performance_Timing_0300
     * @tc.name    : testNetworkManagerHttpPerformanceTiming0300
     * @tc.desc    : Verify performance timing of HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpPerformanceTiming0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpPerformanceTiming0300';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Performance_Timing(CASE_INDEX_3, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Performance_Timing_0400
     * @tc.name    : testNetworkManagerHttpPerformanceTiming0400
     * @tc.desc    : Verify performance timing of HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpPerformanceTiming0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpPerformanceTiming0400';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Performance_Timing(CASE_INDEX_4, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Performance_Timing_0500
     * @tc.name    : testNetworkManagerHttpPerformanceTiming0500
     * @tc.desc    : Verify performance timing of HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpPerformanceTiming0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpPerformanceTiming0500';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Performance_Timing(CASE_INDEX_5, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Performance_Timing_0600
     * @tc.name    : testNetworkManagerHttpPerformanceTiming0600
     * @tc.desc    : Verify performance timing of HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpPerformanceTiming0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpPerformanceTiming0600';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Performance_Timing(CASE_INDEX_6, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Performance_Timing_0700
     * @tc.name    : testNetworkManagerHttpPerformanceTiming0700
     * @tc.desc    : Verify performance timing of HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpPerformanceTiming0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpPerformanceTiming0700';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Performance_Timing(CASE_INDEX_7, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Option_0100
     * @tc.name    : testNetworkManagerHttpRequestOption0100
     * @tc.desc    : Verify setting request options for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpRequestOption0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestOption0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Request_Option(CASE_INDEX_1, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Option_0200
     * @tc.name    : testNetworkManagerHttpRequestOption0200
     * @tc.desc    : Verify setting request options for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpRequestOption0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestOption0200';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Request_Option(CASE_INDEX_2, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Option_0300
     * @tc.name    : testNetworkManagerHttpRequestOption0300
     * @tc.desc    : Verify setting request options for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpRequestOption0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestOption0300';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Request_Option(CASE_INDEX_3, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Option_0400
     * @tc.name    : testNetworkManagerHttpRequestOption0400
     * @tc.desc    : Verify setting request options for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpRequestOption0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestOption0400';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Request_Option(CASE_INDEX_4, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Option_0500
     * @tc.name    : testNetworkManagerHttpRequestOption0500
     * @tc.desc    : Verify setting request options for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpRequestOption0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestOption0500';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Request_Option(CASE_INDEX_5, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Option_0600
     * @tc.name    : testNetworkManagerHttpRequestOption0600
     * @tc.desc    : Verify setting request options for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpRequestOption0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestOption0600';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Request_Option(CASE_INDEX_6, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Option_0700
     * @tc.name    : testNetworkManagerHttpRequestOption0700
     * @tc.desc    : Verify setting request options for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpRequestOption0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestOption0700';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Request_Option(CASE_INDEX_7, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Option_0800
     * @tc.name    : testNetworkManagerHttpRequestOption0800
     * @tc.desc    : Verify setting request options for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpRequestOption0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestOption0800';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Request_Option(CASE_INDEX_8, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Option_0900
     * @tc.name    : testNetworkManagerHttpRequestOption0900
     * @tc.desc    : Verify setting request options for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpRequestOption0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestOption0900';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Request_Option(CASE_INDEX_9, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Option_1000
     * @tc.name    : testNetworkManagerHttpRequestOption1000
     * @tc.desc    : Verify setting request options for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpRequestOption1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestOption1000';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Request_Option(CASE_INDEX_10, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Option_1100
     * @tc.name    : testNetworkManagerHttpRequestOption1100
     * @tc.desc    : Verify setting request options for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpRequestOption1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestOption1100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Request_Option(CASE_INDEX_11, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })
    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Option_1200
     * @tc.name    : testNetworkManagerHttpRequestOption1200
     * @tc.desc    : Verify setting request options for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpRequestOption1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestOption1200';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Request_Option(CASE_INDEX_12, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Option_1300
     * @tc.name    : testNetworkManagerHttpRequestOption1300
     * @tc.desc    : Verify setting request options for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpRequestOption1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestOption1300';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Request_Option(CASE_INDEX_13, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Option_1400
     * @tc.name    : testNetworkManagerHttpRequestOption1400
     * @tc.desc    : Verify setting request options for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpRequestOption1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestOption1400';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Request_Option(CASE_INDEX_14, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Response_0100
     * @tc.name    : testNetworkManagerHttpResponse0100
     * @tc.desc    : Verify setting response options for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpResponse0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpResponse0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Resps(CASE_INDEX_1, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Response_0200
     * @tc.name    : testNetworkManagerHttpResponse0200
     * @tc.desc    : Verify setting response options for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpResponse0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpResponse0200';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Resps(CASE_INDEX_2, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Response_0300
     * @tc.name    : testNetworkManagerHttpResponse0300
     * @tc.desc    : Verify setting response options for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpResponse0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpResponse0300';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Resps(CASE_INDEX_3, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Response_0400
     * @tc.name    : testNetworkManagerHttpResponse0400
     * @tc.desc    : Verify setting response options for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpResponse0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpResponse0400';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Resps(CASE_INDEX_4, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Response_0500
     * @tc.name    : testNetworkManagerHttpResponse0500
     * @tc.desc    : Verify setting response options for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpResponse0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpResponse0500';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Resps(CASE_INDEX_5, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Response_0600
     * @tc.name    : testNetworkManagerHttpResponse0600
     * @tc.desc    : Verify setting response options for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpResponse0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpResponse0600';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Resps(CASE_INDEX_6, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Req_0100
     * @tc.name    : testNetworkManagerHttpReq0100
     * @tc.desc    : Verify request for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpReq0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpReq0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Req(CASE_INDEX_1, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Req_0200
     * @tc.name    : testNetworkManagerHttpReq0200
     * @tc.desc    : Verify request for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpReq0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpReq0200';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Req(CASE_INDEX_2, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Req_0300
     * @tc.name    : testNetworkManagerHttpReq0300
     * @tc.desc    : Verify request for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpReq0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpReq0300';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Req(CASE_INDEX_3, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_EventHandler_0100
     * @tc.name    : testNetworkManagerHttpEventHandler0100
     * @tc.desc    : Verify Http event handler for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpEventHandler0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpEventHandler0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Events_Handler(CASE_INDEX_1, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_EventHandler_0200
     * @tc.name    : testNetworkManagerHttpEventHandler0200
     * @tc.desc    : Verify Http event handler for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpEventHandler0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpEventHandler0200';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Events_Handler(CASE_INDEX_2, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_EventHandler_0300
     * @tc.name    : testNetworkManagerHttpEventHandler0300
     * @tc.desc    : Verify Http event handler for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpEventHandler0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpEventHandler0300';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Events_Handler(CASE_INDEX_3, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_EventHandler_0400
     * @tc.name    : testNetworkManagerHttpEventHandler0400
     * @tc.desc    : Verify Http event handler for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpEventHandler0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpEventHandler0400';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Events_Handler(CASE_INDEX_4, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_EventHandler_0500
     * @tc.name    : testNetworkManagerHttpEventHandler0500
     * @tc.desc    : Verify Http event handler for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpEventHandler0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpEventHandler0500';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Events_Handler(CASE_INDEX_5, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
        done();
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_EventHandler_0600
     * @tc.name    : testNetworkManagerHttpEventHandler0600
     * @tc.desc    : Verify Http event handler for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpEventHandler0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpEventHandler0600';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_Events_Handler(CASE_INDEX_6, "https://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(NETCONN_PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_DestroyHeaders_0100
     * @tc.name    : testNetworkManagerHttpDestroyHeaders0100
     * @tc.desc    : Verify Http destroy headers for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpDestroyHeaders0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpDestroyHeaders0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_DestroyHeaders(CASE_INDEX_1);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_DestroyHeaders_0200
     * @tc.name    : testNetworkManagerHttpDestroyHeaders0200
     * @tc.desc    : Verify Http destroy headers for HTTP requests
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpDestroyHeaders0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpDestroyHeaders0200';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_DestroyHeaders(CASE_INDEX_2);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_OH_HTTP_RESULT_OK_0100
     * @tc.name    : testNetworkManagerOHHTTPRESULTOK0100
     * @tc.desc    : Verify OH_HTTP_RESULT_OK HTTP Error Code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerOHHTTPRESULTOK0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerOHHTTPRESULTOK0100';
      try {
        console.info(`${caseName} ---start`);
        let result: number = NetHttpTest.Http_SetHeaderValue(CASE_INDEX_3);
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_RESULT_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })
  })
}
