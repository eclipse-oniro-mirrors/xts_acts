/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, beforeAll, afterAll, beforeEach, afterEach, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';

// Interceptor type enum
enum InterceptorType {
  INITIAL_REQUEST = 'INITIAL_REQUEST',
  REDIRECTION = 'REDIRECTION',
  CACHE_CHECKED = 'READ_CACHE',
  NETWORK_CONNECT = 'CONNECT_NETWORK',
  FINAL_RESPONSE = 'FINAL_RESPONSE'
}

// Redirect interceptor
class RedirectionHttpInterceptor implements http.HttpInterceptor {
  interceptorType: InterceptorType = InterceptorType.REDIRECTION;
  result: boolean = true;
  private redirectCount: number = 0;

  constructor(interceptorType: InterceptorType, result: boolean) {
    this.interceptorType = interceptorType;
    this.result = result;
  }

  interceptorHandle(reqContext: http.HttpRequestContext, rspContext: http.HttpResponse): Promise<http.ChainContinue> {
    this.redirectCount++;
    console.info(`[RedirectInterceptor] redirect ${this.redirectCount}, url: ${reqContext.url}`);
    return Promise.resolve(this.result);
  }
}

// Create HttpRequest with interceptor
function createHttpWithInterceptor(): http.HttpRequest {
  let req = http.createHttp();
  let chain: http.HttpInterceptorChain = new http.HttpInterceptorChain();
  chain.addChain([new RedirectionHttpInterceptor(InterceptorType.REDIRECTION, true)]);
  chain.apply(req);
  return req;
}

