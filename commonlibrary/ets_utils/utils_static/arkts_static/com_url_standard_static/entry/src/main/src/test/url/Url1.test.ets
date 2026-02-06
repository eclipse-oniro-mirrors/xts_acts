/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import Url from '@ohos.url';
import { BusinessError } from '@ohos.base';
import Utils from '../Util.test';

let str2 =
  '%21%21%22%22%23%23%24%24%25%25%27%27%28%28%29%29**%2B%2B%2C%2C--..%2F%2F%3A%3A%3B%3B%3C%3C%3D%3D%3E%3E%3F%3F%40%40%5B%5B%5C%5C%5D%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%7D%7E%7E';
let str2Decode = '!!""##$$%%\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
let str3 =
  '%21%21%22%22%23%23%24%24%25%25%26%26%27%27%28%28**%2B%2B%2C%2C--..%2F%2F%3A%3A%3B%3B%3C%3C%3D%3D%3E%3E%3F%3F%40%40%5B%5B%5C%5C%5D%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%7D%7E%7E';
let str3Decode = '!!""##$$%%&&\'\'((**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
type EntryArrayElement = [string, string, boolean];

interface KeyValue {
  key: string;
  expectedValue: string | undefined;
}
interface KeyTestCase {
  key: string;
  expectedResult: boolean;
}

