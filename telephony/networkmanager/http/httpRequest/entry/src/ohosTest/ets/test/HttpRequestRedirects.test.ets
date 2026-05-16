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
import { describe, it, expect, beforeAll, afterAll, beforeEach, afterEach, TestType, Size, Level} from '@ohos/hypium';
import { BusinessError } from '@ohos.base';

class Header {
  public contentType: string;

  constructor(contentType: string) {
    this.contentType = contentType;
  }
}

export default function HttpRequestMaxAutoRedirectsTest() {
  describe('HttpRequest_MaxAutoRedirects_Test', () => {
    let httpRequest: http.HttpRequest;
    // Test server address
    const BASE_URL = 'http://23.106.128.32:1088/redirect';

    beforeEach(() => {
      console.info('[HttpRequest_MaxAutoRedirects] beforeEach: create new HttpRequest');
      httpRequest = http.createHttp();
    });

    // Destroy HttpRequest after each test case
    afterEach(() => {
      console.info('[HttpRequest_MaxAutoRedirects] afterEach: destroy HttpRequest');
      httpRequest.destroy();
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirects0100
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_0100
     * @tc.desc Default behavior without maxRedirects
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirects0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_001] 测试开始');
      try {
        let url = `${BASE_URL}/30`;
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          readTimeout: 60000,
          connectTimeout: 0
        };
        let response = await httpRequest.request(url, options);
        console.info(`[HttpRequest_MaxAutoRedirects_001] 实际响应码: ${response.responseCode}`);
        console.info(`[HttpRequest_MaxAutoRedirects_001] 响应头: ${JSON.stringify(response.header)}`);
        if (response.responseCode === 200 || response.responseCode === 302) {
          console.info('[HttpRequest_MaxAutoRedirects_001]  测试通过');
          done();
        } else {
          console.error(`[HttpRequest_MaxAutoRedirects_001] ❌ 非预期响应码: ${response.responseCode}`);
          expect().assertFail();
          done();
        }
      } catch (err) {
        let error = err as BusinessError;
        console.error(`[HttpRequest_MaxAutoRedirects_001] ❌ 测试失败: code=${error.code}, message=${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirects0200
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_0200
     * @tc.desc maxRedirects=0 should throw error code 2300047
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirects0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_002] 测试开始');
      try {
        let url = `${BASE_URL}/1`;
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          maxRedirects: 0
        } as http.HttpRequestOptions;
        await httpRequest.request(url, options);
        console.error('[HttpRequest_MaxAutoRedirects_002] ❌ 预期失败但成功了');
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
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirects0300
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_0300
     * @tc.desc maxRedirects=1 with 2 redirects should throw error
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirects0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_003] 测试开始');
      try {
        let url = `${BASE_URL}/2`;
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          maxRedirects: 1
        } as http.HttpRequestOptions;
        await httpRequest.request(url, options);
        console.error('[HttpRequest_MaxAutoRedirects_003] ❌ 预期失败但成功了');
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
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirects0400
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_0400
     * @tc.desc maxRedirects=5 with 3 redirects should succeed
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirects0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
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
        console.error(`[HttpRequest_MaxAutoRedirects_004] ❌ 测试失败: ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirects0500
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_0500
     * @tc.desc maxRedirects=3 with 3 redirects should succeed
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirects0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
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
        console.error(`[HttpRequest_MaxAutoRedirects_005] ❌ 测试失败: ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirects0600
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_0600
     * @tc.desc maxRedirects=INT_MAX should succeed
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirects0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
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
        console.error(`[HttpRequest_MaxAutoRedirects_006] ❌ 测试失败: ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirects0700
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_0700
     * @tc.desc maxRedirects > INT_MAX, invalid param uses default behavior
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirects0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_007] 测试开始');
      try {
        let url = `${BASE_URL}/31`;
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          maxRedirects: 2147483648
        } as http.HttpRequestOptions;
        await httpRequest.request(url, options);
        console.error('[HttpRequest_MaxAutoRedirects_007] ❌ 预期失败但成功了');
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info(`[HttpRequest_MaxAutoRedirects_007] 捕获预期错误: code=${error.code}`);
        expect(error.code).assertEqual(2300047);
        console.info('[HttpRequest_MaxAutoRedirects_007]  测试通过');
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirects0800
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_0800
     * @tc.desc maxRedirects=-1, invalid param uses default behavior
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirects0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
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
        console.info(`[HttpRequest_MaxAutoRedirects_008] 捕获预期错误`);
        expect(error.code).assertEqual(2300047);
        console.info('[HttpRequest_MaxAutoRedirects_008]  测试通过');
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirects0900
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_0900
     * @tc.desc maxRedirects='3' (string), invalid param uses default behavior
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirects0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
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
        console.info(`[HttpRequest_MaxAutoRedirects_009] 捕获预期错误`);
        expect(error.code).assertEqual(2300047);
        console.info('[HttpRequest_MaxAutoRedirects_009]  测试通过');
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirects1000
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_1000
     * @tc.desc Test with all possible options should succeed
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirects1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
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
        console.error(`[HttpRequest_MaxAutoRedirects_010] ❌ 测试失败: ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirects1100
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_1100
     * @tc.desc maxRedirects=undefined, invalid param uses default behavior
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirects1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_011] 测试开始');
      try {
        let url = `${BASE_URL}/31`;
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          maxRedirects: undefined
        } as http.HttpRequestOptions;
        await httpRequest.request(url, options);
        console.error('[HttpRequest_MaxAutoRedirects_011] ❌ 预期失败但成功了');
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info(`[HttpRequest_MaxAutoRedirects_011] 捕获预期错误: code=${error.code}`);
        expect(error.code).assertEqual(2300047);
        console.info('[HttpRequest_MaxAutoRedirects_011]  测试通过');
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirects1200
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_1200
     * @tc.desc requestInStream default behavior test
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirects1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_012] 测试开始');
      try {
        let url = `${BASE_URL}/5`;
        let responseCode = await httpRequest.requestInStream(url);
        expect(responseCode).assertEqual(200);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(`[HttpRequest_MaxAutoRedirects_012] ❌ 测试失败: ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirects1300
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_1300
     * @tc.desc requestInStream maxRedirects=0 should throw 2300047
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirects1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_013] 测试开始');
      try {
        let url = `${BASE_URL}/1`;
        let options: http.HttpRequestOptions = {
          maxRedirects: 0
        } as http.HttpRequestOptions;
        await httpRequest.requestInStream(url, options);
        console.error('[HttpRequest_MaxAutoRedirects_013] ❌ 预期失败但成功了');
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info(`[HttpRequest_MaxAutoRedirects_013] 捕获预期错误: code=${error.code}`);
        expect(error.code).assertEqual(2300047);
        console.info('[HttpRequest_MaxAutoRedirects_013]  测试通过');
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirects1400
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_1400
     * @tc.desc requestInStream exceed redirect limit test
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirects1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
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
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirects1500
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_1500
     * @tc.desc maxRedirects=5 with 3 redirects should succeed
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirects1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
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
        console.error(`[HttpRequest_MaxAutoRedirects_015] ❌ 测试失败: ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirects1600
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_1600
     * @tc.desc maxRedirects=3 with 3 redirects should succeed
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirects1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
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
        console.error(`[HttpRequest_MaxAutoRedirects_016] ❌ 测试失败: ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirects1700
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_1700
     * @tc.desc maxRedirects=INT_MAX should succeed
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirects1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
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
        console.error(`[HttpRequest_MaxAutoRedirects_017] ❌ 测试失败: ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirects1800
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_1800
     * @tc.desc maxRedirects > INT_MAX, invalid param uses default behavior
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirects1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_018] 测试开始');
      try {
        let url = `${BASE_URL}/31`;
        let options: http.HttpRequestOptions = {
          maxRedirects: 2147483648
        } as http.HttpRequestOptions;
        await httpRequest.requestInStream(url, options);
        console.error('[HttpRequest_MaxAutoRedirects_018] ❌ 预期失败但成功了');
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info(`[HttpRequest_MaxAutoRedirects_018] 捕获预期错误: code=${error.code}`);
        expect(error.code).assertEqual(2300047);
        console.info('[HttpRequest_MaxAutoRedirects_018]  测试通过');
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirects1900
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_1900
     * @tc.desc maxRedirects=-1 should throw error
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirects1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
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
        console.info(`[HttpRequest_MaxAutoRedirects_019] 捕获预期错误`);
        expect(error.code).assertEqual(2300047);
        console.info('[HttpRequest_MaxAutoRedirects_019]  测试通过');
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirects2000
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_2000
     * @tc.desc maxRedirects='3' (string) should throw error
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirects2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
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
        console.info(`[HttpRequest_MaxAutoRedirects_020] 捕获预期错误`);
        expect(error.code).assertEqual(2300047);
        console.info('[HttpRequest_MaxAutoRedirects_020]  测试通过');
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirects2100
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_2100
     * @tc.desc requestInStream with all options should succeed
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirects2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
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
        console.error(`[HttpRequest_MaxAutoRedirects_021] ❌ 测试失败: ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirects2200
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_2200
     * @tc.desc requestInStream maxRedirects=undefined, invalid param uses default behavior
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirects2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info('[HttpRequest_MaxAutoRedirects_022] 测试开始');
      try {
        let url = `${BASE_URL}/31`;
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          maxRedirects: undefined
        } as http.HttpRequestOptions;
        await httpRequest.requestInStream(url, options);
        console.error('[HttpRequest_MaxAutoRedirects_022] ❌ 预期失败但成功了');
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info(`[HttpRequest_MaxAutoRedirects_022] 捕获预期错误: code=${error.code}`);
        expect(error.code).assertEqual(2300047);
        console.info('[HttpRequest_MaxAutoRedirects_022]  测试通过');
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirects2300
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_2300
     * @tc.desc 31 redirects without maxRedirects should throw 2300047
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirects2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info('[testHttpRequestMaxAutoRedirects2300] 测试开始 - 默认超过30次重定向');
      try {
        let url = `${BASE_URL}/31`;
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          readTimeout: 120000,
          connectTimeout: 60000
        };
        await httpRequest.request(url, options);
        console.error('[HttpRequest_MaxAutoRedirects_045] ❌ 预期失败但成功了');
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info(`[HttpRequest_MaxAutoRedirects_045] 捕获预期错误: code=${error.code}`);
        expect(error.code).assertEqual(2300047);
        console.info('[HttpRequest_MaxAutoRedirects_045]  测试通过');
        done();
      }
    });

    /**
     * @tc.name testNetworkMgrHttpRequestMaxAutoRedirects2400
     * @tc.number SUB_NetworkMgr_Http_MaxAutoRedirects_2400
     * @tc.desc requestInStream 31 redirects should throw 2300047
     * @tc.size MEDIUMTEST
     * @tc.type Function
     * @tc.level Level1
     */
    it('testNetworkMgrHttpRequestMaxAutoRedirects2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1 , async (done: Function) => {
      console.info('[testHttpRequestMaxAutoRedirects2400] 测试开始 - requestInStream 默认超过30次重定向');
      try {
        let url = `${BASE_URL}/31`;
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.GET,
          readTimeout: 120000,
          connectTimeout: 60000
        };
        await httpRequest.requestInStream(url, options);
        console.error('[HttpRequest_MaxAutoRedirects_046]  预期失败但成功了');
        expect().assertFail();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info(`[HttpRequest_MaxAutoRedirects_046] 捕获预期错误: code=${error.code}`);
        expect(error.code).assertEqual(2300047);
        console.info('[HttpRequest_MaxAutoRedirects_046]  测试通过');
        done();
      }
    });
  });
}