export default function HttpRequestMaxAutoRedirectsWithInterceptorTest() {
  describe('HttpRequest_MaxAutoRedirects_WithInterceptor_Test', () => {
    let httpRequest: http.HttpRequest;
    // Test server address
    const BASE_URL = 'http://23.106.128.32:1088/redirect';

    beforeEach(() => {
      console.info('[WithInterceptor] beforeEach: create HttpRequest with interceptor');
      httpRequest = createHttpWithInterceptor();
    });

    afterEach(() => {
      console.info('[WithInterceptor] afterEach: destroy HttpRequest');
      httpRequest.destroy();
    });
    
    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor0100
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_WithInercptor_0100
     * @tc.desc With interceptor, verify redirect completes successfully
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_001] 测试开始 - 带拦截器默认行为');
      try {
        let url = `${BASE_URL}/30`;
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          readTimeout: 600000,
          connectTimeout: 0
        };
        let response = await httpRequest.request(url, options);
        console.info(`[HttpRequest_MaxAutoRedirects_001] 响应码: ${response.responseCode}`);
        if (response.responseCode === 200 || response.responseCode === 302) {
          console.info('[HttpRequest_MaxAutoRedirects_001]  测试通过');
          done();
        } else {
          expect().assertFail();
          done();
        }
      } catch (err) {
        let error = err as BusinessError;
        console.error(`[HttpRequest_MaxAutoRedirects_001]  失败: code=${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor0200
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_WithInercptor_0200
     * @tc.desc maxRedirects=0 should throw error 2300047
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_002] 测试开始 - 带拦截器关闭重定向');
      try {
        let url = `${BASE_URL}/1`;
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          maxRedirects : 0
        } as http.HttpRequestOptions;
        await httpRequest.request(url, options);
        console.error('[HttpRequest_MaxAutoRedirects_002]  预期失败但成功了');
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info(`[HttpRequest_MaxAutoRedirects_002] 捕获预期错误: code=${error.code}`);
        expect(error.code).assertEqual(2300047);
        console.info('[HttpRequest_MaxAutoRedirects_002]  测试通过');
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor0300
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_WithInercptor_0300
     * @tc.desc maxRedirects=1 with 2 redirects should throw error 2300047
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_003] 测试开始 - 带拦截器超出限制');
      try {
        let url = `${BASE_URL}/2`;
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          maxRedirects: 1
        } as http.HttpRequestOptions;
        await httpRequest.request(url, options);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info(`[HttpRequest_MaxAutoRedirects_003] 捕获预期错误: ${error.code}`);
        expect(error.code).assertEqual(2300047);
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor0400
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_WithInercptor_0400
     * @tc.desc maxRedirects=5 with 3 redirects should succeed
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_004] 测试开始');
      try {
        let url = `${BASE_URL}/3`;
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          maxRedirects: 5
        } as http.HttpRequestOptions;
        let response = await httpRequest.request(url, options);
        expect(response.responseCode).assertEqual(200);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(`[HttpRequest_MaxAutoRedirects_004]  失败: ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor0500
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_WithInercptor_0500
     * @tc.desc maxRedirects=3 with 3 redirects should succeed
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_005] 测试开始');
      try {
        let url = `${BASE_URL}/3`;
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          maxRedirects: 3
        } as http.HttpRequestOptions;
        let response = await httpRequest.request(url, options);
        expect(response.responseCode).assertEqual(200);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(`[HttpRequest_MaxAutoRedirects_005]  失败: ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor0600
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_WithInercptor_0600
     * @tc.desc maxRedirects=INT_MAX should succeed
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_006] 测试开始');
      try {
        let url = `${BASE_URL}/3`;
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          maxRedirects: 2147483647
        } as http.HttpRequestOptions;
        let response = await httpRequest.request(url, options);
        expect(response.responseCode).assertEqual(200);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(`[HttpRequest_MaxAutoRedirects_006]  失败: ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor0700
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_WithInercptor_0700
     * @tc.desc maxRedirects > INT_MAX, invalid param uses default behavior
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_007] 测试开始');
      try {
        let url = `${BASE_URL}/31`;
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          maxRedirects: 2147483648
        } as http.HttpRequestOptions;
        await httpRequest.request(url, options);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info(`[HttpRequest_MaxAutoRedirects_007] 捕获预期错误: code=${error.code}`);
        expect(error.code).assertEqual(2300047);
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor0800
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_WithInercptor_0800
     * @tc.desc maxRedirects=-1, invalid param uses default behavior
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_008] 测试开始');
      try {
        let url = `${BASE_URL}/31`;
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          maxRedirects: -1
        } as http.HttpRequestOptions;
        await httpRequest.request(url, options);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        expect(error.code).assertEqual(2300047);
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor0900
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_WithInercptor_0900
     * @tc.desc maxRedirects='3' (string), invalid param uses default behavior
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_009] 测试开始');
      try {
        let url = `${BASE_URL}/31`;
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          maxRedirects: ('3' as Object) as number
        } as http.HttpRequestOptions;
        await httpRequest.request(url, options);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        expect(error.code).assertEqual(2300047);
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor1000
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_WithInercptor_1000
     * @tc.desc With all config options should work correctly
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_010] 测试开始');
      try {
        let url = `${BASE_URL}/3`;
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          maxRedirects: 5,
          connectTimeout: 10000,
          readTimeout: 10000,
          header: { 'User-Agent': 'Test' }
        } as http.HttpRequestOptions;
        let response = await httpRequest.request(url, options);
        expect(response.responseCode).assertEqual(200);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(`[HttpRequest_MaxAutoRedirects_010]  失败: ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor1100
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_WithInercptor_1100
     * @tc.desc maxRedirects=undefined, invalid param uses default behavior
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_011] 测试开始');
      try {
        let url = `${BASE_URL}/31`;
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          maxRedirects: undefined
        } as http.HttpRequestOptions;
        await httpRequest.request(url, options);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        expect(error.code).assertEqual(2300047);
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor1200
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_WithInercptor_1200
     * @tc.desc requestInStream default behavior should succeed
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_012] 测试开始');
      try {
        let url = `${BASE_URL}/5`;
        let responseCode = await httpRequest.requestInStream(url);
        expect(responseCode).assertEqual(200);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(`[HttpRequest_MaxAutoRedirects_012]  失败: ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor1300
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_WithInercptor_1300
     * @tc.desc requestInStream maxRedirects=0 should throw error 2300047
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_013] 测试开始');
      try {
        let url = `${BASE_URL}/1`;
        let options: http.HttpRequestOptions = {
          maxRedirects: 0
        } as http.HttpRequestOptions;
        await httpRequest.requestInStream(url, options);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        expect(error.code).assertEqual(2300047);
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor1400
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_WithInercptor_1400
     * @tc.desc requestInStream exceeding redirect limit should throw error 2300047
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_014] 测试开始');
      try {
        let url = `${BASE_URL}/5`;
        let options: http.HttpRequestOptions = { maxRedirects: 3 } as http.HttpRequestOptions;
        await httpRequest.requestInStream(url, options);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        expect(error.code).assertEqual(2300047);
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor1500
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_WithInercptor_1500
     * @tc.desc requestInStream maxRedirects=5 with 3 redirects should succeed
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_015] 测试开始');
      try {
        let url = `${BASE_URL}/3`;
        let options: http.HttpRequestOptions = {
          maxRedirects: 5
        } as http.HttpRequestOptions;
        let responseCode = await httpRequest.requestInStream(url, options);
        expect(responseCode).assertEqual(200);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(`[HttpRequest_MaxAutoRedirects_015]  失败: ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor1600
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_WithInercptor_1600
     * @tc.desc requestInStream maxRedirects=3 with 3 redirects should succeed
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_016] 测试开始');
      try {
        let url = `${BASE_URL}/3`;
        let options: http.HttpRequestOptions = {
          maxRedirects: 3
        } as http.HttpRequestOptions;
        let responseCode = await httpRequest.requestInStream(url, options);
        expect(responseCode).assertEqual(200);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(`[HttpRequest_MaxAutoRedirects_016]  失败: ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor1700
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_WithInercptor_1700
     * @tc.desc requestInStream maxRedirects=INT_MAX should succeed
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_017] 测试开始');
      try {
        let url = `${BASE_URL}/3`;
        let options: http.HttpRequestOptions = {
          maxRedirects: 2147483647
        } as http.HttpRequestOptions;
        let responseCode = await httpRequest.requestInStream(url, options);
        expect(responseCode).assertEqual(200);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(`[HttpRequest_MaxAutoRedirects_017]  失败: ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor1800
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_WithInercptor_1800
     * @tc.desc requestInStream maxRedirects > INT_MAX, invalid param uses default behavior
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_018] 测试开始');
      try {
        let url = `${BASE_URL}/31`;
        let options: http.HttpRequestOptions = {
          maxRedirects: 2147483648
        } as http.HttpRequestOptions;
        await httpRequest.requestInStream(url, options);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        expect(error.code).assertEqual(2300047);
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor1900
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_WithInercptor_1900
     * @tc.desc requestInStream maxRedirects=-1, invalid param uses default behavior
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_019] 测试开始');
      try {
        let url = `${BASE_URL}/31`;
        let options: http.HttpRequestOptions = {
          maxRedirects: -1
        } as http.HttpRequestOptions;
        await httpRequest.requestInStream(url, options);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        expect(error.code).assertEqual(2300047);
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor2000
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_WithInercptor_2000
     * @tc.desc requestInStream maxRedirects='3' (string), invalid param uses default behavior
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_020] 测试开始');
      try {
        let url = `${BASE_URL}/31`;
        let options: http.HttpRequestOptions = {
          maxRedirects: ('3' as Object) as number
        } as http.HttpRequestOptions;
        await httpRequest.requestInStream(url, options);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        expect(error.code).assertEqual(2300047);
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor2100
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_WithInercptor_2100
     * @tc.desc requestInStream with all config options should succeed
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_021] 测试开始');
      try {
        let url = `${BASE_URL}/3`;
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          maxRedirects: 5,
          connectTimeout: 10000,
          readTimeout: 10000,
          header: { 'User-Agent': 'Test' }
        } as http.HttpRequestOptions;
        let responseCode = await httpRequest.requestInStream(url, options);
        expect(responseCode).assertEqual(200);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(`[HttpRequest_MaxAutoRedirects_021]  失败: ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor2200
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_WithInercptor_2200
     * @tc.desc requestInStream maxRedirects=undefined, invalid param uses default behavior
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_022] 测试开始');
      try {
        let url = `${BASE_URL}/31`;
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          maxRedirects: undefined
        } as http.HttpRequestOptions;
        await httpRequest.requestInStream(url, options);
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        expect(error.code).assertEqual(2300047);
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor2300
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_WithInercptor_2300
     * @tc.desc Default behavior with 31 redirects should throw error 2300047
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_023] 测试开始 - 带拦截器默认超过30次重定向');
      try {
        let url = `${BASE_URL}/31`;
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          readTimeout: 120000,
          connectTimeout: 60000
        };
        await httpRequest.request(url, options);
        console.error('[HttpRequest_MaxAutoRedirects_023]  预期失败但成功了');
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info(`[HttpRequest_MaxAutoRedirects_023] 捕获预期错误: code=${error.code}`);
        expect(error.code).assertEqual(2300047);
        console.info('[HttpRequest_MaxAutoRedirects_023]  测试通过');
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor2400
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_WithInercptor_2400
     * @tc.desc requestInStream with 31 redirects should throw error 2300047
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirectsWithInercptor2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_024] 测试开始 - 带拦截器requestInStream默认超过30次重定向');
      try {
        let url = `${BASE_URL}/31`;
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          readTimeout: 120000,
          connectTimeout: 60000
        };
        await httpRequest.requestInStream(url, options);
        console.error('[HttpRequest_MaxAutoRedirects_024]  预期失败但成功了');
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info(`[HttpRequest_MaxAutoRedirects_024] 捕获预期错误: code=${error.code}`);
        expect(error.code).assertEqual(2300047);
        console.info('[HttpRequest_MaxAutoRedirects_024]  测试通过');
        done();
      }
    });

  });
}