export default function urlTest1() {
  describe('urlTest1', (): void => {
    afterEach(() => {
      await Utils.msSleep(20);
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSENTRIES_0100
     * @tc.name       : testParamsEntries0001
     * @tc.desc       : Testing URLParams.entries() to validate it correctly parses and returns key-value pairs.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParamsEntries0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testParamsEntries0001";
      try {
        const params = new Url.URLParams("key1=value1&key2=value2");
        let entries = new Array<string>();
        for (const pair of params.entries()) {
          entries.push(pair[0], pair[1]);
        }
        expect(entries[1]).assertEqual("value1");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSENTRIES_0200
     * @tc.name       : testParamsEntries0002
     * @tc.desc       : Testing URLParams.entries() with empty string to validate it handles absence of
     *                  key-value pairs correctly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParamsEntries0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testParamsEntries0002";
      try {
        const params = new Url.URLParams("");
        let entries = new Array<string>();
        for (const pair of params.entries()) {
          entries.push(pair[0], pair[1]);
        }
        expect(String(entries.length)).assertEqual('0');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSENTRIES_0300
     * @tc.name       : testParamsEntries0003
     * @tc.desc       : Testing URLParams.entries() to validate it correctly parses and returns key-value
     *                  pairs from a nested array.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParamsEntries0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testParamsEntries0003";
      try {
        const params = new Url.URLParams([["key1", "value1"], ["key2", "value2"]]);
        let entries = new Array<string>();
        for (const pair of params.entries()) {
          entries.push(pair[0], pair[1]);
        }
        expect(entries[1]).assertEqual("value1");
        expect(entries[3]).assertEqual("value2");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSENTRIES_0400
     * @tc.name       : testParamsEntries0004
     * @tc.desc       : Testing URLParams.entries() with an empty nested array to validate it handles absence
     *                  of key-value pairs correctly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParamsEntries0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testParamsEntries0004";
      try {
        const params = new Url.URLParams([]);
        let entries = new Array<string>();
        for (const pair of params.entries()) {
          entries.push(pair[0], pair[1]);
        }
        expect(String(entries.length)).assertEqual('0');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSENTRIES_0500
     * @tc.name       : testParamsEntries0005
     * @tc.desc       : Testing URLParams.entries() to validate it correctly parses and returns key-value pairs
     *                  from an object.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParamsEntries0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testParamsEntries0005";
      try {
        const params = new Url.URLParams([["key1", "value1"], ["key2", "value2"]]);
        let entries = new Array<string>();
        for (const pair of params.entries()) {
          entries.push(pair[0], pair[1]);
        }
        expect(entries[1]).assertEqual("value1");
        expect(entries[3]).assertEqual("value2");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSENTRIES_0600
     * @tc.name       : testParamsEntries0006
     * @tc.desc       : Testing URLParams.entries() with an empty object to validate it handles absence of
     *                  key-value pairs correctly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParamsEntries0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testParamsEntries0006";
      try {
        const params = new Url.URLParams([]);
        let entries = new Array<string>();
        for (const pair of params.entries()) {
          entries.push(pair[0], pair[1]);
        }
        expect(String(entries.length)).assertEqual('0');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSENTRIES_0700
     * @tc.name       : testParamsEntries0007
     * @tc.desc       : Testing URLParams.entries() to validate it correctly parses and returns key-value pairs
     *                  from URL search parameters and toString() produces correct query string.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParamsEntries0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testParamsEntries0007";
      try {
        const url = new Url.URL();
        url.href = 'http://username:password@host:8080/directory/file?foo=1&bar=2';
        const params = new Url.URLParams(url.search);
        const result = params.toString();
        expect(result).assertEqual('foo=1&bar=2');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSENTRIES_0800
     * @tc.name       : testParamsEntries0008
     * @tc.desc       : Testing URLParams.entries() with URL having no search parameters to validate it handles
     *                   absence of key-value pairs correctly and toString() is an empty string.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParamsEntries0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testParamsEntries0008";
      try {
        const url = new Url.URL();
        url.href = 'http://username:password@host:8080/directory/file';
        const params = new Url.URLParams(url.search);
        const result = params.toString();
        expect(result).assertEqual('');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSENTRIES_0900
     * @tc.name       : testParamsEntries0009
     * @tc.desc       : Testing URLParams.entries() to validate it correctly parses and returns key-value pairs
     *                  from URL params and toString() produces correct query string.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParamsEntries0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testParamsEntries0009";
      try {
        const url = new Url.URL();
        url.href = 'http://username:password@host:8080/directory/file?foo=1&bar=2';
        const params = new Url.URLParams(url.search);
        const result = params.toString();
        expect(result).assertEqual('foo=1&bar=2');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSENTRIES_1000
     * @tc.name       : testParamsEntries0010
     * @tc.desc       : Testing URLParams.entries() with URL having no search parameters to validate it handles
     *                  absence of key-value pairs correctly and toString() is an empty string.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParamsEntries0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testParamsEntries0010";
      try {
        const url = new Url.URL();
        url.href = 'http://username:password@host:8080/directory/file';
        const params = new Url.URLParams(url.search);
        const result = params.toString();
        expect(result).assertEqual('');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSENTRIESAPPEND_0100
     * @tc.name       : testParamsEntriesAppend0001
     * @tc.desc       : Testing URLParams.append() to validate it correctly adds new key-value pairs.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParamsEntriesAppend0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testParamsEntriesAppend0001";
      try {
        const params = new Url.URLParams("key1=value1&key2=value2");
        params.append("ma 大", "jk￥");
        let paramsResult = params.toString();
        expect(paramsResult).assertEqual("key1=value1&key2=value2&ma+%E5%A4%A7=jk%EF%BF%A5");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSENTRIESAPPEND_0200
     * @tc.name       : testParamsEntriesAppend0002
     * @tc.desc       : Testing URLParams.append() to validate it correctly handles adding a key with an empty
     *                  string to an existing URLParams object.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParamsEntriesAppend0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testParamsEntriesAppend0002";
      try {
        const params = new Url.URLParams("key1=value1&key2=value2");
        params.append("", "jk￥");
        let paramsResult = params.toString();
        expect(paramsResult).assertEqual("key1=value1&key2=value2&=jk%EF%BF%A5");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSENTRIESAPPEND_0300
     * @tc.name       : testParamsEntriesAppend0003
     * @tc.desc       : Testing URLParams.append() to validate it correctly adds new key-value pairs.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParamsEntriesAppend0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testParamsEntriesAppend0003";
      try {
        const params = new Url.URLParams("key1=value1&key2=value2");
        params.append("ma 大", "jk￥");
        params.append("ma 大", "jk￥");
        params.append("ma 大", "ma 大");
        params.append("key2", "jk￥");
        let paramsResult = params.toString();
        expect(paramsResult).assertEqual("key1=value1&key2=value2&ma+%E5%A4%A7=jk%EF%BF%A5&" +
          "ma+%E5%A4%A7=jk%EF%BF%A5&ma+%E5%A4%A7=ma+%E5%A4%A7&key2=jk%EF%BF%A5");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSENTRIESAPPEND_0400
     * @tc.name       : testParamsEntriesAppend0004
     * @tc.desc       : Testing URLParams.append() to validate adding a key with the same name and different values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParamsEntriesAppend0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testParamsEntriesAppend0004";
      try {
        const params = new Url.URLParams("key1=value1&key2=value2");
        params.append("key3", "jk￥");
        let paramsResult = params.toString();
        expect(paramsResult).assertEqual("key1=value1&key2=value2&key3=jk%EF%BF%A5");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSENTRIESAPPEND_0500
     * @tc.name       : testParamsEntriesAppend0005
     * @tc.desc       : Testing URLParams.append() to validate adding multiple keys with the same name.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParamsEntriesAppend0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testParamsEntriesAppend0005";
      try {
        const params = new Url.URLParams("key1=value1&key2=value2");
        params.append("ma 大", "");
        let paramsResult = params.toString();
        expect(paramsResult).assertEqual("key1=value1&key2=value2&ma+%E5%A4%A7=");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSENTRIESAPPEND_0600
     * @tc.name       : testParamsEntriesAppend0006
     * @tc.desc       : Testing URLParams.append() to validate key-value pairs with special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParamsEntriesAppend0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testParamsEntriesAppend0006";
      try {
        const params = new Url.URLParams("key1=value1&key2=value2");
        params.append("ma 大", "jk￥");
        params.append("ma 大", "jk￥");
        params.append("jk￥", "jk￥");
        params.append("ma 大", "value2");
        let paramsResult = params.toString();
        expect(paramsResult).assertEqual("key1=value1&key2=value2&ma+%E5%A4%A7=jk%EF%BF%A5&" +
          "ma+%E5%A4%A7=jk%EF%BF%A5&jk%EF%BF%A5=jk%EF%BF%A5&ma+%E5%A4%A7=value2");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSDELETE_0100
     * @tc.name       : testParamsDelete0001
     * @tc.desc       : Testing URLParams.delete() to validate it correctly deletes key-value pairs.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParamsDelete0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testParamsDelete0001";
      try {
        const params = new Url.URLParams("key1=value1&key2=value2");
        params.delete("key2");
        let paramsResult1 = params.toString();
        expect(paramsResult1).assertEqual("key1=value1");
        params.append("ma 大", "jk￥");
        let paramsResult2 = params.toString();
        expect(paramsResult2).assertEqual("key1=value1&ma+%E5%A4%A7=jk%EF%BF%A5");
        params.delete("ma 大");
        params.append("key2", "value2");
        let paramsResult3 = params.toString();
        expect(paramsResult3).assertEqual("key1=value1&key2=value2");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSDELETE_0200
     * @tc.name       : testParamsDelete0002
     * @tc.desc       : Testing URLParams.delete() to validate it correctly handles deleting non-existent keys.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParamsDelete0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testParamsDelete0002";
      try {
        const params = new Url.URLParams("key1=value1&key2=value2");
        params.delete("nonExistentKey");
        let paramsResult = params.toString();
        expect(paramsResult).assertEqual("key1=value1&key2=value2");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSDELETE_0300
     * @tc.name       : testParamsDelete0003
     * @tc.desc       : Testing URLParams.delete() to validate it handles deleting keys with special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParamsDelete0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testParamsDelete0003";
      try {
        const params = new Url.URLParams("key1=value1&key2=value2");
        params.append(str2Decode, str3Decode);
        let paramsResult1 = params.toString();
        expect(paramsResult1).assertEqual(`key1=value1&key2=value2&${str2}=${str3}`);
        params.delete(str2Decode);
        let paramsResult2 = params.toString();
        expect(paramsResult2).assertEqual("key1=value1&key2=value2");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSDELETE_0400
     * @tc.name       : testParamsDelete0004
     * @tc.desc       : Testing URLParams.delete() to validate it correctly deletes all instances of a key.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParamsDelete0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testParamsDelete0004";
      try {
        const params = new Url.URLParams("key1=value1&key2=value2&key1=newValue1&key1=anotherValue1");
        params.delete("key1");
        let paramsResult = params.toString();
        expect(paramsResult).assertEqual("key2=value2");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSDELETE_0500
     * @tc.name       : testParamsDelete0005
     * @tc.desc       : Testing URLParams.delete() to validate it correctly updates the URLParams object after deletion.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParamsDelete0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testParamsDelete0005";
      try {
        const params = new Url.URLParams("key1=value1&key2=value2&ma+%E5%A4%A7=jk%EF%BF%A5");
        params.delete("ma 大");
        let paramsResult = params.toString();
        expect(paramsResult).assertEqual("key1=value1&key2=value2");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSDELETE_0600
     * @tc.name       : testParamsDelete0006
     * @tc.desc       : Testing URLParams.delete() to validate it correctly handles empty URLParams.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testParamsDelete0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testParamsDelete0006";
      try {
        const params = new Url.URLParams("");
        params.delete("key1");
        let paramsResult = params.toString();
        expect(paramsResult).assertEqual("");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSPARSEANDITERATE_0100
    //  * @tc.name       : testParseAndIterateParams0001
    //  * @tc.desc       : Testing URLParams parsing and iteration with an empty string to ensure correct
    //  *                  handling of empty parameters.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testParseAndIterateParams0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testParseAndIterateParams0001";
    //   try {
    //     let searchParamsObject = new Url.URLParams("");
    //     // let newArrayValue: Array<[String, String]> = Array.from<[string, string]>(searchParamsObject.entries());//TypeError: No matching call signature for from(EntryIterator) [Url.test.ets:543:54]
    //     let newArrayValue: [string, string][] = Array.from(searchParamsObject.entries());
    //     expect(newArrayValue.toString()).assertEqual('');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSPARSEANDITERATE_0200
    //  * @tc.name       : testParseAndIterateParams0002
    //  * @tc.desc       : Testing URLParams parsing and iteration for multiple identical sets of parameters to
    //  *                  ensure correct parsing and retrieval of all values.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testParseAndIterateParams0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testParseAndIterateParams0002";
    //   try {
    //     let searchParamsObject = new Url.URLParams("a=1&cc=2&ac=3&b=4&a=1&cc=2&ac=3&b=4&a=1&cc=2&ac=3&b=4");
    //     let newArrayValue: [string, string][] = Array.from(searchParamsObject.entries());
    //     expect(newArrayValue.toString()).assertEqual('a,1,cc,2,ac,3,b,4,a,1,cc,2,ac,3,b,4,a,1,cc,2,ac,3,b,4');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSPARSEANDITERATE_0300
    //  * @tc.name       : testParseAndIterateParams0003
    //  * @tc.desc       : Testing URLParams parsing and iteration to ensure values are correctly appended and retrieved.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testParseAndIterateParams0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testParseAndIterateParams0003";
    //   try {
    //     let searchParamsObject = new Url.URLParams("a=1&cc=2&ac=3&b=4");
    //     searchParamsObject.append("d", "5");
    //     expect(searchParamsObject.get("d")).assertEqual("5");
    //     let newArrayValue: [string, string][] = Array.from(searchParamsObject.entries());
    //     let expectedPairs: [string, string][] = [
    //       ['a', '1'], ['cc', '2'], ['ac', '3'], ['b', '4'],
    //       ['d', '5']
    //     ];
    //     expect(String(newArrayValue.length)).assertEqual(String(expectedPairs.length));
    //     for (let i = 0; i < newArrayValue.length; i++) {
    //       expect(String(newArrayValue[i][0])).assertEqual(String(expectedPairs[i][0]));
    //       expect(String(newArrayValue[i][1])).assertEqual(String(expectedPairs[i][1]));
    //     }
    //     expect(newArrayValue.toString()).assertEqual('a,1,cc,2,ac,3,b,4,d,5');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSPARSEANDFOREACH_0100
    //  * @tc.name       : testParseAndForeachParams0001
    //  * @tc.desc       : Testing URLParams parsing and iteration with an empty string to ensure correct
    //  *                  handling of empty parameters.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testParseAndForeachParams0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testParseAndForeachParams0001";
    //   try {
    //     const myURLObject = Url.URL.parseURL('https://developer.exampleUrl/?');
    //     let entriesArray: Array<EntryArrayElement> = new Array<EntryArrayElement>();
    //     myURLObject.params.forEach((value: string, name: string, searchParams) => {
    //       entriesArray.push([name, value, myURLObject.params === searchParams]);
    //     });
    //     expect(String(entriesArray.length)).assertEqual('0');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSPARSEANDFOREACH_0200
    //  * @tc.name       : testParseAndForeachParams0002
    //  * @tc.desc       : Testing URLParams parsing and iteration for multiple identical sets of parameters to
    //  *                  ensure correct parsing and retrieval of all values.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testParseAndForeachParams0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testParseAndForeachParams0002";
    //   try {
    //     const myURLObject =
    //       Url.URL.parseURL('https://developer.exampleUrl/?a=1&cc=2&ac=3&b=4&a=1&cc=2&ac=3&b=4&a=1&cc=2&ac=3&b=4');
    //     let entriesArray: EntryArrayElement[] = [];
    //     myURLObject.params.forEach((value: string, name: string, searchParams) => {
    //       entriesArray.push([name, value, myURLObject.params === searchParams]);
    //     });
    //     let expectedArray: EntryArrayElement[] = [
    //       ['a', '1', true], ['cc', '2', true], ['ac', '3', true], ['b', '4', true],
    //       ['a', '1', true], ['cc', '2', true], ['ac', '3', true], ['b', '4', true],
    //       ['a', '1', true], ['cc', '2', true], ['ac', '3', true], ['b', '4', true]
    //     ];
    //     expect(entriesArray.toString()).assertEqual(expectedArray.toString());
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSPARSEANDFOREACH_0300
    //  * @tc.name       : testParseAndForeachParams0003
    //  * @tc.desc       : Testing URLParams parsing and iteration to ensure values are correctly appended and retrieved.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testParseAndForeachParams0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testParseAndForeachParams0003";
    //   try {
    //     const myURLObject = Url.URL.parseURL('https://developer.exampleUrl/?a=1&cc=2&ac=3&b=4');
    //     myURLObject.params.append("d", "5");
    //     expect(myURLObject.params.get("d")).assertEqual("5");
    //     let entriesArray: EntryArrayElement[] = [];
    //     myURLObject.params.forEach((value: string, name: string, searchParams) => {
    //       entriesArray.push([name, value, myURLObject.params === searchParams]);
    //     });
    //     let expectedArray: EntryArrayElement[] = [
    //       ['a', '1', true], ['cc', '2', true], ['ac', '3', true], ['b', '4', true], ['d', '5', true]
    //     ];
    //     expect(entriesArray.toString()).assertEqual(expectedArray.toString());
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSPARSEANDITERATESYMBOL_0100
    //  * @tc.name       : testParseAndIterateParamsSymbol0001
    //  * @tc.desc       : Testing URLParams [Symbol.iterator]() method with an empty string to ensure correct
    //  *                  handling of empty parameters.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testParseAndIterateParamsSymbol0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testParseAndIterateParamsSymbol0001";
    //   try {
    //     const paramsObject = new Url.URLParams('');
    //     let pairs = new Array<[string, string]>();
    //     for (const entry of paramsObject) {
    //       pairs.push(entry);
    //     }
    //     expect(String(pairs.length)).assertEqual('0');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSPARSEANDITERATESYMBOL_0200
    //  * @tc.name       : testParseAndIterateParamsSymbol0002
    //  * @tc.desc       : Testing URLParams [Symbol.iterator]() method to ensure it handles multiple identical
    //  *                  sets of parameters correctly.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testParseAndIterateParamsSymbol0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testParseAndIterateParamsSymbol0002";
    //   try {
    //     const paramsObject = new Url.URLParams('a=1&cc=2&ac=3&b=4&a=1&cc=2&ac=3&b=4&a=1&cc=2&ac=3&b=4');
    //     let iter: Iterable<Object[]> = paramsObject[Symbol.iterator]();
    //     let pairs = Array.from(iter);
    //     let expectedPairs: [string, string][] = [
    //       ['a', '1'], ['cc', '2'], ['ac', '3'], ['b', '4'],
    //       ['a', '1'], ['cc', '2'], ['ac', '3'], ['b', '4'],
    //       ['a', '1'], ['cc', '2'], ['ac', '3'], ['b', '4']
    //     ];
    //     expect(String(pairs.length)).assertEqual(String(expectedPairs.length));
    //     for (let i = 0; i < pairs.length; i++) {
    //       expect(String(pairs[i][0])).assertEqual(String(expectedPairs[i][0]));
    //       expect(String(pairs[i][1])).assertEqual(String(expectedPairs[i][1]));
    //     }
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PARAMSPARSEANDITERATESYMBOL_0300
    //  * @tc.name       : testParseAndIterateParamsSymbol0003
    //  * @tc.desc       : Testing URLParams [Symbol.iterator]() method to ensure values are correctly appended
    //  *                  and retrieved.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testParseAndIterateParamsSymbol0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testParseAndIterateParamsSymbol0003";
    //   try {
    //     const paramsObject = new Url.URLParams('a=1&cc=2&ac=3&b=4');
    //     paramsObject.append("d", "5");
    //     let iter: Iterable<Object[]> = paramsObject[Symbol.iterator]();
    //     let pairs = Array.from(iter);
    //     let expectedPairs: [string, string][] = [
    //       ['a', '1'], ['cc', '2'], ['ac', '3'], ['b', '4'], ['d', '5']
    //     ];
    //     expect(String(pairs.length)).assertEqual(String(expectedPairs.length));
    //     for (let i = 0; i < pairs.length; i++) {
    //       expect(String(pairs[i][0])).assertEqual(String(expectedPairs[i][0]));
    //       expect(String(pairs[i][1])).assertEqual(String(expectedPairs[i][1]));
    //     }
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETALLVALUESFORKEY_0100
     * @tc.name       : testGetAllValuesForKey0001
     * @tc.desc       : Testing URLParams getAll() method for key "" to ensure all values are correctly retrieved.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetAllValuesForKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetAllValuesForKey0001";
      try {
        let searchParamsObject = new Url.URLParams("=1&=2&b=3&b=4&c=5");
        let valuesForKeyA = searchParamsObject.getAll("");
        let expectedValuesForKeyA = ["1", "2"];
        expect(String(valuesForKeyA.length)).assertEqual(String(expectedValuesForKeyA.length));
        for (let i = 0; i < valuesForKeyA.length; i++) {
          expect(String(valuesForKeyA[i])).assertEqual(String(expectedValuesForKeyA[i]));
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETALLVALUESFORKEY_0200
     * @tc.name       : testGetAllValuesForKey0002
     * @tc.desc       : Testing URLParams getAll() method for key "b" to ensure all values are correctly retrieved.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetAllValuesForKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetAllValuesForKey0002";
      try {
        let searchParamsObject = new Url.URLParams("b=1&b=2&b=3&b=4&c=5");
        let valuesForKeyB = searchParamsObject.getAll("b");
        let expectedValuesForKeyB = ["1", "2", "3", "4"];
        expect(String(valuesForKeyB.length)).assertEqual(String(expectedValuesForKeyB.length));
        for (let i = 0; i < valuesForKeyB.length; i++) {
          expect(String(valuesForKeyB[i])).assertEqual(String(expectedValuesForKeyB[i]));
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETALLVALUESFORKEY_0300
     * @tc.name       : testGetAllValuesForKey0003
     * @tc.desc       : Testing URLParams getAll() method for key "c" to ensure all values are correctly retrieved.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetAllValuesForKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetAllValuesForKey0003";
      try {
        let searchParamsObject = new Url.URLParams("a=1&a=2&b=3&b=4&c=5");
        let valuesForKeyC = searchParamsObject.getAll("c");
        let expectedValuesForKeyC = ["5"];
        expect(String(valuesForKeyC.length)).assertEqual(String(expectedValuesForKeyC.length));
        for (let i = 0; i < valuesForKeyC.length; i++) {
          expect(String(valuesForKeyC[i])).assertEqual(String(expectedValuesForKeyC[i]));
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETALLVALUESFORKEY_0400
     * @tc.name       : testGetAllValuesForKey0004
     * @tc.desc       : Testing URLParams getAll() method for a non-existing key "d" to ensure an empty array
     *                  is returned.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetAllValuesForKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetAllValuesForKey0004";
      try {
        let searchParamsObject = new Url.URLParams("a=1&a=2&b=3&b=4&c=5");
        let valuesForKeyD = searchParamsObject.getAll("d");
        let expectedValuesForKeyD: string[] = [];
        expect(String(valuesForKeyD.length)).assertEqual(String(expectedValuesForKeyD.length));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETALLVALUESFORKEY_0500
     * @tc.name       : testGetAllValuesForKey0005
     * @tc.desc       : Testing URLParams getAll() method for a key with special characters
     *                  "耄耋鍟毗粢ASGDDest1312%#^$%" to ensure all values are correctly retrieved.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetAllValuesForKey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetAllValuesForKey0005";
      try {
        let searchParamsObject = new Url.URLParams("耄耋鍟毗粢ASGDDest1312%#^$%=1&a=2&b=3&" +
          "耄耋鍟毗粢ASGDDest1312%#^$%a!$#%#=4&c=5");
        let valuesForKeyD = searchParamsObject.getAll("耄耋鍟毗粢ASGDDest1312%#^$%");
        let expectedValuesForKeyD = ["1"];
        expect(String(valuesForKeyD.length)).assertEqual(String(expectedValuesForKeyD.length));
        for (let i = 0; i < valuesForKeyD.length; i++) {
          expect(String(valuesForKeyD[i])).assertEqual(String(expectedValuesForKeyD[i]));
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETVALUEFORKEY_0100
     * @tc.name       : testGetValueForKey0001
     * @tc.desc       : Testing URLParams get() method for key "" to ensure the first value is correctly retrieved.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetValueForKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetValueForKey0001";
      try {
        let searchParamsObject = new Url.URLParams("=1&=2&b=3&b=4&c=5");
        let valueForKeyA = searchParamsObject.get("");
        let expectedValueForKeyA = "1";
        expect(valueForKeyA).assertEqual(expectedValueForKeyA);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETVALUEFORKEY_0200
     * @tc.name       : testGetValueForKey0002
     * @tc.desc       : Testing URLParams get() method for key "b" to ensure the first value is correctly retrieved.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetValueForKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetValueForKey0002";
      try {
        let searchParamsObject = new Url.URLParams("b=1&b=2&b=3&b=4&c=5");
        let valueForKeyB = searchParamsObject.get("b");
        let expectedValueForKeyB = "1";
        expect(valueForKeyB).assertEqual(expectedValueForKeyB);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETVALUEFORKEY_0300
     * @tc.name       : testGetValueForKey0003
     * @tc.desc       : Testing URLParams get() method for key "c" to ensure the first value is correctly retrieved.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetValueForKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetValueForKey0003";
      try {
        let searchParamsObject = new Url.URLParams("a=1&a=2&b=3&b=4&c=5");
        let valueForKeyC = searchParamsObject.get("c");
        let expectedValueForKeyC = "5";
        expect(valueForKeyC).assertEqual(expectedValueForKeyC);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETVALUEFORKEY_0400
     * @tc.name       : testGetValueForKey0004
     * @tc.desc       : Testing URLParams get() method for a non-existing key "d" to ensure null is returned.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetValueForKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetValueForKey0004";
      try {
        let searchParamsObject = new Url.URLParams("a=1&a=2&b=3&b=4&c=5");
        let valueForKeyD = searchParamsObject.get("d");
        expect(valueForKeyD).assertEqual(undefined);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETVALUEFORKEY_0500
     * @tc.name       : testGetValueForKey0005
     * @tc.desc       : Testing URLParams get() method for a key with special characters
     *                  "耄耋鍟毗粢ASGDDest1312%#^$%" to ensure the first value is correctly retrieved.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetValueForKey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetValueForKey0005";
      try {
        let searchParamsObject = new Url.URLParams("耄耋鍟毗粢ASGDDest1312%#^$%=1&a=2&b=3&" +
          "耄耋鍟毗粢ASGDDest1312%#^$%a!$#%#=4&c=5");
        let valueForKeyD = searchParamsObject.get("耄耋鍟毗粢ASGDDest1312%#^$%");
        let expectedValueForKeyD = "1";
        expect(String(valueForKeyD)).assertEqual(String(expectedValueForKeyD));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETVALUEFORKEY_0600
     * @tc.name       : testGetValueForKey0006
     * @tc.desc       : Testing URLParams get() method for various special character cases,
     *                  ensuring the method correctly retrieves the first value.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetValueForKey0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testGetValueForKey0006";
      try {
        let searchParamsObject = new Url.URLParams("http://dass/saf.com?ab=ku%20kua¶m2=value2&" +
          "%D5%8F=1&a=2&b=3&b=4&c=5&%20=1&%2b=2&d=%2b&e=%20&f=%26&%26=1");
        const keyValues: KeyValue[] = [
          {
            key: "%D5%8F", expectedValue: undefined
          },
          {
            key: "a", expectedValue: "2"
          },
          {
            key: "b", expectedValue: "3"
          },
          {
            key: "c", expectedValue: "5"
          },
          {
            key: "%20", expectedValue: undefined
          },
          {
            key: "%2b", expectedValue: undefined
          },
          {
            key: "d", expectedValue: "+"
          },
          {
            key: "e", expectedValue: " "
          },
          {
            key: "f", expectedValue: "&"
          },
          {
            key: "%26", expectedValue: undefined
          },
        ];
        for (let i = 0; i < keyValues.length; i++) {
          const key = keyValues[i].key;
          const expectedValue = keyValues[i].expectedValue;
          const actualValue = searchParamsObject.get(key);
          expect(actualValue).assertEqual(expectedValue);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_HASKEY_0100
     * @tc.name       : testHasKey0001
     * @tc.desc       : Testing URLParams has() method for key "" to ensure it correctly identifies existence.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHasKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testHasKey0001";
      try {
        let searchParamsObject = new Url.URLParams("=1&=2&b=3&b=4&c=5");
        let hasKey = searchParamsObject.has("");
        expect(String(hasKey)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_HASKEY_0200
     * @tc.name       : testHasKey0002
     * @tc.desc       : Testing URLParams has() method for key "b" to ensure it correctly identifies existence.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHasKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testHasKey0002";
      try {
        let searchParamsObject = new Url.URLParams("b=1&b=2&b=3&b=4&c=5");
        let hasKey = searchParamsObject.has("b");
        expect(String(hasKey)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_HASKEY_0300
     * @tc.name       : testHasKey0003
     * @tc.desc       : Testing URLParams has() method for key "c" to ensure it correctly identifies existence.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHasKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testHasKey0003";
      try {
        let searchParamsObject = new Url.URLParams("a=1&a=2&b=3&b=4&c=5");
        let hasKey = searchParamsObject.has("c");
        expect(String(hasKey)).assertEqual('true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_HASKEY_0400
     * @tc.name       : testHasKey0004
     * @tc.desc       : Testing URLParams has() method for a non-existing key "d" to ensure it correctly identifies non-existence.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHasKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testHasKey0004";
      try {
        let searchParamsObject = new Url.URLParams("a=1&a=2&b=3&b=4&c=5");
        let hasKey = searchParamsObject.has("d");
        expect(String(hasKey)).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_HASKEY_0500
     * @tc.name       : testHasKey0005
     * @tc.desc       : Testing URLParams has() method for special character key "耄耋鍟毗粢ASGDDest1312%#^$%"
     *                  to ensure the method correctly identifies the existence of the key.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHasKey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testHasKey0005";
      try {
        const testKeyPresence = (url: string, keys: KeyTestCase[]) => {
          let searchParamsObject = new Url.URLParams(url);
          for (let i = 0; i < keys.length; i++) {
            let hasKey = searchParamsObject.has(keys[i].key);
            expect(String(hasKey)).assertEqual(String(keys[i].expectedResult));
          }
        };
        const testCases1: KeyTestCase[] = [
          {
            key: "耄耋鍟毗粢ASGDDest1312%#^$%", expectedResult: true
          }
        ];
        testKeyPresence("耄耋鍟毗粢ASGDDest1312%#^$%=1&a=2&b=3&耄耋鍟毗粢ASGDDest1312%#^$%a!$#%#=4&c=5", testCases1);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_HASKEY_0600
     * @tc.name       : testHasKey0006
     * @tc.desc       : Testing URLParams has() method for special character keys ("%20", "%2b", "%26")
     *                  to ensure the method correctly identifies the non-existence of these keys.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testHasKey0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testHasKey0006";
      try {
        const testKeyPresence = (url: string, keys: KeyTestCase[]) => {
          let searchParamsObject = new Url.URLParams(url);
          for (let i = 0; i < keys.length; i++) {
            let hasKey = searchParamsObject.has(keys[i].key);
            expect(String(hasKey)).assertEqual(String(keys[i].expectedResult));
          }
        };
        const testCases2: KeyTestCase[] = [
          {
            key: "%20", expectedResult: false
          },
          {
            key: "%2b", expectedResult: false
          },
          {
            key: "%26", expectedResult: false
          }
        ];
        testKeyPresence("http://dass/saf.com?ab=ku%20kua¶m2=value2&%D5%8F=1&a=2&b=3&b=4" +
          "&c=5&%20=1&%2b=2&d=%2b&e=%20&f=%26&%26=1", testCases2);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SETKEYANDVALUE_0100
     * @tc.name       : testSetKeyAndValue0001
     * @tc.desc       : Testing URLSearchParams set() method with an empty name.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSetKeyAndValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetKeyAndValue0001";
      try {
        let searchParamsObject = new Url.URLParams("a=1&b=2");
        searchParamsObject.set("", "newValue");
        let hasEmptyKey = searchParamsObject.has("");
        expect(String(hasEmptyKey)).assertEqual('true');
        let value = searchParamsObject.get("");
        expect(String(value)).assertEqual("newValue");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SETKEYANDVALUE_0200
     * @tc.name       : testSetKeyAndValue0002
     * @tc.desc       : Testing URLSearchParams set() method with an empty value.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSetKeyAndValue0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetKeyAndValue0002";
      try {
        let searchParamsObject = new Url.URLParams("a=1&b=2");
        searchParamsObject.set("newKey", "");
        let hasNewKey = searchParamsObject.has("newKey");
        expect(String(hasNewKey)).assertEqual('true');
        let value = searchParamsObject.get("newKey");
        expect(String(value)).assertEqual("");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SETKEYANDVALUE_0300
     * @tc.name       : testSetKeyAndValue0003
     * @tc.desc       : Testing URLSearchParams set() method with an empty name and empty value.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSetKeyAndValue0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetKeyAndValue0003";
      try {
        let searchParamsObject = new Url.URLParams("a=1&b=2");
        searchParamsObject.set("", "");
        let hasEmptyKey = searchParamsObject.has("");
        expect(String(hasEmptyKey)).assertEqual('true');
        let value = searchParamsObject.get("");
        expect(String(value)).assertEqual("");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SETKEYANDVALUE_0400
     * @tc.name       : testSetKeyAndValue0004
     * @tc.desc       : Testing URLSearchParams set() method with multiple duplicate keys.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSetKeyAndValue0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetKeyAndValue0004";
      try {
        let paramsObject = new Url.URLParams('name=Jonathan&name=YH&name=DKH');
        expect(paramsObject.toString()).assertEqual("name=Jonathan&name=YH&name=DKH");
        paramsObject.set('name', 'zhuDi');
        expect(paramsObject.toString()).assertEqual("name=zhuDi");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SETKEYANDVALUE_0500
     * @tc.name       : testSetKeyAndValue0005
     * @tc.desc       : Testing URLSearchParams set() method with a single key.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSetKeyAndValue0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetKeyAndValue0005";
      try {
        let paramsObject = new Url.URLParams('name=Jonathan');
        expect(paramsObject.toString()).assertEqual("name=Jonathan");
        paramsObject.set('name', 'zhudi');
        expect(paramsObject.toString()).assertEqual("name=zhudi");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SETKEYANDVALUE_0600
     * @tc.name       : testSetKeyAndValue0006
     * @tc.desc       : Testing URLSearchParams set() method with a non-existent key.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSetKeyAndValue0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetKeyAndValue0006";
      try {
        let paramsObject = new Url.URLParams('a=1&b=2');
        expect(paramsObject.toString()).assertEqual("a=1&b=2");
        paramsObject.set('name', 'zhudi');
        expect(paramsObject.toString()).assertEqual("a=1&b=2&name=zhudi");
        let value = paramsObject.get('name');
        expect(value).assertEqual("zhudi");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SETKEYANDVALUE_0700
     * @tc.name       : testSetKeyAndValue0007
     * @tc.desc       : Testing URLSearchParams set() method with a key containing special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSetKeyAndValue0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetKeyAndValue0007";
      try {
        let paramsObject = new Url.URLParams('a=1&b=2');
        expect(paramsObject.toString()).assertEqual("a=1&b=2");
        const specialKey = '耄耋鍟毗粢ASGDDest1312%#^$%';
        paramsObject.set(specialKey, 'specialValue');
        expect(paramsObject.toString()).assertEqual(`a=1&b=2&${encodeURIComponent(specialKey)}=specialValue`);
        let value = paramsObject.get(specialKey);
        expect(value).assertEqual("specialValue");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SETKEYANDVALUE_0800
     * @tc.name       : testSetKeyAndValue0008
     * @tc.desc       : Testing URLSearchParams set() method with encoded characters in key and value.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSetKeyAndValue0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSetKeyAndValue0008";
      try {
        let paramsObject = new Url.URLParams('a=1&b=2');
        expect(paramsObject.toString()).assertEqual("a=1&b=2");
        const encodedKeyWithSpace = 'name%20with%20space';
        const encodedKeyWithPlus = 'name%2bwith%2bplus';
        const valueWithAmp = 'value%26contains%26ampersand';
        paramsObject.set(decodeURIComponent(encodedKeyWithSpace), 'valueWithSpace');
        paramsObject.set(decodeURIComponent(encodedKeyWithPlus), 'valueWithPlus');
        paramsObject.set('name', decodeURIComponent(valueWithAmp));
        expect(paramsObject.toString()).assertEqual("a=1&b=2&name+with+space=valueWithSpace&name%2Bwith%" +
          "2Bplus=valueWithPlus&name=value%26contains%26ampersand");
        let value1 = paramsObject.get(decodeURIComponent(encodedKeyWithSpace));
        expect(value1).assertEqual("valueWithSpace");
        let value2 = paramsObject.get(decodeURIComponent(encodedKeyWithPlus));
        expect(value2).assertEqual("valueWithPlus");
        let value3 = paramsObject.get('name');
        expect(value3).assertEqual("value&contains&ampersand");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SORT_0100
     * @tc.name       : testSort0001
     * @tc.desc       : Testing URLParams sort() method to ensure parameters are sorted correctly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSort0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSort0001";
      try {
        let paramsObject = new Url.URLParams('name=Jonathan&name=YH&name=DKH');
        const keyValuePairs: [string, string][] = [
          ["1", "c"], ["5", "c"], ["a", "c"],
          ["ad", "c"], ["ab", "c"], ["b", "c"], ["ca", "c"]
        ];
        for (const pair of keyValuePairs) {
          paramsObject.append(pair[0], pair[1]);
        }
        expect(paramsObject.toString()).assertEqual(
          'name=Jonathan&name=YH&name=DKH&1=c&5=c&a=c&ad=c&ab=c&b=c&ca=c'
        );
        paramsObject.sort();
        expect(paramsObject.toString()).assertEqual(
          '1=c&5=c&a=c&ab=c&ad=c&b=c&ca=c&name=YH&name=DKH&name=Jonathan'
        );
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SORT_0200
     * @tc.name       : testSort0002
     * @tc.desc       : Testing URLParams sort() method to ensure parameters with same keys but different
     *                  values are sorted by adding order correctly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSort0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSort0002";
      try {
        let paramsObject = new Url.URLParams('1=3&1=6');
        const keyValuePairs: [string, string][] = [
          ["1", "1"],
          ["1", "2"],
          ["1", "3"],
          ["1", "4"],
          ["2", "5"],
          ["3", "5"],
          ["4", "2"],
          ["2", "2"],
          ["1", "3"],
          ["3", "7"],
          ["0", "9"],
        ];
        for (const pair of keyValuePairs) {
          paramsObject.append(pair[0], pair[1]);
        }
        expect(paramsObject.toString()).assertEqual('1=3&1=6&1=1&1=2&1=3&1=4&2=5&3=5&4=2&2=2&1=3&3=7&0=9');
        paramsObject.sort();
        expect(paramsObject.toString()).assertEqual('0=9&1=6&1=1&1=2&1=3&1=4&1=3&1=3&2=5&2=2&3=7&3=5&4=2');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SORT_0300
     * @tc.name       : testSort0003
     * @tc.desc       : Testing URLParams sort() method to ensure parameters with special characters are sorted correctly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSort0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSort0003";
      try {
        let paramsObject = new Url.URLParams('key@1=value1&key#2=value2');
        const keyValuePairs: [string, string][] = [
          ["key@1", "value3"],
          ["key#2", "value4"],
          ["key*3", "value5"],
          ["key(4)", "value6"],
        ];
        for (const pair of keyValuePairs) {
          paramsObject.append(pair[0], pair[1]);
        }
        expect(paramsObject.toString()).assertEqual('key%401=value1&key%232=value2&key%401=value3&' +
          'key%232=value4&key*3=value5&key%284%29=value6');
        paramsObject.sort();
        expect(paramsObject.toString()).assertEqual('key%232=value2&key%232=value4&key%284%29=value6&' +
          'key*3=value5&key%401=value3&key%401=value1');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SORT_0400
     * @tc.name       : testSort0004
     * @tc.desc       : Testing URLParams sort() method to ensure parameters with special characters
     *                  in values are sorted correctly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSort0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSort0004";
      try {
        let paramsObject = new Url.URLParams('key1=value&key2=world!');
        const keyValuePairs: [string, string][] = [
          ["key1", "hello@"],
          ["key2", "foo#"],
          ["key3", "bar$"],
          ["key4", "baz%"],
        ];
        for (const pair of keyValuePairs) {
          paramsObject.append(pair[0], pair[1]);
        }
        expect(paramsObject.toString()).assertEqual('key1=value&key2=world%21&key1=hello%40&' +
          'key2=foo%23&key3=bar%24&key4=baz%25');
        paramsObject.sort();
        expect(paramsObject.toString()).assertEqual('key1=value&key1=hello%40&key2=world%21&' +
          'key2=foo%23&key3=bar%24&key4=baz%25');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_KEYS_ITERATOR_0100
    //  * @tc.name       : testKeysIterableIterator0001
    //  * @tc.desc       : Testing URLParams keys() method with mixed string types: numbers and characters.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testKeysIterableIterator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testKeysIterableIterator0001";
    //   try {
    //     const paramsObject = new Url.URLParams('1=value1&5=value2&a=value3');
    //     const keyValuePairs: Array<[string, string]> = new Array();
    //     keyValuePairs.push(["ad", "value4"]);
    //     keyValuePairs.push(["ab", "value5"]);
    //     keyValuePairs.push(["b", "value6"]);
    //     keyValuePairs.push(["ca", "value7"]);
    //     for (let i = 0; i < keyValuePairs.length; i++) {
    //       const pair = keyValuePairs[i];
    //       paramsObject.append(pair[0], pair[1]);
    //     }
    //     const keysArray: Array<string> = new Array();
    //     const keysIterator = paramsObject.keys();
    //     let next = keysIterator.next();
    //
    //     while (!next.done) {
    //       keysArray.push(next.value);
    //       next = keysIterator.next();
    //     }
    //     expect(keysArray.toString()).assertEqual('1,5,a,ad,ab,b,ca');
    //   }  catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_KEYS_ITERATOR_0200
    //  * @tc.name       : testKeysIterableIterator0002
    //  * @tc.desc       : Testing URLParams keys() method with keys containing special characters.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testKeysIterableIterator0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testKeysIterableIterator0002";
    //   try {
    //     let paramsObject = new Url.URLParams('key@1=value1&key#2=value2&key*3=value3');
    //     const keyValuePairs = [
    //       ["key(4)", "value4"],
    //       ["key$5", "value5"],
    //       ["key&6", "value6"],
    //       ["key%7", "value7"],
    //     ];
    //     keyValuePairs.forEach(pair => paramsObject.append(pair[0], pair[1]));
    //     const keysIterator = paramsObject.keys();
    //     const keysArray = Array.from(keysIterator);
    //     expect(keysArray.toString()).assertEqual('key@1,key#2,key*3,key(4),key$5,key&6,key%7');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_KEYS_ITERATOR_0300
    //  * @tc.name       : testKeysIterableIterator0003
    //  * @tc.desc       : Testing URLParams keys() method with add, query, delete, and query operations.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testKeysIterableIterator0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testKeysIterableIterator0003";
    //   try {
    //     let paramsObject = new Url.URLParams();
    //     const keyValuePairs = [
    //       ["key1", "value1"],
    //       ["key2", "value2"],
    //       ["key3", "value3"]
    //     ];
    //     keyValuePairs.forEach(pair => paramsObject.append(pair[0], pair[1]));
    //     let keysIterator = paramsObject.keys();
    //     let keysArray = Array.from(keysIterator);
    //     expect(keysArray.toString()).assertEqual('key1,key2,key3');
    //     paramsObject.delete("key2");
    //     keysIterator = paramsObject.keys();
    //     keysArray = Array.from(keysIterator);
    //     expect(keysArray.toString()).assertEqual('key1,key3');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_VALUES_ITERATOR_0100
    //  * @tc.name       : testValuesIterableIterator0001
    //  * @tc.desc       : Testing URLParams values() method with mixed key formats (numbers and characters).
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testValuesIterableIterator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testValuesIterableIterator0001";
    //   try {
    //     let paramsObject = new Url.URLParams('key1=1&key2=5&key3=a&key4=ad&key6=ab&key5=c');
    //     const valuesArray: string[] = [];
    //     const iterator = paramsObject.values();
    //     let next = iterator.next();
    //     while (!next.done) {
    //       valuesArray.push(next.value);
    //       next = iterator.next();
    //     }
    //     expect(valuesArray.toString()).assertEqual('1,5,a,ad,ab,c');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_VALUES_ITERATOR_0200
    //  * @tc.name       : testValuesIterableIterator0002
    //  * @tc.desc       : Testing URLParams values() method with values containing special characters.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testValuesIterableIterator0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testValuesIterableIterator0002";
    //   try {
    //     let paramsObject = new Url.URLParams('key1=value@#1&key2=value*2&key3=value(3)');
    //     const specialValuePairs = [
    //       ["key4", "value$4"],
    //       ["key5", "value&5"],
    //       ["key6", "value%6"],
    //       ["key7", "value^7"],
    //     ];
    //     specialValuePairs.forEach(pair => paramsObject.append(pair[0], pair[1]));
    //     const valuesIterator = paramsObject.values();
    //     const valuesArray = Array.from(valuesIterator);
    //     expect(valuesArray.toString()).assertEqual('value@#1,value*2,value(3),value$4,value&5,value%6,value^7');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });
    //
    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_VALUES_ITERATOR_0300
    //  * @tc.name       : testValuesIterableIterator0003
    //  * @tc.desc       : Testing URLParams values() method with add, query, delete, and query operations.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testValuesIterableIterator0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testValuesIterableIterator0003";
    //   try {
    //     let paramsObject = new Url.URLParams();
    //     const keyValuePairs = [
    //       ["key1", "value1"],
    //       ["key2", "value2"],
    //       ["key3", "value3"]
    //     ];
    //     keyValuePairs.forEach(pair => paramsObject.append(pair[0], pair[1]));
    //     let valuesIterator = paramsObject.values();
    //     let valuesArray = Array.from(valuesIterator);
    //     expect(valuesArray.toString()).assertEqual('value1,value2,value3');
    //     paramsObject.delete("key2");
    //     valuesIterator = paramsObject.values();
    //     valuesArray = Array.from(valuesIterator);
    //     expect(valuesArray.toString()).assertEqual('value1,value3');
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_SPECIAL_0100
     * @tc.name       : testSpecial0001
     * @tc.desc       : Testing URLParams for handling special characters in query values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpecial0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSpecial0001";
      try {
        let params1 = new Url.URLParams('fod=!!#%(())**++-..//::<<==>>??[');
        let params2 = new Url.URLParams('fod=!!22%22%23%23%24%24%25%25%26%26(())**%2B');
        let params3 = new Url.URLParams('fod=21%2122%2223%23%24%24%25%25%26%26%27%27%28');
        let res1 = params1.get('fod');
        let res2 = params2.get('fod');
        let res3 = params3.get('fod');
        expect(res1).assertEqual("!!#%(())**  -..//::<<==>>??[");
        expect(res2).assertEqual("!!22\"##$$%%&&(())**+");
        expect(res3).assertEqual("21!22\"23#$$%%&&''(");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_SPECIAL_0200
     * @tc.name       : testSpecial0002
     * @tc.desc       : Testing append for handling special characters in query values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpecial0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSpecial0002";
      try {
        let params = new Url.URLParams('bard=2');
        params.append('fod', "!\"#$%&&&'()*+++,-./:;<=>?@[\\]^_`{|}~");
        let res2 = params.get('fod');
        let params1 = new Url.URLParams('bard=2');
        expect(res2).assertEqual('!"#$%&&&\'()*+++,-./:;<=>?@[\\]^_`{|}~');
        params1.append('fod', '21!\"#$%&\'()*+,-./:;<=++>?@[\\]^_&&`{|}~');
        let res3 = params.get('fod');
        expect(res3).assertEqual('!"#$%&&&\'()*+++,-./:;<=>?@[\\]^_`{|}~');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_SPECIAL_0300
     * @tc.name       : testSpecial0003
     * @tc.desc       : Testing getAll for handling multiple values with special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpecial0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSpecial0003";
      try {
        let params = new Url.URLParams('bard=2');
        params.append('fod', "!\"#$%&&&'()*+++,-./:;<=>?@[\\]^_`{|}~");
        params.append('fod', '21!\"#$%&\'()*+,-./:;<=++>?@[\\]^_&&`{|}~');
        params.append('fod', 'Another special value: %^&*()_+|');
        let res = params.getAll('fod');
        expect(res.toString()).assertEqual('!"#$%&&&\'()*+++,-./:;<=>?@[\\]^_`{|}~,21!"#$%&\'()*' +
          '+,-./:;<=++>?@[\\]^_&&`{|}~,Another special value: %^&*()_+|');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_SPECIAL_0400
     * @tc.name       : testSpecial0004
     * @tc.desc       : Testing set for handling special characters in query values.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpecial0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSpecial0004";
      try {
        let params = new Url.URLParams('bard=2');
        params.set('fod', "!!%22%22%23%23%24%24%25%25%26%26''(())**%2B%2B%2C%2C--..%2F" +
          "%2F%3A%3A%3B%3B%3C%3C%3D%3D%3E%3E%3F%3F%40%40%5B%5B%5C%5C%5D%5D%5E%5E__%6" +
          "0%60%7B%7B%7C%7C%7D%7D~~");
        let res = params.get('fod');
        expect(res).assertEqual('!!%22%22%23%23%24%24%25%25%26%26\'\'(())**%2B%2B%2C%2' +
          'C--..%2F%2F%3A%3A%3B%3B%3C%3C%3D%3D%3E%3E%3F%3F%40%40%5B%5B%5C%5C%5D%5D%5' +
          'E%5E__%60%60%7B%7B%7C%7C%7D%7D~~');
        params.set('fod', '%21%21%22%22%23%23%24%24%25%25%26%26%27%27%28%28%2A%2A%2B%2' +
          'B%2C%2C%2D%2D%2E%2E%2F%2F%3A%3A%3B%3B%3C%3C%3D%3D%3E%3E%3F%3F%40%40%5B%5B' +
          '%5C%5C%5D%5D%5E%5E%5F%5F%60%60%7B%7B%7C%7C%7D%7D%7E%7E');
        let newRes = params.get('fod');
        expect(newRes).assertEqual('%21%21%22%22%23%23%24%24%25%25%26%26%27%27%28%28%2' +
          'A%2A%2B%2B%2C%2C%2D%2D%2E%2E%2F%2F%3A%3A%3B%3B%3C%3C%3D%3D%3E%3E%3F%3F%40' +
          '%40%5B%5B%5C%5C%5D%5D%5E%5E%5F%5F%60%60%7B%7B%7C%7C%7D%7D%7E%7E');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_SPECIAL_0500
     * @tc.name       : testSpecial0005
     * @tc.desc       : Testing values for handling multiple values with special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpecial0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSpecial0005";
      try {
        let params = new Url.URLParams('bard=2');
        params.append('fod', "!\"#$%&&&'()*+++,-./:;<=>?@[\\]^_`{|}~");
        params.append('fod', 'Another special value: %^&*()_+|');
        params.append('fod', 'More special characters: ~`!@#$%^&*()-_=+');
        let resultValues = params.values();
        expect(String(resultValues)).assertEqual("2,!\"#$%&&&'()*+++,-./:;<=>?@[\\]^_`" +
          "{|}~,Another special value: %^&*()_+|,More special characters: " +
          "~`!@#$%^&*()-_=+");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_SPECIAL_0600
    //  * @tc.name       : testSpecial0006
    //  * @tc.desc       : Testing entries for handling keys and values with special characters.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testSpecial0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testSpecial0006";
    //   try {
    //     let Params1 = new Url.URLParams('nan=po&fod=!!""##' +
    //       '$$%%\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~&bard=2');
    //     let Params2 = new Url.URLParams('nan=po&fod=!!%22%' +
    //       '22%23%23%24%24%25%25%26%26\'\'(())**%2B%2B%2C%2C--..%2F%2F%3A%3A%3B%3B%3C%3C' +
    //       '%3D%3D%3E%3E%3F%3F%40%40%5B%5B%5C%5C%5D%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%7D~~' +
    //       '&bard=2');
    //     let Params3 = new Url.URLParams('nan=po&fod=%21%21%' +
    //       '22%22%23%23%24%24%25%25%26%26%27%27%28%28%2A%2A%2B%2B%2C%2C%2D%2D%2E%2E%2F%2F' +
    //       '%3A%3A%3B%3B%3C%3C%3D%3D%3E%3E%3F%3F%40%40%5B%5B%5C%5C%5D%5D%5E%5E%5F%5F%60%6' +
    //       '0%7B%7B%7C%7C%7D%7D%7E%7E&bard=2');
    //     let arrayValue1 = Object.entries(Params1);//TypeError: No matching call signature for from(EntryIterator) [Url.test.ets:1872:27]
    // TypeError: No matching call signature for from(EntryIterator) [Url.test.ets:1874:27]
    //     let pair2 = Params2.entries();
    //     let arrayValue2 = Array.from(pair2);
    //     let pair3 = Params3.entries();
    //     let arrayValue3 = Array.from(pair3);
    //     let expectedValues = [
    //       '!!""##$$%%\'\'(())**  ,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~',
    //       '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~',
    //       '!!""##$$%%&&\'\'((**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~'
    //     ];
    //     expect(arrayValue1[1][1]).assertEqual(expectedValues[0]);
    //     expect(arrayValue2[1][1]).assertEqual(expectedValues[1]);
    //     expect(arrayValue3[1][1]).assertEqual(expectedValues[2]);
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_SPECIAL_0700
     * @tc.name       : testSpecial0007
     * @tc.desc       : Testing forEach for handling keys and values with special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpecial0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSpecial0007";
      try {
        let params = new Url.URLParams('nan=po&fod=!!""##$$%' +
          '%\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~&bard=2');
        const specialValuePairs = [
          ["key4", "value$4"],
          ["key5", "value&5"],
          ["key6", "value%6"],
          ["key7", "value^7"],
        ];
        for (let i = 0; i < specialValuePairs.length; i++) {
          let pair = specialValuePairs[i];
          params.append(pair[0], pair[1]);
        }
        expect(specialValuePairs.toString()).assertEqual("key4,value$4,key5,value&5,key6,value%6,key7,value^7");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_SPECIAL_0800
     * @tc.name       : testSpecial0008
     * @tc.desc       : Testing parseURL for handling special characters in query parameters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpecial0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSpecial0008";
      try {
        let url = 'https://developer.mozilla.org/?fod=!!""##$$%%\'\'(())**++,,--..' +
          '//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~&bard=2';
        let params1 = Url.URL.parseURL(url);
        let fodValue = params1.params.get('fod');
        expect(fodValue).assertEqual("!!\"\"");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_SPECIAL_0900
     * @tc.name       : testSpecial0009
     * @tc.desc       : Testing delete for handling keys with special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpecial0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSpecial0009";
      try {
        let str1 = '!!""##$$%%\'\'(())**++,,--.' +
          './/::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
        let str2 = '!!%22%22%23%23%24%24%25%25%2' +
          '6%26\'\'(())**%2B%2B%2C%2C--..%2F%2F%3A%3A%3B%3B%3C%3C%3D%3D%3E' +
          '%3E%3F%3F%40%40%5B%5B%5C%5C%5D%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%' +
          '7D~~';
        let str3 = '%21%21%22%22%23%23%24%24%25%' +
          '25%26%26%27%27%28%28%2A%2A%2B%2B%2C%2C%2D%2D%2E%2E%2F%2F%3A%3A%' +
          '3B%3B%3C%3C%3D%3D%3E%3E%3F%3F%40%40%5B%5B%5C%5C%5D%5D%5E%5E%5F%' +
          '5F%60%60%7B%7B%7C%7C%7D%7D%7E%7E';
        let params1 = new Url.URLParams("nan=po&" + str1 + "=fod&bard=2");
        let params2 = new Url.URLParams("nan=po&" + str2 + "=fod&bard=2");
        let params3 = new Url.URLParams("nan=po&" + str3 + "=fod&bard=2");
        params1.delete(str1)
        params2.delete(str2)
        params3.delete(str3)
        let res1 = params1.getAll(str1);
        let res2 = params2.getAll(str2);
        let res3 = params3.getAll(str3);
        expect(String(res1.length)).assertEqual('0');
        expect(String(res2.length)).assertEqual('0');
        expect(String(res3.length)).assertEqual('0');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_SPECIAL_1000
    //  * @tc.name       : testSpecial0010
    //  * @tc.desc       : Testing getting values using keys with special characters.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testSpecial0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testSpecial0010";
    //   try {
    //     let params1 = new Url.URLParams('key1=value1&!!""##$$%%=value');
    //     let params2 = new Url.URLParams('key1=value1&!!""##$$%%\'\'(())' +
    //       '**  ,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~=value');
    //     let params3 = new Url.URLParams('key1=value1&!!%22%22%23%23%24%' +
    //       '24%25%25%26%26(())**%2B%2B%2C%2C--..%2F%2F%3A%3A%3B%3B%3C%3C%3D%3D%3E%3E%3F%3F%40%40%5B%5' +
    //       'B%5C%5C%5D%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%7D~~=value');
    //     let key1 = Array.from(params1.keys())
    //     let key2 = Array.from(params2.keys())
    //     let key3 = Array.from(params3.keys())
    //     expect(key1.toString()).assertEqual("key1,!!\"\"##$$%%")
    //     expect(key2.toString()).assertEqual("key1,!!\"\"##$$%%'" +
    //       "'(())**  ,,--..//::;;<<")
    //     expect(key3.toString()).assertEqual("key1,!!\"\"##$$%%&&" +
    //       "(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~")
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_SPECIAL_1100
     * @tc.name       : testSpecial0011
     * @tc.desc       : Testing has method for checking existence of keys with special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpecial0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSpecial0011";
      try {
        let str1 = '!!""##$$%%\'\'(())**  ,,--..//::;;<<>>??@@[[\\\\]]^^__``{{||}}~~';
        let params1 = new Url.URLParams(`key1=value1&${str1}=value1`);
        expect(String(params1.has('key1') && params1.has(str1))).assertEqual('true');
        expect(String(params1.has('nonexistent'))).assertEqual('false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_SPECIAL_1200
     * @tc.name       : testSpecial0012
     * @tc.desc       : Testing sort method for URL parameters with special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpecial0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSpecial0012";
      try {
        let str1 = "%21%21%22%22%23%23%24%24%25%25%27%27%28%28%29%29**++%2C%2C--..%" +
          "2F%2F%3A%3A%3B%3B%3C%3C%3D%3D%3E%3E%3F%3F%40%40%5B%5B%5C%5C%5D%5D%5E%5E" +
          "__%60%60%7B%7B%7C%7C%7D%7D%7E%7E";
        let str2 = "%21%21%22%22%23%23%24%24%25%25%26%26%27%27%28%28%29%29**%2B%2B%2" +
          "C%2C--..%2F%2F%3A%3A%3B%3B%3C%3C%3D%3D%3E%3E%3F%3F%40%40%5B%5B%5C%5C%5D" +
          "%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%7D%7E%7E";
        let str3 = "%21%21%22%22%23%23%24%24%25%25%26%26%27%27%28%28**%2B%2B%2C%2C--" +
          "..%2F%2F%3A%3A%3B%3B%3C%3C%3D%3D%3E%3E%3F%3F%40%40%5B%5B%5C%5C%5D%5D%5E" +
          "%5E__%60%60%7B%7B%7C%7C%7D%7D%7E%7E";
        let params1 = new Url.URLParams('nan=po&fod=!!""##$$%%\'\'(())**++,,--..//::' +
          ';;<<==>>??@@[[\\\\]]^^__``{{||}}~~&bard=2');
        let params2 = new Url.URLParams('nan=po&fod=!!%22%22%23%23%24%24%25%25%26%26' +
          '\'\'(())**%2B%2B%2C%2C--..%2F%2F%3A%3A%3B%3B%3C%3C%3D%3D%3E%3E%3F%3F%40' +
          '%40%5B%5B%5C%5C%5D%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%7D~~&bard=2');
        let params3 = new Url.URLParams('nan=po&fod=%21%21%22%22%23%23%24%24%25%25%2' +
          '6%26%27%27%28%28%2A%2A%2B%2B%2C%2C%2D%2D%2E%2E%2F%2F%3A%3A%3B%3B%3C%3C%' +
          '3D%3D%3E%3E%3F%3F%40%40%5B%5B%5C%5C%5D%5D%5E%5E%5F%5F%60%60%7B%7B%7C%7C' +
          '%7D%7D%7E%7E&bard=2');
        params1.sort();
        params2.sort();
        params3.sort();
        let res1 = params1.toString();
        let res2 = params2.toString();
        let res3 = params3.toString();
        expect(res1).assertEqual(`bard=2&fod=${str1}&nan=po`);
        expect(res2).assertEqual(`bard=2&fod=${str2}&nan=po`);
        expect(res3).assertEqual(`bard=2&fod=${str3}&nan=po`);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_SPECIAL_1300
    //  * @tc.name       : testSpecial0013
    //  * @tc.desc       : Testing URLSearchParams for special characters extraction.
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testSpecial0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const TAG = "testSpecial0013";
    //   try {
    //     let str1 = '!!""##$$%%\'\'(())**  ,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
    //     let str2 = '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
    //     let str3 = '!!""##$$%%&&\'\'((**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
    //     let Params1 = new Url.URLParams('https://developer.mozilla.org/?nan=po&fod=!!""##' +
    //       '$$%%\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~&bard=2');
    //     let Params2 = new Url.URLParams('https://developer.mozilla.org/?nan=po&fod=!!%22%' +
    //       '22%23%23%24%24%25%25%26%26\'\'(())**%2B%2B%2C%2C--..%2F%2F%3A%3A%3B%3B%3C%3C' +
    //       '%3D%3D%3E%3E%3F%3F%40%40%5B%5B%5C%5C%5D%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%7D~~' +
    //       '&bard=2');
    //     let Params3 = new Url.URLParams('https://developer.mozilla.org/?nan=po&fod=%21%21' +
    //       '%22%22%23%23%24%24%25%25%26%26%27%27%28%28%2A%2A%2B%2B%2C%2C%2D%2D%2E%2E%2F%' +
    //       '2F%3A%3A%3B%3B%3C%3C%3D%3D%3E%3E%3F%3F%40%40%5B%5B%5C%5C%5D%5D%5E%5E%5F%5F%6' +
    //       '0%60%7B%7B%7C%7C%7D%7D%7E%7E&bard=2');
    //     let iter1 = Params1[Symbol.iterator]();
    //     let arrayValue1 = Array.from(iter1);
    //     let res1 = arrayValue1[1][1];
    //     let iter2 = Params2[Symbol.iterator]();
    //     let arrayValue2 = Array.from(iter2);
    //     let res2 = arrayValue2[1][1];
    //     let iter3 = Params3[Symbol.iterator]();
    //     let arrayValue3 = Array.from(iter3);
    //     let res3 = arrayValue3[1][1];
    //     expect(res1).assertEqual(str1);
    //     expect(res2).assertEqual(str2);
    //     expect(res3).assertEqual(str3);
    //   } catch (err: BusinessError) {
    //     console.error(`${TAG} failed, error: ${err}`);
    //     expect(false).assertFail();
    //   }
    // });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_URLPARAMS_SPECIAL_1400
     * @tc.name       : testSpecial0014
     * @tc.desc       : Testing URLSearchParams for additional special characters extraction.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpecial0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSpecial0014";
      try {
        let str1 = 'nan=po&fod=%21%21%22%22%23%23%24%24%25%25&=&%27%27%28%28%29' +
          '%29**++%2C%2C--..%2F%2F%3A%3A%3B%3B%3C%3C=%3D%3E%3E%3F%3F%40%40%5B' +
          '%5B%5C%5C%5D%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%7D%7E%7E&bard=2';
        let str2 = 'nan=po&fod=%21%21%22%22%23%23%24%24%25%25%26%26%27%27%28%28' +
          '%29%29**%2B%2B%2C%2C--..%2F%2F%3A%3A%3B%3B%3C%3C%3D%3D%3E%3E%3F%3F' +
          '%40%40%5B%5B%5C%5C%5D%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%7D%7E%7E&bard=2';
        let str3 = 'nan=po&fod=%21%21%22%22%23%23%24%24%25%25%26%26%27%27%28%28' +
          '**%2B%2B%2C%2C--..%2F%2F%3A%3A%3B%3B%3C%3C%3D%3D%3E%3E%3F%3F%40%40' +
          '%5B%5B%5C%5C%5D%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%7D%7E%7E&bard=2';
        let Params1 = new Url.URLParams('nan=po&fod=!!""##' +
          '$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~&bard=2');
        let Params2 = new Url.URLParams('nan=po&fod=!!%22%22%23%23%24%24%25%25%26' +
          '%26\'\'(())**%2B%2B%2C%2C--..%2F%2F%3A%3A%3B%3B%3C%3C%3D%3D%3E%3E%3F' +
          '%3F%40%40%5B%5B%5C%5C%5D%5D%5E%5E__%60%60%7B%7B%7C%7C%7D%7D~~&bard=2');
        let Params3 = new Url.URLParams('nan=po&fod=%21%21%22%22%23%23%24%24%25%2' +
          '5%26%26%27%27%28%28%2A%2A%2B%2B%2C%2C%2D%2D%2E%2E%2F%2F%3A%3A%3B%3B%' +
          '3C%3C%3D%3D%3E%3E%3F%3F%40%40%5B%5B%5C%5C%5D%5D%5E%5E%5F%5F%60%60%7B' +
          '%7B%7C%7C%7D%7D%7E%7E&bard=2');
        expect(Params1.toString()).assertEqual(str1);
        expect(Params2.toString()).assertEqual(str2);
        expect(Params3.toString()).assertEqual(str3);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });
  });
}