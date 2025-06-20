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

import http from '@ohos.net.http';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';

// no permission.
const NOT_PERMISSION = 201;

class Header {
  public contentType: string;

  constructor(contentType: string) {
    this.contentType = contentType;
  }
}

let httpRequest = http.createHttp();

export default function httpTest() {
  describe('httpTest', () => {
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

    /*
     * @tc.number:SUB_Communication_NetStack_Http_RequestInStream_HttpRequestOptions_Promise_100
     * @tc.name: Http_RequestInStream_HttpRequestOptions_Promise_100
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_NetStack_Http_RequestInStream_HttpRequestOptions_Promise_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,  async (done: Function) => {
      hilog.info(0x0000, 'httpTag', '%{public}s', 'SUB_Communication_NetStack_Http_RequestInStream_HttpRequestOptions_Promise_100 begin');
      try {
        let promise = httpRequest.requestInStream("EXAMPLE_URL", {
          method: http.RequestMethod.GET,
          connectTimeout: 60000,
          readTimeout: 60000,
          header: new Header('application/json')
        });
        promise.then((data: number) => {
          hilog.info(0x0000, 'httpTag', '%{public}s', 'SUB_Communication_NetStack_Http_RequestInStream_HttpRequestOptions_Promise_100 success');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'httpTag', '%{public}s', 'SUB_Communication_NetStack_Http_RequestInStream_HttpRequestOptions_Promise_100 ' + JSON.stringify(err));
          expect(err.code).assertEqual(NOT_PERMISSION);
          done();
        });
      } catch (error) {
        hilog.error(0x0000, 'httpTag', '%{public}s', 'SUB_Communication_NetStack_Http_RequestInStream_HttpRequestOptions_Promise_100 failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /*
     * @tc.number:SUB_Communication_NetStack_Http_RequestInStream_HttpRequestOptions_Callback_200
     * @tc.name: Http_RequestInStream_HttpRequestOptions_Callback_200
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_NetStack_Http_RequestInStream_HttpRequestOptions_Callback_200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      hilog.info(0x0000, 'httpTag', '%{public}s', 'SUB_Communication_NetStack_Http_RequestInStream_HttpRequestOptions_Callback_200 begin');
      try {
        httpRequest.requestInStream("EXAMPLE_URL", {
          method: http.RequestMethod.GET,
          connectTimeout: 60000,
          readTimeout: 60000,
          header: new Header('application/json')
        }, (err: BusinessError<void>, data: number) => {
          if (err) {
            hilog.error(0x0000, 'httpTag', '%{public}s', 'SUB_Communication_NetStack_Http_RequestInStream_HttpRequestOptions_Callback_200 failed ' + JSON.stringify(err));
            expect(err.code).assertEqual(NOT_PERMISSION);
            done();
          } else {
            hilog.info(0x0000, 'httpTag', '%{public}s', 'SUB_Communication_NetStack_Http_RequestInStream_HttpRequestOptions_Callback_200 success');
            expect().assertFail();
            done();
          }
        })
      } catch (error) {
        hilog.error(0x0000, 'httpTag', '%{public}s', 'SUB_Communication_NetStack_Http_RequestInStream_HttpRequestOptions_Callback_200 failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /*
     * @tc.number:SUB_Communication_NetStack_Http_RequestInStream_Callback_300
     * @tc.name: Http_RequestInStream_Callback_300
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_NetStack_Http_RequestInStream_Callback_300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      hilog.info(0x0000, 'httpTag', '%{public}s', 'SUB_Communication_NetStack_Http_RequestInStream_Callback_300 begin');
      try {
        httpRequest.requestInStream("EXAMPLE_URL", (err: BusinessError, data: number) => {
          if (err) {
            hilog.error(0x0000, 'httpTag', '%{public}s', 'SUB_Communication_NetStack_Http_RequestInStream_Callback_300 failed ' + JSON.stringify(err));
            expect(err.code).assertEqual(NOT_PERMISSION);
            done();
          } else {
            hilog.info(0x0000, 'httpTag', '%{public}s', 'SUB_Communication_NetStack_Http_RequestInStream_Callback_300 success');
            expect().assertFail();
            done();
          }
        })
      } catch (error) {
        hilog.error(0x0000, 'httpTag', '%{public}s', 'SUB_Communication_NetStack_Http_RequestInStream_Callback_300 failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /*
     * @tc.number:SUB_Communication_NetStack_Http_Request_Callback_400
     * @tc.name: Http_Request_Callback_400
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_NetStack_Http_Request_Callback_400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,  async (done: Function) => {
      hilog.info(0x0000, 'httpTag', '%{public}s', 'SUB_Communication_NetStack_Http_Request_Callback_400 begin');
      try {
        httpRequest.request("EXAMPLE_URL", (err: BusinessError, data: http.HttpResponse) => {
          if (err) {
            hilog.error(0x0000, 'httpTag', '%{public}s', 'SUB_Communication_NetStack_Http_Request_Callback_400 failed ' + JSON.stringify(err));
            expect(err.code).assertEqual(NOT_PERMISSION);
            done();
          } else {
            hilog.info(0x0000, 'httpTag', '%{public}s', 'SUB_Communication_NetStack_Http_Request_Callback_400 success');
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        hilog.error(0x0000, 'httpTag', '%{public}s', 'SUB_Communication_NetStack_Http_Request_Callback_400 failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });


      /*
       * @tc.number:SUB_Communication_NetStack_Http_Request_HttpRequestOptions_Callback_500
       * @tc.name: Http_Request_HttpRequestOptions_Callback_500
       * @tc.desc:Using the on method without permission
       * @tc.level:Level 3
       * @tc.type:Function
       * @tc.size:MediumTest
       */
      it('SUB_Communication_NetStack_Http_Request_HttpRequestOptions_Callback_500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,  async (done: Function) => {
        hilog.info(0x0000, 'httpTag', '%{public}s', 'SUB_Communication_NetStack_Http_Request_HttpRequestOptions_Callback_500 begin');
        try {
          httpRequest.request("EXAMPLE_URL", {
            method: http.RequestMethod.GET,
            connectTimeout: 60000,
            readTimeout: 60000,
            header: new Header('application/json')
          }, (err: BusinessError, data: http.HttpResponse) => {
            if (err) {
              hilog.error(0x0000, 'httpTag', '%{public}s', 'SUB_Communication_NetStack_Http_Request_HttpRequestOptions_Callback_500 failed ' + JSON.stringify(err));
              expect(err.code).assertEqual(NOT_PERMISSION);
              done();
            } else {
              hilog.info(0x0000, 'httpTag', '%{public}s', 'SUB_Communication_NetStack_Http_Request_HttpRequestOptions_Callback_500 success');
              expect().assertFail();
              done();
            }
          })
        } catch (error) {
          hilog.error(0x0000, 'httpTag', '%{public}s', 'SUB_Communication_NetStack_Http_Request_HttpRequestOptions_Callback_500 failed ' + JSON.stringify(error));
          expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          done();
        }
      });

      /*
       * @tc.number:SUB_Communication_NetStack_Http_Request_HttpRequestOptions_Promise_600
       * @tc.name: Http_Request_HttpRequestOptions_Promise_600
       * @tc.desc:Using the on method without permission
       * @tc.level:Level 3
       * @tc.type:Function
       * @tc.size:MediumTest
       */
      it('SUB_Communication_NetStack_Http_Request_HttpRequestOptions_Promise_600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        hilog.info(0x0000, 'httpTag', '%{public}s', 'SUB_Communication_NetStack_Http_Request_HttpRequestOptions_Promise_600 begin');
        try {
          let promise = httpRequest.request("EXAMPLE_URL", {
            method: http.RequestMethod.GET,
            connectTimeout: 60000,
            readTimeout: 60000,
            header: new Header('application/json')
          });
          promise.then((data:http.HttpResponse) => {
            hilog.info(0x0000, 'httpTag', '%{public}s', 'SUB_Communication_NetStack_Http_Request_HttpRequestOptions_Promise_600 success');
            expect().assertFail();
            done();
          }).catch((error:BusinessError) => {
            hilog.error(0x0000, 'httpTag', '%{public}s', 'SUB_Communication_NetStack_Http_Request_HttpRequestOptions_Promise_600 failed ' + JSON.stringify(error));
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
            done();
          });
        } catch (error) {
          hilog.error(0x0000, 'httpTag', '%{public}s', 'SUB_Communication_NetStack_Http_Request_HttpRequestOptions_Promise_600 failed ' + JSON.stringify(error));
          expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          done();
        }
      });

  });
}
