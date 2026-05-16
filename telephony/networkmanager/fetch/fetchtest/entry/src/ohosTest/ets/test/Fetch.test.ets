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

import {describe, TestType, Level, Size, it, expect } from '@ohos/hypium';
import Fetch, { FetchResponse } from '@system.fetch';
import connection from '@ohos.net.connection';

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

const TEST_URL_FOR_FETCH: string = 'https://www.baidu.com';
const TEST_URL: string = 'https://httpbin.org/anything';

interface FetchOptions {
  url: string,
  data?: string | object;
  header?: object;
  method?: string,
  responseType?: string
}

interface ErrorObject {
  code: number,
  data: string | object
}

type FetchCallback = (data: FetchResponse) => void;
type ErrorCallback = (data: ErrorObject) => void;

async function runFetchTestCase(caseName: string, options: FetchOptions, done: Function, successAssert: FetchCallback, failAssert: ErrorCallback) {
  console.info(`${caseName} test start `);
  try {
    let hasNet: boolean = await connection.hasDefaultNet();
    if (hasNet) {
      Fetch.fetch({
        url: options.url,
        data: options.data,
        method: options.method,
        header: options.header,
        responseType: options.responseType,
        success: (data: FetchResponse) => {
          console.info(`${caseName} test success ${JSON.stringify(data)}`);
          successAssert(data);
          done();
          console.info(`${caseName} test end `);
        },
        fail: (error: ErrorObject) => {
          console.info(`${caseName} test fail ${JSON.stringify(error)}`);
          failAssert(error);
          done();
          console.info(`${caseName} test end `);
        },
        complete: () => {
          console.info(`${caseName} test complete`);
        }
      });
    } else {
      ExpectTrue(false);
      done();
      console.info(`${caseName} test fail because of net not connect`);
      console.info(`${caseName} test end `);
    }
  } catch (error) {
    console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
    ExpectTrue(false);
    done();
    console.info(`${caseName} test end `);
  }
}


