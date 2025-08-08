/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import { describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base';
import connection from '@ohos.net.connection';

/**
 * @description assert whether the input argument is true
 * @param data
 */
function ExpectTrue(data: Boolean): void {
  try {
    expect(data).assertTrue();
  } catch (e) {
    const error: BusinessError = e as BusinessError;
    console.info(`expect true catch error, code: ${error.code}, message: ${error.message}`);
  }
}

/**
 * @description failure assertions
 */
function ExpectFail(): void {
  try {
    expect().assertFail();
  } catch (e) {
    const error: BusinessError = e as BusinessError;
    console.info(`expect fail catch error, code: ${error.code}, message: ${error.message}`);
  }
}

export default function HttpResponseCodeTest() {
  describe('HttpResponseCodeTest', () => {
    let XTS_TEST_HTTP_URL: string = 'http://www.baidu.com/';

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_0100
     * @tc.name   : testNetworkMgrHttpResponseCode0100
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */
    it('testNetworkMgrHttpResponseCode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode0100';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.OK == 200)
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_0200
     * @tc.name   : testNetworkMgrHttpResponseCode0200
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode0200';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.CREATED == 201)
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_0300
     * @tc.name   : testNetworkMgrHttpResponseCode0300
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2 , async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode0300';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.ACCEPTED == 202);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_0400
     * @tc.name   : testNetworkMgrHttpResponseCode0400
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode0400';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.NOT_AUTHORITATIVE == 203);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_0500
     * @tc.name   : testNetworkMgrHttpResponseCode0500
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode0500';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.NO_CONTENT == 204);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_0600
     * @tc.name   : testNetworkMgrHttpResponseCode0600
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode0600',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode0600';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.RESET == 205);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_0700
     * @tc.name   : testNetworkMgrHttpResponseCode0700
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode0700';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.PARTIAL == 206);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_0800
     * @tc.name   : testNetworkMgrHttpResponseCode0800
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode0800';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.MULT_CHOICE == 300);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_0900
     * @tc.name   : testNetworkMgrHttpResponseCode0900
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode0900';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.MOVED_PERM == 301);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_1000
     * @tc.name   : testNetworkMgrHttpResponseCode1000
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode1000';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.MOVED_TEMP == 302);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_1100
     * @tc.name   : testNetworkMgrHttpResponseCode1100
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode1100';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.SEE_OTHER == 303);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_1200
     * @tc.name   : testNetworkMgrHttpResponseCode1200
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode1200';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.NOT_MODIFIED == 304);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_1300
     * @tc.name   : testNetworkMgrHttpResponseCode1300
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode1300';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.USE_PROXY == 305);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_1400
     * @tc.name   : testNetworkMgrHttpResponseCode1400
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode1400';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.BAD_REQUEST == 400);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_1500
     * @tc.name   : testNetworkMgrHttpResponseCode1500
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode1500';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.UNAUTHORIZED == 401);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_1600
     * @tc.name   : testNetworkMgrHttpResponseCode1600
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode1600';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.PAYMENT_REQUIRED == 402);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_1700
     * @tc.name   : testNetworkMgrHttpResponseCode1700
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode1700';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.FORBIDDEN == 403);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_1800
     * @tc.name   : testNetworkMgrHttpResponseCode1800
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode1800';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.NOT_FOUND == 404);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_1900
     * @tc.name   : testNetworkMgrHttpResponseCode1900
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode1900';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.BAD_METHOD == 405);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_2000
     * @tc.name   : testNetworkMgrHttpResponseCode2000
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode2000';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.NOT_ACCEPTABLE == 406);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_2100
     * @tc.name   : testNetworkMgrHttpResponseCode2100
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode2100';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.PROXY_AUTH == 407);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_2200
     * @tc.name   : testNetworkMgrHttpResponseCode2200
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode2200';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.CLIENT_TIMEOUT == 408);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_2300
     * @tc.name   : testNetworkMgrHttpResponseCode2300
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode2300';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.CONFLICT == 409);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_2400
     * @tc.name   : testResponseCode2400
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode2400';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.GONE == 410);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });


    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_2500
     * @tc.name   : testResponseCode2500
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode2500';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.LENGTH_REQUIRED == 411);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_2600
     * @tc.name   : testNetworkMgrHttpResponseCode2600
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode2600';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.PRECON_FAILED == 412);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_2700
     * @tc.name   : testNetworkMgrHttpResponseCode2700
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode2700';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.ENTITY_TOO_LARGE == 413);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_2800
     * @tc.name   : testNetworkMgrHttpResponseCode2800
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode2800';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.REQ_TOO_LONG == 414);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_2900
     * @tc.name   : testNetworkMgrHttpResponseCode2900
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode2900';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.UNSUPPORTED_TYPE == 415);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_3000
     * @tc.name   : testNetworkMgrHttpResponseCode3000
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode3000';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.INTERNAL_ERROR == 500);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_3100
     * @tc.name   : testNetworkMgrHttpResponseCode3100
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode3100';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.NOT_IMPLEMENTED == 501);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_3200
     * @tc.name   : testNetworkMgrHttpResponseCode3200
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode3200';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.BAD_GATEWAY == 502);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_3300
     * @tc.name   : testNetworkMgrHttpResponseCode3300
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode3300';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.UNAVAILABLE == 503);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_3400
     * @tc.name   : testNetworkMgrHttpResponseCode3400
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode3400';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.GATEWAY_TIMEOUT == 504);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_3500
     * @tc.name   : testNetworkMgrHttpResponseCode3500
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */

    it('testNetworkMgrHttpResponseCode3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode3500';
      console.info(`${caseName} test Start`);
      try {
        ExpectTrue(http.ResponseCode.VERSION == 505);
        done();
      } catch (error) {
        console.info(`${caseName} trycatch error: ${JSON.stringify(error)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_3600
     * @tc.name   : testNetworkMgrHttpResponseCode3600
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */
    it('testNetworkMgrHttpResponseCode3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode3600';
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(XTS_TEST_HTTP_URL, (err: BusinessError, data: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} request success, data: ${JSON.stringify(data)}`);
                  ExpectTrue(data.responseCode == 200);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_3700
     * @tc.name   : testNetworkMgrHttpResponseCode3700
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 0
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */
    it('testNetworkMgrHttpResponseCode3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode3700';
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(XTS_TEST_HTTP_URL).then((data: http.HttpResponse) => {
                console.info(`${caseName} request success, data: ${JSON.stringify(data)}`);
                ExpectTrue(data.responseCode == 200);
                httpRequest.destroy();
                done();
              }).catch((err: BusinessError) => {
                console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_3800
     * @tc.name   : testNetworkMgrHttpResponseCode3800
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */
    it('testNetworkMgrHttpResponseCode3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode3800';
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} Please connect to the network`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(`${XTS_TEST_HTTP_URL}openHarmonyXts`, (err: BusinessError, data: http.HttpResponse) => {
                if (err) {
                  console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  console.info(`${caseName} request success, data: ${JSON.stringify(data)}`);
                  ExpectTrue(data.responseCode == 404);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });

    /**
     * @tc.number : SUB_NetworkMgr_Http_ResponseCode_3900
     * @tc.name   : testNetworkMgrHttpResponseCode3900
     * @tc.desc   : Test ResponseCode property.
     * @tc.level  : Level 2
     * @tc.type   : Function
     * @tc.size   : SmallTest
     */
    it('testNetworkMgrHttpResponseCode3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const caseName: string = 'testNetworkMgrHttpResponseCode3900';
      console.info(`${caseName} test Start`);
      try {
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error) {
            console.info(`${caseName} getDefaultNet fail, error code: ${error.code}, msg: ${error.message}`);
            ExpectFail();
            done();
          } else {
            if (data.netId == 0) {
              console.info(`${caseName} no Network connected`);
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} Network connected`);
              let httpRequest: http.HttpRequest = http.createHttp();
              httpRequest.request(`${XTS_TEST_HTTP_URL}openHarmonyXts`).then((data: http.HttpResponse) => {
                console.info(`${caseName} request success, data: ${JSON.stringify(data)}`);
                ExpectTrue(data.responseCode == 404);
                httpRequest.destroy();
                done();
              }).catch((err: BusinessError) => {
                console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                httpRequest.destroy();
                ExpectFail();
                done();
              });
            }
          }
        });
      } catch (err) {
        console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
      console.info(`${caseName} test End`);
    });
  });
}

