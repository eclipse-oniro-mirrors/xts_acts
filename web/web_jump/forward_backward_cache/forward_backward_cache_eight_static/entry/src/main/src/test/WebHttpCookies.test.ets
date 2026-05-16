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



import { beforeAll, beforeEach, describe, it, TestType, Size, Level, expect } from '../../../hypium/index';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError,RecordData } from '@ohos.base';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import Utils from './Util.test';

import webview from '@ohos.web.webview';

const URL = 'https://' + 'www.example.com'


function getCookieAttribute(cookie: webview.WebHttpCookie, attr: string): string | number | boolean | undefined {
  switch (attr) {
    case 'name': return cookie.name;
    case 'value': return cookie.value;
    case 'domain': return cookie.domain;
    case 'path': return cookie.path;
    case 'samesitePolicy': return cookie.samesitePolicy;
    case 'expiresDate': return cookie.expiresDate;
    case 'isSessionCookie': return cookie.isSessionCookie;
    case 'isHttpOnly': return cookie.isHttpOnly;
    case 'isSecure': return cookie.isSecure;

    default: return undefined;
  }
}

async function testCookies(tc_name:string, url:string, config:string, cookie_attr:string,
  condition:(x:string|number|boolean, y:string|number|boolean) =>  boolean,
  expect_value:string|number|boolean, incognito:boolean=false):Promise<boolean> {

  await webview.WebCookieManager.clearAllCookies();
  await Utils.msSleep(3000)
  let test_result:boolean = false;
  try {
    webview.WebCookieManager.configCookieSync(url,config);
  } catch (error) {
    console.error(`${tc_name} console ErrorCode:${(error as BusinessError).code}, Message: ${(error as BusinessError).message}`)
  }
  await Utils.msSleep(3000)
  try {
    await webview.WebCookieManager.fetchAllCookies(incognito).then((cookies) => {
      console.log(`${tc_name} console cookies.${cookie_attr}`);
      console.log(`${tc_name} console cookies length ${cookies.length}`);
      if ( cookies.length > 0 ) {
        const firstCookie = cookies[0];
        console.log(`${tc_name} console cookies.${cookie_attr}`);
        const actualValue:string | number | boolean = getCookieAttribute(firstCookie, cookie_attr) as string | number | boolean ;
        console.log(`${tc_name} console cookies ${actualValue}: ${expect_value}`);

        if (condition(actualValue, expect_value)) {
          console.log(`${tc_name} console cookies.${cookie_attr}: ${actualValue}`);
          test_result = true;
        }
      }
    })

  } catch (error) {
    console.error(`${tc_name} console ErrorCode:${(error as BusinessError).code}, Message: ${(error as BusinessError).message}`)
  }

  return test_result
}

