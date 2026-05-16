/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { http } from '@kit.NetworkKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(0x0000, 'testTag', `exportFail failed err: ${JSON.stringify(err)}`);
  }
};

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(0x0000, 'testTag', `exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

const HTTP_URL_BAIDU: string = "https://www.baidu.com/";
const HTTP_URL_OLD: string = "http://8.147.129.63:8088/old-path";
const HTTP_URL_CACHE: string = "http://8.147.129.63:8088/aaa";

// 通用request的head
const HEADER = { "content-type": "text/html" } as Record<string, string>;
// 不修改的body
const BODY_NO_CHANGE = { "context": "BODY_NO_CHANGE" } as Record<string, string>;
// 修改的body 在header中根据该字段判断是否进行修改
const BODY_CHANGE_URL = { "context": "BODY_CHANGE_URL" } as Record<string, string>;
const BODY_NOT_CHANGE_URL = { "context": "BODY_NOT_CHANGE_URL" } as Record<string, string>;
const BODY_GET_NOT_CHANGE = { "context": "BODY_GET_NOT_CHANGE" } as Record<string, string>;
const BODY_GET_CHANGE_URL_HEAD = { "context": "BODY_GET_CHANGE_URL_HEAD" } as Record<string, string>;
const BODY_GET_CHANGE_HEAD = { "context": "BODY_GET_CHANGE_HEAD" } as Record<string, string>;
const responseHeader =
  "content-encoding:br \r\n content-type:text/html\r\ncharset=UTF-8,cxy_all:+5c4ea5d1638626cbb796a7db10e0d663\r\ndate:Tue";

enum InterceptorType {
  // 1.创建请求之后，向服务端发送请求之前；
  // 2.result返回为true，标识请求可以继续往下执行；待确定：result返回为false，表示请求在此中断，将response的信息返回为客户端；
  INITIAL_REQUEST = 'INITIAL_REQUEST',

  REDIRECTION = 'REDIRECTION',
  //1.服务端返回信息，命中缓存之后触发(发送第二次相同请求之前并且命中缓存之后才会触发)；
  CACHE_CHECKED = 'READ_CACHE',
  // 1.创建请求之后，向服务端发送请求之前，更靠近请求；
  NETWORK_CONNECT = 'CONNECT_NETWORK',
  // 1.服务端返回信息之后；
  FINAL_RESPONSE = 'FINAL_RESPONSE'
}

const beginningResponse: http.HttpResponse = {
  result: "",
  resultType: http.HttpDataType.STRING,
  responseCode: 200,
  header: "",
  cookies: "",
  performanceTiming: ({
    dnsTiming: 0,
    tcpTiming: 0,
    tlsTiming: 0,
    firstSendTiming: 0,
    firstReceiveTiming: 0,
    totalFinishTiming: 0,
    redirectTiming: 0,
    responseHeaderTiming: 0,
    responseBodyTiming: 0,
    totalTiming: 0
  } as http.PerformanceTiming)
}
let initialResponse: http.HttpResponse = JSON.parse(JSON.stringify(beginningResponse));
let cacheResponse: http.HttpResponse = JSON.parse(JSON.stringify(beginningResponse));
let redirectionResponse: http.HttpResponse = JSON.parse(JSON.stringify(beginningResponse));
let finallyResponse: http.HttpResponse = JSON.parse(JSON.stringify(beginningResponse));
let networkResponse: http.HttpResponse = JSON.parse(JSON.stringify(beginningResponse));

class TestHttpInterceptor implements http.HttpInterceptor {
  interceptorType: InterceptorType = InterceptorType.INITIAL_REQUEST;
  result: boolean;
  title = "";

  constructor(interceptorType: InterceptorType, result: boolean) {
    this.interceptorType = interceptorType;
    this.result = result;
    this.title = this.interceptorType.toString() + " Promise.resolve(" + this.result + ")";
    hilog.info(0x0000, 'testTag', "TestHttpInterceptor::constructor::" + this.title + '::success');
  }

  interceptorHandle(reqContext: http.HttpRequestContext, rspContext: http.HttpResponse): Promise<http.ChainContinue> {
    hilog.info(0x0000, 'testTag', this.title + '::success');
    hilog.info(0x0000, 'testTag', this.title + '::reqContext::' + JSON.stringify(reqContext));
    hilog.info(0x0000, 'testTag', this.title + '::rspContext::' + JSON.stringify(rspContext));

    if (reqContext.url.includes('BODY_GET_NOT_CHANGE')) {
      hilog.info(0x0000, 'testTag', "reqContext.body['context'] === 'BODY_GET_NOT_CHANGE'");
    } else if (reqContext.url.includes('BODY_GET_CHANGE_HEAD')) {
      hilog.info(0x0000, 'testTag', "reqContext.body['context'] === 'BODY_GET_CHANGE_HEAD'");
      reqContext.header['INITIAL_REQUEST_GET'] = '1';
    } else if (reqContext.url.includes('BODY_GET_CHANGE_URL_HEAD')) {
      hilog.info(0x0000, 'testTag', "reqContext.body['context'] === 'BODY_GET_CHANGE_URL_HEAD'");
      reqContext.url = HTTP_URL_OLD + '/?' + reqContext.url.split('?')[1];
      reqContext.header['INITIAL_REQUEST_GET'] = '1';
    } else {
      let oldBody = JSON.parse(JSON.parse(JSON.stringify(reqContext.body))) as Record<string, string>;

      // 不修改
      if (oldBody['context'] === 'BODY_NO_CHANGE') {
        hilog.info(0x0000, 'testTag', "reqContext.body['context'] === 'BODY_NO_CHANGE'");
        ExpectTrue(JSON.stringify(reqContext.header) === JSON.stringify(HEADER));
        ExpectTrue(oldBody['context'] === 'BODY_NO_CHANGE');

      } else {
        if (oldBody['context'] === 'BODY_CHANGE_URL') {
          // 修改URL
          hilog.info(0x0000, 'testTag', "reqContext.body['context'] === 'BODY_CHANGE_URL'");
          reqContext.url = HTTP_URL_OLD;
        }

        // 第一次进入
        if (this.result) {
          if (!reqContext.header['INITIAL_REQUEST']) {
            hilog.info(0x0000, 'testTag', "!reqContext.body['INITIAL_REQUEST']");
            reqContext.header['INITIAL_REQUEST'] = '1';
          } else {
            hilog.info(0x0000, 'testTag', "reqContext.header['INITIAL_REQUEST']");
            ExpectTrue(reqContext.header['INITIAL_REQUEST'] === '1');
            reqContext.header['INITIAL_REQUEST'] = (Number(reqContext.header['INITIAL_REQUEST']) + 1).toString();
          }
        }
      }
    }

    rspContext.result = "INITIAL_REQUEST";
    rspContext.responseCode = 200;
    rspContext.header = responseHeader;
    if (!this.result) {
      initialResponse = JSON.parse(JSON.stringify(rspContext));
      initialResponse.header = {
        "charset=utf-8,cxy_all": "+5c4ea5d1638626cbb796a7db10e0d663",
        "content-encoding": "br",
        "content-type": "text/html",
        "date": "Tue"
      }
    }
    return Promise.resolve(this.result);
  }
}

class CacheHttpInterceptor implements http.HttpInterceptor {
  interceptorType: InterceptorType = InterceptorType.INITIAL_REQUEST;
  result: boolean;
  title = "";

  constructor(interceptorType: InterceptorType, result: boolean) {
    this.interceptorType = interceptorType;
    this.result = result;
    this.title = this.interceptorType.toString() + " Promise.resolve(" + this.result + ")";
    hilog.info(0x0000, 'testTag', "CacheHttpInterceptor::constructor::" + this.title + '::success');
  }

  interceptorHandle(reqContext: http.HttpRequestContext, rspContext: http.HttpResponse): Promise<http.ChainContinue> {
    hilog.info(0x0000, 'testTag', this.title + '::success');
    hilog.info(0x0000, 'testTag', this.title + '::reqContext::' + JSON.stringify(reqContext));
    hilog.info(0x0000, 'testTag', this.title + '::rspContext::' + JSON.stringify(rspContext));

    cacheResponse = JSON.parse(JSON.stringify(rspContext));
    if (reqContext.url.includes('BODY_GET_NOT_CHANGE')) {
      hilog.info(0x0000, 'testTag', "reqContext.body['context'] === 'BODY_GET_NOT_CHANGE'");
    } else {
      hilog.info(0x0000, 'testTag', "reqContext.body['context'] === 'BODY_GET_CHANGE_HEAD'");
      reqContext.header['CACHE_CHECKED'] = '1';
    }

    rspContext.result = "READ_CACHE";
    rspContext.responseCode = 500;
    rspContext.header = responseHeader;
    if (!this.result) {
      cacheResponse = JSON.parse(JSON.stringify(rspContext));
      cacheResponse.header = {
        "charset=utf-8,cxy_all": "+5c4ea5d1638626cbb796a7db10e0d663",
        "content-encoding": "br",
        "content-type": "text/html",
        "date": "Tue"
      }
    }
    return Promise.resolve(this.result);
  }
}

class RedirectionHttpInterceptor implements http.HttpInterceptor {
  interceptorType: InterceptorType = InterceptorType.REDIRECTION;
  result: boolean;
  title = "";

  constructor(interceptorType: InterceptorType, result: boolean) {
    this.interceptorType = interceptorType;
    this.result = result;
    this.title = this.interceptorType.toString() + " Promise.resolve(" + this.result + ")";
    hilog.info(0x0000, 'testTag', "RedirectionInterceptor::constructor::" + this.title + '::success');
  }

  interceptorHandle(reqContext: http.HttpRequestContext, rspContext: http.HttpResponse): Promise<http.ChainContinue> {
    hilog.info(0x0000, 'testTag', this.title + '::success');
    hilog.info(0x0000, 'testTag', this.title + '::reqContext::' + JSON.stringify(reqContext));
    hilog.info(0x0000, 'testTag', this.title + '::rspContext::' + JSON.stringify(rspContext));

    redirectionResponse = JSON.parse(JSON.stringify(rspContext));
    rspContext.result = "REDIRECTION";
    rspContext.responseCode = 500;
    rspContext.header = responseHeader;

    if (!this.result) {
      redirectionResponse = JSON.parse(JSON.stringify(rspContext));
      redirectionResponse.header = {
        "charset=utf-8,cxy_all": "+5c4ea5d1638626cbb796a7db10e0d663",
        "content-encoding": "br",
        "content-type": "text/html",
        "date": "Tue"
      }
    }
    return Promise.resolve(this.result);
  }
}

class FinallyHttpInterceptor implements http.HttpInterceptor {
  interceptorType: InterceptorType = InterceptorType.INITIAL_REQUEST;
  result: boolean;
  title = "";

  constructor(interceptorType: InterceptorType, result: boolean) {
    this.interceptorType = interceptorType;
    this.result = result;
    this.title = this.interceptorType.toString() + " Promise.resolve(" + this.result + ")";
    hilog.info(0x0000, 'testTag', "FinallyHttpInterceptor::constructor::" + this.title + '::success');
  }

  interceptorHandle(reqContext: http.HttpRequestContext, rspContext: http.HttpResponse): Promise<http.ChainContinue> {
    hilog.info(0x0000, 'testTag', this.title + '::success');
    hilog.info(0x0000, 'testTag', this.title + '::reqContext::' + JSON.stringify(reqContext));
    hilog.info(0x0000, 'testTag', this.title + '::rspContext::' + JSON.stringify(rspContext));
    finallyResponse = JSON.parse(JSON.stringify(rspContext));
    rspContext.result = "FINAL_RESPONSE";
    rspContext.responseCode = 900;
    rspContext.header = responseHeader;
    if (!this.result) {
      finallyResponse = JSON.parse(JSON.stringify(rspContext));
      finallyResponse.header = {
        "charset=utf-8,cxy_all": "+5c4ea5d1638626cbb796a7db10e0d663",
        "content-encoding": "br",
        "content-type": "text/html",
        "date": "Tue"
      }
    }
    return Promise.resolve(this.result);
  }
}

class NetworkHttpInterceptor implements http.HttpInterceptor {
  interceptorType: InterceptorType = InterceptorType.NETWORK_CONNECT;
  result: boolean;
  title = "";
  cnt = 0;

  constructor(interceptorType: InterceptorType, result: boolean) {
    this.interceptorType = interceptorType;
    this.result = result;
    this.title = this.interceptorType.toString() + " Promise.resolve(" + this.result + ")";
    hilog.info(0x0000, 'testTag', "NetworkHttpInterceptor::constructor::" + this.title + '::success');
  }

  interceptorHandle(reqContext: http.HttpRequestContext, rspContext: http.HttpResponse): Promise<http.ChainContinue> {
    hilog.info(0x0000, 'testTag', this.title + '::success');
    hilog.info(0x0000, 'testTag', this.title + '::reqContext::' + JSON.stringify(reqContext));
    hilog.info(0x0000, 'testTag', this.title + '::rspContext::' + JSON.stringify(rspContext));
    networkResponse = JSON.parse(JSON.stringify(rspContext));
    this.cnt++;
    if (reqContext.url.includes('BODY_GET_NOT_CHANGE')) {
      hilog.info(0x0000, 'testTag', "reqContext.body['context'] === 'BODY_GET_NOT_CHANGE'");
    } else if (reqContext.url.includes('BODY_GET_CHANGE_HEAD')) {
      hilog.info(0x0000, 'testTag', "reqContext.body['context'] === 'BODY_GET_CHANGE_HEAD'");
      reqContext.header['NETWORK_CONNECT_GET'] = '1';
    } else if (reqContext.url.includes('BODY_GET_CHANGE_URL_HEAD')) {
      hilog.info(0x0000, 'testTag', "reqContext.body['context'] === 'BODY_GET_CHANGE_URL_HEAD'");
      reqContext.url = HTTP_URL_OLD + '/?' + reqContext.url.split('?')[1];
      reqContext.header['NETWORK_CONNECT_GET'] = '1';
    } else {
      let oldBody = JSON.parse(JSON.parse(JSON.stringify(reqContext.body))) as Record<string, string>;

      // 不修改
      if (oldBody['context'] === 'BODY_NO_CHANGE') {
        hilog.info(0x0000, 'testTag', "reqContext.body['context'] === 'BODY_NO_CHANGE'");
        ExpectTrue(JSON.stringify(reqContext.header) === JSON.stringify(HEADER));
        ExpectTrue(oldBody['context'] === 'BODY_NO_CHANGE');

      } else {
        if (oldBody['context'] === 'BODY_CHANGE_URL') {
          // 修改URL
          hilog.info(0x0000, 'testTag', "reqContext.body['context'] === 'BODY_CHANGE_URL'");
          reqContext.url = HTTP_URL_BAIDU;
        }

        // 第一次进入
        if (this.result) {
          if (!reqContext.header['NETWORK_CONNECT']) {
            hilog.info(0x0000, 'testTag', "!reqContext.body['NETWORK_CONNECT']");
            reqContext.header['NETWORK_CONNECT'] = this.cnt.toString();
          } else {
            hilog.info(0x0000, 'testTag', "reqContext.header['NETWORK_CONNECT']");
            ExpectTrue(reqContext.header['NETWORK_CONNECT'] === (this.cnt - 1).toString());
            reqContext.header['NETWORK_CONNECT'] = this.cnt.toString();
          }
        }
      }
    }

    rspContext.result = "CONNECT_NETWORK";
    rspContext.responseCode = 900;
    rspContext.header = responseHeader;
    if (!this.result) {
      networkResponse = JSON.parse(JSON.stringify(rspContext));
      networkResponse.header = {
        "charset=utf-8,cxy_all": "+5c4ea5d1638626cbb796a7db10e0d663",
        "content-encoding": "br",
        "content-type": "text/html",
        "date": "Tue"
      }
    }
    return Promise.resolve(this.result);
  }
}

export default function HttpRequestInterceptor() {
  describe('HttpRequestInterceptor', () => {

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorHttpRequestOptions0100
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_HttpRequestOptions_0100
     * @tc.desc   test INITIAL_REQUEST && NETWORK_CONNECT && FINAL_RESPONSE true  BODY_NO_CHANGE interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorHttpRequestOptions0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorHttpRequestOptions0100";
        hilog.info(0x0000, 'testTag', `${caseName} test Start`);
        try {
          let httpRequest: http.HttpRequest = http.createHttp();
          hilog.info(0x0000, 'testTag', `${caseName} chain apply`);
          let chain: http.HttpInterceptorChain = new http.HttpInterceptorChain();
          let c1 = new TestHttpInterceptor(InterceptorType.INITIAL_REQUEST, true);
          let c2 = new NetworkHttpInterceptor(InterceptorType.NETWORK_CONNECT, true);
          let c3 = new FinallyHttpInterceptor(InterceptorType.FINAL_RESPONSE, true);
          chain.addChain([
            c1, c2, c3
          ]);
          let cs: http.HttpInterceptor[] = chain.getChain();
          hilog.info(0x0000, 'testTag', `${caseName} cs: ${JSON.stringify(cs)}`);
          chain.apply(httpRequest);
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
            header: HEADER,
            extraData: BODY_NO_CHANGE,
          };
          httpRequest.request(HTTP_URL_BAIDU, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              hilog.info(0x0000, 'testTag', `${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              hilog.info(0x0000, 'testTag', `${caseName} res:${JSON.stringify(res)}`);
              hilog.info(0x0000, 'testTag', `${caseName} finallyResponse:${JSON.stringify(finallyResponse)}`);
              httpRequest.destroy();
              ExpectTrue(finallyResponse.responseCode === res.responseCode)
              ExpectTrue(finallyResponse.cookies === res.cookies)
              ExpectTrue(JSON.stringify(finallyResponse.header) === JSON.stringify(res.header))
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(0x0000, 'testTag', `${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorHttpRequestOptions0200
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_HttpRequestOptions_0200
     * @tc.desc   test CACHE_CHECKED true BODY_NO_CHANGE interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorHttpRequestOptions0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorHttpRequestOptions0200";
        hilog.info(0x0000, 'testTag', `${caseName} test Start`);
        try {
          let chain: http.HttpInterceptorChain = new http.HttpInterceptorChain()
          let c1 = new CacheHttpInterceptor(InterceptorType.CACHE_CHECKED, true);
          chain.addChain([
            c1
          ]);
          let httpRequest: http.HttpRequest = http.createHttp();
          chain.apply(httpRequest)
          let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.GET,
            header: HEADER,
            extraData: BODY_GET_NOT_CHANGE,
          };
          httpRequest.request(HTTP_URL_CACHE, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              hilog.info(0x0000, 'testTag', `${caseName} firstResponse failed err: ${JSON.stringify(err)}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              hilog.info(0x0000, 'testTag', `${caseName} firstResponse ${JSON.stringify(res)}`);
              httpRequest.request(HTTP_URL_CACHE, options, (err: BusinessError, data: http.HttpResponse) => {
                if (err) {
                  hilog.info(0x0000, 'testTag', `${caseName} secondResponse failed err: ${JSON.stringify(err)}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  hilog.info(0x0000, 'testTag', `${caseName} secondResponse ${JSON.stringify(data)}`);
                  hilog.info(0x0000, 'testTag', `${caseName} rescache ${JSON.stringify(cacheResponse)}`);
                  httpRequest.destroy();
                  ExpectTrue(cacheResponse.responseCode === data.responseCode)
                  ExpectTrue(cacheResponse.cookies === data.cookies)
                  ExpectTrue(JSON.stringify(cacheResponse.header) === JSON.stringify(data.header))
                  done();
                }
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(0x0000, 'testTag', `${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorHttpRequestOptions0300
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_HttpRequestOptions_0300
     * @tc.desc   test REDIRECTION true BODY_NO_CHANGE interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorHttpRequestOptions0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorHttpRequestOptions0300";
        hilog.info(0x0000, 'testTag', `${caseName} test Start`);
        try {
          let httpRequest: http.HttpRequest = http.createHttp();
          hilog.info(0x0000, 'testTag', `${caseName} chain apply`);
          let chain: http.HttpInterceptorChain = new http.HttpInterceptorChain();
          let c1 = new RedirectionHttpInterceptor(InterceptorType.REDIRECTION, true);
          chain.addChain([
            c1
          ]);
          let cs: http.HttpInterceptor[] = chain.getChain();
          hilog.info(0x0000, 'testTag', `${caseName} cs: ${JSON.stringify(cs)}`);
          chain.apply(httpRequest);
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
            header: HEADER,
            extraData: BODY_NO_CHANGE,
          };
          httpRequest.request(HTTP_URL_OLD, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              hilog.info(0x0000, 'testTag', `${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              hilog.info(0x0000, 'testTag', `${caseName} res:${JSON.stringify(res)}`);
              httpRequest.destroy();
              ExpectTrue(res.responseCode === 200);
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(0x0000, 'testTag', `${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorHttpRequestOptions0400
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_HttpRequestOptions_0400
     * @tc.desc   test INITIAL_REQUEST && NETWORK_CONNECT && FINAL_RESPONSE true BODY_CHANGE_URL interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorHttpRequestOptions0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorHttpRequestOptions0400";
        hilog.info(0x0000, 'testTag', `${caseName} test Start`);
        try {
          let httpRequest: http.HttpRequest = http.createHttp();
          hilog.info(0x0000, 'testTag', `${caseName} chain apply`);
          let chain: http.HttpInterceptorChain = new http.HttpInterceptorChain();
          let c1 = new TestHttpInterceptor(InterceptorType.INITIAL_REQUEST, true);
          let c2 = new NetworkHttpInterceptor(InterceptorType.NETWORK_CONNECT, true);
          let c3 = new FinallyHttpInterceptor(InterceptorType.FINAL_RESPONSE, true);
          chain.addChain([
            c1, c2, c3
          ]);
          let cs: http.HttpInterceptor[] = chain.getChain();
          hilog.info(0x0000, 'testTag', `${caseName} cs: ${JSON.stringify(cs)}`);
          chain.apply(httpRequest);
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
            header: HEADER,
            extraData: BODY_CHANGE_URL,
          };
          httpRequest.request(HTTP_URL_BAIDU, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              hilog.info(0x0000, 'testTag', `${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              hilog.info(0x0000, 'testTag', `${caseName} res:${JSON.stringify(res)}`);
              hilog.info(0x0000, 'testTag', `${caseName} finallyResponse:${JSON.stringify(finallyResponse)}`);
              httpRequest.destroy();
              ExpectTrue(finallyResponse.responseCode === res.responseCode)
              ExpectTrue(finallyResponse.cookies === res.cookies)
              ExpectTrue(JSON.stringify(finallyResponse.header) === JSON.stringify(res.header))
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(0x0000, 'testTag', `${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorHttpRequestOptions0500
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_HttpRequestOptions_0500
     * @tc.desc   test INITIAL_REQUEST && CACHE_CHECKED && FINAL_RESPONSE true BODY_NOT_CHANGE_URL interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorHttpRequestOptions0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorHttpRequestOptions0500";
        hilog.info(0x0000, 'testTag', `${caseName} test Start`);
        try {
          let httpRequest: http.HttpRequest = http.createHttp();
          let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.GET,
            header: HEADER,
            extraData: BODY_GET_CHANGE_HEAD,
          };
          let chain: http.HttpInterceptorChain = new http.HttpInterceptorChain();
          let c1 = new TestHttpInterceptor(InterceptorType.INITIAL_REQUEST, true);
          let c2 = new CacheHttpInterceptor(InterceptorType.CACHE_CHECKED, true);
          let c3 = new FinallyHttpInterceptor(InterceptorType.FINAL_RESPONSE, true);
          chain.addChain([
            c1, c2, c3
          ]);
          let cs: http.HttpInterceptor[] = chain.getChain();
          hilog.info(0x0000, 'testTag', `${caseName} cs: ${JSON.stringify(cs)}`);
          chain.apply(httpRequest);
          hilog.info(0x0000, 'testTag', `${caseName} chain apply`);
          httpRequest.request(HTTP_URL_CACHE, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              hilog.info(0x0000, 'testTag', `${caseName} firstResponse failed err: ${JSON.stringify(err)}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              hilog.info(0x0000, 'testTag', `${caseName} firstResponse ${JSON.stringify(res)}`);
              httpRequest.request(HTTP_URL_CACHE, options, (err: BusinessError, data: http.HttpResponse) => {
                if (err) {
                  hilog.info(0x0000, 'testTag', `${caseName} secondResponse failed err: ${JSON.stringify(err)}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  hilog.info(0x0000, 'testTag', `${caseName} secondResponse ${JSON.stringify(data)}`);
                  hilog.info(0x0000, 'testTag', `${caseName} rescache ${JSON.stringify(cacheResponse)}`);
                  hilog.info(0x0000, 'testTag', `${caseName} finallyResponse:${JSON.stringify(finallyResponse)}`);
                  httpRequest.destroy();
                  ExpectTrue(cacheResponse.responseCode === data.responseCode)
                  ExpectTrue(cacheResponse.cookies === data.cookies)
                  ExpectTrue(JSON.stringify(cacheResponse.header) === JSON.stringify(data.header))
                  ExpectTrue(finallyResponse.responseCode === data.responseCode)
                  ExpectTrue(finallyResponse.cookies === data.cookies)
                  ExpectTrue(JSON.stringify(finallyResponse.header) === JSON.stringify(data.header))
                  done();
                }
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(0x0000, 'testTag', `${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorHttpRequestOptions0600
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_HttpRequestOptions_0600
     * @tc.desc   test INITIAL_REQUEST && NETWORK_CONNECT && REDIRECTION && FINAL_RESPONSE true BODY_CHANGE_URL interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorHttpRequestOptions0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorHttpRequestOptions0600";
        hilog.info(0x0000, 'testTag', `${caseName} test Start`);
        try {
          let httpRequest: http.HttpRequest = http.createHttp();
          hilog.info(0x0000, 'testTag', `${caseName} chain apply`);
          let chain: http.HttpInterceptorChain = new http.HttpInterceptorChain();
          let c1 = new TestHttpInterceptor(InterceptorType.INITIAL_REQUEST, true);
          let c3 = new NetworkHttpInterceptor(InterceptorType.NETWORK_CONNECT, true);
          let c4 = new RedirectionHttpInterceptor(InterceptorType.REDIRECTION, true);
          let c5 = new FinallyHttpInterceptor(InterceptorType.FINAL_RESPONSE, true);
          chain.addChain([
            c1, c3, c4, c5
          ]);
          let cs: http.HttpInterceptor[] = chain.getChain();
          hilog.info(0x0000, 'testTag', `${caseName} cs: ${JSON.stringify(cs)}`);
          chain.apply(httpRequest);
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
            header: HEADER,
            extraData: BODY_NOT_CHANGE_URL,
          };
          httpRequest.request(HTTP_URL_OLD, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              hilog.info(0x0000, 'testTag', `${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              hilog.info(0x0000, 'testTag', `${caseName} res:${JSON.stringify(res)}`);
              hilog.info(0x0000, 'testTag', `${caseName} finallyResponse:${JSON.stringify(finallyResponse)}`);
              httpRequest.destroy();
              ExpectTrue(finallyResponse.responseCode === res.responseCode)
              ExpectTrue(finallyResponse.cookies === res.cookies)
              ExpectTrue(JSON.stringify(finallyResponse.header) === JSON.stringify(res.header))
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(0x0000, 'testTag', `${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorHttpRequestOptions0700
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_HttpRequestOptions_0700
     * @tc.desc   test INITIAL_REQUEST && NETWORK_CONNECT && FINAL_RESPONSE true BODY_CHANGE_URL interceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorHttpRequestOptions0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorHttpRequestOptions0700";
        hilog.info(0x0000, 'testTag', `${caseName} test Start`);
        try {
          let httpRequest: http.HttpRequest = http.createHttp();
          hilog.info(0x0000, 'testTag', `${caseName} chain apply`);
          let chain: http.HttpInterceptorChain = new http.HttpInterceptorChain();
          let c1 = new TestHttpInterceptor(InterceptorType.INITIAL_REQUEST, true);
          let c2 = new NetworkHttpInterceptor(InterceptorType.NETWORK_CONNECT, true);
          let c3 = new FinallyHttpInterceptor(InterceptorType.FINAL_RESPONSE, true);
          chain.addChain([
            c1, c2, c3
          ]);
          let cs: http.HttpInterceptor[] = chain.getChain();
          hilog.info(0x0000, 'testTag', `${caseName} cs: ${JSON.stringify(cs)}`);
          chain.apply(httpRequest);
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.GET,
            header: HEADER,
            extraData: BODY_GET_CHANGE_URL_HEAD,
          };
          httpRequest.request(HTTP_URL_BAIDU, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              hilog.info(0x0000, 'testTag', `${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              hilog.info(0x0000, 'testTag', `${caseName} res:${JSON.stringify(res)}`);
              hilog.info(0x0000, 'testTag', `${caseName} finallyResponse:${JSON.stringify(finallyResponse)}`);
              httpRequest.destroy();
              ExpectTrue(finallyResponse.responseCode === res.responseCode)
              ExpectTrue(finallyResponse.cookies === res.cookies)
              ExpectTrue(JSON.stringify(finallyResponse.header) === JSON.stringify(res.header))
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(0x0000, 'testTag', `${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorHttpRequestOptions0800
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_HttpRequestOptions_0800
     * @tc.desc   test INITIAL_REQUEST false BODY_NO_CHANGE HttpRequestInterceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorHttpRequestOptions0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorHttpRequestOptions0800";
        hilog.info(0x0000, 'testTag', `${caseName} test Start`);
        try {
          let chain: http.HttpInterceptorChain = new http.HttpInterceptorChain();
          let c1 = new TestHttpInterceptor(InterceptorType.INITIAL_REQUEST, false);
          chain.addChain([
            c1
          ]);
          let cs: http.HttpInterceptor[] = chain.getChain();
          hilog.info(0x0000, 'testTag', `${caseName} cs: ${JSON.stringify(cs)}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          hilog.info(0x0000, 'testTag', `${caseName} chain apply`);
          chain.apply(httpRequest);
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
            header: HEADER,
            extraData: BODY_NO_CHANGE,
          };
          httpRequest.request(HTTP_URL_BAIDU, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              hilog.info(0x0000, 'testTag', `${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              hilog.info(0x0000, 'testTag', `${caseName} res:${JSON.stringify(res)}`);
              httpRequest.destroy();
              ExpectTrue(res.result == "INITIAL_REQUEST");
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(0x0000, 'testTag', `${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorHttpRequestOptions0900
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_HttpRequestOptions_0900
     * @tc.desc   test NETWORK_CONNECT false BODY_NO_CHANGE HttpRequestInterceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorHttpRequestOptions0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorHttpRequestOptions0900";
        hilog.info(0x0000, 'testTag', `${caseName} test Start`);
        try {
          let chain: http.HttpInterceptorChain = new http.HttpInterceptorChain();
          let c3 = new NetworkHttpInterceptor(InterceptorType.NETWORK_CONNECT, false);
          chain.addChain([
            c3
          ]);
          let cs: http.HttpInterceptor[] = chain.getChain();
          hilog.info(0x0000, 'testTag', `${caseName} cs: ${JSON.stringify(cs)}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          hilog.info(0x0000, 'testTag', `${caseName} chain apply`);
          chain.apply(httpRequest);
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
            header: HEADER,
            extraData: BODY_NO_CHANGE,
          };
          httpRequest.request(HTTP_URL_BAIDU, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              hilog.info(0x0000, 'testTag', `${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              hilog.info(0x0000, 'testTag', `${caseName} res:${JSON.stringify(res)}`);
              httpRequest.destroy();
              ExpectTrue(res.result === "CONNECT_NETWORK");
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(0x0000, 'testTag', `${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorHttpRequestOptions1000
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_HttpRequestOptions_1000
     * @tc.desc   test FINAL_RESPONSE false BODY_NO_CHANGE HttpRequestInterceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorHttpRequestOptions1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorHttpRequestOptions1000";
        hilog.info(0x0000, 'testTag', `${caseName} test Start`);
        try {
          let chain: http.HttpInterceptorChain = new http.HttpInterceptorChain();
          let c5 = new FinallyHttpInterceptor(InterceptorType.FINAL_RESPONSE, false);
          chain.addChain([
            c5
          ]);
          let cs: http.HttpInterceptor[] = chain.getChain();
          hilog.info(0x0000, 'testTag', `${caseName} cs: ${JSON.stringify(cs)}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          hilog.info(0x0000, 'testTag', `${caseName} chain apply`);
          chain.apply(httpRequest);
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
            header: HEADER,
            extraData: BODY_NO_CHANGE,
          };
          httpRequest.request(HTTP_URL_BAIDU, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              hilog.info(0x0000, 'testTag', `${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              hilog.info(0x0000, 'testTag', `${caseName} res:${JSON.stringify(res)}`);
              httpRequest.destroy();
              ExpectTrue(res.result === "FINAL_RESPONSE");
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(0x0000, 'testTag', `${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorHttpRequestOptions1100
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_HttpRequestOptions_1100
     * @tc.desc   test REDIRECTION false BODY_NO_CHANGE HttpRequestInterceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorHttpRequestOptions1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorHttpRequestOptions1100";
        hilog.info(0x0000, 'testTag', `${caseName} test Start`);
        try {
          let chain: http.HttpInterceptorChain = new http.HttpInterceptorChain();
          let c4 = new RedirectionHttpInterceptor(InterceptorType.REDIRECTION, false);
          chain.addChain([
            c4
          ]);
          let cs: http.HttpInterceptor[] = chain.getChain();
          hilog.info(0x0000, 'testTag', `${caseName} cs: ${JSON.stringify(cs)}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          hilog.info(0x0000, 'testTag', `${caseName} chain apply`);
          chain.apply(httpRequest);
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
            header: HEADER,
            extraData: BODY_NO_CHANGE,
          };
          httpRequest.request(HTTP_URL_OLD, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              hilog.info(0x0000, 'testTag', `${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              hilog.info(0x0000, 'testTag', `${caseName} res:${JSON.stringify(res)}`);
              httpRequest.destroy();
              ExpectTrue(res.result === "REDIRECTION");
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(0x0000, 'testTag', `${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorHttpRequestOptions1200
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_HttpRequestOptions_1200
     * @tc.desc   test CACHE_CHECKED false BODY_NO_CHANGE HttpRequestInterceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorHttpRequestOptions1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorHttpRequestOptions1200";
        hilog.info(0x0000, 'testTag', `${caseName} test Start`);
        try {
          let chain: http.HttpInterceptorChain = new http.HttpInterceptorChain();
          let c2 = new CacheHttpInterceptor(InterceptorType.CACHE_CHECKED, false);
          chain.addChain([
            c2
          ]);
          let cs: http.HttpInterceptor[] = chain.getChain();
          hilog.info(0x0000, 'testTag', `${caseName} cs: ${JSON.stringify(cs)}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          hilog.info(0x0000, 'testTag', `${caseName} chain apply`);
          chain.apply(httpRequest);
          let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.GET,
            header: HEADER,
            extraData: BODY_GET_NOT_CHANGE,
          };
          httpRequest.request(HTTP_URL_CACHE, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              hilog.info(0x0000, 'testTag', `${caseName} firstResponse failed err: ${JSON.stringify(err)}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              hilog.info(0x0000, 'testTag', `${caseName} firstResponse ${JSON.stringify(res)}`);
              httpRequest.request(HTTP_URL_CACHE, options, (err: BusinessError, data: http.HttpResponse) => {
                if (err) {
                  hilog.info(0x0000, 'testTag', `${caseName} secondResponse failed err: ${JSON.stringify(err)}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  hilog.info(0x0000, 'testTag', `${caseName} secondResponse ${JSON.stringify(data)}`);
                  httpRequest.destroy();
                  ExpectTrue(data.result === "READ_CACHE");
                  done();
                }
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `${caseName} catch ERROR-->:${JSON.stringify(err)}`)
          ExpectFail();
          done();
        }
        hilog.info(0x0000, 'testTag', `${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorHttpRequestOptions1300
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_HttpRequestOptions_1300
     * @tc.desc   test INITIAL_REQUEST && CACHE_CHECKED && FINAL_RESPONSE true BODY_NOT_CHANGE_URL and noHttpRequestInterceptor HttpRequestInterceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorHttpRequestOptions1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorHttpRequestOptions1300";
        hilog.info(0x0000, 'testTag', `${caseName} test Start`);
        try {
          let httpRequest: http.HttpRequest = http.createHttp();
          let httpRequest1: http.HttpRequest = http.createHttp();
          hilog.info(0x0000, 'testTag', `${caseName} chain apply`);
          let chain: http.HttpInterceptorChain = new http.HttpInterceptorChain();
          let c1 = new TestHttpInterceptor(InterceptorType.INITIAL_REQUEST, true);
          let c2 = new NetworkHttpInterceptor(InterceptorType.NETWORK_CONNECT, true);
          let c3 = new FinallyHttpInterceptor(InterceptorType.FINAL_RESPONSE, true);
          chain.addChain([
            c1, c2, c3
          ]);
          let cs: http.HttpInterceptor[] = chain.getChain();
          hilog.info(0x0000, 'testTag', `${caseName} cs: ${JSON.stringify(cs)}`);
          chain.apply(httpRequest);
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
            header: HEADER,
            extraData: BODY_NO_CHANGE,
          };
          httpRequest.request(HTTP_URL_BAIDU, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              hilog.info(0x0000, 'testTag', `${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              hilog.info(0x0000, 'testTag', `${caseName} res:${JSON.stringify(res)}`);
              httpRequest.destroy();
              httpRequest1.request(HTTP_URL_OLD, options, (err: BusinessError, data: http.HttpResponse) => {
                if (err) {
                  hilog.info(0x0000, 'testTag',
                    `${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  hilog.info(0x0000, 'testTag', `${caseName} data:${JSON.stringify(data)}`);
                  hilog.info(0x0000, 'testTag', `${caseName} finallyResponse:${JSON.stringify(finallyResponse)}`);
                  httpRequest.destroy();
                  ExpectTrue(finallyResponse.responseCode === res.responseCode)
                  ExpectTrue(finallyResponse.cookies === res.cookies)
                  ExpectTrue(JSON.stringify(finallyResponse.header) === JSON.stringify(res.header))
                  done();
                }
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(0x0000, 'testTag', `${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorHttpRequestOptions1400
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_HttpRequestOptions_1400
     * @tc.desc   test INITIAL_REQUEST false BODY_NO_CHANGE HttpRequestInterceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorHttpRequestOptions1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorHttpRequestOptions1400";
        hilog.info(0x0000, 'testTag', `${caseName} test Start`);
        try {
          let chain: http.HttpInterceptorChain = new http.HttpInterceptorChain();
          let c1 = new TestHttpInterceptor(InterceptorType.INITIAL_REQUEST, false);
          chain.addChain([
            c1
          ]);
          let cs: http.HttpInterceptor[] = chain.getChain();
          hilog.info(0x0000, 'testTag', `${caseName} cs: ${JSON.stringify(cs)}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          hilog.info(0x0000, 'testTag', `${caseName} chain apply`);
          chain.apply(httpRequest);
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
            header: HEADER,
            extraData: BODY_NO_CHANGE,
          };
          httpRequest.request(HTTP_URL_BAIDU, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              hilog.info(0x0000, 'testTag', `${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              hilog.info(0x0000, 'testTag', `${caseName} res:${JSON.stringify(res)}`);
              hilog.info(0x0000, 'testTag', `${caseName} initialResponse:${JSON.stringify(initialResponse)}`);
              ExpectTrue(res.responseCode === initialResponse.responseCode);
              ExpectTrue(res.result === initialResponse.result);
              ExpectTrue(res.header["charset=utf-8,cxy_all"] === initialResponse.header["charset=utf-8,cxy_all"]);
              ExpectTrue(res.header["content-encoding"] === initialResponse.header["content-encoding"]);
              ExpectTrue(res.header["content-type"] === initialResponse.header["content-type"]);
              ExpectTrue(res.header["date"] === initialResponse.header["date"]);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(0x0000, 'testTag', `${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorHttpRequestOptions1500
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_HttpRequestOptions_1500
     * @tc.desc   test NETWORK_CONNECT false BODY_NO_CHANGE HttpRequestInterceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorHttpRequestOptions1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorHttpRequestOptions1500";
        hilog.info(0x0000, 'testTag', `${caseName} test Start`);
        try {
          let chain: http.HttpInterceptorChain = new http.HttpInterceptorChain();
          let c3 = new NetworkHttpInterceptor(InterceptorType.NETWORK_CONNECT, false);
          chain.addChain([
            c3
          ]);
          let cs: http.HttpInterceptor[] = chain.getChain();
          hilog.info(0x0000, 'testTag', `${caseName} cs: ${JSON.stringify(cs)}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          hilog.info(0x0000, 'testTag', `${caseName} chain apply`);
          chain.apply(httpRequest);
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
            header: HEADER,
            extraData: BODY_NO_CHANGE,
          };
          httpRequest.request(HTTP_URL_BAIDU, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              hilog.info(0x0000, 'testTag', `${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              hilog.info(0x0000, 'testTag', `${caseName} res:${JSON.stringify(res)}`);
              hilog.info(0x0000, 'testTag', `${caseName} networkResponse:${JSON.stringify(networkResponse)}`);
              httpRequest.destroy();
              ExpectTrue(res.responseCode === networkResponse.responseCode);
              ExpectTrue(res.result === networkResponse.result);
              ExpectTrue(res.header["charset=utf-8,cxy_all"] === networkResponse.header["charset=utf-8,cxy_all"]);
              ExpectTrue(res.header["content-encoding"] === networkResponse.header["content-encoding"]);
              ExpectTrue(res.header["content-type"] === networkResponse.header["content-type"]);
              ExpectTrue(res.header["date"] === networkResponse.header["date"]);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(0x0000, 'testTag', `${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorHttpRequestOptions1600
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_HttpRequestOptions_1600
     * @tc.desc   test FINAL_RESPONSE false BODY_NO_CHANGE HttpRequestInterceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorHttpRequestOptions1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorHttpRequestOptions1600";
        hilog.info(0x0000, 'testTag', `${caseName} test Start`);
        try {
          let chain: http.HttpInterceptorChain = new http.HttpInterceptorChain();
          let c5 = new FinallyHttpInterceptor(InterceptorType.FINAL_RESPONSE, false);
          chain.addChain([
            c5
          ]);
          let cs: http.HttpInterceptor[] = chain.getChain();
          hilog.info(0x0000, 'testTag', `${caseName} cs: ${JSON.stringify(cs)}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          hilog.info(0x0000, 'testTag', `${caseName} chain apply`);
          chain.apply(httpRequest);
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
            header: HEADER,
            extraData: BODY_NO_CHANGE,
          };
          httpRequest.request(HTTP_URL_BAIDU, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              hilog.info(0x0000, 'testTag', `${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              hilog.info(0x0000, 'testTag', `${caseName} res:${JSON.stringify(res)}`);
              hilog.info(0x0000, 'testTag', `${caseName} finallyResponse:${JSON.stringify(finallyResponse)}`);
              ExpectTrue(res.responseCode === finallyResponse.responseCode);
              ExpectTrue(res.result === finallyResponse.result);
              ExpectTrue(res.header["charset=utf-8,cxy_all"] === finallyResponse.header["charset=utf-8,cxy_all"]);
              ExpectTrue(res.header["content-encoding"] === finallyResponse.header["content-encoding"]);
              ExpectTrue(res.header["content-type"] === finallyResponse.header["content-type"]);
              ExpectTrue(res.header["date"] === finallyResponse.header["date"]);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(0x0000, 'testTag', `${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorHttpRequestOptions1700
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_HttpRequestOptions_1700
     * @tc.desc   test REDIRECTION false BODY_NO_CHANGE HttpRequestInterceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorHttpRequestOptions1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorHttpRequestOptions1700";
        hilog.info(0x0000, 'testTag', `${caseName} test Start`);
        try {
          let chain: http.HttpInterceptorChain = new http.HttpInterceptorChain();
          let c4 = new RedirectionHttpInterceptor(InterceptorType.REDIRECTION, false);
          chain.addChain([
            c4
          ]);
          let cs: http.HttpInterceptor[] = chain.getChain();
          hilog.info(0x0000, 'testTag', `${caseName} cs: ${JSON.stringify(cs)}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          hilog.info(0x0000, 'testTag', `${caseName} chain apply`);
          chain.apply(httpRequest);
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
            header: HEADER,
            extraData: BODY_NO_CHANGE,
          };
          httpRequest.request(HTTP_URL_OLD, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              hilog.info(0x0000, 'testTag', `${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              hilog.info(0x0000, 'testTag', `${caseName} res:${JSON.stringify(res)}`);
              hilog.info(0x0000, 'testTag', `${caseName} redirectionResponse:${JSON.stringify(redirectionResponse)}`);
              ExpectTrue(res.responseCode === redirectionResponse.responseCode);
              ExpectTrue(res.result === redirectionResponse.result);
              ExpectTrue(res.header["charset=utf-8,cxy_all"] === redirectionResponse.header["charset=utf-8,cxy_all"]);
              ExpectTrue(res.header["content-encoding"] === redirectionResponse.header["content-encoding"]);
              ExpectTrue(res.header["content-type"] === redirectionResponse.header["content-type"]);
              ExpectTrue(res.header["date"] === redirectionResponse.header["date"]);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        hilog.info(0x0000, 'testTag', `${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorHttpRequestOptions1800
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_HttpRequestOptions_1800
     * @tc.desc   test CACHE_CHECKED false BODY_NO_CHANGE HttpRequestInterceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorHttpRequestOptions1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorHttpRequestOptions1800";
        hilog.info(0x0000, 'testTag', `${caseName} test Start`);
        try {
          let chain: http.HttpInterceptorChain = new http.HttpInterceptorChain();
          let c2 = new CacheHttpInterceptor(InterceptorType.CACHE_CHECKED, false);
          let chainResult: boolean = chain.addChain([c2]);
          ExpectTrue(chainResult)
          let cs: http.HttpInterceptor[] = chain.getChain();
          hilog.info(0x0000, 'testTag', `${caseName} cs: ${JSON.stringify(cs)}`);
          let httpRequest: http.HttpRequest = http.createHttp();
          hilog.info(0x0000, 'testTag', `${caseName} chain apply`);
          let chainApplyResult: boolean = chain.apply(httpRequest);
          ExpectTrue(chainApplyResult)
          let httpResponseCache: http.HttpResponseCache = http.createHttpResponseCache();
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.GET,
            header: HEADER,
            extraData: BODY_GET_NOT_CHANGE,
          };
          httpRequest.request(HTTP_URL_CACHE, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              hilog.info(0x0000, 'testTag', `${caseName} firstResponse failed err: ${JSON.stringify(err)}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              hilog.info(0x0000, 'testTag', `${caseName} firstResponse ${JSON.stringify(res)}`);
              httpRequest.request(HTTP_URL_CACHE, options, (err: BusinessError, data: http.HttpResponse) => {
                if (err) {
                  hilog.info(0x0000, 'testTag', `${caseName} secondResponse failed err: ${JSON.stringify(err)}`);
                  httpRequest.destroy();
                  ExpectFail();
                  done();
                } else {
                  hilog.info(0x0000, 'testTag', `${caseName} secondResponse ${JSON.stringify(data)}`);
                  hilog.info(0x0000, 'testTag', `${caseName} cacheResponse:${JSON.stringify(cacheResponse)}`);
                  ExpectTrue(data.responseCode === cacheResponse.responseCode);
                  ExpectTrue(data.result === cacheResponse.result);
                  ExpectTrue(data.header["charset=utf-8,cxy_all"] === cacheResponse.header["charset=utf-8,cxy_all"]);
                  ExpectTrue(data.header["content-encoding"] === cacheResponse.header["content-encoding"]);
                  ExpectTrue(data.header["content-type"] === cacheResponse.header["content-type"]);
                  ExpectTrue(data.header["date"] === cacheResponse.header["date"]);
                  httpRequest.destroy();
                  done();
                }
              });
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `${caseName} catch ERROR-->:${JSON.stringify(err)}`)
          ExpectFail();
          done();
        }
        hilog.info(0x0000, 'testTag', `${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorHttpRequestOptions1900
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_HttpRequestOptions_1900
     * @tc.desc   test chain.apply(undefined) catch Parameter type not supported by the interceptor error 2300801 HttpRequestInterceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorHttpRequestOptions1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorHttpRequestOptions1900";
        hilog.info(0x0000, 'testTag', `${caseName} test Start`);
        try {
          let httpRequest: http.HttpRequest = http.createHttp();
          hilog.info(0x0000, 'testTag', `${caseName} chain apply`);
          let chain: http.HttpInterceptorChain = new http.HttpInterceptorChain();
          let c1 = new TestHttpInterceptor(InterceptorType.INITIAL_REQUEST, true);
          chain.addChain([
            c1
          ]);
          let cs: http.HttpInterceptor[] = chain.getChain();
          hilog.info(0x0000, 'testTag', `${caseName} cs: ${JSON.stringify(cs)}`);
          chain.apply(undefined);
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
            header: HEADER,
            extraData: BODY_NO_CHANGE,
          };
          httpRequest.request(HTTP_URL_BAIDU, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              hilog.info(0x0000, 'testTag', `${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              hilog.info(0x0000, 'testTag', `${caseName} res:${JSON.stringify(res)}`);
              hilog.info(0x0000, 'testTag', `${caseName} finallyResponse:${JSON.stringify(finallyResponse)}`);
              httpRequest.destroy();
              ExpectTrue(finallyResponse.responseCode === res.responseCode)
              ExpectTrue(finallyResponse.cookies === res.cookies)
              ExpectTrue(JSON.stringify(finallyResponse.header) === JSON.stringify(res.header))
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectTrue(err.code == 2300801);
          ExpectTrue(err.message === "Parameter type not supported by the interceptor");
          done();
        }
        hilog.info(0x0000, 'testTag', `${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorHttpRequestOptions2000
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_HttpRequestOptions_2000
     * @tc.desc   test chain.addChain(undefined) catch Duplicated interceptor type in the chain error 2300801 HttpRequestInterceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorHttpRequestOptions2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorHttpRequestOptions2000";
        hilog.info(0x0000, 'testTag', `${caseName} test Start`);
        try {
          let httpRequest: http.HttpRequest = http.createHttp();
          hilog.info(0x0000, 'testTag', `${caseName} chain apply`);
          let chain: http.HttpInterceptorChain = new http.HttpInterceptorChain();
          let c1 = new TestHttpInterceptor(InterceptorType.INITIAL_REQUEST, true);
          chain.addChain(undefined);
          let cs: http.HttpInterceptor[] = chain.getChain();
          hilog.info(0x0000, 'testTag', `${caseName} cs: ${JSON.stringify(cs)}`);
          chain.apply(httpRequest);
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
            header: HEADER,
            extraData: BODY_NO_CHANGE,
          };
          httpRequest.request(HTTP_URL_BAIDU, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              hilog.info(0x0000, 'testTag', `${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              hilog.info(0x0000, 'testTag', `${caseName} res:${JSON.stringify(res)}`);
              hilog.info(0x0000, 'testTag', `${caseName} finallyResponse:${JSON.stringify(finallyResponse)}`);
              httpRequest.destroy();
              ExpectTrue(finallyResponse.responseCode === res.responseCode)
              ExpectTrue(finallyResponse.cookies === res.cookies)
              ExpectTrue(JSON.stringify(finallyResponse.header) === JSON.stringify(res.header))
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectTrue(err.code == 2300801);
          ExpectTrue(err.message === "Parameter type not supported by the interceptor");
          done();
        }
        hilog.info(0x0000, 'testTag', `${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorHttpRequestOptions2100
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_HttpRequestOptions_2100
     * @tc.desc   test chain.addChain([c1, c1, c1]) catch Duplicated interceptor type in the chain error 2300802 HttpRequestInterceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorHttpRequestOptions2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorHttpRequestOptions2100";
        hilog.info(0x0000, 'testTag', `${caseName} test Start`);
        try {
          let httpRequest: http.HttpRequest = http.createHttp();
          hilog.info(0x0000, 'testTag', `${caseName} chain apply`);
          let chain: http.HttpInterceptorChain = new http.HttpInterceptorChain();
          let c1 = new TestHttpInterceptor(InterceptorType.INITIAL_REQUEST, true);
          chain.addChain([
            c1, c1, c1
          ]);
          let cs: http.HttpInterceptor[] = chain.getChain();
          hilog.info(0x0000, 'testTag', `${caseName} cs: ${JSON.stringify(cs)}`);
          chain.apply(httpRequest);
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
            header: HEADER,
            extraData: BODY_NO_CHANGE,
          };
          httpRequest.request(HTTP_URL_BAIDU, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              hilog.info(0x0000, 'testTag', `${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              hilog.info(0x0000, 'testTag', `${caseName} res:${JSON.stringify(res)}`);
              hilog.info(0x0000, 'testTag', `${caseName} finallyResponse:${JSON.stringify(finallyResponse)}`);
              httpRequest.destroy();
              ExpectTrue(finallyResponse.responseCode === res.responseCode)
              ExpectTrue(finallyResponse.cookies === res.cookies)
              ExpectTrue(JSON.stringify(finallyResponse.header) === JSON.stringify(res.header))
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectTrue(err.code == 2300802);
          ExpectTrue(err.message === "Duplicated interceptor type in the chain");
          done();
        }
        hilog.info(0x0000, 'testTag', `${caseName} test End`);
      });

    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorHttpRequestOptions2200
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_HttpRequestOptions_2200
     * @tc.desc   test chain.addChain([undefined]) catch Internal error error 2300999 HttpRequestInterceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorHttpRequestOptions2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorHttpRequestOptions2200";
        hilog.info(0x0000, 'testTag', `${caseName} test Start`);
        try {
          let httpRequest: http.HttpRequest = http.createHttp();
          hilog.info(0x0000, 'testTag', `${caseName} chain apply`);
          let chain: http.HttpInterceptorChain = new http.HttpInterceptorChain();
          let c1 = new TestHttpInterceptor(InterceptorType.INITIAL_REQUEST, true);
          chain.addChain([undefined]);
          let cs: http.HttpInterceptor[] = chain.getChain();
          hilog.info(0x0000, 'testTag', `${caseName} cs: ${JSON.stringify(cs)}`);
          chain.apply(httpRequest);
          let options: http.HttpRequestOptions = {
            method: http.RequestMethod.POST,
            header: HEADER,
            extraData: BODY_NO_CHANGE,
          };
          httpRequest.request(HTTP_URL_BAIDU, options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              hilog.info(0x0000, 'testTag', `${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              hilog.info(0x0000, 'testTag', `${caseName} res:${JSON.stringify(res)}`);
              hilog.info(0x0000, 'testTag', `${caseName} finallyResponse:${JSON.stringify(finallyResponse)}`);
              httpRequest.destroy();
              ExpectTrue(finallyResponse.responseCode === res.responseCode)
              ExpectTrue(finallyResponse.cookies === res.cookies)
              ExpectTrue(JSON.stringify(finallyResponse.header) === JSON.stringify(res.header))
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectTrue(err.code == 2300999);
          ExpectTrue(err.message === "Internal error");
          done();
        }
        hilog.info(0x0000, 'testTag', `${caseName} test End`);
      });


    /**
     * @tc.name   testNetworkMgrHttpRequestInterceptorHttpRequestOptions2300
     * @tc.number SUB_NetworkMgr_HttpRequestInterceptor_HttpRequestOptions_2300
     * @tc.desc   test chain.getChain() type catch Internal error error 2300999 HttpRequestInterceptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrHttpRequestInterceptorHttpRequestOptions2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestInterceptorHttpRequestOptions2300";
        hilog.info(0x0000, 'testTag', `${caseName} test Start`);
        try {
          let httpRequest: http.HttpRequest = http.createHttp();
          hilog.info(0x0000, 'testTag', `${caseName} chain apply`);
          let chain: http.HttpInterceptorChain = new http.HttpInterceptorChain();
          let c1 = new TestHttpInterceptor(InterceptorType.INITIAL_REQUEST, true);
          let cs = chain.getChain();
          ExpectTrue(cs.constructor.name === 'Array');
          ExpectTrue(cs.length === 0);
          chain.addChain([c1]);
          cs = chain.getChain();
          ExpectTrue(cs.constructor.name === 'Array');
          ExpectTrue(cs.length > 0);
          done();
          hilog.info(0x0000, 'testTag', `${caseName} cs: ${JSON.stringify(cs)}`);
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          done();
        }
        hilog.info(0x0000, 'testTag', `${caseName} test End`);
      });
  });
}
