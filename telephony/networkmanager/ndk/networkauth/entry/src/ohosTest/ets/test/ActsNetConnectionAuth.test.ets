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
import NetConnectionAuthTest from 'libnetconnectionauthtest.so'

const OH_HTTP_RESULT_OK = 0;
const OH_HTTP_OK = 0;
const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;
const CASE_INDEX_5 = 5;
const CASE_INDEX_6 = 6;
const CASE_INDEX_7 = 7;
const CASE_INDEX_8 = 8;

const WEBSOCKET_CONNECTION_ERROR = 1003
const WEBSOCKET_CONNECTION_PARSE_URL_ERROR = 1005
const WEBSOCKET_CONNECTION_NO_MEMORY = 1006
const WEBSOCKET_CONNECTION_CLOSED_BY_PEER = 1007
const WEBSOCKET_DESTROYED = 1008
const WEBSOCKET_PROTOCOL_ERROR = 1009
const WEBSOCKET_SEND_NO_MEMORY = 1010

const WEBSOCKET_DATA_LENGTH_EXCEEDED = 1012
const WEBSOCKET_QUEUE_LENGTH_EXCEEDED = 1013
const WEBSOCKET_NO_CLIENT_CONTEXT = 1014
const WEBSOCKET_NO_HEADER_CONTEXT = 1015

const WEBSOCKET_HEADER_EXCEEDED = 1016;
const WEBSOCKET_NO_CONNECTION = 1017;
const WEBSOCKET_NO_CONNECTION_CONTEXT = 1018;

const OH_HTTP_UNSUPPORTED_PROTOCOL = 2300001;
const OH_HTTP_INVALID_URL = 2300003;
const OH_HTTP_RESOLVE_PROXY_FAILED = 2300005;
const OH_HTTP_RESOLVE_HOST_FAILED = 2300006;
const OH_HTTP_CONNECT_SERVER_FAILED = 2300007;
const OH_HTTP_INVALID_SERVER_RESPONSE = 2300008;
const OH_HTTP_ACCESS_REMOTE_DENIED = 2300009;
const OH_HTTP_HTTP2_FRAMING_ERROR = 2300016;
const OH_HTTP_TRANSFER_PARTIAL_FILE = 2300018;
const OH_HTTP_WRITE_DATA_FAILED = 2300023;
const OH_HTTP_UPLOAD_FAILED = 2300025;
const OH_HTTP_OPEN_LOCAL_DATA_FAILED = 2300026;

const OH_HTTP_CREATED = 201;
const OH_HTTP_ACCEPTED = 202;
const OH_HTTP_NOT_AUTHORITATIVE = 203;
const OH_HTTP_NO_CONTENT = 204;
const OH_HTTP_RESET = 205;
const OH_HTTP_PARTIAL = 206;
const OH_HTTP_MULT_CHOICE = 300;
const OH_HTTP_MOVED_PERM = 301;
const OH_HTTP_MOVED_TEMP = 302;
const OH_HTTP_SEE_OTHER = 303;
const OH_HTTP_NOT_MODIFIED = 304;
const OH_HTTP_USE_PROXY = 305;
const OH_HTTP_BAD_REQUEST = 400;
const OH_HTTP_UNAUTHORIZED = 401;
const OH_HTTP_PAYMENT_REQUIRED = 402;
const OH_HTTP_FORBIDDEN = 403;
const OH_HTTP_NOT_FOUND = 404;
const OH_HTTP_BAD_METHOD = 405;
const OH_HTTP_NOT_ACCEPTABLE = 406;
const OH_HTTP_PROXY_AUTH = 407;
const OH_HTTP_CLIENT_TIMEOUT = 408;
const OH_HTTP_CONFLICT = 409;
const OH_HTTP_GONE = 410;
const OH_HTTP_LENGTH_REQUIRED = 411;
const OH_HTTP_PRECON_FAILED = 412;
const OH_HTTP_ENTITY_TOO_LARGE = 413;
const OH_HTTP_REQ_TOO_LONG = 414;
const OH_HTTP_UNSUPPORTED_TYPE = 415;
const OH_HTTP_RANGE_NOT_SATISFIABLE = 416;
const OH_HTTP_INTERNAL_ERROR = 500;
const OH_HTTP_NOT_IMPLEMENTED = 501;
const OH_HTTP_BAD_GATEWAY = 502;
const OH_HTTP_UNAVAILABLE = 503;
const OH_HTTP_GATEWAY_TIMEOUT = 504;
const OH_HTTP_VERSION = 505;



