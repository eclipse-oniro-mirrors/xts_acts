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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import { BusinessError } from '@ohos.base';
import Url from '@ohos.url';
import Utils from '../Util.test';

export default function Escape_Url() {
  describe('Escape_Url', (): void => {
    afterEach(() => {
      await Utils.msSleep(10)
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0100
     * @tc.name       : testUrlAppend9Escape0001
     * @tc.desc       : Testing the Urlr interface Append9 with input escape \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlAppend9Escape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlAppend9Escape0001";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.append('\b', '3');
        expect(paramsObject.toString()).assertEqual("fod=1&bard=2&%08=3");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0200
     * @tc.name       : testUrlAppend9Escape0002
     * @tc.desc       : Testing the Url interface Append9 with input escape \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlAppend9Escape0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlAppend9Escape0002";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.append('\f', '3');
        expect(paramsObject.toString()).assertEqual("fod=1&bard=2&%0C=3");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0300
     * @tc.name       : testUrlAppend9Escape0003
     * @tc.desc       : Testing the Url interface Append9 with input escape \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlAppend9Escape0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlAppend9Escape0003";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.append('\n', '3');
        expect(paramsObject.toString()).assertEqual("fod=1&bard=2&%0A=3");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0400
     * @tc.name       : testUrlAppend9Escape0004
     * @tc.desc       : Testing the Url interface Append9 with input escape \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlAppend9Escape0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlAppend9Escape0004";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.append('\r', '3');
        expect(paramsObject.toString()).assertEqual("fod=1&bard=2&%0D=3");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0500
     * @tc.name       : testUrlAppend9Escape0005
     * @tc.desc       : Testing the Url interface Append9 with input escape \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlAppend9Escape0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlAppend9Escape0005";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.append('\t', '3');
        expect(paramsObject.toString()).assertEqual("fod=1&bard=2&%09=3");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0600
     * @tc.name       : testUrlAppend9Escape0006
     * @tc.desc       : Testing the Url interface Append9 with input escape \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlAppend9Escape0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlAppend9Escape0006";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.append('\v', '3');
        expect(paramsObject.toString()).assertEqual("fod=1&bard=2&%0B=3");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0700
     * @tc.name       : testUrlAppend9Escape0007
     * @tc.desc       : Testing the Url interface Append9 with input escape \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlAppend9Escape0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlAppend9Escape0007";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.append('\x24', '3');
        expect(paramsObject.toString()).assertEqual("fod=1&bard=2&%24=3");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0800
     * @tc.name       : testUrlAppend9Escape0008
     * @tc.desc       : Testing the Url interface Append9 with input escape \开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlAppend9Escape0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlAppend9Escape0008";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.append('\\开', '3');
        expect(paramsObject.toString()).assertEqual("fod=1&bard=2&%5C%E5%BC%80=3");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0900
     * @tc.name       : testUrlAppend9Escape0009
     * @tc.desc       : Testing the Url interface Append9 with input escape \😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlAppend9Escape0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlAppend9Escape0009";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.append('\\😊', '3');
        expect(paramsObject.toString()).assertEqual("fod=1&bard=2&%5C%F0%9F%98%8A=3");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_1000
     * @tc.name       : testUrlAppend9Escape0010
     * @tc.desc       : Testing the Url interface Append9 with input escape \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlAppend9Escape0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlAppend9Escape0010";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.append('\\0', '3');
        expect(paramsObject.toString()).assertEqual("fod=1&bard=2&%5C0=3");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_1100
     * @tc.name       : testUrlAppend9Escape0011
     * @tc.desc       : Testing the Url interface Append9 with input escape \\b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlAppend9Escape0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlAppend9Escape0011";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.append('\\b', '3');
        expect(paramsObject.toString()).assertEqual("fod=1&bard=2&%5Cb=3");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0100
     * @tc.name       : testUrlDelete9Escape0001
     * @tc.desc       : Testing the Urlr interface Delete with input escape \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlDelete9Escape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlDelete9Escape0001";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\b=1&bar=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.delete('\b');
        expect(paramsObject.toString()).assertEqual("bar=2");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0200
     * @tc.name       : testUrlDeleteEscape0002
     * @tc.desc       : Testing the Url interface Delete with input escape \f (Form Feed)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlDeleteEscape0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlDeleteEscape0002";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\f=1&bar=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.delete('\f');
        expect(paramsObject.toString()).assertEqual("bar=2");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0300
     * @tc.name       : testUrlDeleteEscape0003
     * @tc.desc       : Testing the Url interface Delete with input escape \n (Newline)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlDeleteEscape0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlDeleteEscape0003";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\n=1&bar=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.delete('');
        expect(paramsObject.toString()).assertEqual("bar=2");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0400
     * @tc.name       : testUrlDeleteEscape0004
     * @tc.desc       : Testing the Url interface Delete with input escape \r (Carriage Return)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlDeleteEscape0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlDeleteEscape0004";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\r=1&bar=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.delete('');
        expect(paramsObject.toString()).assertEqual("bar=2");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0500
     * @tc.name       : testUrlDeleteEscape0005
     * @tc.desc       : Testing the Url interface Delete with input escape \t (Tab)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlDeleteEscape0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlDeleteEscape0005";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\t=1&bar=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.delete('');
        expect(paramsObject.toString()).assertEqual("bar=2");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0600
     * @tc.name       : testUrlDeleteEscape0006
     * @tc.desc       : Testing the Url interface Delete with input escape \v (Vertical Tab)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlDeleteEscape0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlDeleteEscape0006";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\v=1&bar=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.delete('\v');
        expect(paramsObject.toString()).assertEqual("bar=2");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0700
     * @tc.name       : testUrlDeleteEscape0007
     * @tc.desc       : Testing the Url interface Delete with input escape \x24 (Hexadecimal Dollar sign)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlDeleteEscape0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlDeleteEscape0007";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\x24=1&bar=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.delete('\x24');
        expect(paramsObject.toString()).assertEqual("bar=2");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0800
     * @tc.name       : testUrlDeleteEscape0008
     * @tc.desc       : Testing the Url interface Delete with input escape \u5f00
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlDeleteEscape0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlDeleteEscape0008";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\u5f00=1&bar=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.delete('\u5f00');
        expect(paramsObject.toString()).assertEqual("bar=2");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0900
     * @tc.name       : testUrlDeleteEscape0009
     * @tc.desc       : Testing the Url interface Delete with input escape \😊 (Emoji)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlDeleteEscape0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlDeleteEscape0009";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\\😊=1&bar=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.delete('\\😊');
        expect(paramsObject.toString()).assertEqual("bar=2");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_1000
     * @tc.name       : testUrlDeleteEscape0010
     * @tc.desc       : Testing the Url interface Delete with input escape \0 (Null byte)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlDeleteEscape0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlDeleteEscape0010";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\0=1&bar=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.delete('\0');
        expect(paramsObject.toString()).assertEqual("bar=2");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_1100
     * @tc.name       : testUrlDeleteEscape0011
     * @tc.desc       : Testing the Url interface Delete with input escape \\b (Literal backslash + b)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlDeleteEscape0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlDeleteEscape0011";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\\b=1&bar=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.delete('\\b');
        expect(paramsObject.toString()).assertEqual("bar=2");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0100
     * @tc.name       : testUrlGetAll9Escape0001
     * @tc.desc       : Testing the Urlr interface GetAll9 with input escape \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlGetAll9Escape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlGetAll9Escape0001";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\b=1&bard=2');
        let params = new Url.URLParams(urlObject.search.slice(1));
        params.append('\b', '3');
        expect(params.getAll('\b').toString()).assertEqual("1,3");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0200
     * @tc.name       : testUrlGetAll9Escape0002
     * @tc.desc       : Testing the Url interface GetAll9 with input escape \f (Form Feed)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlGetAll9Escape0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlGetAll9Escape0002";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\f=1&bard=2');
        let params = new Url.URLParams(urlObject.search.slice(1));
        params.append('\f', '3');
        expect(params.getAll('\f').toString()).assertEqual("1,3");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0300
     * @tc.name       : testUrlGetAll9Escape0003
     * @tc.desc       : Testing the Url interface GetAll9 with input escape \n (Newline)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlGetAll9Escape0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlGetAll9Escape0003";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\n=1&bard=2');
        let params = new Url.URLParams(urlObject.search.slice(1));
        params.append('', '3');
        expect(params.getAll('').toString()).assertEqual("1,3");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0400
     * @tc.name       : testUrlGetAll9Escape0004
     * @tc.desc       : Testing the Url interface GetAll9 with input escape \r (Carriage Return)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlGetAll9Escape0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlGetAll9Escape0004";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\r=1&bard=2');
        let params = new Url.URLParams(urlObject.search.slice(1));
        params.append('', '3');
        expect(params.getAll('').toString()).assertEqual("1,3");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0500
     * @tc.name       : testUrlGetAll9Escape0005
     * @tc.desc       : Testing the Url interface GetAll9 with input escape \t (Tab)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlGetAll9Escape0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlGetAll9Escape0005";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\t=1&bard=2');
        let params = new Url.URLParams(urlObject.search.slice(1));
        params.append('', '3');
        expect(params.getAll('').toString()).assertEqual("1,3");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0600
     * @tc.name       : testUrlGetAll9Escape0006
     * @tc.desc       : Testing the Url interface GetAll9 with input escape \v (Vertical Tab)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlGetAll9Escape0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlGetAll9Escape0006";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\v=1&bard=2');
        let params = new Url.URLParams(urlObject.search.slice(1));
        params.append('\v', '3');
        expect(params.getAll('\v').toString()).assertEqual("1,3");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0700
     * @tc.name       : testUrlGetAll9Escape0007
     * @tc.desc       : Testing the Url interface GetAll9 with input escape \x24 (Hexadecimal Dollar sign)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlGetAll9Escape0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlGetAll9Escape0007";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\x24=1&bard=2');
        let params = new Url.URLParams(urlObject.search.slice(1));
        params.append('\x24', '3');
        expect(params.getAll('\x24').toString()).assertEqual("1,3");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0800
     * @tc.name       : testUrlGetAll9Escape0008
     * @tc.desc       : Testing the Url interface GetAll9 with input escape \开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlGetAll9Escape0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlGetAll9Escape0008";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\u5f00=1&bard=2');
        let params = new Url.URLParams(urlObject.search.slice(1));
        params.append('\u5f00', '3');
        expect(params.getAll('\u5f00').toString()).assertEqual("1,3");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0900
     * @tc.name       : testUrlGetAll9Escape0009
     * @tc.desc       : Testing the Url interface GetAll9 with input escape \😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlGetAll9Escape0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlGetAll9Escape0009";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\u1F60A=1&bard=2');
        let params = new Url.URLParams(urlObject.search.slice(1));
        params.append('\u1F60A', '3');
        expect(params.getAll('\u1F60A').toString()).assertEqual("1,3");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_1000
     * @tc.name       : testUrlGetAll9Escape0010
     * @tc.desc       : Testing the Url interface GetAll9 with input escape \0 (Null byte)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlGetAll9Escape0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlGetAll9Escape0010";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\0=1&bard=2');
        let params = new Url.URLParams(urlObject.search.slice(1));
        params.append('\0', '3');
        expect(params.getAll('\0').toString()).assertEqual("1,3");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_1100
     * @tc.name       : testUrlGetAll9Escape0011
     * @tc.desc       : Testing the Url interface GetAll9 with input escape \\b (Literal Backslash b)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlGetAll9Escape0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlGetAll9Escape0011";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\\b=1&bard=2');
        let params = new Url.URLParams(urlObject.search.slice(1));
        params.append('\\b', '3');
        expect(params.getAll('\\b').toString()).assertEqual("1,3");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0100
     * @tc.name       : testUrlParams9Entries9Escape0001
     * @tc.desc       : Testing the Url interface Params9Entries9 with input escape \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it('testUrlParams9Entries9Escape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlParams9Entries9Escape0001";
    //   try {
    //     let searchParamsObject = new Url.URLParams("keyName1=\b&keyName2=valueName2");
    //     let pair: Iterable<Object[]> = searchParamsObject.entries();
    //     let arrayValue = Array.from(pair);
    //     let resultString = arrayValue.map(pair => `${pair[0]}, ${pair[1]}`).join("; ");
    //     let expectedString = "keyName1, \b; keyName2, valueName2";
    //     expect(resultString).assertEqual(expectedString);
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // });
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0200
    //  * @tc.name       : testUrlParams9Entries9Escape0002
    //  * @tc.desc       : Testing the Url interface Params9Entries9 with input escape \f
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlParams9Entries9Escape0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlParams9Entries9Escape0002";
    //   try {
    //     let searchParamsObject = new Url.URLParams("keyName1=\f&keyName2=valueName2");
    //     let pair: Iterable<Object[]> = searchParamsObject.entries();
    //     let arrayValue = Array.from(pair);
    //     let resultString = arrayValue.map(pair => `${pair[0]}, ${pair[1]}`).join("; ");
    //     let expectedString = "keyName1, \f; keyName2, valueName2";
    //     expect(resultString).assertEqual(expectedString);
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // });
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0300
    //  * @tc.name       : testUrlParams9Entries9Escape0003
    //  * @tc.desc       : Testing the Url interface Params9Entries9 with input escape \n
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlParams9Entries9Escape0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlParams9Entries9Escape0003";
    //   try {
    //     let searchParamsObject = new Url.URLParams("keyName1=\n&keyName2=valueName2");
    //     let pair: Iterable<Object[]> = searchParamsObject.entries();
    //     let arrayValue = Array.from(pair);
    //     let resultString = arrayValue.map(pair => `${pair[0]}, ${pair[1]}`).join("; ");
    //     let expectedString = "keyName1, \n; keyName2, valueName2";
    //     expect(resultString).assertEqual(expectedString);
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // });
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0400
    //  * @tc.name       : testUrlParams9Entries9Escape0004
    //  * @tc.desc       : Testing the Url interface Params9Entries9 with input escape \r
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlParams9Entries9Escape0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlParams9Entries9Escape0004";
    //   try {
    //     let searchParamsObject = new Url.URLParams("keyName1=\r&keyName2=valueName2");
    //     let pair: Iterable<Object[]> = searchParamsObject.entries();
    //     let arrayValue = Array.from(pair);
    //     let resultString = arrayValue.map(pair => `${pair[0]}, ${pair[1]}`).join("; ");
    //     let expectedString = "keyName1, \r; keyName2, valueName2";
    //     expect(resultString).assertEqual(expectedString);
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // });
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0500
    //  * @tc.name       : testUrlParams9Entries9Escape0005
    //  * @tc.desc       : Testing the Url interface Params9Entries9 with input escape \t
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlParams9Entries9Escape0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlParams9Entries9Escape0005";
    //   try {
    //     let searchParamsObject = new Url.URLParams("keyName1=\t&keyName2=valueName2");
    //     let pair: Iterable<Object[]> = searchParamsObject.entries();
    //     let arrayValue = Array.from(pair);
    //     let resultString = arrayValue.map(pair => `${pair[0]}, ${pair[1]}`).join("; ");
    //     let expectedString = "keyName1, \t; keyName2, valueName2";
    //     expect(resultString).assertEqual(expectedString);
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // });
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0600
    //  * @tc.name       : testUrlParams9Entries9Escape0006
    //  * @tc.desc       : Testing the Url interface Params9Entries9 with input escape \v
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlParams9Entries9Escape0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlParams9Entries9Escape0006";
    //   try {
    //     let searchParamsObject = new Url.URLParams("keyName1=\v&keyName2=valueName2");
    //     let pair: Iterable<Object[]> = searchParamsObject.entries();
    //     let arrayValue = Array.from(pair);
    //     let resultString = arrayValue.map(pair => `${pair[0]}, ${pair[1]}`).join("; ");
    //     let expectedString = "keyName1, \v; keyName2, valueName2";
    //     expect(resultString).assertEqual(expectedString);
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // });
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0700
    //  * @tc.name       : testUrlParams9Entries9Escape0007
    //  * @tc.desc       : Testing the Url interface Params9Entries9 with input escape \x24
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlParams9Entries9Escape0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlParams9Entries9Escape0007";
    //   try {
    //     let searchParamsObject = new Url.URLParams("keyName1=\x24&keyName2=valueName2");
    //     let pair: Iterable<Object[]> = searchParamsObject.entries();
    //     let arrayValue = Array.from(pair);
    //     let resultString = arrayValue.map(pair => `${pair[0]}, ${pair[1]}`).join("; ");
    //     let expectedString = "keyName1, \$; keyName2, valueName2";
    //     expect(resultString).assertEqual(expectedString);
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // });
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0800
    //  * @tc.name       : testUrlParams9Entries9Escape0008
    //  * @tc.desc       : Testing the Url interface Params9Entries9 with input escape \开
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlParams9Entries9Escape0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlParams9Entries9Escape0008";
    //   try {
    //     let searchParamsObject = new Url.URLParams("keyName1=\\开&keyName2=valueName2");
    //     let pair: Iterable<Object[]> = searchParamsObject.entries();
    //     let arrayValue = Array.from(pair);
    //     let resultString = arrayValue.map(pair => `${pair[0]}, ${pair[1]}`).join("; ");
    //     let expectedString = "keyName1, \\开; keyName2, valueName2";
    //     expect(resultString).assertEqual(expectedString);
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // });
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0900
    //  * @tc.name       : testUrlParams9Entries9Escape0009
    //  * @tc.desc       : Testing the Url interface Params9Entries9 with input escape \😊
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlParams9Entries9Escape0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlParams9Entries9Escape0009";
    //   try {
    //     let searchParamsObject = new Url.URLParams("keyName1=\\😊&keyName2=valueName2");
    //     let pair: Iterable<Object[]> = searchParamsObject.entries();
    //     let arrayValue = Array.from(pair);
    //     let resultString = arrayValue.map(pair => `${pair[0]}, ${pair[1]}`).join("; ");
    //     let expectedString = "keyName1, \\😊; keyName2, valueName2";
    //     expect(resultString).assertEqual(expectedString);
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // });
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_1000
    //  * @tc.name       : testUrlParams9Entries9Escape0010
    //  * @tc.desc       : Testing the Url interface Params9Entries9 with input escape \0
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlParams9Entries9Escape0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlParams9Entries9Escape0010";
    //   try {
    //     let searchParamsObject = new Url.URLParams("keyName1=\0&keyName2=valueName2");
    //     let pair: Iterable<Object[]> = searchParamsObject.entries();
    //     let arrayValue = Array.from(pair);
    //     let resultString = arrayValue.map(pair => `${pair[0]}, ${pair[1]}`).join("; ");
    //     let expectedString = "keyName1, \0; keyName2, valueName2";
    //     expect(resultString).assertEqual(expectedString);
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // });
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_1100
    //  * @tc.name       : testUrlParams9Entries9Escape0011
    //  * @tc.desc       : Testing the Url interface Params9Entries9 with input escape \\b
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlParams9Entries9Escape0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlParams9Entries9Escape0011";
    //   try {
    //     let searchParamsObject = new Url.URLParams("keyName1=\\b&keyName2=valueName2");
    //     let pair: Iterable<Object[]> = searchParamsObject.entries();
    //     let arrayValue = Array.from(pair);
    //     let resultString = arrayValue.map(pair => `${pair[0]}, ${pair[1]}`).join("; ");
    //     let expectedString = "keyName1, \\b; keyName2, valueName2";
    //     expect(resultString).assertEqual(expectedString);
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0100
     * @tc.name       : testUrlParams9ForEach9Escape0001
     * @tc.desc       : Testing the Url interface Params9ForEach9 with input escape \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9ForEach9Escape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9ForEach9Escape0001";
      try {
        const myURLObject = Url.URL.parseURL('https://developer.exampleUrl/?text=abc\b&anotherParam=xyz');
        let callbackInvoked = false;
        myURLObject.params.forEach((value, name, searchParams) => {
          console.log(name, value, myURLObject.params === searchParams);
          if (name === "text") {
            expect(value).assertEqual("abc\b");
          }
          callbackInvoked = true;
        });
        expect(String(callbackInvoked)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0101
     * @tc.name       : testUrlParams9ForEach9Escape0002
     * @tc.desc       : Testing the Url interface Params9ForEach9 with input escape \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9ForEach9Escape0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9ForEach9Escape0002";
      try {
        const myURLObject = Url.URL.parseURL('https://developer.exampleUrl/?text=abc\f&anotherParam=xyz');
        let callbackInvoked = false;
        myURLObject.params.forEach((value, name, searchParams) => {
          console.log(name, value, myURLObject.params === searchParams);
          if (name === "text") {
            expect(value).assertEqual("abc\f");
          }
          callbackInvoked = true;
        });
        expect(String(callbackInvoked)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0102
     * @tc.name       : testUrlParams9ForEach9Escape0003
     * @tc.desc       : Testing the Url interface Params9ForEach9 with input escape \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9ForEach9Escape0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9ForEach9Escape0003";
      try {
        const myURLObject = Url.URL.parseURL('https://developer.exampleUrl/?text=abc\n&anotherParam=xyz');
        let callbackInvoked = false;
        myURLObject.params.forEach((value, name, searchParams) => {
          console.log(name, value, myURLObject.params === searchParams);
          if (name === "text") {
            expect(encodeURI(value)).assertEqual(encodeURI("abc"));
          }
          callbackInvoked = true;
        });
        expect(String(callbackInvoked)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0103
     * @tc.name       : testUrlParams9ForEach9Escape0004
     * @tc.desc       : Testing the Url interface Params9ForEach9 with input escape \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9ForEach9Escape0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9ForEach9Escape0004";
      try {
        const myURLObject = Url.URL.parseURL('https://developer.exampleUrl/?text=abc\r&anotherParam=xyz');
        let callbackInvoked = false;
        myURLObject.params.forEach((value, name, searchParams) => {
          console.log(name, value, myURLObject.params === searchParams);
          if (name === "text") {
            expect(encodeURI(value)).assertEqual(encodeURI("abc"));
          }
          callbackInvoked = true;
        });
        expect(String(callbackInvoked)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0104
     * @tc.name       : testUrlParams9ForEach9Escape0005
     * @tc.desc       : Testing the Url interface Params9ForEach9 with input escape \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9ForEach9Escape0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9ForEach9Escape0005";
      try {
        const myURLObject = Url.URL.parseURL('https://developer.exampleUrl/?text=abc\t&anotherParam=xyz');
        let callbackInvoked = false;
        myURLObject.params.forEach((value, name, searchParams) => {
          console.log(name, value, myURLObject.params === searchParams);
          if (name === "text") {
            expect(value).assertEqual("abc");
          }
          callbackInvoked = true;
        });
        expect(String(callbackInvoked)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0105
     * @tc.name       : testUrlParams9ForEach9Escape0006
     * @tc.desc       : Testing the Url interface Params9ForEach9 with input escape \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9ForEach9Escape0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9ForEach9Escape0006";
      try {
        const myURLObject = Url.URL.parseURL('https://developer.exampleUrl/?text=abc\v&anotherParam=xyz');
        let callbackInvoked = false;
        myURLObject.params.forEach((value, name, searchParams) => {
          console.log(name, value, myURLObject.params === searchParams);
          if (name === "text") {
            expect(encodeURI(value)).assertEqual(encodeURI("abc\v"));
          }
          callbackInvoked = true;
        });
        expect(String(callbackInvoked)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0106
     * @tc.name       : testUrlParams9ForEach9Escape0007
     * @tc.desc       : Testing the Url interface Params9ForEach9 with input escape \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9ForEach9Escape0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9ForEach9Escape0007";
      try {
        const myURLObject = Url.URL.parseURL('https://developer.exampleUrl/?text=abc\x24&anotherParam=xyz');
        let callbackInvoked = false;
        myURLObject.params.forEach((value, name, searchParams) => {
          console.log(name, value, myURLObject.params === searchParams);
          if (name === "text") {
            expect(value).assertEqual("abc\x24");
          }
          callbackInvoked = true;
        });
        expect(String(callbackInvoked)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0107
     * @tc.name       : testUrlParams9ForEach9Escape0008
     * @tc.desc       : Testing the Url interface Params9ForEach9 with input escape \开 (== 开)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9ForEach9Escape0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9ForEach9Escape0008";
      try {
        const myURLObject = Url.URL.parseURL('https://developer.exampleUrl/?text=abc\\开&anotherParam=xyz');
        let callbackInvoked = false;
        myURLObject.params.forEach((value, name, searchParams) => {
          console.log(name, value, myURLObject.params === searchParams);
          if (name === "text") {
            expect(value).assertEqual("abc\\开");
          }
          callbackInvoked = true;
        });
        expect(String(callbackInvoked)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0108
     * @tc.name       : testUrlParams9ForEach9Escape0009
     * @tc.desc       : Testing the Url interface Params9ForEach9 with input escape \😊 (== 😊)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9ForEach9Escape0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9ForEach9Escape0009";
      try {
        const myURLObject = Url.URL.parseURL('https://developer.exampleUrl/?text=abc\\😊&anotherParam=xyz');
        let callbackInvoked = false;
        myURLObject.params.forEach((value, name, searchParams) => {
          console.log(name, value, myURLObject.params === searchParams);
          if (name === "text") {
            expect(value).assertEqual("abc\\😊");
          }
          callbackInvoked = true;
        });
        expect(String(callbackInvoked)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0109
     * @tc.name       : testUrlParams9ForEach9Escape0010
     * @tc.desc       : Testing the Url interface Params9ForEach9 with input escape \0 (== null)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9ForEach9Escape0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9ForEach9Escape0010";
      try {
        const myURLObject = Url.URL.parseURL('https://developer.exampleUrl/?text=abc\\0&anotherParam=xyz');
        let callbackInvoked = false;
        myURLObject.params.forEach((value, name, searchParams) => {
          console.log(name, value, myURLObject.params === searchParams);
          if (name === "text") {
            expect(value).assertEqual("abc\\0");
          }
          callbackInvoked = true;
        });
        expect(String(callbackInvoked)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0110
     * @tc.name       : testUrlParams9ForEach9Escape0011
     * @tc.desc       : Testing the Url interface Params9ForEach9 with input escape \\b (== \b)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9ForEach9Escape0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9ForEach9Escape0011";
      try {
        const myURLObject = Url.URL.parseURL('https://developer.exampleUrl/?text=abc\\b&anotherParam=xyz');
        let callbackInvoked = false;
        myURLObject.params.forEach((value, name, searchParams) => {
          console.log(name, value, myURLObject.params === searchParams);
          if (name === "text") {
            expect(value).assertEqual("abc\\b");
          }
          callbackInvoked = true;
        });
        expect(String(callbackInvoked)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0100
     * @tc.name       : testUrlParams9Get9Escape0001
     * @tc.desc       : Testing the Url interface Params9Get9 with input escape \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Get9Escape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Get9Escape0001";
      try {
        let paramsObject = new Url.URLParams('escape=hello\b');
        expect(paramsObject.get("escape")?.toString()).assertEqual("hello\b");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0200
     * @tc.name       : testUrlParams9Get9Escape0002
     * @tc.desc       : Testing the Url interface Params9Get9 with input escape \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Get9Escape0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Get9Escape0002";
      try {
        let paramsObject = new Url.URLParams('escape=hello\f');
        expect(paramsObject.get("escape")?.toString()).assertEqual("hello\f");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0300
     * @tc.name       : testUrlParams9Get9Escape0003
     * @tc.desc       : Testing the Url interface Params9Get9 with input escape \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Get9Escape0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Get9Escape0003";
      try {
        let paramsObject = new Url.URLParams('escape=hello\nworld');
        expect(paramsObject.get("escape")?.toString()).assertEqual("hello\nworld");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0400
     * @tc.name       : testUrlParams9Get9Escape0004
     * @tc.desc       : Testing the Url interface Params9Get9 with input escape \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Get9Escape0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Get9Escape0004";
      try {
        let paramsObject = new Url.URLParams('escape=hello\rworld');
        expect(paramsObject.get("escape")?.toString()).assertEqual("hello\rworld");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0500
     * @tc.name       : testUrlParams9Get9Escape0005
     * @tc.desc       : Testing the Url interface Params9Get9 with input escape \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Get9Escape0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Get9Escape0005";
      try {
        let paramsObject = new Url.URLParams('escape=hello\tworld');
        expect(paramsObject.get("escape")?.toString()).assertEqual("hello\tworld");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0600
     * @tc.name       : testUrlParams9Get9Escape0006
     * @tc.desc       : Testing the Url interface Params9Get9 with input escape \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Get9Escape0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Get9Escape0006";
      try {
        let paramsObject = new Url.URLParams('escape=hello\vworld');
        expect(paramsObject.get("escape")?.toString()).assertEqual("hello\vworld");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0700
     * @tc.name       : testUrlParams9Get9Escape0007
     * @tc.desc       : Testing the Url interface Params9Get9 with input escape \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Get9Escape0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Get9Escape0007";
      try {
        let paramsObject = new Url.URLParams('escape=hello\x24world');
        expect(paramsObject.get("escape")?.toString()).assertEqual("hello\x24world");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0800
     * @tc.name       : testUrlParams9Get9Escape0008
     * @tc.desc       : Testing the Url interface Params9Get9 with input escape \开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Get9Escape0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Get9Escape0008";
      try {
        let paramsObject = new Url.URLParams('escape=hello\\开world');
        expect(paramsObject.get("escape")?.toString()).assertEqual("hello\\开world");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0900
     * @tc.name       : testUrlParams9Get9Escape0009
     * @tc.desc       : Testing the Url interface Params9Get9 with input escape \😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Get9Escape0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Get9Escape0009";
      try {
        let paramsObject = new Url.URLParams('escape=hello\\😊world');
        expect(paramsObject.get("escape")?.toString()).assertEqual("hello\\😊world");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_1000
     * @tc.name       : testUrlParams9Get9Escape0010
     * @tc.desc       : Testing the Url interface Params9Get9 with input escape \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Get9Escape0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Get9Escape0010";
      try {
        let paramsObject = new Url.URLParams('escape=hello\\0world');
        expect(paramsObject.get("escape")?.toString()).assertEqual("hello\\0world");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_1100
     * @tc.name       : testUrlParams9Get9Escape0011
     * @tc.desc       : Testing the Url interface Params9Get9 with input escape \\b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Get9Escape0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Get9Escape0011";
      try {
        let paramsObject = new Url.URLParams('escape=hello\\bworld');
        expect(paramsObject.get("escape")?.toString()).assertEqual("hello\\bworld");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0100
     * @tc.name       : testUrlParams9Has9Escape0001
     * @tc.desc       : Testing the Url interface Params9Has9 with input escape \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Has9Escape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Has9Escape0001";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\b=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        let result1 = paramsObject.has('\b');
        let result2 = paramsObject.has('fod');
        expect(String(result1)).assertEqual('true');
        expect(String(result2)).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0200
     * @tc.name       : testUrlParams9Has9Escape0002
     * @tc.desc       : Testing the Url interface Params9Has9 with input escape \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Has9Escape0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Has9Escape0002";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\f=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        let result1 = paramsObject.has('\f');
        let result2 = paramsObject.has('fod');
        expect(String(result1)).assertEqual('true');
        expect(String(result2)).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0300
     * @tc.name       : testUrlParams9Has9Escape0003
     * @tc.desc       : Testing the Url interface Params9Has9 with input escape \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Has9Escape0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Has9Escape0003";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\n=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        let result1 = paramsObject.has('');
        let result2 = paramsObject.has('fod');
        expect(String(result1)).assertEqual('true');
        expect(String(result2)).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0400
     * @tc.name       : testUrlParams9Has9Escape0004
     * @tc.desc       : Testing the Url interface Params9Has9 with input escape \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Has9Escape0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Has9Escape0004";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\r=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        let result1 = paramsObject.has('');
        let result2 = paramsObject.has('fod');
        expect(String(result1)).assertEqual('true');
        expect(String(result2)).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0500
     * @tc.name       : testUrlParams9Has9Escape0005
     * @tc.desc       : Testing the Url interface Params9Has9 with input escape \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Has9Escape0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Has9Escape0005";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\t=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        let result1 = paramsObject.has('');
        let result2 = paramsObject.has('fod');
        expect(String(result1)).assertEqual('true');
        expect(String(result2)).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0600
     * @tc.name       : testUrlParams9Has9Escape0006
     * @tc.desc       : Testing the Url interface Params9Has9 with input escape \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Has9Escape0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Has9Escape0006";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\v=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        let result1 = paramsObject.has('\v');
        let result2 = paramsObject.has('fod');
        expect(String(result1)).assertEqual('true');
        expect(String(result2)).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0700
     * @tc.name       : testUrlParams9Has9Escape0007
     * @tc.desc       : Testing the Url interface Params9Has9 with input escape \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Has9Escape0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Has9Escape0007";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\x24=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        let result1 = paramsObject.has('\x24');
        let result2 = paramsObject.has('fod');
        expect(String(result1)).assertEqual('true');
        expect(String(result2)).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0800
     * @tc.name       : testUrlParams9Has9Escape0008
     * @tc.desc       : Testing the Url interface Params9Has9 with input escape \开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Has9Escape0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Has9Escape0008";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\\开=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        let result1 = paramsObject.has('\\开');
        let result2 = paramsObject.has('fod');
        expect(String(result1)).assertEqual('true');
        expect(String(result2)).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0900
     * @tc.name       : testUrlParams9Has9Escape0009
     * @tc.desc       : Testing the Url interface Params9Has9 with input escape \😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Has9Escape0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Has9Escape0009";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\\😊=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        let result1 = paramsObject.has('\\😊');
        let result2 = paramsObject.has('fod');
        expect(result1).assertEqual(true);
        expect(result2).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_1000
     * @tc.name       : testUrlParams9Has9Escape0010
     * @tc.desc       : Testing the Url interface Params9Has9 with input escape \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Has9Escape0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Has9Escape0010";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\\0=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        let result1 = paramsObject.has('\\0');
        let result2 = paramsObject.has('fod');
        expect(String(result1)).assertEqual('true');
        expect(String(result2)).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_1100
     * @tc.name       : testUrlParams9Has9Escape0011
     * @tc.desc       : Testing the Url interface Params9Has9 with input escape \\b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Has9Escape0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Has9Escape0011";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?\\\\b=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        let result1 = paramsObject.has('\\\\b');
        let result2 = paramsObject.has('fod');
        expect(String(result1)).assertEqual('true');
        expect(String(result2)).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0100
     * @tc.name       : testUrlParams9Set9Escape0001
     * @tc.desc       : Testing the Url interface Params9Set9 with input escape \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Set9Escape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Set9Escape0001";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.set('\b', 'backspace');
        expect(paramsObject.get('\b')).assertEqual('backspace');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0200
     * @tc.name       : testUrlParams9Set9Escape0002
     * @tc.desc       : Testing the Url interface Params9Set9 with input escape \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Set9Escape0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Set9Escape0002";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.set('\f', 'pageBreak');
        expect(paramsObject.get('\f')).assertEqual('pageBreak');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0300
     * @tc.name       : testUrlParams9Set9Escape0003
     * @tc.desc       : Testing the Url interface Params9Set9 with input escape \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Set9Escape0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Set9Escape0003";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.set('\n', 'newLine');
        expect(paramsObject.get('\n')).assertEqual('newLine');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0400
     * @tc.name       : testUrlParams9Set9Escape0004
     * @tc.desc       : Testing the Url interface Params9Set9 with input escape \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Set9Escape0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Set9Escape0004";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.set('\r', 'carriageReturn');
        expect(paramsObject.get('\r')).assertEqual('carriageReturn');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0500
     * @tc.name       : testUrlParams9Set9Escape0005
     * @tc.desc       : Testing the Url interface Params9Set9 with input escape \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Set9Escape0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Set9Escape0005";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.set('\t', 'tab');
        expect(paramsObject.get('\t')).assertEqual('tab');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0600
     * @tc.name       : testUrlParams9Set9Escape0006
     * @tc.desc       : Testing the Url interface Params9Set9 with input escape \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Set9Escape0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Set9Escape0006";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.set('\v', 'verticalTab');
        expect(paramsObject.get('\v')).assertEqual('verticalTab');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0700
     * @tc.name       : testUrlParams9Set9Escape0007
     * @tc.desc       : Testing the Url interface Params9Set9 with input escape \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Set9Escape0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Set9Escape0007";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.set('\x24', 'dollar');
        expect(paramsObject.get('\x24')).assertEqual('dollar');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0800
     * @tc.name       : testUrlParams9Set9Escape0008
     * @tc.desc       : Testing the Url interface Params9Set9 with input escape \开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Set9Escape0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Set9Escape0008";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.set('\\开', 'open');
        expect(paramsObject.get('\\开')).assertEqual('open');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0900
     * @tc.name       : testUrlParams9Set9Escape0009
     * @tc.desc       : Testing the Url interface Params9Set9 with input escape \😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Set9Escape0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Set9Escape0009";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.set('\\😊', 'emoji');
        expect(paramsObject.get('\\😊')).assertEqual('emoji');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_1000
     * @tc.name       : testUrlParams9Set9Escape0010
     * @tc.desc       : Testing the Url interface Params9Set9 with input escape \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Set9Escape0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Set9Escape0010";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.set('\\0', 'null');
        expect(paramsObject.get('\\0')).assertEqual('null');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_1100
     * @tc.name       : testUrlParams9Set9Escape0011
     * @tc.desc       : Testing the Url interface Params9Set9 with input escape \\b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParams9Set9Escape0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParams9Set9Escape0011";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let paramsObject = new Url.URLParams(urlObject.search.slice(1));
        paramsObject.set('\\b', '\\b');
        expect(paramsObject.get('\\b')).assertEqual('\\b');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0100
     * @tc.name       : testUrlParams9Keys9Escape0001
     * @tc.desc       : Testing the Url interface Params9Keys9 with input escape \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it('testUrlParams9Keys9Escape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlParams9Keys9Escape0001";
    //   try {
    //     let searchParamsObject= new Url.URLParams("\b=backspace&key1=value1");
    //     let keys = Array.from(searchParamsObject.keys());
    //     expect(keys.toString()).assertEqual("\b,key1");
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // });

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0200
    //  * @tc.name       : testUrlParams9Keys9Escape0002
    //  * @tc.desc       : Testing the Url interface Params9Keys9 with input escape \f (form feed)
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlParams9Keys9Escape0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlParams9Keys9Escape0002";
    //   try {
    //     let searchParamsObject = new Url.URLParams("\f=formFeed&key2=value2");
    //     let keys = Array.from(searchParamsObject.keys());
    //     expect(keys.toString()).assertEqual("\f,key2");
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // });
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0300
    //  * @tc.name       : testUrlParams9Keys9Escape0003
    //  * @tc.desc       : Testing the Url interface Params9Keys9 with input escape \n (newline)
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlParams9Keys9Escape0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlParams9Keys9Escape0003";
    //   try {
    //     let searchParamsObject = new Url.URLParams("\n=newline&key3=value3");
    //     let keys = Array.from(searchParamsObject.keys());
    //     expect(keys.toString()).assertEqual("\n,key3");
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // });
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0400
    //  * @tc.name       : testUrlParams9Keys9Escape0004
    //  * @tc.desc       : Testing the Url interface Params9Keys9 with input escape \r (carriage return)
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlParams9Keys9Escape0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlParams9Keys9Escape0004";
    //   try {
    //     let searchParamsObject = new Url.URLParams("\r=carriageReturn&key4=value4");
    //     let keys = Array.from(searchParamsObject.keys());
    //     expect(keys.toString()).assertEqual("\r,key4");
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // });
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0500
    //  * @tc.name       : testUrlParams9Keys9Escape0005
    //  * @tc.desc       : Testing the Url interface Params9Keys9 with input escape \t (tab)
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlParams9Keys9Escape0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlParams9Keys9Escape0005";
    //   try {
    //     let searchParamsObject = new Url.URLParams("\t=tab&key5=value5");
    //     let keys = Array.from(searchParamsObject.keys());
    //     expect(keys.toString()).assertEqual("\t,key5");
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // });
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0106
    //  * @tc.name       : testUrlParams9Keys9Escape0006
    //  * @tc.desc       : Testing the Url interface Params9Keys9 with input escape \v (vertical tab)
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlParams9Keys9Escape0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlParams9Keys9Escape0006";
    //   try {
    //     let searchParamsObject = new Url.URLParams("\v=verticalTab&key6=value6");
    //     let keys = Array.from(searchParamsObject.keys());
    //     expect(keys.toString()).assertEqual("\v,key6");
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // });
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0700
    //  * @tc.name       : testUrlParams9Keys9Escape0007
    //  * @tc.desc       : Testing the Url interface Params9Keys9 with input escape \x24 (hexadecimal for dollar sign)
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlParams9Keys9Escape0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlParams9Keys9Escape0007";
    //   try {
    //     let searchParamsObject = new Url.URLParams("\x24=dollarSign&key7=value7");
    //     let keys = Array.from(searchParamsObject.keys());
    //     expect(keys.toString()).assertEqual("\x24,key7");
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // });
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0108
    //  * @tc.name       : testUrlParams9Keys9Escape0008
    //  * @tc.desc       : Testing the Url interface Params9Keys9 with input escape \开
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlParams9Keys9Escape0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlParams9Keys9Escape0008";
    //   try {
    //     let searchParamsObject = new Url.URLParams("\开=escapeOpen&key8=value8");
    //     let keys = Array.from(searchParamsObject.keys());
    //     expect(keys.toString()).assertEqual("\开,key8");
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // });
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_0900
    //  * @tc.name       : testUrlParams9Keys9Escape0009
    //  * @tc.desc       : Testing the Url interface Params9Keys9 with input escape \😊 (emoji)
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlParams9Keys9Escape0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlParams9Keys9Escape0009";
    //   try {
    //     let searchParamsObject = new Url.URLParams("\😊=emoji&key9=value9");
    //     let keys = Array.from(searchParamsObject.keys());
    //     expect(keys.toString()).assertEqual("\😊,key9");
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // });
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_1000
    //  * @tc.name       : testUrlParams9Keys9Escape0010
    //  * @tc.desc       : Testing the Url interface Params9Keys9 with input escape \0 (null character)
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlParams9Keys9Escape0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlParams9Keys9Escape0010";
    //   try {
    //     let searchParamsObject = new Url.URLParams("\0=nullChar&key10=value10");
    //     let keys = Array.from(searchParamsObject.keys());
    //     expect(keys.toString()).assertEqual("\0,key10");
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // });
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Url_ESCAPE_1100
    //  * @tc.name       : testUrlParams9Keys9Escape0011
    //  * @tc.desc       : Testing the Url interface Params9Keys9 with input escape \\b (backslash followed by b)
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlParams9Keys9Escape0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlParams9Keys9Escape0011";
    //   try {
    //     let searchParamsObject = new Url.URLParams("\\b=backslashB&key11=value11");
    //     let keys = Array.from(searchParamsObject.keys());
    //     expect(keys.toString()).assertEqual("\\b,key11");
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // });
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_0100
    //  * @tc.name       : testUrlValues9Escape0001
    //  * @tc.desc       : Test the BUILINTS interface Values9 with input escape \b.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlValues9Escape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlValues9Escape0001";
    //   try {
    //     let searchParams = new Url.URLParams("key1=\b&key2=value2");
    //     let values = Array.from(searchParams.values());
    //     expect(values.toString()).assertEqual("\b,value2");
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // })
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_0200
    //  * @tc.name       : testUrlValues9Escape0002
    //  * @tc.desc       : Test the BUILINTS interface Values9 with input escape \f.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlValues9Escape0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlValues9Escape0002";
    //   try {
    //     let searchParams = new Url.URLParams("key1=\f&key2=value2");
    //     let values = Array.from(searchParams.values());
    //     expect(values.toString()).assertEqual("\f,value2");
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // })
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_0300
    //  * @tc.name       : testUrlValues9Escape0003
    //  * @tc.desc       : Test the BUILINTS interface Values9 with input escape \n.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlValues9Escape0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlValues9Escape0003";
    //   try {
    //     let searchParams = new Url.URLParams("key1=\n&key2=value2");
    //     let values = Array.from(searchParams.values());
    //     expect(values.toString()).assertEqual("\n,value2");
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // })
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_0400
    //  * @tc.name       : testUrlValues9Escape0004
    //  * @tc.desc       : Test the BUILINTS interface Values9 with input escape \r.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlValues9Escape0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlValues9Escape0004";
    //   try {
    //     let searchParams = new Url.URLParams("key1=\r&key2=value2");
    //     let values = Array.from(searchParams.values());
    //     expect(values.toString()).assertEqual("\r,value2");
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // })
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_0500
    //  * @tc.name       : testUrlValues9Escape0005
    //  * @tc.desc       : Test the BUILINTS interface Values9 with input escape \t.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlValues9Escape0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlValues9Escape0005";
    //   try {
    //     let searchParams = new Url.URLParams("key1=\t&key2=value2");
    //     let values = Array.from(searchParams.values());
    //     expect(values.toString()).assertEqual("\t,value2");
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // })
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_0600
    //  * @tc.name       : testUrlValues9Escape0006
    //  * @tc.desc       : Test the BUILINTS interface Values9 with input escape \v.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlValues9Escape0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlValues9Escape0006";
    //   try {
    //     let searchParams = new Url.URLParams("key1=\v&key2=value2");
    //     let values = Array.from(searchParams.values());
    //     expect(values.toString()).assertEqual("\v,value2");
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // })
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_0700
    //  * @tc.name       : testUrlValues9Escape0007
    //  * @tc.desc       : Test the BUILINTS interface Values9 with input escape \x24.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlValues9Escape0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlValues9Escape0007";
    //   try {
    //     let searchParams = new Url.URLParams("key1=\x24&key2=value2");
    //     let values = Array.from(searchParams.values());
    //     expect(values.toString()).assertEqual("\x24,value2");
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // })
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_0800
    //  * @tc.name       : testUrlValues9Escape0008
    //  * @tc.desc       : Test the BUILINTS interface Values9 with input escape \开.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlValues9Escape0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlValues9Escape0008";
    //   try {
    //     let searchParams = new Url.URLParams("key1=\开&key2=value2");
    //     let values = Array.from(searchParams.values());
    //     expect(values.toString()).assertEqual("\开,value2");
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // })
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_0900
    //  * @tc.name       : testUrlValues9Escape0009
    //  * @tc.desc       : Test the BUILINTS interface Values9 with input escape \😊.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlValues9Escape0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlValues9Escape0009";
    //   try {
    //     let searchParams = new Url.URLParams("key1=\😊&key2=value2");
    //     let values = Array.from(searchParams.values());
    //     expect(values.toString()).assertEqual("\😊,value2");
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // })
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_1000
    //  * @tc.name       : testUrlValues9Escape0010
    //  * @tc.desc       : Test the BUILINTS interface Values9 with input escape \0.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlValues9Escape0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlValues9Escape0010";
    //   try {
    //     let searchParams = new Url.URLParams("key1=\0&key2=value2");
    //     let values = Array.from(searchParams.values());
    //     expect(values.toString()).assertEqual("\0,value2");
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // })
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_1100
    //  * @tc.name       : testUrlValues9Escape0011
    //  * @tc.desc       : Test the BUILINTS interface Values9 with input escape \\b.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testUrlValues9Escape0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testUrlValues9Escape0011";
    //   try {
    //     let searchParams = new Url.URLParams("key1=\\b&key2=value2");
    //     let values = Array.from(searchParams.values());
    //     expect(values.toString()).assertEqual("\\b,value2");
    //   } catch (err:BusinessError) {
    //     console.error(`${TAG} failed, error: ${err.message}`);
    //     expect(false).assertFail();
    //   }
    // })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_0100
     * @tc.name       : testUrlToString9Escape0001
     * @tc.desc       : Test the BUILINTS interface toString9 with input escape \b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlToString9Escape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlToString9Escape0001";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let params = new Url.URLParams(urlObject.search.slice(1));
        params.append('escape', '\b');
        expect(params.toString()).assertEqual('fod=1&bard=2&escape=%08');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_0200
     * @tc.name       : testUrlToString9Escape0002
     * @tc.desc       : Test the BUILINTS interface toString9 with input escape \f.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlToString9Escape0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlToString9Escape0002";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let params = new Url.URLParams(urlObject.search.slice(1));
        params.append('escape', '\f');
        expect(params.toString()).assertEqual('fod=1&bard=2&escape=%0C');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_0300
     * @tc.name       : testUrlToString9Escape0003
     * @tc.desc       : Test the BUILINTS interface toString9 with input escape \n.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlToString9Escape0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlToString9Escape0003";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let params = new Url.URLParams(urlObject.search.slice(1));
        params.append('escape', '\n');
        expect(params.toString()).assertEqual('fod=1&bard=2&escape=%0A');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_0400
     * @tc.name       : testUrlToString9Escape0004
     * @tc.desc       : Test the BUILINTS interface toString9 with input escape \r.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlToString9Escape0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlToString9Escape0004";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let params = new Url.URLParams(urlObject.search.slice(1));
        params.append('escape', '\r');
        expect(params.toString()).assertEqual('fod=1&bard=2&escape=%0D');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_0500
     * @tc.name       : testUrlToString9Escape0005
     * @tc.desc       : Test the BUILINTS interface toString9 with input escape \t.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlToString9Escape0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlToString9Escape0005";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let params = new Url.URLParams(urlObject.search.slice(1));
        params.append('escape', '\t');
        expect(params.toString()).assertEqual('fod=1&bard=2&escape=%09');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_0600
     * @tc.name       : testUrlToString9Escape0006
     * @tc.desc       : Test the BUILINTS interface toString9 with input escape \v.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlToString9Escape0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlToString9Escape0006";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let params = new Url.URLParams(urlObject.search.slice(1));
        params.append('escape', '\v');
        expect(params.toString()).assertEqual('fod=1&bard=2&escape=%0B');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_0700
     * @tc.name       : testUrlToString9Escape0007
     * @tc.desc       : Test the BUILINTS interface toString9 with input escape \x24.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlToString9Escape0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlToString9Escape0007";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let params = new Url.URLParams(urlObject.search.slice(1));
        params.append('escape', '\x24');
        expect(params.toString()).assertEqual('fod=1&bard=2&escape=%24');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_0800
     * @tc.name       : testUrlToString9Escape0008
     * @tc.desc       : Test the BUILINTS interface toString9 with input escape \开.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlToString9Escape0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlToString9Escape0008";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let params = new Url.URLParams(urlObject.search.slice(1));
        params.append('escape', '\开');
        expect(params.toString()).assertEqual('fod=1&bard=2&escape=%E5%BC%80');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_0900
     * @tc.name       : testUrlToString9Escape0009
     * @tc.desc       : Test the BUILINTS interface toString9 with input escape \😊.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlToString9Escape0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlToString9Escape0009";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let params = new Url.URLParams(urlObject.search.slice(1));
        params.append('escape', '\😊');
        expect(params.toString()).assertEqual('fod=1&bard=2&escape=%F0%9F%98%8A');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_1000
     * @tc.name       : testUrlToString9Escape0010
     * @tc.desc       : Test the BUILINTS interface toString9 with input escape \0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlToString9Escape0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlToString9Escape0010";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let params = new Url.URLParams(urlObject.search.slice(1));
        params.append('escape', '\0');
        expect(params.toString()).assertEqual('fod=1&bard=2&escape=%00');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_ESCAPE_1100
     * @tc.name       : testUrlToString9Escape0011
     * @tc.desc       : Test the BUILINTS interface toString9 with input escape \\b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlToString9Escape0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlToString9Escape0011";
      try {
        let urlObject = Url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
        let params = new Url.URLParams(urlObject.search.slice(1));
        params.append('escape', '\\b');
        expect(params.toString()).assertEqual('fod=1&bard=2&escape=%5Cb');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_0100
     * @tc.name       : testUrlParseUrl9Escape0001
     * @tc.desc       : Testing the Url interface ParseURL with input escape \b (Backspace)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParseUrl9Escape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParseUrl9Escape0001";
      try {
        let urlString1 = '\b/path2';
        let urlString2 = '/\b/path2';
        let url1 = Url.URL.parseURL(urlString1, 'https://www.example.com/test/test1');
        let url2 = Url.URL.parseURL(urlString2, 'https://www.example.com/test/test1');
        let temp1 = '/path2';
        expect(url1.toString()).assertEqual('https://www.example.com/test/' + temp1);
        let temp2 = '%08/path2';
        expect(url2.toString()).assertEqual('https://www.example.com/' + temp2);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_0200
     * @tc.name       : testUrlParseUrl9Escape0002
     * @tc.desc       : Testing the Url interface ParseURL with input escape \b (Backspace)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParseUrl9Escape0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParseUrl9Escape0002";
      try {
        let url3 = Url.URL.parseURL('/\b/path2', '');
        expect(false).assertFail();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("Parameter error. The type of  must be string");
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_0300
     * @tc.name       : testUrlParseUrl9Escape0003
     * @tc.desc       : Testing the Url interface ParseURL with input escape \f (Form Feed)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParseUrl9Escape0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParseUrl9Escape0003";
      try {
        let urlString1 = '\f/path2';
        let urlString2 = '/\f/path2';
        let url1 = Url.URL.parseURL(urlString1, 'https://www.example.com/test/test1');
        let url2 = Url.URL.parseURL(urlString2, 'https://www.example.com/test/test1');
        let rstUrl1 = 'https://www.example.com/test//path2';
        let temp = '%0C/path2';
        let rstUrl2 = 'https://www.example.com/' + temp;
        expect(url1.toString()).assertEqual(rstUrl1);
        expect(url2.toString()).assertEqual(rstUrl2);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_0400
     * @tc.name       : testUrlParseUrl9Escape0004
     * @tc.desc       : Testing the Url interface ParseURL with input escape \f (Form Feed)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParseUrl9Escape0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParseUrl9Escape0004";
      try {
        let url3 = Url.URL.parseURL('/\f/path2', '');
        expect(false).assertFail();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("Parameter error. The type of  must be string");
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_0500
     * @tc.name       : testUrlParseUrl9Escape0005
     * @tc.desc       : Testing the Url interface ParseURL with input escape \n (Newline)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParseUrl9Escape0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParseUrl9Escape0005";
      try {
        let urlString1 = '\n/path2';
        let urlString2 = '/\n/path2';
        let url1 = Url.URL.parseURL(urlString1, 'https://www.example.com/test/test1');
        let url2 = Url.URL.parseURL(urlString2, 'https://www.example.com/test/test1');
        let rstUrl1 = 'https://www.example.com/test//path2';
        let temp = '%0A/path2';
        let rstUrl2 = 'https://www.example.com/' + temp;
        expect(url1.toString()).assertEqual(rstUrl1);
        expect(url2.toString()).assertEqual(rstUrl2);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_0600
     * @tc.name       : testUrlParseUrl9Escape0006
     * @tc.desc       : Testing the Url interface ParseURL with input escape \n (Newline)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParseUrl9Escape0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParseUrl9Escape0006";
      try {
        let url3 = Url.URL.parseURL('/\n/path2', '');
        expect(false).assertFail();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("Parameter error. The type of  must be string");
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_0700
     * @tc.name       : testUrlParseUrl9Escape0007
     * @tc.desc       : Testing the Url interface ParseURL with input escape \r (Carriage Return)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParseUrl9Escape0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParseUrl9Escape0007";
      try {
        let urlString1 = '\r/path2';
        let urlString2 = '/\r/path2';
        let url1 = Url.URL.parseURL(urlString1, 'https://www.example.com/test/test1');
        let url2 = Url.URL.parseURL(urlString2, 'https://www.example.com/test/test1');
        let rstUrl1 = 'https://www.example.com/test//path2';
        let temp = '%0D/path2';
        let rstUrl2 = 'https://www.example.com/' + temp;
        expect(url1.toString()).assertEqual(rstUrl1);
        expect(url2.toString()).assertEqual(rstUrl2);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_0800
     * @tc.name       : testUrlParseUrl9Escape0008
     * @tc.desc       : Testing the Url interface ParseURL with input escape \r (Carriage Return)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParseUrl9Escape0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParseUrl9Escape0008";
      try {
        let url3 = Url.URL.parseURL('/\r/path2', '');
        expect(false).assertFail();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("Parameter error. The type of  must be string");
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_0900
     * @tc.name       : testUrlParseUrl9Escape0009
     * @tc.desc       : Testing the Url interface ParseURL with input escape \t (Tab)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParseUrl9Escape0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParseUrl9Escape0009";
      try {
        let urlString1 = '\t/path2';
        let urlString2 = '/\t/path2';
        let url1 = Url.URL.parseURL(urlString1, 'https://www.example.com/test/test1');
        let url2 = Url.URL.parseURL(urlString2, 'https://www.example.com/test/test1');
        let temp = '%09/path2';
        let rstUrl1 = 'https://www.example.com/test//path2';
        let rstUrl2 = 'https://www.example.com/' + temp;
        expect(url1.toString()).assertEqual(rstUrl1);
        expect(url2.toString()).assertEqual(rstUrl2);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_1000
     * @tc.name       : testUrlParseUrl9Escape0010
     * @tc.desc       : Testing the Url interface ParseURL with input escape \t (Tab)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParseUrl9Escape0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParseUrl9Escape0010";
      try {
        let url3 = Url.URL.parseURL('/\t/path2', '');
        expect(false).assertFail();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("Parameter error. The type of  must be string");
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_1100
     * @tc.name       : testUrlParseUrl9Escape0011
     * @tc.desc       : Testing the Url interface ParseURL with input escape \v (Vertical Tab)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParseUrl9Escape0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParseUrl9Escape0011";
      try {
        let urlString1 = '\v/path2';
        let urlString2 = '/\v/path2';
        let url1 = Url.URL.parseURL(urlString1, 'https://www.example.com/test/test1');
        let url2 = Url.URL.parseURL(urlString2, 'https://www.example.com/test/test1');
        let temp1 = '/path2';
        expect(url1.toString()).assertEqual('https://www.example.com/test/' + temp1);
        let temp2 = '%0B/path2';
        expect(url2.toString()).assertEqual('https://www.example.com/' + temp2);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_1200
     * @tc.name       : testUrlParseUrl9Escape0012
     * @tc.desc       : Testing the Url interface ParseURL with input escape \v (Vertical Tab)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParseUrl9Escape0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParseUrl9Escape0012";
      try {
        let url3 = Url.URL.parseURL('/\v/path2', '');
        expect(false).assertFail();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("Parameter error. The type of  must be string");
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_1300
     * @tc.name       : testUrlParseUrl9Escape0013
     * @tc.desc       : Testing the Url interface ParseURL with input escape \x24 (Hexadecimal $)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParseUrl9Escape0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParseUrl9Escape0013";
      try {
        let urlString1 = '\x24/path2';
        let urlString2 = '/\x24/path2';
        let url1 = Url.URL.parseURL(urlString1, 'https://www.example.com/test/test1');
        let url2 = Url.URL.parseURL(urlString2, 'https://www.example.com/test/test1');
        let temp = '$/path2';
        let rstUrl1 = 'https://www.example.com/test/' + temp;
        let rstUrl2 = 'https://www.example.com/' + temp;
        expect(url1.toString()).assertEqual(rstUrl1);
        expect(url2.toString()).assertEqual(rstUrl2);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_1400
     * @tc.name       : testUrlParseUrl9Escape0014
     * @tc.desc       : Testing the Url interface ParseURL with input escape \x24 (Hexadecimal $)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParseUrl9Escape0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParseUrl9Escape0014";
      try {
        let url3 = Url.URL.parseURL('/\x24/path2', '');
        expect(false).assertFail();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("Parameter error. The type of  must be string");
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_1500
     * @tc.name       : testUrlParseUrl9Escape0015
     * @tc.desc       : Testing the Url interface ParseURL with input escape \开 (Chinese character '开')
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParseUrl9Escape0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParseUrl9Escape0015";
      try {
        let urlString1 = '\开/path2';
        let urlString2 = '/\开/path2';
        let url1 = Url.URL.parseURL(urlString1, 'https://www.example.com/test/test1');
        let url2 = Url.URL.parseURL(urlString2, 'https://www.example.com/test/test1');
        let temp = '%E5%BC%80/path2';
        let rstUrl1 = 'https://www.example.com/test/' + temp;
        let rstUrl2 = 'https://www.example.com/' + temp;
        expect(url1.toString()).assertEqual(rstUrl1);
        expect(url2.toString()).assertEqual(rstUrl2);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_1600
     * @tc.name       : testUrlParseUrl9Escape0016
     * @tc.desc       : Testing the Url interface ParseURL with input escape \开 (Chinese character '开')
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParseUrl9Escape0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParseUrl9Escape0016";
      try {
        let url3 = Url.URL.parseURL('/\开/path2', '');
        expect(false).assertFail();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("Parameter error. The type of  must be string");
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_1700
     * @tc.name       : testUrlParseUrl9Escape0017
     * @tc.desc       : Testing the Url interface ParseURL with input escape \😊 (Emoji)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParseUrl9Escape0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParseUrl9Escape0017";
      try {
        let urlString1 = '\😊/path2';
        let urlString2 = '/\😊/path2';
        let url1 = Url.URL.parseURL(urlString1, 'https://www.example.com/test/test1');
        let url2 = Url.URL.parseURL(urlString2, 'https://www.example.com/test/test1');
        let temp = '%F0%9F%98%8A/path2';
        let rstUrl1 = 'https://www.example.com/test/' + temp;
        let rstUrl2 = 'https://www.example.com/' + temp;
        expect(url1.toString()).assertEqual(rstUrl1);
        expect(url2.toString()).assertEqual(rstUrl2);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_1800
     * @tc.name       : testUrlParseUrl9Escape0018
     * @tc.desc       : Testing the Url interface ParseURL with input escape \😊 (Emoji)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParseUrl9Escape0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParseUrl9Escape0018";
      try {
        let url3 = Url.URL.parseURL('/\😊/path2', '');
        expect(false).assertFail();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("Parameter error. The type of  must be string");
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_1900
     * @tc.name       : testUrlParseUrl9Escape0019
     * @tc.desc       : Testing the Url interface ParseURL with input escape \0 (Null character)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParseUrl9Escape0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParseUrl9Escape0019";
      try {
        let urlString1 = '\0/path2';
        let urlString2 = '/\0/path2';
        let url1 = Url.URL.parseURL(urlString1, 'https://www.example.com/test/test1');
        let url2 = Url.URL.parseURL(urlString2, 'https://www.example.com/test/test1');
        let rstUrl1 = 'https://www.example.com/test//path2';
        let temp = '%00/path2';
        let rstUrl2 = 'https://www.example.com/' + temp;
        expect(url1.toString()).assertEqual(rstUrl1);
        expect(url2.toString()).assertEqual(rstUrl2);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_2000
     * @tc.name       : testUrlParseUrl9Escape0020
     * @tc.desc       : Testing the Url interface ParseURL with input escape \0 (Null character)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParseUrl9Escape0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParseUrl9Escape0020";
      try {
        let url3 = Url.URL.parseURL('/\0/path2', '');
        expect(false).assertFail();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("Parameter error. The type of  must be string");
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_2100
     * @tc.name       : testUrlParseUrl9Escape0021
     * @tc.desc       : Testing the Url interface ParseURL with input escape \\b (Backslash b)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParseUrl9Escape0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParseUrl9Escape0021";
      try {
        let urlString1 = '\\b/path2';
        let urlString2 = '/\\b/path2';
        let url1 = Url.URL.parseURL(urlString1, 'https://www.example.com/test/test1');
        let url2 = Url.URL.parseURL(urlString2, 'https://www.example.com/test/test1');
        let temp1 = '%5Cb/path2';
        let rstUrl1 = 'https://www.example.com/test/' + temp1;
        let rstUrl2 = 'https://b/path2';
        expect(url1.toString()).assertEqual(rstUrl1);
        expect(url2.toString()).assertEqual(rstUrl2);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_2200
     * @tc.name       : testUrlParseUrl9Escape0022
     * @tc.desc       : Testing the Url interface ParseURL with input escape \\b (Backslash b)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlParseUrl9Escape0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlParseUrl9Escape0022";
      try {
        let url3 = Url.URL.parseURL('/\\b/path2', '');
        expect(false).assertFail();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("Parameter error. The type of  must be string");
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_0100
     * @tc.name       : testUrlToStringEscape0001
     * @tc.desc       : Testing the Url interface ToString with input escape \b (Backspace)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlToStringEscape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlToStringEscape0001";
      try {
        const urlObject = Url.URL.parseURL('https://username:password@host:8080/directory/\b');
        let result = urlObject.toString();
        expect(result).assertEqual('https://username:password@host:8080/directory/');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_0200
     * @tc.name       : testUrlToStringEscape0002
     * @tc.desc       : Testing the Url interface ToString with input escape \f (Form Feed)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlToStringEscape0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlToStringEscape0002";
      try {
        const urlObject = Url.URL.parseURL('https://username:password@host:8080/directory/\f');
        let result = urlObject.toString();
        expect(result).assertEqual('https://username:password@host:8080/directory/');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_0300
     * @tc.name       : testUrlToStringEscape0003
     * @tc.desc       : Testing the Url interface ToString with input escape \n (New Line)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlToStringEscape0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlToStringEscape0003";
      try {
        const urlObject = Url.URL.parseURL('https://username:password@host:8080/directory/\n');
        let result = urlObject.toString();
        expect(result).assertEqual('https://username:password@host:8080/directory/');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_0400
     * @tc.name       : testUrlToStringEscape0004
     * @tc.desc       : Testing the Url interface ToString with input escape \r (Carriage Return)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlToStringEscape0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlToStringEscape0004";
      try {
        const urlObject = Url.URL.parseURL('https://username:password@host:8080/directory/\r');
        let result = urlObject.toString();
        expect(result).assertEqual('https://username:password@host:8080/directory/');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_0500
     * @tc.name       : testUrlToStringEscape0005
     * @tc.desc       : Testing the Url interface ToString with input escape \t (Horizontal Tab)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlToStringEscape0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlToStringEscape0005";
      try {
        const urlObject = Url.URL.parseURL('https://username:password@host:8080/directory/\t');
        let result = urlObject.toString();
        expect(result).assertEqual('https://username:password@host:8080/directory/');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_0600
     * @tc.name       : testUrlToStringEscape0006
     * @tc.desc       : Testing the Url interface ToString with input escape \v (Vertical Tab)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlToStringEscape0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlToStringEscape0006";
      try {
        const urlObject = Url.URL.parseURL('https://username:password@host:8080/directory/\v');
        let result = urlObject.toString();
        expect(result).assertEqual('https://username:password@host:8080/directory/');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_0700
     * @tc.name       : testUrlToStringEscape0007
     * @tc.desc       : Testing the Url interface ToString with input escape \x24 (Hexadecimal number)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlToStringEscape0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlToStringEscape0007";
      try {
        const urlObject = Url.URL.parseURL('https://username:password@host:8080/directory/\x24');
        let result = urlObject.toString();
        expect(result).assertEqual('https://username:password@host:8080/directory/$');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_0800
     * @tc.name       : testUrlToStringEscape0008
     * @tc.desc       : Testing the Url interface ToString with input escape \开 (Chinese Character)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlToStringEscape0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlToStringEscape0008";
      try {
        const urlObject = Url.URL.parseURL('https://username:password@host:8080/directory/\开');
        let result = urlObject.toString();
        expect(result).assertEqual('https://username:password@host:8080/directory/%E5%BC%80');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_0900
     * @tc.name       : testUrlToStringEscape0009
     * @tc.desc       : Testing the Url interface ToString with input emoji \😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlToStringEscape0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlToStringEscape0009";
      try {
        const urlObject = Url.URL.parseURL('https://username:password@host:8080/directory/\😊');
        let result = urlObject.toString();
        expect(result).assertEqual('https://username:password@host:8080/directory/%F0%9F%98%8A');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_1000
     * @tc.name       : testUrlToStringEscape0010
     * @tc.desc       : Testing the Url interface ToString with input escape \0 (Null character)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlToStringEscape0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlToStringEscape0010";
      try {
        const urlObject = Url.URL.parseURL('https://username:password@host:8080/directory/\0');
        let result = urlObject.toString();
        expect(result).assertEqual('https://username:password@host:8080/directory/');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URL_ESCAPE_1100
     * @tc.name       : testUrlToStringEscape0011
     * @tc.desc       : Testing the Url interface ToString with input escape \\b (Backslash + b)
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUrlToStringEscape0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testUrlToStringEscape0011";
      try {
        const urlObject = Url.URL.parseURL('https://username:password@host:8080/directory/\\b');
        let result = urlObject.toString();
        expect(result).assertEqual('https://username:password@host:8080/directory//b');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(false).assertFail();
      }
    });
  })
}