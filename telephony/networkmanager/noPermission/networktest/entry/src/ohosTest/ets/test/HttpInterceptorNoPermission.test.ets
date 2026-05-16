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

import { describe, expect, it, Size, Level, TestType } from '@ohos/hypium';
import { http } from '@kit.NetworkKit';
import { BusinessError } from "@kit.BasicServicesKit";
import testNetManager from 'libentry.so';

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`exportFail failed err: ${JSON.stringify(err)}`);
  }
};

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

const HTTP_URL_BAIDU: string = "http://www.baidu.com";


// 常量定义
const DOMAIN: number = 0x0000; // 日志域值
const TAG: string = 'netstack'; // 日志标签


export default function httpInterceptorNoPermission() {
  describe('HttpInterceptorNoPermission', () => {
    /**
     * @tc.name   testNetworkMgrHttpInterceptorNoPermissionAddInterceptor0100
     * @tc.number SUB_NetworkMgr_HttpInterceptorNoPermission_AddInterceptor_0100
     * @tc.desc   test Add request interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpInterceptorNoPermissionAddInterceptor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpInterceptorNoPermissionAddInterceptor0100";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.AddWritableRequestInterceptor(0, 1);
          ExpectTrue(result == 201);
          console.info(`${TAG} ${caseName} result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
          };
          httpRequest.request(HTTP_URL_BAIDU, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectTrue(err.code == 201);
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpInterceptorNoPermissionAddInterceptor0200
     * @tc.number SUB_NetworkMgr_HttpInterceptorNoPermission_AddInterceptor_0200
     * @tc.desc   test Add request interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpInterceptorNoPermissionAddInterceptor0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpInterceptorNoPermissionAddInterceptor0200";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.AddReadOnlyRequestInterceptor(10, 1);
          ExpectTrue(result == 201);
          console.info(`${TAG} ${caseName} result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
          };
          httpRequest.request(HTTP_URL_BAIDU, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectTrue(err.code == 201);
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpInterceptorNoPermissionAddInterceptor0300
     * @tc.number SUB_NetworkMgr_HttpInterceptorNoPermission_AddInterceptor_0300
     * @tc.desc   test Add response interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpInterceptorNoPermissionAddInterceptor0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpInterceptorNoPermissionAddInterceptor0300";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.AddWritableResponseInterceptor(0, 1);
          ExpectTrue(result == 201);
          console.info(`${TAG} ${caseName} result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
          };
          httpRequest.request(HTTP_URL_BAIDU, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectTrue(err.code == 201);
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpInterceptorNoPermissionAddInterceptor0400
     * @tc.number SUB_NetworkMgr_HttpInterceptorNoPermission_AddInterceptor_0400
     * @tc.desc   test Add response interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpInterceptorNoPermissionAddInterceptor0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpInterceptorNoPermissionAddInterceptor0400";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.AddReadOnlyResponseInterceptor(10, 1);
          ExpectTrue(result == 201);
          console.info(`${TAG} ${caseName} result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
          };
          httpRequest.request(HTTP_URL_BAIDU, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectTrue(err.code == 201);
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpInterceptorNoPermissionRemoveInterceptor0100
     * @tc.number SUB_NetworkMgr_HttpInterceptorNoPermission_RemoveInterceptor_0100
     * @tc.desc   test remove request interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpInterceptorNoPermissionRemoveInterceptor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpInterceptorNoPermissionRemoveInterceptor0100";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.RemoveRequestInterceptor(1);
          ExpectTrue(result == 201);
          console.info(`${TAG} ${caseName} result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
          };
          httpRequest.request(HTTP_URL_BAIDU, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectTrue(err.code == 201);
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpInterceptorNoPermissionRemoveInterceptor0200
     * @tc.number SUB_NetworkMgr_HttpInterceptorNoPermission_RemoveInterceptor_0200
     * @tc.desc   test remove response interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpInterceptorNoPermissionRemoveInterceptor0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpInterceptorNoPermissionRemoveInterceptor0200";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.RemoveResponseInterceptor(1);
          ExpectTrue(result == 201);
          console.info(`${TAG} ${caseName} result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
          };
          httpRequest.request(HTTP_URL_BAIDU, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectTrue(err.code == 201);
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpInterceptorNoPermissionRemoveAllInterceptor0100
     * @tc.number SUB_NetworkMgr_HttpInterceptorNoPermission_RemoveAllInterceptor_0100
     * @tc.desc   test remove all interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpInterceptorNoPermissionRemoveAllInterceptor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpInterceptorNoPermissionRemoveAllInterceptor0100";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.RemoveAllInterceptor(2);
          ExpectTrue(result == 201);
          console.info(`${TAG} ${caseName} result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
          };
          httpRequest.request(HTTP_URL_BAIDU, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectTrue(err.code == 201);
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpInterceptorNoPermissionStartAllInterceptor0100
     * @tc.number SUB_NetworkMgr_HttpInterceptorNoPermission_StartAllInterceptor_0100
     * @tc.desc   test remove request interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpInterceptorNoPermissionStartAllInterceptor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpInterceptorNoPermissionStartAllInterceptor0100";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.StartAllInterceptor(3);
          ExpectTrue(result == 201);
          console.info(`${TAG} ${caseName} result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
          };
          httpRequest.request(HTTP_URL_BAIDU, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectTrue(err.code == 201);
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpInterceptorNoPermissionStopAllInterceptor0100
     * @tc.number SUB_NetworkMgr_HttpInterceptorNoPermission_StopAllInterceptor_0100
     * @tc.desc   test remove response interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpInterceptorNoPermissionStopAllInterceptor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpInterceptorNoPermissionStopAllInterceptor0100";
        console.info(`${TAG} ${caseName} test Start`);
        try {
          let result: number = testNetManager.StopAllInterceptor(4);
          ExpectTrue(result == 201);
          console.info(`${TAG} ${caseName} result:${result}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
          };
          httpRequest.request(HTTP_URL_BAIDU, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${TAG} ${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectTrue(err.code == 201);
              done();
            } else {
              console.info(`${TAG} ${caseName} res:${JSON.stringify(res)}`);
              ExpectFail();
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${TAG} ${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${TAG} ${caseName} test End`);
      });

  });
}