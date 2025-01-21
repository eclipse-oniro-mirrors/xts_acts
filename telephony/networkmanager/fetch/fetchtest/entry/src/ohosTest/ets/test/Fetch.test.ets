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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
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

    /* *
     * @tc.number: SUB_NetworkMgr_Http_FetchRequestURL_0100
     * @tc.name  : testHttpFetchRequestURL0100
     * @tc.desc  : Test fetch api with useful url.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testHttpFetchRequestURL0100', 0, async (done: Function) => {
      let caseName: string = 'testHttpFetchRequestURL0100';
      runFetchTestCase(caseName, {
        url: TEST_URL
      }, done, () => {
        ExpectTrue(true);
      }, () => {
        ExpectTrue(false);
      });
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Http_FetchRequestURLIsNull_0200
     * @tc.name  : testHttpFetchRequestURLIsNull0200
     * @tc.desc  : Test fetch api with empty url.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testHttpFetchRequestURLIsNull0200', 0, async (done: Function) => {
      let caseName: string = 'testHttpFetchRequestURLIsNull0200';
      runFetchTestCase(caseName, {
        url: ''
      }, done, () => {
        ExpectTrue(false);
      }, () => {
        ExpectTrue(true); // no error code to assert
      });
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Http_FetchRequestURLIsInvalid_0300
     * @tc.name  : testHttpFetchRequestURLIsInvalid0300
     * @tc.desc  : Test fetch api with url is invalid.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testHttpFetchRequestURLIsInvalid0300', 0, (done: Function) => {
      let caseName: string = 'testHttpFetchRequestURLIsInvalid0300';
      runFetchTestCase(caseName, {
        url: 'hello'
      }, done, () => {
        ExpectTrue(false);
      }, () => {
        ExpectTrue(true); // no error code to assert
      });
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Http_FetchRequestParamsIsInvalid_0400
     * @tc.name  : testHttpFetchRequestParamsIsInvalid0400
     * @tc.desc  : Test fetch api with param that method is invalid.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testHttpFetchRequestParamsIsInvalid0400', 0, (done: Function) => {
      let caseName: string = 'testHttpFetchRequestParamsIsInvalid0400';
      runFetchTestCase(caseName, {
        url: TEST_URL, method: 'ME'
      }, done, () => {
        ExpectTrue(false);
      }, () => {
        ExpectTrue(true); // no error code to assert
      });
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Http_FetchCode200_0500
     * @tc.name  : testHttpFetchCode2000500
     * @tc.desc  : Test fetch api with verify code 200.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testHttpFetchCode2000500', 0, async (done: Function) => {
      let caseName: string = 'testHttpFetchCode2000500';
      runFetchTestCase(caseName, {
        url: TEST_URL
      }, done, (data: FetchResponse) => {
        ExpectTrue(data.code === 200);
      }, () => {
        ExpectTrue(false);
      });
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Http_FetchCode404_0600
     * @tc.name  : testHttpFetchCode4040600
     * @tc.desc  : Test fetch api with verify code 404.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testHttpFetchCode4040600', 0, async (done: Function) => {
      let caseName: string = 'testHttpFetchCode4040600';
      runFetchTestCase(caseName, {
        url: `${TEST_URL_FOR_FETCH}/view`
      }, done, (data: FetchResponse) => {
        ExpectTrue(data.code === 404);
      }, () => {
        ExpectTrue(false);
      });
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Http_FetchCode400_0700
     * @tc.name  : testHttpFetchCode4000700
     * @tc.desc  : Test fetch api with verify code 400.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testHttpFetchCode4000700', 0, async (done: Function) => {
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

    /* *
     * @tc.number: SUB_NetworkMgr_Http_FetchResponseDataType_0800
     * @tc.name  : testHttpFetchResponseDataType0800
     * @tc.desc  : Test fetch api with param that responseType is text.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testHttpFetchResponseDataType0800', 0, async (done: Function) => {
      let caseName: string = 'testHttpFetchResponseDataType0800';
      runFetchTestCase(caseName, {
        url: TEST_URL, responseType: 'text'
      }, done, (data: FetchResponse) => {
        ExpectTrue(typeof data.data === 'string');
      }, () => {
        ExpectTrue(false);
      });
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Http_FetchResponseDataType_0900
     * @tc.name  : testHttpFetchResponseDataType0900
     * @tc.desc  : Test fetch api with param that responseType is json.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testHttpFetchResponseDataType0900', 0, async (done: Function) => {
      let caseName: string = 'testHttpFetchResponseDataType0900';
      runFetchTestCase(caseName, {
        url: TEST_URL, responseType: 'json'
      }, done, (data: FetchResponse) => {
        ExpectTrue(typeof data.data === 'object');
      }, () => {
        ExpectTrue(false);
      });
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Http_FetchResponseDataType_01000
     * @tc.name  : testHttpFetchResponseDataType01000
     * @tc.desc  : Test fetch api with param that responseType default.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testHttpFetchResponseDataType01000', 0, async (done: Function) => {
      let caseName: string = 'testHttpFetchResponseDataType01000';
      runFetchTestCase(caseName, {
        url: TEST_URL
      }, done, (data: FetchResponse) => {
        ExpectTrue(typeof data.data === 'string');
      }, () => {
        ExpectTrue(false);
      });
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Http_FetchResponseDataType_01100
     * @tc.name  : testHttpFetchResponseDataType01100
     * @tc.desc  : Test fetch api with param that responseType is random text.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testHttpFetchResponseDataType01100', 0, async (done: Function) => {
      let caseName: string = 'testHttpFetchResponseDataType01100';
      runFetchTestCase(caseName, {
        url: TEST_URL, responseType: 'hello'
      }, done, (data: FetchResponse) => {
        ExpectTrue(typeof data.data === 'string');
      }, () => {
        ExpectTrue(false);
      });
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Http_FetchRequestMethod_01200
     * @tc.name  : testHttpFetchRequestMethod01200
     * @tc.desc  : Test fetch api with param that method is POST.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testHttpFetchRequestMethod01200', 0, async (done: Function) => {
      let caseName: string = 'testHttpFetchRequestMethod01200';
      runFetchTestCase(caseName, {
        url: TEST_URL, method: 'POST', responseType: 'json'
      }, done, (data: FetchResponse) => {
        ExpectTrue(data.data['method'] === 'POST');
      }, () => {
        ExpectTrue(false);
      });
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Http_FetchRequestMethod_01300
     * @tc.name  : testHttpFetchRequestMethod01300
     * @tc.desc  : Test fetch api with param that method is DELETE.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testHttpFetchRequestMethod01300', 0, async (done: Function) => {
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

    /* *
     * @tc.number: SUB_NetworkMgr_Http_FetchRequestData_01400
     * @tc.name  : testHttpFetchRequestData01400
     * @tc.desc  : Test fetch api with param that data is not valid type.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testHttpFetchRequestData01400', 0, async (done: Function) => {
      let caseName: string = 'testHttpFetchRequestData01400';
      runFetchTestCase(caseName, {
        url: TEST_URL, data: [123]
      }, done, (data: FetchResponse) => {
        ExpectTrue(data.code === 200);
      }, () => {
        ExpectTrue(false);
      });
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Http_FetchRequestData_01500
     * @tc.name  : testHttpFetchRequestData01500
     * @tc.desc  : Test fetch api with param that data empty text.
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testHttpFetchRequestData01500', 0, async (done: Function) => {
      let caseName: string = 'testHttpFetchRequestData01500';
      runFetchTestCase(caseName, {
        url: TEST_URL, data: ''
      }, done, (data: FetchResponse) => {
        ExpectTrue(data.code === 200);
      }, () => {
        ExpectTrue(false);
      });
    });

    /* *
     * @tc.number: SUB_NetworkMgr_Http_FetchRequestComplete_01600
     * @tc.name  : testHttpFetchRequestComplete01600
     * @tc.desc  : Test fetch api with verify complete callback
     * @tc.size  : MediumTest
     * @tc.type  : Function
     * @tc.level : level 2
     */
    it('testHttpFetchRequestComplete01600', 0, async (done: Function) => {
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
  });
}