export default function httpFetchTest() {
  describe('HttpFetchTest', () => {

    /**
     * @tc.name   testNetworkMgrHttpFetchRequestURL0100
     * @tc.number SUB_NetworkMgr_Http_FetchRequestURL_0100
     * @tc.desc   Test fetch api with useful url.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrHttpFetchRequestURL0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
      let caseName: string = 'testNetworkMgrHttpFetchRequestURL0100';
      runFetchTestCase(caseName, {
        url: TEST_URL
      }, done, () => {
        ExpectTrue(true);
      }, () => {
        ExpectTrue(false);
      });
    });

    /**
     * @tc.name   testHttpFetchRequestURLIsNull0200
     * @tc.number SUB_NetworkMgr_Http_FetchRequestURLIsNull_0200
     * @tc.desc   Test fetch api with empty url.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpFetchRequestURLIsNull0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      let caseName: string = 'testHttpFetchRequestURLIsNull0200';
      runFetchTestCase(caseName, {
        url: ''
      }, done, () => {
        ExpectTrue(false);
      }, () => {
        ExpectTrue(true); // no error code to assert
      });
    });

    /**
     * @tc.name   testHttpFetchRequestURLIsInvalid0300
     * @tc.number SUB_NetworkMgr_Http_FetchRequestURLIsInvalid_0300
     * @tc.desc   Test fetch api with url is invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpFetchRequestURLIsInvalid0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , (done: Function) => {
      let caseName: string = 'testHttpFetchRequestURLIsInvalid0300';
      runFetchTestCase(caseName, {
        url: 'hello'
      }, done, () => {
        ExpectTrue(false);
      }, () => {
        ExpectTrue(true); // no error code to assert
      });
    });

    /**
     * @tc.name   testHttpFetchRequestParamsIsInvalid0400
     * @tc.number SUB_NetworkMgr_Http_FetchRequestParamsIsInvalid_0400
     * @tc.desc   Test fetch api with param that method is invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpFetchRequestParamsIsInvalid0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , (done: Function) => {
      let caseName: string = 'testHttpFetchRequestParamsIsInvalid0400';
      runFetchTestCase(caseName, {
        url: TEST_URL, method: 'ME'
      }, done, () => {
        ExpectTrue(false);
      }, () => {
        ExpectTrue(true); // no error code to assert
      });
    });

    /**
     * @tc.name   testHttpFetchCode2000500
     * @tc.number SUB_NetworkMgr_Http_FetchCode200_0500
     * @tc.desc   Test fetch api with verify code 200.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpFetchCode2000500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      let caseName: string = 'testHttpFetchCode2000500';
      runFetchTestCase(caseName, {
        url: TEST_URL
      }, done, (data: FetchResponse) => {
        ExpectTrue(data.code === 200);
      }, () => {
        ExpectTrue(false);
      });
    });

    /**
     * @tc.name   testHttpFetchCode4040600
     * @tc.number SUB_NetworkMgr_Http_FetchCode404_0600
     * @tc.desc   Test fetch api with verify code 404.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpFetchCode4040600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      let caseName: string = 'testHttpFetchCode4040600';
      runFetchTestCase(caseName, {
        url: `${TEST_URL_FOR_FETCH}/view`
      }, done, (data: FetchResponse) => {
        ExpectTrue(data.code === 404);
      }, () => {
        ExpectTrue(false);
      });
    });

    /**
     * @tc.name   testHttpFetchCode4000700
     * @tc.number SUB_NetworkMgr_Http_FetchCode400_0700
     * @tc.desc   Test fetch api with verify code 400.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpFetchCode4000700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testHttpFetchCode4000700';
      runFetchTestCase(caseName, {
        url: 'http://www.kuaidi100.com/query'
      }, done, (data: FetchResponse) => {
        let resp: object = JSON.parse(data.data as string);
        ExpectTrue(resp['status'] === '400');
      }, () => {
        ExpectTrue(false);
      });
    });

    /**
     * @tc.name   testHttpFetchResponseDataType0800
     * @tc.number SUB_NetworkMgr_Http_FetchResponseDataType_0800
     * @tc.desc   Test fetch api with param that responseType is text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpFetchResponseDataType0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testHttpFetchResponseDataType0800';
      runFetchTestCase(caseName, {
        url: TEST_URL, responseType: 'text'
      }, done, (data: FetchResponse) => {
        ExpectTrue(typeof data.data === 'string');
      }, () => {
        ExpectTrue(false);
      });
    });

    /**
     * @tc.name   testHttpFetchResponseDataType0900
     * @tc.number SUB_NetworkMgr_Http_FetchResponseDataType_0900
     * @tc.desc   Test fetch api with param that responseType is json.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpFetchResponseDataType0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testHttpFetchResponseDataType0900';
      runFetchTestCase(caseName, {
        url: TEST_URL, responseType: 'json'
      }, done, (data: FetchResponse) => {
        ExpectTrue(typeof data.data === 'object');
      }, () => {
        ExpectTrue(false);
      });
    });

    /**
     * @tc.name   testHttpFetchResponseDataType01000
     * @tc.number SUB_NetworkMgr_Http_FetchResponseDataType_01000
     * @tc.desc   Test fetch api with param that responseType default.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpFetchResponseDataType01000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testHttpFetchResponseDataType01000';
      runFetchTestCase(caseName, {
        url: TEST_URL
      }, done, (data: FetchResponse) => {
        ExpectTrue(typeof data.data === 'string');
      }, () => {
        ExpectTrue(false);
      });
    });

    /**
     * @tc.name   testHttpFetchResponseDataType01100
     * @tc.number SUB_NetworkMgr_Http_FetchResponseDataType_01100
     * @tc.desc   Test fetch api with param that responseType is random text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpFetchResponseDataType01100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testHttpFetchResponseDataType01100';
      runFetchTestCase(caseName, {
        url: TEST_URL, responseType: 'hello'
      }, done, (data: FetchResponse) => {
        ExpectTrue(typeof data.data === 'string');
      }, () => {
        ExpectTrue(false);
      });
    });

    /**
     * @tc.name   testNetworkMgrHttpFetchRequestMethod01200
     * @tc.number SUB_NetworkMgr_Http_FetchRequestMethod_01200
     * @tc.desc   Test fetch api with param that method is POST.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrHttpFetchRequestMethod01200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrHttpFetchRequestMethod01200';
      runFetchTestCase(caseName, {
        url: TEST_URL, method: 'POST', responseType: 'json'
      }, done, (data: FetchResponse) => {
        if (data && data.data) {
          ExpectTrue(data.data['method'] === 'POST');
        } else {
          ExpectTrue(false);
        }
      }, () => {
        ExpectTrue(false);
      });
    });

    /**
     * @tc.name   testHttpFetchRequestMethod01300
     * @tc.number SUB_NetworkMgr_Http_FetchRequestMethod_01300
     * @tc.desc   Test fetch api with param that method is DELETE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpFetchRequestMethod01300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testHttpFetchRequestMethod01300';
      runFetchTestCase(caseName, {
        url: TEST_URL, method: 'DELETE'
      }, done, (data: FetchResponse) => {
        let resp: object = JSON.parse(data.data as string);
        ExpectTrue(resp['method'] === 'DELETE');
      }, () => {
        ExpectTrue(false);
      });
    });

    /**
     * @tc.name   testHttpFetchRequestData01400
     * @tc.number SUB_NetworkMgr_Http_FetchRequestData_01400
     * @tc.desc   Test fetch api with param that data is not valid type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpFetchRequestData01400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testHttpFetchRequestData01400';
      runFetchTestCase(caseName, {
        url: TEST_URL, data: [123]
      }, done, (data: FetchResponse) => {
        ExpectTrue(data.code === 200);
      }, () => {
        ExpectTrue(false);
      });
    });

    /**
     * @tc.name   testHttpFetchRequestData01500
     * @tc.number SUB_NetworkMgr_Http_FetchRequestData_01500
     * @tc.desc   Test fetch api with param that data empty text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpFetchRequestData01500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testHttpFetchRequestData01500';
      runFetchTestCase(caseName, {
        url: TEST_URL, data: ''
      }, done, (data: FetchResponse) => {
        ExpectTrue(data.code === 200);
      }, () => {
        ExpectTrue(false);
      });
    });

    /**
     * @tc.name   testHttpFetchRequestComplete01600
     * @tc.number SUB_NetworkMgr_Http_FetchRequestComplete_01600
     * @tc.desc   Test fetch api with verify complete callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHttpFetchRequestComplete01600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testHttpFetchRequestComplete01600';
      console.info(`${caseName} test start `);
      try {
        Fetch.fetch({
          url: TEST_URL,
          complete: () => {
            ExpectTrue(true);
            console.info(`${caseName} test complete`);
            console.info(`${caseName} test end `);
            done();
          }
        });
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
        console.info(`${caseName} test end `);
      }
    });

    /**
     * @tc.name   testHttpFetchRequestMethod01700
     * @tc.number SUB_NetworkMgr_Http_FetchRequestMethod_01700
     * @tc.desc   Test fetch api with param that method is DELETE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHttpFetchRequestMethod01700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      let caseName: string = 'testHttpFetchRequestMethod01700';
      runFetchTestCase(caseName, {
        url: "www.baidu.com",
      }, done, (data: FetchResponse) => {
        ExpectTrue(data.headers != undefined)
      }, () => {
        ExpectTrue(false);
      });
    });
  });
}