export default function WebHttpCookies() {
  describe('WebHttpCookies', () => {

    beforeAll(async (): Promise<void> => {
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.forwardbackwardcacheeighttest.static')
      await Utils.msSleep(8000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async () => {
      console.info('web beforeEach start');
    })

    /**
     * @tc.name   testWebFetchAllCookiesReturnEmptyStatic0001
     * @tc.number SUB_WEB_FetchAllCookies_empty_STATIC_0001
     * @tc.desc   test fetchAllCookies false return empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebFetchAllCookiesReturnEmptyStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=> void):Promise<void> => {
      await webview.WebCookieManager.clearAllCookies();
      let isExistCookies:boolean = webview.WebCookieManager.existCookie();
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
     * @tc.name   testWebFetchAllCookiesReturnEmptyStatic0002
     * @tc.number SUB_WEB_FetchAllCookies_empty_STATIC_0002
     * @tc.desc   test fetchAllCookies true return empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebFetchAllCookiesReturnEmptyStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=> void):Promise<void> => {
      await webview.WebCookieManager.clearAllCookies();
      let isExistCookies:boolean = webview.WebCookieManager.existCookie(true);
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
     * @tc.name   testWebFetchAllCookiesNotReturnEmptyStatic0001
     * @tc.number SUB_WEB_FetchAllCookies_not_empty_STATIC_0001
     * @tc.desc   test fetchAllCookies false not return empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebFetchAllCookiesNotReturnEmptyStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=> void):Promise<void> => {
      webview.WebCookieManager.configCookieSync(URL, 'a=b');
      let isExistCookies:boolean = webview.WebCookieManager.existCookie();
      if (!isExistCookies) {
        webview.WebCookieManager.configCookieSync(URL, 'a=b');
      }
      await webview.WebCookieManager.fetchAllCookies(false).then((cookies) => {
        console.log('fetchAllCookies cookies length==>' + cookies.length);
        expect(cookies.length).assertLarger(0);
      })
      done();
    })
    /**
     * @tc.name   testWebFetchAllCookiesNotReturnEmptyStatic0002
     * @tc.number SUB_WEB_FetchAllCookies_not_empty_STATIC_0002
     * @tc.desc   test fetchAllCookies true not return empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebFetchAllCookiesNotReturnEmptyStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=> void):Promise<void> => {
      webview.WebCookieManager.configCookieSync(URL, 'a=b', true);
      let isExistCookies:boolean = webview.WebCookieManager.existCookie(true);
      if (!isExistCookies) {
        webview.WebCookieManager.configCookieSync(URL, 'a=b', true);
      }
      await webview.WebCookieManager.fetchAllCookies(true).then((cookies) => {
        console.log('fetchAllCookies cookies length==>' + cookies.length);
        expect(cookies.length).assertLarger(0);
      })
      done();
    })

    /**
     * @tc.name   testWebSameSitePolicyStatic0001
     * @tc.number SUB_WEB_SameSitePolicy_STATIC_0001
     * @tc.desc   test SameSitePolicy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebSameSitePolicyStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void):Promise<void> => {
      let result: boolean = false;
      result = await testCookies(
        'testWebSameSitePolicy0001',
        URL,
        'a=b; path=/example; domain=.example.com; Secure; HttpOnly; SameSite=NONE',
        'samesitePolicy',
        (x: string | number | boolean, y: string | number | boolean): boolean => {
          return x == y
        },
        webview.WebHttpCookieSameSitePolicy.NONE)
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebSameSitePolicyStatic0002
     * @tc.number SUB_WEB_SameSitePolicy_STATIC_0002
     * @tc.desc   test SameSitePolicy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebSameSitePolicyStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void):Promise<void> => {
      let result: boolean = false;
      result = await testCookies(
        'testWebSameSitePolicy0002',
        URL,
        'a=b; path=/example; domain=.example.com; Secure; HttpOnly; SameSite=LAX',
        'samesitePolicy',
        (x: string | number | boolean, y: string | number | boolean): boolean => {
          return x == y
        },
        webview.WebHttpCookieSameSitePolicy.LAX)
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebSameSitePolicyStatic0003
     * @tc.number SUB_WEB_SameSitePolicy_STATIC_0003
     * @tc.desc   test SameSitePolicy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebSameSitePolicyStatic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void):Promise<void> => {
      let result: boolean = false;
      result = await testCookies(
        'testWebSameSitePolicy0003',
        URL,
        'a=b; path=/example; domain=.example.com; Secure; HttpOnly; SameSite=STRICT',
        'samesitePolicy',
        (x: string | number | boolean, y: string | number | boolean): boolean => {
          return x == y
        },
        webview.WebHttpCookieSameSitePolicy.STRICT)
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebExpiresDateStatic0001
     * @tc.number SUB_WEB_ExpiresDate_STATIC_0001
     * @tc.desc   test ExpiresDate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebExpiresDateStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void):Promise<void> => {
      let result: boolean = false;
      result = await testCookies(
        'testWebExpiresDate0001',
        URL,
        'a=b; path=/example; domain=.example.com; Secure; HttpOnly; SameSite=STRICT',
        'expiresDate',
        (x: string | number | boolean, y: string | number | boolean): boolean => {
          return x == y
        },
        '')
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebExpiresDateStatic0002
     * @tc.number SUB_WEB_ExpiresDate_STATIC_0002
     * @tc.desc   test ExpiresDate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebExpiresDateStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void):Promise<void> => {
      let result: boolean = false;
      result = await testCookies(
        'testWebExpiresDate0002',
        URL,
        'a=b; expires=Thu, 18 Dec 2038 12:00:00 UTC; path=/example; domain=.example.com; Secure; HttpOnly; SameSite=STRICT',
        'expiresDate',
        (x: string | number | boolean, y: string | number | boolean): boolean => {
          return x != y
        },
        '')
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebCookieNameStatic0001
     * @tc.number SUB_WEB_CookieName_STATIC_0001
     * @tc.desc   test CookieName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebCookieNameStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void):Promise<void> => {
      let result: boolean = false;
      result = await testCookies(
        'testWebCookieName0001',
        URL,
        'a=b;',
        'name',
        (x: string | number | boolean, y: string | number | boolean): boolean => {
          return x == y
        },
        'a')
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebCookieValueStatic0001
     * @tc.number SUB_WEB_CookieValue_STATIC_0001
     * @tc.desc   test CookieValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebCookieValueStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void):Promise<void> => {
      let result: boolean = false;
      result = await testCookies(
        'testWebCookieValue0001',
        URL,
        'a=b;',
        'value',
        (x: string | number | boolean, y: string | number | boolean): boolean => {
          return x == y
        },
        'b')
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebCookiePathStatic0001
     * @tc.number SUB_WEB_CookiePath_STATIC_0001
     * @tc.desc   test CookiePath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebCookiePathStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void):Promise<void> => {
      let result: boolean = false;
      result = await testCookies(
        'testWebCookiePath0001',
        URL,
        'a=b; path=/',
        'path',
        (x: string | number | boolean, y: string | number | boolean): boolean => {
          return x == y
        },
        '/')
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebCookieDomainStatic0001
     * @tc.number SUB_WEB_CookieDomain_STATIC_0001
     * @tc.desc   test CookieDomain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebCookieDomainStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void):Promise<void> => {
      let result: boolean = false;
      result = await testCookies(
        'testWebCookieDomain0001',
        URL,
        'a=b; path=/;domain=.example.com',
        'domain',
        (x: string | number | boolean, y: string | number | boolean): boolean => {
          return x == y
        },
        '.example.com')
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebIsSessionCookieStatic0001
     * @tc.number SUB_WEB_IsSessionCookie_STATIC_0001
     * @tc.desc   test IsSessionCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebIsSessionCookieStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void):Promise<void> => {
      let result: boolean = false;
      result = await testCookies(
        'testWebIsSessionCookie0001',
        URL,
        'a=b; path=/;domain=.example.com',
        'isSessionCookie',
        (x: string | number | boolean, y: string | number | boolean): boolean => {
          return x == y
        },
        true)
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebIsSessionCookieStatic0002
     * @tc.number SUB_WEB_IsSessionCookie_STATIC_0002
     * @tc.desc   test IsSessionCookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebIsSessionCookieStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void):Promise<void> => {
      let result: boolean = false;
      result = await testCookies(
        'testWebIsSessionCookie0002',
        URL,
        'a=b; expires=Thu, 18 Dec 2038 12:00:00 UTC;path=/;domain=.example.com',
        'isSessionCookie',
        (x: string | number | boolean, y: string | number | boolean): boolean => {
          return x == y
        },
        false)
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebIsHttpOnlyStatic0001
     * @tc.number SUB_WEB_IsHttpOnly_STATIC_0001
     * @tc.desc   test IsHttpOnly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebIsHttpOnlyStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void):Promise<void> => {
      let result: boolean = false;
      result = await testCookies(
        'testWebIsHttpOnly0001',
        URL,
        'a=b; HttpOnly',
        'isHttpOnly',
        (x: string | number | boolean, y: string | number | boolean): boolean => {
          return x == y
        },
        true)
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebIsHttpOnlyStatic0002
     * @tc.number SUB_WEB_IsHttpOnly_STATIC_0002
     * @tc.desc   test IsHttpOnly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebIsHttpOnlyStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void):Promise<void> => {
      let result: boolean = false;
      result = await testCookies(
        'testWebIsHttpOnly0002',
        URL,
        'a=b;',
        'isHttpOnly',
        (x: string | number | boolean, y: string | number | boolean): boolean => {
          return x == y
        },
        false)
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebIsSecureStatic0001
     * @tc.number SUB_WEB_IsSecure_STATIC_0001
     * @tc.desc   test IsSecure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebIsSecureStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void):Promise<void> => {
      let result: boolean = false;
      result = await testCookies(
        'testWebIsSecure0001',
        URL,
        'a=b; Secure',
        'isSecure',
        (x: string | number | boolean, y: string | number | boolean): boolean => {
          return x == y
        },
        true)
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebIsSecureStatic0002
     * @tc.number SUB_WEB_IsSecure_STATIC_0002
     * @tc.desc   test IsSecure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebIsSecureStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void):Promise<void> => {
      let result: boolean = false;
      result = await testCookies(
        'testWebIsSecure0001',
        URL,
        'a=b',
        'isSecure',
        (x: string | number | boolean, y: string | number | boolean): boolean => {
          return x == y
        },
        false)
      expect(result).assertEqual(true);
      done();
    })

    /**
     * @tc.name   testWebFetchAllCookiesStatic0003
     * @tc.number SUB_WEB_FetchAllCookies_STATIC_0003
     * @tc.desc   test FetchAllCookies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebFetchAllCookiesStatic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void):Promise<void> => {
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
     * @tc.name   testWebFetchAllCookiesStatic0004
     * @tc.number SUB_WEB_FetchAllCookies_STATIC_0004
     * @tc.desc   test FetchAllCookies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebFetchAllCookiesStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=> void):Promise<void> => {
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