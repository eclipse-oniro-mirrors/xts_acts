/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium'
import { createProxy } from '../testability/pages/Proxy'
import { sliceString, treeString } from '../testability/pages/TreeString'



export default function builtinsProxyTest() {
  describe('builtinsProxyTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_0100
     * @tc.name builtinsProxyTest0100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsProxyTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      interface User {
        name: string;
        age: number;
      }
      const user: User = { name: 'Alice', age: 25 };
      const userProxy = createProxy(user) as User;
      expect('Alice').assertEqual(userProxy.name)
      console.log('=====',userProxy.name);
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_0200
     * @tc.name builtinsProxyTest0200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsProxyTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      interface User {
        name: string;
        age: number;
      }
      const user: User = { name: 'Bob@#$%', age: 25 };
      const userProxy = createProxy(user) as User;
      expect('Bob@#$%').assertEqual(userProxy.name)
      console.log('=====',userProxy.name);
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_0300
     * @tc.name builtinsProxyTest0300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsProxyTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      interface User {
        name: string|undefined;
        age: number;
        specialChar?: string;
        undefinedProp?: undefined;
      }
      const user: User =  { name: undefined, age: 0};
      const userProxy = createProxy(user) as User;
      expect(undefined).assertEqual(userProxy.name)
      console.log('=====',userProxy.name);
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_0400
     * @tc.name builtinsProxyTest0400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsProxyTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      interface User {
        name: string|undefined|null;
        age: number;
        specialChar?: string;
        undefinedProp?: undefined;
      }
      const user: User =  { name: null, age: 0};
      const userProxy = createProxy(user) as User;
      expect(null).assertEqual(userProxy.name)
      console.log('=====',userProxy.name);
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_0500
     * @tc.name builtinsProxyTest0500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsProxyTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      interface User {
        name: string|undefined|null;
        age: number;
        specialChar?: string;
        undefinedProp?: undefined;
      }
      const user: User =  { name: '\a', age: 0};
      const userProxy = createProxy(user) as User;
      expect('\a').assertEqual(userProxy.name)
      console.log('=====',userProxy.name);
      Done()
    })
    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_0600
     * @tc.name builtinsProxyTest0600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsProxyTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      interface User {
        name: string|undefined|null;
        age: number;
        specialChar?: string;
        undefinedProp?: undefined;
      }
      const user: User =  { name: '\f', age: 0};
      const userProxy = createProxy(user) as User;
      expect('\f').assertEqual(userProxy.name)
      console.log('=====',userProxy.name);
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_0700
     * @tc.name builtinsProxyTest0700
     * @tc.desc test [1,2,3,4,5]splice(-2,1);
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsProxyTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      interface User {
        name: string|undefined|null;
        age: number;
        specialChar?: string;
        undefinedProp?: undefined;
      }
      const user: User =  { name: '\t', age: 0};
      const userProxy = createProxy(user) as User;
      expect('\t').assertEqual(userProxy.name)
      console.log('=====',userProxy.name);
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_0800
     * @tc.name builtinsProxyTest0800
     * @tc.desc test [1,2,3,4,5]splice(1, 0,undefined);
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsProxyTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      interface User {
        name: string|undefined|null;
        age: number;
        specialChar?: string;
        undefinedProp?: undefined;
      }
      const user: User =  { name: '\\', age: 0};
      const userProxy = createProxy(user) as User;
      expect('\\').assertEqual(userProxy.name)
      console.log('=====',userProxy.name);
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_0900
     * @tc.name builtinsProxyTest0900
     * @tc.desc test [1, 2, 3, 4, 5]splice(1, 0, null);
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsProxyTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      interface User {
        name: string|undefined|null;
        age: number;
        specialChar?: string;
        undefinedProp?: undefined;
      }
      const user: User =  { name: '👆', age: 0};
      const userProxy = createProxy(user) as User;
      expect('👆').assertEqual(userProxy.name)
      console.log('=====',userProxy.name);
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_1000
     * @tc.name builtinsProxyTest1000
     * @tc.desc test [1,2,3]splice(0, 3);
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsProxyTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      interface User {
        name: string|undefined|null;
        age: number;
        specialChar?: string;
        undefinedProp?: undefined;
      }
      const user: User =  { name: '👀', age: 0};
      const userProxy = createProxy(user) as User;
      expect('👀').assertEqual(userProxy.name)
      console.log('=====',userProxy.name);
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_1100
     * @tc.name builtinsProxyTest1100
     * @tc.desc test [1, 2, 3]splice(1, 0, 'a', 'b');
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsProxyTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      interface User {
        name: string|undefined|null;
        age: number;
        specialChar?: string;
        undefinedProp?: undefined;
      }
      const user: User =  { name: '\ud83d\udc46', age: 0};
      const userProxy = createProxy(user) as User;
      expect('\ud83d\udc46').assertEqual(userProxy.name)
      console.log('=====',userProxy.name);
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_1200
     * @tc.name builtinsProxyTest1200
     * @tc.desc test [1, 2, 3]splice(1, 0, '#','$');
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsProxyTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      interface User {
        name: string|undefined|null;
        age: number;
        specialChar?: string;
        undefinedProp?: undefined;
      }
      const user: User =  { name: '\ud83d', age: 0};
      const userProxy = createProxy(user) as User;
      expect(JSON.stringify('\ud83d')).assertEqual(JSON.stringify(userProxy.name))
      console.log('=====',userProxy.name);
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_1300
     * @tc.name builtinsProxyTest1300
     * @tc.desc test [1, 2, 3]splice(1, 0,undefined,'$');
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsProxyTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      interface User {
        name: string|undefined|null;
        age: number;
        specialChar?: string;
        undefinedProp?: undefined;
      }
      const user: User =  { name: 'NaN', age: 0};
      const userProxy = createProxy(user) as User;
      expect('NaN').assertEqual(userProxy.name)
      console.log('=====',userProxy.name);
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_1400
     * @tc.name builtinsProxyTest1400
     * @tc.desc test [1, 2, 3]splice(1, 0,'€', '©');
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsProxyTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      interface User {
        name: string|undefined|null;
        age: number;
        specialChar?: string;
        undefinedProp?: undefined;
      }
      const user: User =  { name: '0', age: 0};
      const userProxy = createProxy(user) as User;
      expect('0').assertEqual(userProxy.name)
      console.log('=====',userProxy.name);
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_1500
     * @tc.name builtinsProxyTest1500
     * @tc.desc test [1, 2, 3]splice(1, 0,'\udc04', '\ud83d');
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsProxyTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      interface User {
        name: string|undefined|null;
        age: number;
        specialChar?: string;
        undefinedProp?: undefined;
      }
      const user: User =  { name: treeString(100), age: 0};
      const userProxy = createProxy(user) as User;
      expect(userProxy.name?.length).assertEqual(113);
      console.log('=====',userProxy.name);
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_1600
     * @tc.name builtinsProxyTest1600
     * @tc.desc test [1, 2, 3]splice(1, 0,'\a', '\b');
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsProxyTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      interface User {
        name: string|undefined|null;
        age: number;
        specialChar?: string;
        undefinedProp?: undefined;
      }
      const user: User =  { name: treeString(88), age: 0};
      const userProxy = createProxy(user) as User;
      expect(userProxy.name?.length).assertEqual(97);
      console.log('=====',userProxy.name);
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_1700
     * @tc.name builtinsProxyTest1700
     * @tc.desc test [1, 2, 3]splice(1, 0,Math.floor(1.5), NaN);
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsProxyTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      interface User {
        name: string|undefined|null;
        age: number;
        specialChar?: string;
        undefinedProp?: undefined;
      }
      const user: User =  { name: treeString(80), age: 0};
      const userProxy = createProxy(user) as User;
      expect(userProxy.name?.length).assertEqual(89);
      console.log('=====',userProxy.name);
      Done()

    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SPLICE_TEST_1800
     * @tc.name builtinsProxyTest1800
     * @tc.desc test [1, 2, 3]splice(1, 0,Number.EPSILON, 0xcafebabe);
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsProxyTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      interface User {
        name: string|undefined|null;
        age: number;
        specialChar?: string;
        undefinedProp?: undefined;
      }
      const user: User =  { name:sliceString('{k1:value1,k2:value2}'),age:0};
      const userProxy = createProxy(user) as User;
      expect(userProxy.name).assertEqual('{');;
      Done()
    })

  })
}


