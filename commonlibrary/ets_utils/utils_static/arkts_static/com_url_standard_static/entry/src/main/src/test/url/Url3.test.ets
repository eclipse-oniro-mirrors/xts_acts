/*
* Copyright (c) 2024-2026 SwanLink (Jiangsu) Technology Development Co., LTD.
* Licensed under the Apache License, Version Version 2.0 (the "License");
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

import {
  afterEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import { url } from '@kit.ArkTS';
import { BusinessError } from '@ohos.base';
import Utils from '../Util.test';

export default function urlArktsStaTest() {
  describe('urlArktsStaTest', (): void => {
    afterEach(async (): Promise<void> => {
      await Utils.msSleep(20);
    })

    /**
     * @tc.name   testURLSetHash0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_SETHASH_0100
     * @tc.desc   Testing URL.hash setter to validate it correctly sets the hash fragment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLSetHash0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLSetHash0001";
      try {
        const urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        urlObject.hash = '#newFragment';
        expect(urlObject.hash).assertEqual('#newFragment');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLSetHash0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_SETHASH_0200
     * @tc.desc   Testing URL.hash setter with empty string to validate it clears the hash fragment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLSetHash0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLSetHash0002";
      try {
        const urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
        urlObject.hash = '';
        expect(urlObject.hash).assertEqual('');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLSetHash0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_SETHASH_0300
     * @tc.desc   Testing URL.hash setter with special characters to validate encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLSetHash0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLSetHash0003";
      try {
        const urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file');
        urlObject.hash = '#test-fragment_123';
        expect(urlObject.hash).assertEqual('#test-fragment_123');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLSetHost0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_SETHOST_0100
     * @tc.desc   Testing URL.host setter to validate it correctly sets the host.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLSetHost0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLSetHost0001";
      try {
        const urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file');
        urlObject.host = 'newhost:9090';
        expect(urlObject.host).assertEqual('newhost:9090');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLSetHost0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_SETHOST_0200
     * @tc.desc   Testing URL.host setter with port to validate it correctly sets host and port.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLSetHost0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLSetHost0002";
      try {
        const urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file');
        urlObject.host = 'example.com:80';
        expect(urlObject.host).assertEqual('example.com:80');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLSetHostname0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_SETHOSTNAME_0100
     * @tc.desc   Testing URL.hostname setter to validate it correctly sets the hostname.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLSetHostname0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLSetHostname0001";
      try {
        const urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file');
        urlObject.hostname = 'newhostname';
        expect(urlObject.hostname).assertEqual('newhostname');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLSetHostname0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_SETHOSTNAME_0200
     * @tc.desc   Testing URL.hostname setter with domain name to validate it correctly sets the hostname.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLSetHostname0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLSetHostname0002";
      try {
        const urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file');
        urlObject.hostname = 'example.com';
        expect(urlObject.hostname).assertEqual('example.com');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLSetHref0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_SETHREF_0100
     * @tc.desc   Testing URL.href setter to validate it correctly sets the complete URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLSetHref0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLSetHref0001";
      try {
        const urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file');
        urlObject.href = 'https://newuser:newpass@newhost:9090/newpath/newfile?query=1#frag';
        expect(urlObject.href).assertEqual('https://newuser:newpass@newhost:9090/newpath/newfile?query=1#frag');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLSetHref0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_SETHREF_0200
     * @tc.desc   Testing URL.href setter with simple URL to validate it correctly sets the complete URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLSetHref0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLSetHref0002";
      try {
        const urlObject = url.URL.parseURL('http://example.com/path');
        urlObject.href = 'https://newexample.com/newpath';
        expect(urlObject.href).assertEqual('https://newexample.com/newpath');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLSetPassword0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_SETPASSWORD_0100
     * @tc.desc   Testing URL.password setter to validate it correctly sets the password.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLSetPassword0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLSetPassword0001";
      try {
        const urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file');
        urlObject.password = 'newpassword';
        expect(urlObject.password).assertEqual('newpassword');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLSetPassword0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_SETPASSWORD_0200
     * @tc.desc   Testing URL.password setter with empty string to validate it clears the password.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLSetPassword0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLSetPassword0002";
      try {
        const urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file');
        urlObject.password = '';
        expect(urlObject.password).assertEqual('');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLSetPassword0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_SETPASSWORD_0300
     * @tc.desc   Testing URL.password setter with special characters to validate it handles special characters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLSetPassword0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLSetPassword0003";
      const urlObject = url.URL.parseURL('http://username@host:8080/directory/file');
      urlObject.password = 'p@ss!w0rd';
      expect(urlObject.password).assertEqual('p%40ss!w0rd');
    });

    /**
     * @tc.name   testURLSetPathname0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_SETPATHNAME_0100
     * @tc.desc   Testing URL.pathname setter to validate it correctly sets the pathname.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLSetPathname0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLSetPathname0001";
      try {
        const urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file');
        urlObject.pathname = '/newpath/newfile';
        expect(urlObject.pathname).assertEqual('/newpath/newfile');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLSetPathname0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_SETPATHNAME_0200
     * @tc.desc   Testing URL.pathname setter with root path to validate it correctly sets the pathname.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLSetPathname0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLSetPathname0002";
      try {
        const urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file');
        urlObject.pathname = '/';
        expect(urlObject.pathname).assertEqual('/');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLSetPort0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_SETPORT_0100
     * @tc.desc   Testing URL.port setter to validate it correctly sets the port.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLSetPort0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLSetPort0001";
      try {
        const urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file');
        urlObject.port = '9090';
        expect(urlObject.port).assertEqual('9090');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLSetPort0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_SETPORT_0200
     * @tc.desc   Testing URL.port setter with empty string to validate it clears the port.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLSetPort0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file');
      urlObject.port = '';
      expect(urlObject.port).assertEqual('8080');
    });

    /**
     * @tc.name   testURLSetProtocol0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_SETPROTOCOL_0100
     * @tc.desc   Testing URL.protocol setter to validate it correctly sets the protocol.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLSetProtocol0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLSetProtocol0001";
      try {
        const urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file');
        urlObject.protocol = 'https:';
        expect(urlObject.protocol).assertEqual('https:');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLSetProtocol0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_SETPROTOCOL_0200
     * @tc.desc   Testing URL.protocol setter with ftp protocol to validate it correctly sets the protocol.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLSetProtocol0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLSetProtocol0002";
      try {
        const urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file');
        urlObject.protocol = 'ftp:';
        expect(urlObject.protocol).assertEqual('ftp:');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLSetSearch0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_SETSEARCH_0100
     * @tc.desc   Testing URL.search setter to validate it correctly sets the search query.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLSetSearch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLSetSearch0001";
      try {
        const urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file');
        urlObject.search = '?newquery=1&newparam=2';
        expect(urlObject.search).assertEqual('?newquery=1&newparam=2');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLSetSearch0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_SETSEARCH_0200
     * @tc.desc   Testing URL.search setter with empty string to validate it clears the search query.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLSetSearch0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLSetSearch0002";
      try {
        const urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        urlObject.search = '';
        expect(urlObject.search).assertEqual('');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLSetSearch0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_SETSEARCH_0300
     * @tc.desc   Testing URL.search setter with special characters to validate it handles encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLSetSearch0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLSetSearch0003";
      try {
        const urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file');
        urlObject.search = '?key=value&test=123';
        expect(urlObject.search).assertEqual('?key=value&test=123');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLSetUsername0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_SETUSERNAME_0100
     * @tc.desc   Testing URL.username setter to validate it correctly sets the username.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLSetUsername0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLSetUsername0001";
      try {
        const urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file');
        urlObject.username = 'newusername';
        expect(urlObject.username).assertEqual('newusername');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLSetUsername0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_SETUSERNAME_0200
     * @tc.desc   Testing URL.username setter with empty string to validate it clears the username.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLSetUsername0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLSetUsername0002";
      try {
        const urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file');
        urlObject.username = '';
        expect(urlObject.username).assertEqual('');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLSetUsername0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_SETUSERNAME_0300
     * @tc.desc   Testing URL.username setter with special characters to validate it handles special characters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLSetUsername0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file');
      urlObject.username = 'user@name';
      expect(urlObject.username).assertEqual('user%40name');
    });

    /**
     * @tc.name   testURLParamsConstructor0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_CONSTRUCTOR_0100
     * @tc.desc   Testing URLParams constructor with string array to validate it correctly creates URLParams.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLParamsConstructor0001";
      try {
        const params = new url.URLParams([['user1', 'abc1'], ['query2', 'first2'], ['query3', 'second3']]);
        expect(params.get('user1')).assertEqual('abc1');
        expect(params.get('query2')).assertEqual('first2');
        expect(params.get('query3')).assertEqual('second3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLParamsConstructor0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_CONSTRUCTOR_0200
     * @tc.desc   Testing URLParams constructor with Record to validate it correctly creates URLParams.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLParamsConstructor0002";
      try {
        const record: Record<string, string> = { "fod": '1', "bard": '2' };
        const params = new url.URLParams(record);
        expect(params.get('fod')).assertEqual('1');
        expect(params.get('bard')).assertEqual('2');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLParamsConstructor0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_CONSTRUCTOR_0300
     * @tc.desc   Testing URLParams constructor with string to validate it correctly creates URLParams.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLParamsConstructor0003";
      try {
        const params = new url.URLParams('?fod=1&bard=2');
        expect(params.get('fod')).assertEqual('1');
        expect(params.get('bard')).assertEqual('2');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLParamsConstructor0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_CONSTRUCTOR_0400
     * @tc.desc   Testing URLParams constructor with URLParams to validate it correctly creates URLParams.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLParamsConstructor0004";
      try {
        const urlObject = url.URL.parseURL('https://developer.mozilla.org/?fod=1&bard=2');
        const params = new url.URLParams(urlObject.search);
        expect(params.get('fod')).assertEqual('1');
        expect(params.get('bard')).assertEqual('2');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLParamsGet0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_GET_0100
     * @tc.desc   Testing URLParams.get() to validate it returns the first value for a key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsGet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLParamsGet0001";
      try {
        const params = new url.URLParams('name=Jonathan&age=18');
        const name = params.get("name");
        const age = params.get("age");
        expect(name).assertEqual('Jonathan');
        expect(age).assertEqual('18');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLParamsGet0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_GET_0200
     * @tc.desc   Testing URLParams.get() with non-existent key to validate it returns undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsGet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLParamsGet0002";
      try {
        const params = new url.URLParams('name=Jonathan&age=18');
        const getObj = params.get("abc");
        expect(getObj).assertEqual(undefined);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLParamsGetAll0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_GETALL_0100
     * @tc.desc   Testing URLParams.getAll() to validate it returns all values for a key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsGetAll0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLParamsGetAll0001";
      try {
        const urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        const params = new url.URLParams(urlObject.search.slice(1));
        params.append('fod', '3');
        const allValues = params.getAll('fod');
        expect(allValues[0]).assertEqual('1');
        expect(allValues[1]).assertEqual('3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLParamsHas0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_HAS_0100
     * @tc.desc   Testing URLParams.has() to validate it checks if a key exists.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsHas0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLParamsHas0001";
      try {
        const urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        const params = new url.URLParams(urlObject.search.slice(1));
        const result = params.has('bard');
        expect(result).assertEqual(true);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLParamsHas0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_HAS_0200
     * @tc.desc   Testing URLParams.has() with non-existent key to validate it returns false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsHas0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLParamsHas0002";
      try {
        const urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        const params = new url.URLParams(urlObject.search.slice(1));
        const result = params.has('nonexistent');
        expect(result).assertEqual(false);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLParamsSet0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_SET_0100
     * @tc.desc   Testing URLParams.set() to validate it sets a key-value pair.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsSet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLParamsSet0001";
      try {
        const urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        const params = new url.URLParams(urlObject.search.slice(1));
        params.set('baz', '3');
        expect(params.get('baz')).assertEqual('3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLParamsSet0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_SET_0200
     * @tc.desc   Testing URLParams.set() with existing key to validate it replaces the value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsSet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLParamsSet0002";
      try {
        const urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        const params = new url.URLParams(urlObject.search.slice(1));
        params.set('fod', 'newvalue');
        expect(params.get('fod')).assertEqual('newvalue');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLParamsDelete0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_DELETE_0100
     * @tc.desc   Testing URLParams.delete() to validate it deletes a key-value pair.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsDelete0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLParamsDelete0001";
      try {
        const urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        const params = new url.URLParams(urlObject.search.slice(1));
        params.delete('fod');
        expect(params.has('fod')).assertEqual(false);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLParamsAppend0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_APPEND_0100
     * @tc.desc   Testing URLParams.append() to validate it appends a key-value pair.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsAppend0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLParamsAppend0001";
      try {
        const urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        const params = new url.URLParams(urlObject.search.slice(1));
        params.append('fod', '3');
        const allValues = params.getAll('fod');
        expect(allValues.length).assertEqual(2);
        expect(allValues[1]).assertEqual('3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLParamsSort0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_SORT_0100
     * @tc.desc   Testing URLParams.sort() to validate it sorts key-value pairs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsSort0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLParamsSort0001";
      try {
        const searchParamsObject = new url.URLParams("c=3&a=9&b=4&d=2");
        searchParamsObject.sort();
        const result = searchParamsObject.toString();
        expect(result).assertEqual('a=9&b=4&c=3&d=2');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLParamsKeys0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_KEYS_0100
     * @tc.desc   Testing URLParams.keys() to validate it returns an iterator of keys.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsKeys0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLParamsKeys0001";
      try {
        const searchParamsObject = new url.URLParams("key1=value1&key2=value2");
        const keys: Array<string> = Array.from(searchParamsObject.keys());
        expect(keys[0]).assertEqual('key1');
        expect(keys[1]).assertEqual('key2');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLParamsValues0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_VALUES_0100
     * @tc.desc   Testing URLParams.values() to validate it returns an iterator of values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsValues0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLParamsValues0001";
      try {
        const searchParams = new url.URLParams("key1=value1&key2=value2");
        const values: Array<string> = Array.from(searchParams.values());
        expect(values[0]).assertEqual('value1');
        expect(values[1]).assertEqual('value2');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLParamsForEach0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_FOREACH_0100
     * @tc.desc   Testing URLParams.forEach() to validate it iterates over key-value pairs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsForEach0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLParamsForEach0001";
      try {
        let params = new url.URLParams("key1=value1&key2=value2");
        let arr = new Array<string>();
        let i = 0;
        let urlCB: url.UrlCbFn = (value: string, key: string, searchParams: url.URLParams) => {
          arr.push(value + " " + key + " " + (params == searchParams));
          i++;
        };
        params.forEach(urlCB);
        expect(arr[0]).assertEqual('value1 key1 true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLParamsToString0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_TOSTRING_0100
     * @tc.desc   Testing URLParams.toString() to validate it returns a serialized string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParamsToString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLParamsToString0001";
      try {
        const urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        const params = new url.URLParams(urlObject.search.slice(1));
        params.append('fod', '3');
        const result = params.toString();
        expect(result).assertEqual('fod=1&bard=2&fod=3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLParseURL0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_PARSEURL_0100
     * @tc.desc   Testing URL.parseURL() to validate it parses a URL string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParseURL0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLParseURL0001";
      try {
        const mm = 'https://username:password@host:8080/test/test1/test3';
        const urlObject = url.URL.parseURL(mm);
        const result = urlObject.toString();
        expect(result).assertEqual('https://username:password@host:8080/test/test1/test3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLParseURL0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_PARSEURL_0200
     * @tc.desc   Testing URL.parseURL() with base to validate it resolves relative URLs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParseURL0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLParseURL0002";
      try {
        const url1 = url.URL.parseURL('path2/path3', 'https://www.example.com/test/test1');
        expect(url1.toString()).assertEqual('https://www.example.com/test/path2/path3');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLParseURL0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_PARSEURL_0300
     * @tc.desc   Testing URL.parseURL() with absolute URL to validate it ignores base.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLParseURL0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLParseURL0003";
      try {
        const urlObject = url.URL.parseURL('https://www.example.com', 'https://www.base.com');
        expect(urlObject.toString()).assertEqual('https://www.example.com/');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLToString0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_TOSTRING_0100
     * @tc.desc   Testing URL.toString() to validate it returns the serialized URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLToString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLToString0001";
      try {
        const urlObject = url.URL.parseURL('https://username:password@host:8080/directory/file?query=pppppp#qwer=da');
        const result = urlObject.toString();
        expect(result).assertEqual('https://username:password@host:8080/directory/file?query=pppppp#qwer=da');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLToJSON0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_TOJSON_0100
     * @tc.desc   Testing URL.toJSON() to validate it returns the JSON serialized URL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLToJSON0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLToJSON0001";
      try {
        const urlObject = url.URL.parseURL('https://username:password@host:8080/directory/file?query=pppppp#qwer=da');
        const result = urlObject.toJSON();
        expect(result).assertEqual('https://username:password@host:8080/directory/file?query=pppppp#qwer=da');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLGetOrigin001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_GETORIGIN_0100
     * @tc.desc   Testing URL.origin getter to validate it returns the origin.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLGetOrigin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLGetOrigin001";
      try {
        const urlObject = url.URL.parseURL('http://username:password@host:8080/directory/file?foo=1&bar=2');
        const origin = urlObject.origin;
        expect(origin).assertEqual('http://host:8080');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testURLGetParams0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_URL_GETPARAMS_0100
     * @tc.desc   Testing URL.params getter to validate it returns the URLParams object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testURLGetParams0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testURLGetParams0001";
      try {
        const urlObject = url.URL.parseURL('https://developer.mozilla.org/?fod=1&bard=2');
        const params = urlObject.params;
        expect(params.get('fod')).assertEqual('1');
        expect(params.get('bard')).assertEqual('2');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });
  });
}