export default function ActsNetConnectionAuth() {
  describe('ActsNetConnectionAuth', () => {
    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_0900
     * @tc.name    : testNetworkManagerHttpRequestAuth0900
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpRequestAuth0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth0900';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_CREATED, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_CREATED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_1000
     * @tc.name    : testNetworkManagerHttpRequestAuth1000  
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpRequestAuth1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth1000';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_ACCEPTED, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_ACCEPTED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_1100
     * @tc.name    : testNetworkManagerHttpRequestAuth1100
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpRequestAuth1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth1100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_NOT_AUTHORITATIVE, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_NOT_AUTHORITATIVE);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_1200
     * @tc.name    : testNetworkManagerHttpRequestAuth1200
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpRequestAuth1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth1200';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_NO_CONTENT, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_NO_CONTENT);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_1300
     * @tc.name    : testNetworkManagerHttpRequestAuth1300
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpRequestAuth1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth1300';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_RESET, "http://www.baidu.com");

        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_RESET);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_1400
     * @tc.name    : testNetworkManagerHttpRequestAuth1400
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpRequestAuth1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth1400';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_PARTIAL, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_PARTIAL);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_1500
     * @tc.name    : testNetworkManagerHttpRequestAuth1500
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpRequestAuth1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth1500';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_MULT_CHOICE, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_MULT_CHOICE);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_1600
     * @tc.name    : testNetworkManagerHttpRequestAuth1600
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpRequestAuth1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth1600';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_MOVED_PERM, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_MOVED_PERM);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_1700
     * @tc.name    : testNetworkManagerHttpRequestAuth1700
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpRequestAuth1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth1700';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_MOVED_TEMP, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_MOVED_TEMP);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_1800
     * @tc.name    : testNetworkManagerHttpRequestAuth1800
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpRequestAuth1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth1800';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_SEE_OTHER, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_SEE_OTHER);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_1900
     * @tc.name    : testNetworkManagerHttpRequestAuth1900
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */

    it('testNetworkManagerHttpRequestAuth1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth1900';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_NOT_MODIFIED, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_NOT_MODIFIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_2000
     * @tc.name    : testNetworkManagerHttpRequestAuth2000
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerHttpRequestAuth2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth2000';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_USE_PROXY, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_USE_PROXY);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })



    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_2100
     * @tc.name    : testNetworkManagerHttpRequestAuth2100
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
      it('testNetworkManagerHttpRequestAuth2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth2100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_BAD_REQUEST, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_BAD_REQUEST);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_2200
     * @tc.name    : testNetworkManagerHttpRequestAuth2200
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
      it('testNetworkManagerHttpRequestAuth2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth2200';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_UNAUTHORIZED, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_UNAUTHORIZED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_2300
     * @tc.name    : testNetworkManagerHttpRequestAuth2300
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
      it('testNetworkManagerHttpRequestAuth2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth2300';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_PAYMENT_REQUIRED, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_PAYMENT_REQUIRED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_2400
     * @tc.name    : testNetworkManagerHttpRequestAuth2400
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
      it('testNetworkManagerHttpRequestAuth2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth2400';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_FORBIDDEN, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_FORBIDDEN);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })


    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_2500
     * @tc.name    : testNetworkManagerHttpRequestAuth2500
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
      it('testNetworkManagerHttpRequestAuth2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth2500';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_NOT_FOUND, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_NOT_FOUND);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_2600
     * @tc.name    : testNetworkManagerHttpRequestAuth2600
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
      it('testNetworkManagerHttpRequestAuth2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth2600';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_BAD_METHOD, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_BAD_METHOD);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_2700
     * @tc.name    : testNetworkManagerHttpRequestAuth2700
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
      it('testNetworkManagerHttpRequestAuth2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth2700';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_NOT_ACCEPTABLE, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_NOT_ACCEPTABLE);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_2800
     * @tc.name    : testNetworkManagerHttpRequestAuth2800
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
      it('testNetworkManagerHttpRequestAuth2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth2800';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_PROXY_AUTH, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_PROXY_AUTH);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_2900
     * @tc.name    : testNetworkManagerHttpRequestAuth2900
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
      it('testNetworkManagerHttpRequestAuth2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth2900';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_CLIENT_TIMEOUT, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_CLIENT_TIMEOUT);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_3000
     * @tc.name    : testNetworkManagerHttpRequestAuth3000
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
      it('testNetworkManagerHttpRequestAuth3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth3000';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_CONFLICT, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_CONFLICT);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })
  
    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_3100
     * @tc.name    : testNetworkManagerHttpRequestAuth3100
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
      it('testNetworkManagerHttpRequestAuth3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth3100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_GONE, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_GONE);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

        /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_3200
     * @tc.name    : testNetworkManagerHttpRequestAuth3200
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
      it('testNetworkManagerHttpRequestAuth3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth3200';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_LENGTH_REQUIRED, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_LENGTH_REQUIRED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_3300
     * @tc.name    : testNetworkManagerHttpRequestAuth3300
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
      it('testNetworkManagerHttpRequestAuth3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth3300';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_PRECON_FAILED, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_PRECON_FAILED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_3400
     * @tc.name    : testNetworkManagerHttpRequestAuth3400
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
      it('testNetworkManagerHttpRequestAuth3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth3400';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_ENTITY_TOO_LARGE, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_ENTITY_TOO_LARGE);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

        /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_3500
     * @tc.name    : testNetworkManagerHttpRequestAuth3500
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
      it('testNetworkManagerHttpRequestAuth3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth3500';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_REQ_TOO_LONG, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_REQ_TOO_LONG);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_3600
     * @tc.name    : testNetworkManagerHttpRequestAuth3600
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
      it('testNetworkManagerHttpRequestAuth3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth3600';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_UNSUPPORTED_TYPE, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_UNSUPPORTED_TYPE);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_3700
     * @tc.name    : testNetworkManagerHttpRequestAuth3700
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
      it('testNetworkManagerHttpRequestAuth3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth3700';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_RANGE_NOT_SATISFIABLE, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_RANGE_NOT_SATISFIABLE);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

        /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_3800
     * @tc.name    : testNetworkManagerHttpRequestAuth3800
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
      it('testNetworkManagerHttpRequestAuth3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth3800';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_INTERNAL_ERROR, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_INTERNAL_ERROR);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_3900
     * @tc.name    : testNetworkManagerHttpRequestAuth3900
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
      it('testNetworkManagerHttpRequestAuth3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth3900';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_NOT_IMPLEMENTED, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_NOT_IMPLEMENTED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_4000
     * @tc.name    : testNetworkManagerHttpRequestAuth4000
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
      it('testNetworkManagerHttpRequestAuth4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth4000';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_BAD_GATEWAY, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_BAD_GATEWAY);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_4100
     * @tc.name    : testNetworkManagerHttpRequestAuth4100
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
      it('testNetworkManagerHttpRequestAuth4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth4100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_UNAVAILABLE, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_UNAVAILABLE);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_4200
     * @tc.name    : testNetworkManagerHttpRequestAuth4200
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
      it('testNetworkManagerHttpRequestAuth4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth4200';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_GATEWAY_TIMEOUT, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_GATEWAY_TIMEOUT);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Http_Request_Auth_4300
     * @tc.name    : testNetworkManagerHttpRequestAuth4300
     * @tc.desc    : test Http_Request error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
      it('testNetworkManagerHttpRequestAuth4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth4300';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_VERSION, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_VERSION);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Web_Socket_0100
     * @tc.name    : testNetworkManagerWebSocket0100
     * @tc.desc    : test Web_Socket error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerWebSocket0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocket0100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Web_Socket(CASE_INDEX_1, "www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(WEBSOCKET_NO_CONNECTION);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Web_Socket_0200
     * @tc.name    : testNetworkManagerWebSocket0200
     * @tc.desc    : test Web_Socket error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerWebSocket0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocket0200';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Web_Socket(CASE_INDEX_2, "www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(WEBSOCKET_NO_CONNECTION_CONTEXT);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.number  : SUB_NetworkManager_Web_Socket_0300
     * @tc.name    : testNetworkManagerWebSocket0300
     * @tc.desc    : test Web_Socket error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerWebSocket0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocket0300';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Web_Socket(CASE_INDEX_3, "www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(WEBSOCKET_HEADER_EXCEEDED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
      })

    /**
     * @tc.number  : SUB_NetworkManager_Web_Socket_0500
     * @tc.name    : testNetworkManagerWebSocket0500
     * @tc.desc    : test Web_Socket error code
     * @tc.level   : Level2
     * @tc.size    : SmallTest
     * @tc.type    : Function
     */
    it('testNetworkManagerWebSocket0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocket0500';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Web_Socket(CASE_INDEX_5, "wss://whale.tooly.top/ws");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(WEBSOCKET_DATA_LENGTH_EXCEEDED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })
  })
}
