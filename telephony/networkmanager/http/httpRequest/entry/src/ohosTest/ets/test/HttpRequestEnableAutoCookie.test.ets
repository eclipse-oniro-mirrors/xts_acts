
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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import http from '@ohos.net.http';

const Url1: string = "http://httpbin.moyufangge.com/cookies/set/test_cookie/test_value";
const Url2: string = "http://httpbin.moyufangge.com/cookies";
const Url3: string = "http://httpbin.org/cookies";

let ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`exportFail failed err: ${JSON.stringify(err)}`);
  }
}

let ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`exportTrue failed err: ${JSON.stringify(err)}`);
  }
}
interface Cookies {
  test_cookie?: string;
}
interface CookiesResponse {
  cookies?: Cookies;
}

export default function HttpRequestEnableAutoCookieTest() {
  describe('HttpRequestEnableAutoCookieTest', () => {

    /**
     * @tc.name   testHttpRequestEnableAutoCookieTest0100
     * @tc.number SUB_NetworkMgr_Http_HttpRequestEnableAutoCookieTest_0100
     * @tc.desc   test Same instance, same domain, AutoCookie enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpRequestEnableAutoCookieTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testHttpRequestEnableAutoCookieTest0100';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | null = null;
      try {
        httpRequest = http.createHttp();
        httpRequest.enableAutoCookie(true);
        console.info(`${caseName} request1 set Cookies ` + Url1);
        let data: http.HttpResponse = await httpRequest.request(Url1);
        console.info(`${caseName} Request 1 success: ${JSON.stringify(data)}`);
        expect(data.responseCode).assertEqual(200);
        console.info(`${caseName} request2 get Cookies ` + Url2);
        let data2: http.HttpResponse = await httpRequest.request(Url2);
        console.info(`${caseName} Request 2 success: ${JSON.stringify(data2)}`);
        expect(data2.responseCode).assertEqual(200);
        let result: CookiesResponse | null = null;
        let parseSuccess: boolean = false;
        let contentType = '';
        if (data2.header && typeof data2.header === 'object') {
          contentType = (data2.header['content-type'] as string) || '';
        }
        console.info(`${caseName} content-type: ${contentType}`);
        try {
          result = JSON.parse(data2.result as string);
          console.info(`${caseName} JSON parse success`);
          parseSuccess = true;
        } catch (parseErr) {
          console.info(`${caseName} JSON parse failed: ${JSON.stringify(parseErr)}`);
          parseSuccess = false;
        }
        if (contentType && !contentType.includes('application/json')) {
          console.info(`${caseName} content-type is not application/json`);
          ExpectFail();
          console.info(`${caseName} Unexpected content-type: ${contentType}`);
        } else if (!parseSuccess) {
          console.info(`${caseName} Failed to parse response as JSON`);
          ExpectFail();
        } else {
          if (result !== null) {
            console.info(`${caseName} Cookies: ${JSON.stringify(result.cookies)}`);
            if (result.cookies !== null && result.cookies !== undefined) {
              ExpectTrue(result.cookies.test_cookie === 'test_value');
              console.info(`${caseName} Cookies are included`);
            } else {
              ExpectFail();
              console.info(`${caseName} Cookies are missing`);
            }
          } else {
            ExpectFail();
            console.info(`${caseName} Parsed result is null`);
          }
        }
        console.info(`${caseName} All requests completed.`);
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest) {
          httpRequest.destroy();
        }
      }
      done();
      console.info(`${caseName}---End`);
    });
    /**
     * @tc.name   testHttpRequestEnableAutoCookieTest0200
     * @tc.number SUB_NetworkMgr_Http_HttpRequestEnableAutoCookieTest_0200
     * @tc.desc   test Same instance, same domain, AutoCookie disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpRequestEnableAutoCookieTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testHttpRequestEnableAutoCookieTest0200';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | null = null;
      try {
        httpRequest = http.createHttp();
        httpRequest.enableAutoCookie(false);
        console.info(`${caseName} request1 set Cookies ${Url1}`);
        let data: http.HttpResponse = await httpRequest.request(Url1);
        console.info(`${caseName} Request 1 success: ${JSON.stringify(data)}`);
        expect(data.responseCode).assertEqual(200);
        console.info(`${caseName} request2 get Cookies ` + Url2);
        let data2: http.HttpResponse = await httpRequest.request(Url2);
        console.info(`${caseName} Request 2 success: ${JSON.stringify(data2)}`);
        expect(data2.responseCode).assertEqual(200);
        let result: CookiesResponse | null = null;
        let parseSuccess: boolean = false;
        let contentType = '';
        if (data2.header && typeof data2.header === 'object') {
          contentType = (data2.header['content-type'] as string) || '';
        }
        console.info(`${caseName} content-type: ${contentType}`);
        try {
          result = JSON.parse(data2.result as string);
          console.info(`${caseName} JSON parse success`);
          parseSuccess = true;
        } catch (parseErr) {
          console.info(`${caseName} JSON parse failed: ${JSON.stringify(parseErr)}`);
          parseSuccess = false;
        }
        if (contentType && !contentType.includes('application/json')) {
          console.info(`${caseName} content-type is not application/json`);
          ExpectFail();
          console.info(`${caseName} Unexpected content-type: ${contentType}`);
        } else if (!parseSuccess) {
          console.info(`${caseName} Failed to parse response as JSON`);
          ExpectFail();
        } else {
          if (result !== null) {
            console.info(`${caseName} Cookies: ${JSON.stringify(result.cookies)}`);
            if (result.cookies !== null && result.cookies !== undefined) {
              ExpectTrue(result.cookies.test_cookie !== 'test_value');
              console.info(`${caseName} Cookies are missing`);
            } else {
              ExpectFail();
              console.info(`${caseName} Cookies are included`);
            }
          } else {
            ExpectFail();
            console.info(`${caseName} Parsed result is null`);
          }
        }
        console.info(`${caseName} All requests completed.`);
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest) {
          httpRequest.destroy();
        }
      }
      done();
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.name   testHttpRequestEnableAutoCookieTest0300
     * @tc.number SUB_NetworkMgr_Http_HttpRequestEnableAutoCookieTest_0300
     * @tc.desc   test Same Instance, Different Domain Cookies, AutoCookie Enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpRequestEnableAutoCookieTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testHttpRequestEnableAutoCookieTest0300';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | null = null;
      try {
        httpRequest = http.createHttp();
        httpRequest.enableAutoCookie(true);
        console.info(`${caseName} request1 set Cookies ${Url1}`);
        let data: http.HttpResponse = await httpRequest.request(Url1);
        console.info(`${caseName} Request 1 success: ${JSON.stringify(data)}`);
        expect(data.responseCode).assertEqual(200);
        console.info(`${caseName} request2 get Cookies ` + Url3);
        let data2: http.HttpResponse = await httpRequest.request(Url3);
        console.info(`${caseName} Request 2 success: ${JSON.stringify(data2)}`);
        expect(data2.responseCode).assertEqual(200);
        let result: CookiesResponse | null = null;
        let parseSuccess: boolean = false;
        let contentType = '';
        if (data2.header && typeof data2.header === 'object') {
          contentType = (data2.header['content-type'] as string) || '';
        }
        console.info(`${caseName} content-type: ${contentType}`);
        try {
          result = JSON.parse(data2.result as string);
          console.info(`${caseName} JSON parse success`);
          parseSuccess = true;
        } catch (parseErr) {
          console.info(`${caseName} JSON parse failed: ${JSON.stringify(parseErr)}`);
          parseSuccess = false;
        }
        if (contentType && !contentType.includes('application/json')) {
          console.info(`${caseName} content-type is not application/json`);
          ExpectFail();
          console.info(`${caseName} Unexpected content-type: ${contentType}`);
        } else if (!parseSuccess) {
          console.info(`${caseName} Failed to parse response as JSON`);
          ExpectFail();
        } else {
          if (result !== null) {
            console.info(`${caseName} Cookies: ${JSON.stringify(result.cookies)}`);
            if (result.cookies !== null && result.cookies !== undefined) {
              ExpectTrue(result.cookies.test_cookie !== 'test_value');
              console.info(`${caseName} Cookies are missing and Domain-Related`);
            } else {
              ExpectFail();
              console.info(`${caseName} Cookies are included`);
            }
          } else {
            ExpectFail();
            console.info(`${caseName} Parsed result is null`);
          }
        }
        console.info(`${caseName} All requests completed.`);
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest) {
          httpRequest.destroy();
        }
      }
      done();
      console.info(`${caseName}---End`);
    });


    /**
     * @tc.name   testHttpRequestEnableAutoCookieTest0400
     * @tc.number SUB_NetworkMgr_Http_HttpRequestEnableAutoCookieTest_0400
     * @tc.desc   test Same Instance, Different Domain Cookies, AutoCookie Disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpRequestEnableAutoCookieTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testHttpRequestEnableAutoCookieTest0400';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | null = null;
      try {
        httpRequest = http.createHttp();
        httpRequest.enableAutoCookie(false);
        console.info(`${caseName} request1 set Cookies ${Url1}`);
        let data: http.HttpResponse = await httpRequest.request(Url1);
        console.info(`${caseName} Request 1 success: ${JSON.stringify(data)}`);
        expect(data.responseCode).assertEqual(200);
        console.info(`${caseName} request2 get Cookies ` + Url3);
        let data2: http.HttpResponse = await httpRequest.request(Url3);
        console.info(`${caseName} Request 2 success: ${JSON.stringify(data2)}`);
        expect(data2.responseCode).assertEqual(200);
        let result: CookiesResponse | null = null;
        let parseSuccess: boolean = false;
        let contentType = '';
        if (data2.header && typeof data2.header === 'object') {
          contentType = (data2.header['content-type'] as string) || '';
        }
        console.info(`${caseName} content-type: ${contentType}`);
        try {
          result = JSON.parse(data2.result as string);
          console.info(`${caseName} JSON parse success`);
          parseSuccess = true;
        } catch (parseErr) {
          console.info(`${caseName} JSON parse failed: ${JSON.stringify(parseErr)}`);
          parseSuccess = false;
        }
        if (contentType && !contentType.includes('application/json')) {
          console.info(`${caseName} content-type is not application/json`);
          ExpectFail();
          console.info(`${caseName} Unexpected content-type: ${contentType}`);
        } else if (!parseSuccess) {
          console.info(`${caseName} Failed to parse response as JSON`);
          ExpectFail();
        } else {
          if (result !== null) {
            console.info(`${caseName} Cookies: ${JSON.stringify(result.cookies)}`);
            if (result.cookies !== null && result.cookies !== undefined) {
              ExpectTrue(result.cookies.test_cookie !== 'test_value');
              console.info(`${caseName} Cookies are missing and Domain-Related`);
            } else {
              ExpectFail();
              console.info(`${caseName} Cookies are included`);
            }
          } else {
            ExpectFail();
            console.info(`${caseName} Parsed result is null`);
          }
        }
        console.info(`${caseName} All requests completed.`);
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest) {
          httpRequest.destroy();
        }
      }
      done();
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.name   testHttpRequestEnableAutoCookieTest0500
     * @tc.number SUB_NetworkMgr_Http_HttpRequestEnableAutoCookieTest_0500
     * @tc.desc   Different instances, same domain, AutoCookie enabled on all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpRequestEnableAutoCookieTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testHttpRequestEnableAutoCookieTest0500';
      console.info(`${caseName}---Start`);
      let httpRequest1 = http.createHttp();
      let httpRequest2 = http.createHttp();
      try {
        httpRequest1.enableAutoCookie(true);
        httpRequest2.enableAutoCookie(true);
        console.info(`${caseName} request1 set Cookies ` + Url1);
        let data: http.HttpResponse = await httpRequest1.request(Url1);
        console.info(`${caseName} Request 1 success: ${JSON.stringify(data)}`);
        expect(data.responseCode).assertEqual(200);
        console.info(`${caseName} request2 get Cookies ` + Url2);
        let data2: http.HttpResponse = await httpRequest2.request(Url2);
        console.info(`${caseName} Request 2 success: ${JSON.stringify(data2)}`);
        expect(data2.responseCode).assertEqual(200);
        let result: CookiesResponse | null = null;
        let parseSuccess: boolean = false;
        let contentType = '';
        if (data2.header && typeof data2.header === 'object') {
          contentType = (data2.header['content-type'] as string) || '';
        }
        console.info(`${caseName} content-type: ${contentType}`);
        try {
          result = JSON.parse(data2.result as string);
          console.info(`${caseName} JSON parse success`);
          parseSuccess = true;
        } catch (parseErr) {
          console.info(`${caseName} JSON parse failed: ${JSON.stringify(parseErr)}`);
          parseSuccess = false;
        }
        if (contentType && !contentType.includes('application/json')) {
          console.info(`${caseName} content-type is not application/json`);
          ExpectFail();
          console.info(`${caseName} Unexpected content-type: ${contentType}`);
        } else if (!parseSuccess) {
          console.info(`${caseName} Failed to parse response as JSON`);
          ExpectFail();
        } else {
          if (result !== null) {
            console.info(`${caseName} Cookies: ${JSON.stringify(result.cookies)}`);
            if (result.cookies !== null && result.cookies !== undefined) {
              ExpectTrue(result.cookies.test_cookie !== 'test_value');
              console.info(`${caseName} Cookies are missing and Each instance is independent`);
            } else {
              ExpectFail();
              console.info(`${caseName} Cookies are included`);
            }
          } else {
            ExpectFail();
            console.info(`${caseName} Parsed result is null`);
          }
        }
        console.info(`${caseName} All requests completed.`);
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest1) {
          httpRequest1.destroy();
        }
        if (httpRequest2) {
          httpRequest2.destroy();
        }
      }
      done();
      console.info(`${caseName}---End`);
    });
    /**
     * @tc.name   testHttpRequestEnableAutoCookieTest0600
     * @tc.number SUB_NetworkMgr_Http_HttpRequestEnableAutoCookieTest_0600
     * @tc.desc   Different instances, same domain, AutoCookie: enabled on 1, disabled on 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpRequestEnableAutoCookieTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testHttpRequestEnableAutoCookieTest0600';
      console.info(`${caseName}---Start`);
      let httpRequest1 = http.createHttp();
      let httpRequest2 = http.createHttp();
      try {
        httpRequest1.enableAutoCookie(true);
        httpRequest2.enableAutoCookie(false);
        console.info(`${caseName} request1 set Cookies ` + Url1);
        let data: http.HttpResponse = await httpRequest1.request(Url1);
        console.info(`${caseName} Request 1 success: ${JSON.stringify(data)}`);
        expect(data.responseCode).assertEqual(200);
        console.info(`${caseName} request2 get Cookies ` + Url2);
        let data2: http.HttpResponse = await httpRequest2.request(Url2);
        console.info(`${caseName} Request 2 success: ${JSON.stringify(data2)}`);
        expect(data2.responseCode).assertEqual(200);
        let result: CookiesResponse | null = null;
        let parseSuccess: boolean = false;
        let contentType = '';
        if (data2.header && typeof data2.header === 'object') {
          contentType = (data2.header['content-type'] as string) || '';
        }
        console.info(`${caseName} content-type: ${contentType}`);
        try {
          result = JSON.parse(data2.result as string);
          console.info(`${caseName} JSON parse success`);
          parseSuccess = true;
        } catch (parseErr) {
          console.info(`${caseName} JSON parse failed: ${JSON.stringify(parseErr)}`);
          parseSuccess = false;
        }
        if (contentType && !contentType.includes('application/json')) {
          console.info(`${caseName} content-type is not application/json`);
          ExpectFail();
          console.info(`${caseName} Unexpected content-type: ${contentType}`);
        } else if (!parseSuccess) {
          console.info(`${caseName} Failed to parse response as JSON`);
          ExpectFail();
        } else {
          if (result !== null) {
            console.info(`${caseName} Cookies: ${JSON.stringify(result.cookies)}`);
            if (result.cookies !== null && result.cookies !== undefined) {
              ExpectTrue(result.cookies.test_cookie !== 'test_value');
              console.info(`${caseName} The disabled instance did not send cookies`);
            } else {
              ExpectFail();
              console.info(`${caseName} Cookies are included`);
            }
          } else {
            ExpectFail();
            console.info(`${caseName} Parsed result is null`);
          }
        }
        console.info(`${caseName} All requests completed.`);
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest1) {
          httpRequest1.destroy();
        }
        if (httpRequest2) {
          httpRequest2.destroy();
        }
      }
      done();
      console.info(`${caseName}---End`);
    });
    /**
     * @tc.name   testHttpRequestEnableAutoCookieTest0700
     * @tc.number SUB_NetworkMgr_Http_HttpRequestEnableAutoCookieTest_0700
     * @tc.desc   Different instances, same domain, AutoCookie: disabled on 1, enabled on 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpRequestEnableAutoCookieTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testHttpRequestEnableAutoCookieTest0700';
      console.info(`${caseName}---Start`);
      let httpRequest1 = http.createHttp();
      let httpRequest2 = http.createHttp();
      try {
        httpRequest1.enableAutoCookie(false);
        httpRequest2.enableAutoCookie(true);
        console.info(`${caseName} request1 set Cookies ` + Url1);
        let data: http.HttpResponse = await httpRequest1.request(Url1);
        console.info(`${caseName} Request 1 success: ${JSON.stringify(data)}`);
        expect(data.responseCode).assertEqual(200);
        console.info(`${caseName} request2 get Cookies ` + Url2);
        let data2: http.HttpResponse = await httpRequest2.request(Url2);
        console.info(`${caseName} Request 2 success: ${JSON.stringify(data2)}`);
        expect(data2.responseCode).assertEqual(200);
        let result: CookiesResponse | null = null;
        let parseSuccess: boolean = false;
        let contentType = '';
        if (data2.header && typeof data2.header === 'object') {
          contentType = (data2.header['content-type'] as string) || '';
        }
        console.info(`${caseName} content-type: ${contentType}`);
        try {
          result = JSON.parse(data2.result as string);
          console.info(`${caseName} JSON parse success`);
          parseSuccess = true;
        } catch (parseErr) {
          console.info(`${caseName} JSON parse failed: ${JSON.stringify(parseErr)}`);
          parseSuccess = false;
        }
        if (contentType && !contentType.includes('application/json')) {
          console.info(`${caseName} content-type is not application/json`);
          ExpectFail();
          console.info(`${caseName} Unexpected content-type: ${contentType}`);
        } else if (!parseSuccess) {
          console.info(`${caseName} Failed to parse response as JSON`);
          ExpectFail();
        } else {
          if (result !== null) {
            console.info(`${caseName} Cookies: ${JSON.stringify(result.cookies)}`);
            if (result.cookies !== null && result.cookies !== undefined) {
              ExpectTrue(result.cookies.test_cookie !== 'test_value');
              console.info(`${caseName} The disabled instance did not send cookies`);
            } else {
              ExpectFail();
              console.info(`${caseName} Cookies are included`);
            }
          } else {
            ExpectFail();
            console.info(`${caseName} Parsed result is null`);
          }
        }
        console.info(`${caseName} All requests completed.`);
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest1) {
          httpRequest1.destroy();
        }
        if (httpRequest2) {
          httpRequest2.destroy();
        }
      }
      done();
      console.info(`${caseName}---End`);
    });
    /**
     * @tc.name   testHttpRequestEnableAutoCookieTest0800
     * @tc.number SUB_NetworkMgr_Http_HttpRequestEnableAutoCookieTest_0800
     * @tc.desc   Different instances, same domain, AutoCookie: disabled on 1, disabled on 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpRequestEnableAutoCookieTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testHttpRequestEnableAutoCookieTest0800';
      console.info(`${caseName}---Start`);
      let httpRequest1 = http.createHttp();
      let httpRequest2 = http.createHttp();
      try {
        httpRequest1.enableAutoCookie(false);
        httpRequest2.enableAutoCookie(false);
        console.info(`${caseName} request1 set Cookies ` + Url1);
        let data: http.HttpResponse = await httpRequest1.request(Url1);
        console.info(`${caseName} Request 1 success: ${JSON.stringify(data)}`);
        expect(data.responseCode).assertEqual(200);
        console.info(`${caseName} request2 get Cookies ` + Url2);
        let data2: http.HttpResponse = await httpRequest2.request(Url2);
        console.info(`${caseName} Request 2 success: ${JSON.stringify(data2)}`);
        expect(data2.responseCode).assertEqual(200);
        let result: CookiesResponse | null = null;
        let parseSuccess: boolean = false;
        let contentType = '';
        if (data2.header && typeof data2.header === 'object') {
          contentType = (data2.header['content-type'] as string) || '';
        }
        console.info(`${caseName} content-type: ${contentType}`);
        try {
          result = JSON.parse(data2.result as string);
          console.info(`${caseName} JSON parse success`);
          parseSuccess = true;
        } catch (parseErr) {
          console.info(`${caseName} JSON parse failed: ${JSON.stringify(parseErr)}`);
          parseSuccess = false;
        }
        if (contentType && !contentType.includes('application/json')) {
          console.info(`${caseName} content-type is not application/json`);
          ExpectFail();
          console.info(`${caseName} Unexpected content-type: ${contentType}`);
        } else if (!parseSuccess) {
          console.info(`${caseName} Failed to parse response as JSON`);
          ExpectFail();
        } else {
          if (result !== null) {
            console.info(`${caseName} Cookies: ${JSON.stringify(result.cookies)}`);
            if (result.cookies !== null && result.cookies !== undefined) {
              ExpectTrue(result.cookies.test_cookie !== 'test_value');
              console.info(`${caseName} The disabled instance did not send cookies`);
            } else {
              ExpectFail();
              console.info(`${caseName} Cookies are included`);
            }
          } else {
            ExpectFail();
            console.info(`${caseName} Parsed result is null`);
          }
        }
        console.info(`${caseName} All requests completed.`);
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest1) {
          httpRequest1.destroy();
        }
        if (httpRequest2) {
          httpRequest2.destroy();
        }
      }
      done();
      console.info(`${caseName}---End`);
    });
    /**
     * @tc.name   testHttpRequestEnableAutoCookieTest0900
     * @tc.number SUB_NetworkMgr_Http_HttpRequestEnableAutoCookieTest_0900
     * @tc.desc   test Different Instances, Different Domains for Cookies, AutoCookie Enabled of all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpRequestEnableAutoCookieTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testHttpRequestEnableAutoCookieTest0900';
      console.info(`${caseName}---Start`);
      let httpRequest1 = http.createHttp();
      let httpRequest2 = http.createHttp();
      try {
        httpRequest1.enableAutoCookie(true);
        httpRequest2.enableAutoCookie(true);
        console.info(`${caseName} request1 set Cookies ${Url1}`);
        let data: http.HttpResponse = await httpRequest1.request(Url1);
        console.info(`${caseName} Request 1 success: ${JSON.stringify(data)}`);
        expect(data.responseCode).assertEqual(200);
        console.info(`${caseName} request2 get Cookies ` + Url3);
        let data2: http.HttpResponse = await httpRequest2.request(Url3);
        console.info(`${caseName} Request 2 success: ${JSON.stringify(data2)}`);
        expect(data2.responseCode).assertEqual(200);
        let result: CookiesResponse | null = null;
        let parseSuccess: boolean = false;
        let contentType = '';
        if (data2.header && typeof data2.header === 'object') {
          contentType = (data2.header['content-type'] as string) || '';
        }
        console.info(`${caseName} content-type: ${contentType}`);
        try {
          result = JSON.parse(data2.result as string);
          console.info(`${caseName} JSON parse success`);
          parseSuccess = true;
        } catch (parseErr) {
          console.info(`${caseName} JSON parse failed: ${JSON.stringify(parseErr)}`);
          parseSuccess = false;
        }
        if (contentType && !contentType.includes('application/json')) {
          console.info(`${caseName} content-type is not application/json`);
          ExpectFail();
          console.info(`${caseName} Unexpected content-type: ${contentType}`);
        } else if (!parseSuccess) {
          console.info(`${caseName} Failed to parse response as JSON`);
          ExpectFail();
        } else {
          if (result !== null) {
            console.info(`${caseName} Cookies: ${JSON.stringify(result.cookies)}`);
            if (result.cookies !== null && result.cookies !== undefined) {
              ExpectTrue(result.cookies.test_cookie !== 'test_value');
              console.info(`${caseName} Cookies are missing and Domain-Related`);
            } else {
              ExpectFail();
              console.info(`${caseName} Cookies are included`);
            }
          } else {
            ExpectFail();
            console.info(`${caseName} Parsed result is null`);
          }
        }
        console.info(`${caseName} All requests completed.`);
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest1) {
          httpRequest1.destroy();
        }
        if (httpRequest2) {
          httpRequest2.destroy();
        }
      }
      done();
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.name   testHttpRequestEnableAutoCookieTest1000
     * @tc.number SUB_NetworkMgr_Http_HttpRequestEnableAutoCookieTest_1000
     * @tc.desc   test Different Instances, Different Domains for Cookies, Instance 1: AutoCookie Enabled, Instance 2: AutoCookie Disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpRequestEnableAutoCookieTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testHttpRequestEnableAutoCookieTest1000';
      console.info(`${caseName}---Start`);
      let httpRequest1 = http.createHttp();
      let httpRequest2 = http.createHttp();
      try {
        httpRequest1.enableAutoCookie(true);
        httpRequest2.enableAutoCookie(false);
        console.info(`${caseName} request1 set Cookies ${Url1}`);
        let data: http.HttpResponse = await httpRequest1.request(Url1);
        console.info(`${caseName} Request 1 success: ${JSON.stringify(data)}`);
        expect(data.responseCode).assertEqual(200);
        console.info(`${caseName} request2 get Cookies ` + Url3);
        let data2: http.HttpResponse = await httpRequest2.request(Url3);
        console.info(`${caseName} Request 2 success: ${JSON.stringify(data2)}`);
        expect(data2.responseCode).assertEqual(200);
        let result: CookiesResponse | null = null;
        let parseSuccess: boolean = false;
        let contentType = '';
        if (data2.header && typeof data2.header === 'object') {
          contentType = (data2.header['content-type'] as string) || '';
        }
        console.info(`${caseName} content-type: ${contentType}`);
        try {
          result = JSON.parse(data2.result as string);
          console.info(`${caseName} JSON parse success`);
          parseSuccess = true;
        } catch (parseErr) {
          console.info(`${caseName} JSON parse failed: ${JSON.stringify(parseErr)}`);
          parseSuccess = false;
        }
        if (contentType && !contentType.includes('application/json')) {
          console.info(`${caseName} content-type is not application/json`);
          ExpectFail();
          console.info(`${caseName} Unexpected content-type: ${contentType}`);
        } else if (!parseSuccess) {
          console.info(`${caseName} Failed to parse response as JSON`);
          ExpectFail();
        } else {
          if (result !== null) {
            console.info(`${caseName} Cookies: ${JSON.stringify(result.cookies)}`);
            if (result.cookies !== null && result.cookies !== undefined) {
              ExpectTrue(result.cookies.test_cookie !== 'test_value');
              console.info(`${caseName} Cookies are missing and Domain-Related`);
            } else {
              ExpectFail();
              console.info(`${caseName} Cookies are included`);
            }
          } else {
            ExpectFail();
            console.info(`${caseName} Parsed result is null`);
          }
        }
        console.info(`${caseName} All requests completed.`);
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest1) {
          httpRequest1.destroy();
        }
        if (httpRequest2) {
          httpRequest2.destroy();
        }
      }
      done();
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.name   testHttpRequestEnableAutoCookieTest1100
     * @tc.number SUB_NetworkMgr_Http_HttpRequestEnableAutoCookieTest_1100
     * @tc.desc   test Different Instances, Different Domains for Cookies, Instance 1: AutoCookie Disabled, Instance 2: AutoCookie Enabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpRequestEnableAutoCookieTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testHttpRequestEnableAutoCookieTest1100';
      console.info(`${caseName}---Start`);
      let httpRequest1 = http.createHttp();
      let httpRequest2 = http.createHttp();
      try {
        httpRequest1.enableAutoCookie(false);
        httpRequest2.enableAutoCookie(true);
        console.info(`${caseName} request1 set Cookies ${Url1}`);
        let data: http.HttpResponse = await httpRequest1.request(Url1);
        console.info(`${caseName} Request 1 success: ${JSON.stringify(data)}`);
        expect(data.responseCode).assertEqual(200);
        console.info(`${caseName} request2 get Cookies ` + Url3);
        let data2: http.HttpResponse = await httpRequest2.request(Url3);
        console.info(`${caseName} Request 2 success: ${JSON.stringify(data2)}`);
        expect(data2.responseCode).assertEqual(200);
        let result: CookiesResponse | null = null;
        let parseSuccess: boolean = false;
        let contentType = '';
        if (data2.header && typeof data2.header === 'object') {
          contentType = (data2.header['content-type'] as string) || '';
        }
        console.info(`${caseName} content-type: ${contentType}`);
        try {
          result = JSON.parse(data2.result as string);
          console.info(`${caseName} JSON parse success`);
          parseSuccess = true;
        } catch (parseErr) {
          console.info(`${caseName} JSON parse failed: ${JSON.stringify(parseErr)}`);
          parseSuccess = false;
        }
        if (contentType && !contentType.includes('application/json')) {
          console.info(`${caseName} content-type is not application/json`);
          ExpectFail();
          console.info(`${caseName} Unexpected content-type: ${contentType}`);
        } else if (!parseSuccess) {
          console.info(`${caseName} Failed to parse response as JSON`);
          ExpectFail();
        } else {
          if (result !== null) {
            console.info(`${caseName} Cookies: ${JSON.stringify(result.cookies)}`);
            if (result.cookies !== null && result.cookies !== undefined) {
              ExpectTrue(result.cookies.test_cookie !== 'test_value');
              console.info(`${caseName} Cookies are missing and Domain-Related`);
            } else {
              ExpectFail();
              console.info(`${caseName} Cookies are included`);
            }
          } else {
            ExpectFail();
            console.info(`${caseName} Parsed result is null`);
          }
        }
        console.info(`${caseName} All requests completed.`);
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest1) {
          httpRequest1.destroy();
        }
        if (httpRequest2) {
          httpRequest2.destroy();
        }
      }
      done();
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.name   testHttpRequestEnableAutoCookieTest1200
     * @tc.number SUB_NetworkMgr_Http_HttpRequestEnableAutoCookieTest_1200
     * @tc.desc   test Different Instances, Different Domains for Cookies, Instance 1: AutoCookie Disabled, Instance 2: AutoCookie Disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpRequestEnableAutoCookieTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testHttpRequestEnableAutoCookieTest1200';
      console.info(`${caseName}---Start`);
      let httpRequest1 = http.createHttp();
      let httpRequest2 = http.createHttp();
      try {
        httpRequest1.enableAutoCookie(false);
        httpRequest2.enableAutoCookie(false);
        console.info(`${caseName} request1 set Cookies ${Url1}`);
        let data: http.HttpResponse = await httpRequest1.request(Url1);
        console.info(`${caseName} Request 1 success: ${JSON.stringify(data)}`);
        expect(data.responseCode).assertEqual(200);
        console.info(`${caseName} request2 get Cookies ` + Url3);
        let data2: http.HttpResponse = await httpRequest2.request(Url3);
        console.info(`${caseName} Request 2 success: ${JSON.stringify(data2)}`);
        expect(data2.responseCode).assertEqual(200);
        let result: CookiesResponse | null = null;
        let parseSuccess: boolean = false;
        let contentType = '';
        if (data2.header && typeof data2.header === 'object') {
          contentType = (data2.header['content-type'] as string) || '';
        }
        console.info(`${caseName} content-type: ${contentType}`);
        try {
          result = JSON.parse(data2.result as string);
          console.info(`${caseName} JSON parse success`);
          parseSuccess = true;
        } catch (parseErr) {
          console.info(`${caseName} JSON parse failed: ${JSON.stringify(parseErr)}`);
          parseSuccess = false;
        }
        if (contentType && !contentType.includes('application/json')) {
          console.info(`${caseName} content-type is not application/json`);
          ExpectFail();
          console.info(`${caseName} Unexpected content-type: ${contentType}`);
        } else if (!parseSuccess) {
          console.info(`${caseName} Failed to parse response as JSON`);
          ExpectFail();
        } else {
          if (result !== null) {
            console.info(`${caseName} Cookies: ${JSON.stringify(result.cookies)}`);
            if (result.cookies !== null && result.cookies !== undefined) {
              ExpectTrue(result.cookies.test_cookie !== 'test_value');
              console.info(`${caseName} Cookies are missing and Domain-Related`);
            } else {
              ExpectFail();
              console.info(`${caseName} Cookies are included`);
            }
          } else {
            ExpectFail();
            console.info(`${caseName} Parsed result is null`);
          }
        }
        console.info(`${caseName} All requests completed.`);
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest1) {
          httpRequest1.destroy();
        }
        if (httpRequest2) {
          httpRequest2.destroy();
        }
      }
      done();
      console.info(`${caseName}---End`);
    });

    /**
     * @tc.name   testHttpRequestEnableAutoCookieTest1300
     * @tc.number SUB_NetworkMgr_Http_HttpRequestEnableAutoCookieTest_1300
     * @tc.desc   AutoCookie receives null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpRequestEnableAutoCookieTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testHttpRequestEnableAutoCookieTest1300';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | null = null;
      try {
        httpRequest = http.createHttp();
        httpRequest.enableAutoCookie(null);
        console.info(`${caseName} request1 set Cookies ${Url1}`);
        let data: http.HttpResponse = await httpRequest.request(Url1);
        console.info(`${caseName} Request 1 success: ${JSON.stringify(data)}`);
        expect(data.responseCode).assertEqual(200);
        console.info(`${caseName} request2 get Cookies ` + Url2);
        let data2: http.HttpResponse = await httpRequest.request(Url2);
        console.info(`${caseName} Request 2 success: ${JSON.stringify(data2)}`);
        expect(data2.responseCode).assertEqual(200);
        let result: CookiesResponse | null = null;
        let parseSuccess: boolean = false;
        let contentType = '';
        if (data2.header && typeof data2.header === 'object') {
          contentType = (data2.header['content-type'] as string) || '';
        }
        console.info(`${caseName} content-type: ${contentType}`);
        try {
          result = JSON.parse(data2.result as string);
          console.info(`${caseName} JSON parse success`);
          parseSuccess = true;
        } catch (parseErr) {
          console.info(`${caseName} JSON parse failed: ${JSON.stringify(parseErr)}`);
          parseSuccess = false;
        }
        if (contentType && !contentType.includes('application/json')) {
          console.info(`${caseName} content-type is not application/json`);
          ExpectFail();
          console.info(`${caseName} Unexpected content-type: ${contentType}`);
        } else if (!parseSuccess) {
          console.info(`${caseName} Failed to parse response as JSON`);
          ExpectFail();
        } else {
          if (result !== null) {
            console.info(`${caseName} Cookies: ${JSON.stringify(result.cookies)}`);
            if (result.cookies !== null && result.cookies !== undefined) {
              ExpectTrue(result.cookies.test_cookie !== 'test_value');
              console.info(`${caseName} Cookies are missing`);
            } else {
              ExpectFail();
              console.info(`${caseName} Cookies are included`);
            }
          } else {
            ExpectFail();
            console.info(`${caseName} Parsed result is null`);
          }
        }
        console.info(`${caseName} All requests completed.`);
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest) {
          httpRequest.destroy();
        }
      }
      done();
      console.info(`${caseName}---End`);
    });
    /**
     * @tc.name   testHttpRequestEnableAutoCookieTest1400
     * @tc.number SUB_NetworkMgr_Http_HttpRequestEnableAutoCookieTest_1400
     * @tc.desc   AutoCookie receives undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHttpRequestEnableAutoCookieTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testHttpRequestEnableAutoCookieTest1400';
      console.info(`${caseName}---Start`);
      let httpRequest: http.HttpRequest | null = null;
      try {
        httpRequest = http.createHttp();
        httpRequest.enableAutoCookie(undefined);
        console.info(`${caseName} request1 set Cookies ${Url1}`);
        let data: http.HttpResponse = await httpRequest.request(Url1);
        console.info(`${caseName} Request 1 success: ${JSON.stringify(data)}`);
        expect(data.responseCode).assertEqual(200);
        console.info(`${caseName} request2 get Cookies ` + Url3);
        let data2: http.HttpResponse = await httpRequest.request(Url3);
        console.info(`${caseName} Request 2 success: ${JSON.stringify(data2)}`);
        expect(data2.responseCode).assertEqual(200);
        let result: CookiesResponse | null = null;
        let parseSuccess: boolean = false;
        let contentType = '';
        if (data2.header && typeof data2.header === 'object') {
          contentType = (data2.header['content-type'] as string) || '';
        }
        console.info(`${caseName} content-type: ${contentType}`);
        try {
          result = JSON.parse(data2.result as string);
          console.info(`${caseName} JSON parse success`);
          parseSuccess = true;
        } catch (parseErr) {
          console.info(`${caseName} JSON parse failed: ${JSON.stringify(parseErr)}`);
          parseSuccess = false;
        }
        if (contentType && !contentType.includes('application/json')) {
          console.info(`${caseName} content-type is not application/json`);
          ExpectFail();
          console.info(`${caseName} Unexpected content-type: ${contentType}`);
        } else if (!parseSuccess) {
          console.info(`${caseName} Failed to parse response as JSON`);
          ExpectFail();
        } else {
          if (result !== null) {
            console.info(`${caseName} Cookies: ${JSON.stringify(result.cookies)}`);
            if (result.cookies !== null && result.cookies !== undefined) {
              ExpectTrue(result.cookies.test_cookie !== 'test_value');
              console.info(`${caseName} Cookies are missing`);
            } else {
              ExpectFail();
              console.info(`${caseName} Cookies are included`);
            }
          } else {
            ExpectFail();
            console.info(`${caseName} Parsed result is null`);
          }
        }
        console.info(`${caseName} All requests completed.`);
      } catch (err) {
        console.info(`${caseName} catch err: ${JSON.stringify(err)}`);
        ExpectFail();
      } finally {
        if (httpRequest) {
          httpRequest.destroy();
        }
      }
      done();
      console.info(`${caseName}---End`);
    });
  });
}

