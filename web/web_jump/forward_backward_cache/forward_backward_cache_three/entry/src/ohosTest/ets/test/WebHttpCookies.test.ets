/**
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { accessibility, config } from '@kit.AccessibilityKit';
import webview from '@ohos.web.webview';
import { BusinessError } from '@ohos.base';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const URL = "https://" + "www.example.com"

async function testCookies(tc_name:string, url:string, config:string, cookie_attr:string,
  condition:(x:string, y:string|number|boolean) =>  boolean,
  expect_value:string|number|boolean, incognito=false) {
  let test_result:boolean = false;
  try {
    webview.WebCookieManager.configCookieSync(url,config);
  } catch (error) {
    console.error(`${tc_name} console ErrorCode:${(error as BusinessError).code}, Message: ${(error as BusinessError).message}`)
  }
  await webview.WebCookieManager.fetchAllCookies(incognito).then((cookies) => {
    try {
      console.log(`${tc_name} console cookies.length: ${cookies.length}`)
      if (cookies.length > 0 && condition(cookies[0][cookie_attr], expect_value)) {
        console.log(`${tc_name} console cookies.${cookie_attr}: ${cookies[0][cookie_attr]}`);
        test_result = true
      }
    } catch (error) {
      console.error(`${tc_name} console ErrorCode:${(error as BusinessError).code}, Message: ${(error as BusinessError).message}`)
    }
  })
  return test_result
}

export default function WebHttpCookies() {
  describe('WebHttpCookies', () => {

    beforeEach(async (done: Function) => {
      webview.WebCookieManager.clearAllCookiesSync();
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('WebHttpCookies beforeEach start');
      done();
    })

    /**
     * @tc.name   testWebFetchAllCookiesReturnEmpty0001
     * @tc.number SUB_WEB_FetchAllCookies_empty_0001
     * @tc.desc   test fetchAllCookies false return empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebFetchAllCookiesReturnEmpty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await webview.WebCookieManager.clearAllCookies();
      let isExistCookies = webview.WebCookieManager.existCookie();
      if (isExistCookies) {
        await webview.WebCookieManager.clearAllCookies();
      }
      await webview.WebCookieManager.fetchAllCookies(false).then((cookies) => {
        console.log('fetchAllCookies cookies length==>' + cookies.length);
        expect(cookies.length).assertEqual(0);
      })
      done();
    })
    /**
     * @tc.name   testWebFetchAllCookiesReturnEmpty0002
     * @tc.number SUB_WEB_FetchAllCookies_empty_0002
     * @tc.desc   test fetchAllCookies true return empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebFetchAllCookiesReturnEmpty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await webview.WebCookieManager.clearAllCookies();
      let isExistCookies = webview.WebCookieManager.existCookie(true);
      if (isExistCookies) {
        await webview.WebCookieManager.clearAllCookies();
      }
      await webview.WebCookieManager.fetchAllCookies(true).then((cookies) => {
        console.log('fetchAllCookies cookies length==>' + cookies.length);
        expect(cookies.length).assertEqual(0);
      })
      done();
    })
    /**
     * @tc.name   testWebFetchAllCookiesNotReturnEmpty0001
     * @tc.number SUB_WEB_FetchAllCookies_not_empty_0001
     * @tc.desc   test fetchAllCookies false not return empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebFetchAllCookiesNotReturnEmpty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await webview.WebCookieManager.configCookieSync(URL, 'a=b');
      let isExistCookies = webview.WebCookieManager.existCookie();
      if (!isExistCookies) {
        await webview.WebCookieManager.configCookieSync(URL, 'a=b');
      }
      await webview.WebCookieManager.fetchAllCookies(false).then((cookies) => {
        console.log('fetchAllCookies cookies length==>' + cookies.length);
        expect(cookies.length).assertLarger(0);
      })
      done();
    })
    /**
     * @tc.name   testWebFetchAllCookiesNotReturnEmpty0002
     * @tc.number SUB_WEB_FetchAllCookies_not_empty_0002
     * @tc.desc   test fetchAllCookies true not return empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebFetchAllCookiesNotReturnEmpty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await webview.WebCookieManager.configCookieSync(URL, 'a=b', true);
      let isExistCookies = webview.WebCookieManager.existCookie(true);
      if (!isExistCookies) {
        await webview.WebCookieManager.configCookieSync(URL, 'a=b', true);
      }
      await webview.WebCookieManager.fetchAllCookies(true).then((cookies) => {
        console.log('fetchAllCookies cookies length==>' + cookies.length);
        expect(cookies.length).assertLarger(0);
      })
      done();
    })

    /**
     * @tc.name   testWebSameSitePolicy0001
     * @tc.number SUB_WEB_SameSitePolicy_0001
     * @tc.desc   test SameSitePolicy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebSameSitePolicy0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: boolean = false;
      result = await testCookies(
        "testWebSameSitePolicy0001",
        URL,
        "a=b; path=/example; domain=.example.com; Secure; HttpOnly; SameSite=NONE",
        "samesitePolicy",
        (x: string, y: string | number | boolean): boolean => {
          return x == y
        },
        webview.WebHttpCookieSameSitePolicy.NONE)
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebSameSitePolicy0002
     * @tc.number SUB_WEB_SameSitePolicy_0002
     * @tc.desc   test SameSitePolicy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebSameSitePolicy0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: boolean = false;
      result = await testCookies(
        "testWebSameSitePolicy0002",
        URL,
        "a=b; path=/example; domain=.example.com; Secure; HttpOnly; SameSite=LAX",
        "samesitePolicy",
        (x: string, y: string | number | boolean): boolean => {
          return x == y
        },
        webview.WebHttpCookieSameSitePolicy.LAX)
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebSameSitePolicy0003
     * @tc.number SUB_WEB_SameSitePolicy_0003
     * @tc.desc   test SameSitePolicy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebSameSitePolicy0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: boolean = false;
      result = await testCookies(
        "testWebSameSitePolicy0003",
        URL,
        "a=b; path=/example; domain=.example.com; Secure; HttpOnly; SameSite=STRICT",
        "samesitePolicy",
        (x: string, y: string | number | boolean): boolean => {
          return x == y
        },
        webview.WebHttpCookieSameSitePolicy.STRICT)
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebExpiresDate0001
     * @tc.number SUB_WEB_ExpiresDate_0001
     * @tc.desc   test ExpiresDate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebExpiresDate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: boolean = false;
      result = await testCookies(
        "testWebExpiresDate0001",
        URL,
        "a=b; path=/example; domain=.example.com; Secure; HttpOnly; SameSite=STRICT",
        "expiresDate",
        (x: string, y: string | number | boolean): boolean => {
          return x == y
        },
        "")
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebExpiresDate0002
     * @tc.number SUB_WEB_ExpiresDate_0002
     * @tc.desc   test ExpiresDate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebExpiresDate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: boolean = false;
      result = await testCookies(
        "testWebExpiresDate0002",
        URL,
        "a=b; expires=Thu, 18 Dec 2038 12:00:00 UTC; path=/example; domain=.example.com; Secure; HttpOnly; SameSite=STRICT",
        "expiresDate",
        (x: string, y: string | number | boolean): boolean => {
          return x != y
        },
        "")
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebCookieName0001
     * @tc.number SUB_WEB_CookieName_0001
     * @tc.desc   test CookieName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebCookieName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: boolean = false;
      result = await testCookies(
        "testWebCookieName0001",
        URL,
        "a=b;",
        "name",
        (x: string, y: string | number | boolean): boolean => {
          return x == y
        },
        "a")
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebCookieValue0001
     * @tc.number SUB_WEB_CookieValue_0001
     * @tc.desc   test CookieValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebCookieValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: boolean = false;
      result = await testCookies(
        "testWebCookieValue0001",
        URL,
        "a=b;",
        "value",
        (x: string, y: string | number | boolean): boolean => {
          return x == y
        },
        "b")
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebCookiePath0001
     * @tc.number SUB_WEB_CookiePath_0001
     * @tc.desc   test CookiePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebCookiePath0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: boolean = false;
      result = await testCookies(
        "testWebCookiePath0001",
        URL,
        "a=b; path=/",
        "path",
        (x: string, y: string | number | boolean): boolean => {
          return x == y
        },
        "/")
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebCookieDomain0001
     * @tc.number SUB_WEB_CookieDomain_0001
     * @tc.desc   test CookieDomain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebCookieDomain0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: boolean = false;
      result = await testCookies(
        "testWebCookieDomain0001",
        URL,
        "a=b; path=/;domain=.example.com",
        "domain",
        (x: string, y: string | number | boolean): boolean => {
          return x == y
        },
        ".example.com")
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebIsSessionCookie0001
     * @tc.number SUB_WEB_IsSessionCookie_0001
     * @tc.desc   test IsSessionCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebIsSessionCookie0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: boolean = false;
      result = await testCookies(
        "testWebIsSessionCookie0001",
        URL,
        "a=b; path=/;domain=.example.com",
        "isSessionCookie",
        (x: string, y: string | number | boolean): boolean => {
          return x == y
        },
        true)
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebIsSessionCookie0002
     * @tc.number SUB_WEB_IsSessionCookie_0002
     * @tc.desc   test IsSessionCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebIsSessionCookie0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: boolean = false;
      result = await testCookies(
        "testWebIsSessionCookie0002",
        URL,
        "a=b; expires=Thu, 18 Dec 2038 12:00:00 UTC;path=/;domain=.example.com",
        "isSessionCookie",
        (x: string, y: string | number | boolean): boolean => {
          return x == y
        },
        false)
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebIsHttpOnly0001
     * @tc.number SUB_WEB_IsHttpOnly_0001
     * @tc.desc   test IsHttpOnly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebIsHttpOnly0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: boolean = false;
      result = await testCookies(
        "testWebIsHttpOnly0001",
        URL,
        "a=b; HttpOnly",
        "isHttpOnly",
        (x: string, y: string | number | boolean): boolean => {
          return x == y
        },
        true)
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebIsHttpOnly0002
     * @tc.number SUB_WEB_IsHttpOnly_0002
     * @tc.desc   test IsHttpOnly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebIsHttpOnly0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: boolean = false;
      result = await testCookies(
        "testWebIsHttpOnly0002",
        URL,
        "a=b;",
        "isHttpOnly",
        (x: string, y: string | number | boolean): boolean => {
          return x == y
        },
        false)
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebIsSecure0001
     * @tc.number SUB_WEB_IsSecure_0001
     * @tc.desc   test IsSecure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebIsSecure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: boolean = false;
      result = await testCookies(
        "testWebIsSecure0001",
        URL,
        "a=b; Secure",
        "isSecure",
        (x: string, y: string | number | boolean): boolean => {
          return x == y
        },
        true)
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebIsSecure0002
     * @tc.number SUB_WEB_IsSecure_0002
     * @tc.desc   test IsSecure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebIsSecure0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: boolean = false;
      result = await testCookies(
        "testWebIsSecure0001",
        URL,
        "a=b",
        "isSecure",
        (x: string, y: string | number | boolean): boolean => {
          return x == y
        },
        false)
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebFetchAllCookies0001
     * @tc.number SUB_WEB_FetchAllCookies_0001
     * @tc.desc   test FetchAllCookies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebFetchAllCookies0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result:boolean = false
      try {
        webview.WebCookieManager.fetchAllCookies(null)
      } catch (error) {
        console.error(`ErrorCode:${(error as BusinessError).code}, Message: ${(error as BusinessError).message}`)
        if (error.code == 401) {
          result = true
        }
      }
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebFetchAllCookies0002
     * @tc.number SUB_WEB_FetchAllCookies_0002
     * @tc.desc   test FetchAllCookies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebFetchAllCookies0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result:boolean = false
      try {
        webview.WebCookieManager.fetchAllCookies(undefined)
      } catch (error) {
        console.error(`ErrorCode:${(error as BusinessError).code}, Message: ${(error as BusinessError).message}`)
        if (error.code == 401) {
          result = true
        }
      }
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebFetchAllCookies0003
     * @tc.number SUB_WEB_FetchAllCookies_0003
     * @tc.desc   test FetchAllCookies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebFetchAllCookies0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result:boolean = false
      try {
        webview.WebCookieManager.fetchAllCookies(true)
        result = true
      } catch (error) {
        console.error(`ErrorCode:${(error as BusinessError).code}, Message: ${(error as BusinessError).message}`)
      }
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebFetchAllCookies0004
     * @tc.number SUB_WEB_FetchAllCookies_0004
     * @tc.desc   test FetchAllCookies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebFetchAllCookies0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result:boolean = false
      try {
        webview.WebCookieManager.fetchAllCookies(false)
        result = true
      } catch (error) {
        console.error(`ErrorCode:${(error as BusinessError).code}, Message: ${(error as BusinessError).message}`)
      }
      expect(result).assertEqual(true);
      done();
    })

  })
}