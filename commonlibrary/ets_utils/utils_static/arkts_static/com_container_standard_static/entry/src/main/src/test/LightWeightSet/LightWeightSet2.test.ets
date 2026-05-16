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
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Level,
  Size
} from '../../../../hypium/index';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import LightWeightSet from '@ohos.util.LightWeightSet';
import Utils from '../Util.test';

class C1 {
  name: string;
  age: string;

  constructor(name: string = "", age: string = "") {
    this.name = name;
    this.age = age;
  }
}

class C2 {
  name: string;

  constructor(name: string = "") {
    this.name = name;
  }
}

export default function LightWeightSetTest2() {
  describe('lightWeightSetTest2', (): void => {
    afterEach(() => {
      await Utils.msSleep(10)
    })
    /**
     * @tc.name   testLightWeightSet0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_0100
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0001";
      try {
        let lightWeightSet: LightWeightSet<number | string> = new LightWeightSet<number | string>();
        let result = lightWeightSet.isEmpty()
        expect(String(result)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_0200
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0002";
      try {
        let lightWeightSet: LightWeightSet<number | string> = new LightWeightSet<number | string>();
        lightWeightSet.add(1)
        lightWeightSet.add(2)
        lightWeightSet.add(3)
        let result = lightWeightSet.isEmpty()
        expect(String(result)).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_0300
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0003";
      try {
        let lightWeightSet: LightWeightSet<number | string> = new LightWeightSet<number | string>();
        lightWeightSet.add(3)
        lightWeightSet.remove(3)
        let result = lightWeightSet.isEmpty()
        expect(String(result)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_0400
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0004";
      try {
        let lightWeightSet: LightWeightSet<number | string> = new LightWeightSet<number | string>();
        lightWeightSet.add("a")
        lightWeightSet.add("b")
        lightWeightSet.add("c")
        lightWeightSet.clear()
        let result = lightWeightSet.isEmpty()
        expect(String(result)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_0500
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0005";
      try {
        let lightWeightSet: LightWeightSet<number | string> = new LightWeightSet<number | string>();
        const MY_MAX: number = 10240;
        let result = lightWeightSet.add(MY_MAX);
        expect(String(result)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_0600
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0006";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        let result = lightWeightSet.add("squirrel");
        expect(String(result)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_0700
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0007";
      try {
        let lightWeightSet: LightWeightSet<number> = new LightWeightSet<number>();
        const MY_MAX: number = 10240;
        lightWeightSet.add(MY_MAX);
        let set: LightWeightSet<number> = new LightWeightSet<number>();
        let result = set.addAll(set);
        expect(String(result)).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_0800
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0008";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        let set: LightWeightSet<string> = new LightWeightSet<string>();
        set.add("sparrow");
        let result = lightWeightSet.hasAll(set);
        expect(String(result)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_0900
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0009";
      try {
        let lightWeightSet: LightWeightSet<number> = new LightWeightSet<number>();
        lightWeightSet.add(123);
        let result = lightWeightSet.has(123);
        expect(String(result)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }

    })

    /**
     * @tc.name   testLightWeightSet0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_1200
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0012";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        let str: string = ''
        for (let index = 0; index < 10000; index++) {
          str.concat(index + '')
        }
        lightWeightSet.add(str);
        let result = lightWeightSet.has(str);
        expect(String(result)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });


    /**
     * @tc.name   testLightWeightSet0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_2000
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0020";
      try {
        let lightWeightSet: LightWeightSet<number> = new LightWeightSet<number>();
        lightWeightSet.increaseCapacityTo(10);
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_2100
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0021";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        let result = lightWeightSet.getIndexOf("sparrow");
        expect(String(result)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_2200
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0022";
      try {
        let lightWeightSet: LightWeightSet<object> = new LightWeightSet<object>();
        let a: C1 = {
          name: "Dylon", age: "13"
        };
        lightWeightSet.add(a);
        let result = lightWeightSet.getIndexOf(a);
        expect(String(result)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_2300
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0023";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        let age: string = ''
        lightWeightSet.add(age);
        let result = lightWeightSet.getIndexOf(age);
        expect(String(result)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_2600
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0026";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        lightWeightSet.add("squirrel2222222222222");
        lightWeightSet.add("sparrow33");
        let result1 = lightWeightSet.getIndexOf("squirrel2222222222222");
        let result = lightWeightSet.getIndexOf("sparrow33");
        expect(String(result)).assertEqual('1');
        expect(String(result1)).assertEqual('0');

      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_2700
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0027";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        let result = lightWeightSet.remove("sparrow");
        expect(result).assertEqual("sparrow");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_3000
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0030";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        let result = lightWeightSet.remove("88");
        expect(String(result)).assertEqual('undefined');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_3200
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0032";
      try {
        let lightWeightSet: LightWeightSet<number> = new LightWeightSet<number>();
        const MY_MAX: number = 1024000;
        lightWeightSet.add(MY_MAX);
        let result = lightWeightSet.remove(MY_MAX);
        expect(String(result)).assertEqual(String(MY_MAX));
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_3300
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0033";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        let result = lightWeightSet.removeAt(1);
        expect(String(result)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_3300
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0034";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        let result = lightWeightSet.removeAt(-1);
        expect(String(result)).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_3500
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0035";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        let result = lightWeightSet.removeAt(3);
        expect(String(result)).assertEqual('false');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_3600
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0036";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        let result = lightWeightSet.getValueAt(1);
        expect(result).assertEqual("squirrel");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_3700
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0037";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        let result = lightWeightSet.getValueAt(3);
        expect(String(result)).assertEqual('undefined');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_3800
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0038";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        let result = lightWeightSet.getValueAt(1);
        let result1 = lightWeightSet.getIndexOf("sparrow");
        expect(result).assertEqual("squirrel");
        expect(String(result1)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_3900
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0039";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        lightWeightSet.clear();
        let result = lightWeightSet.length;
        expect(String(result)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_3900
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0040";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        lightWeightSet.clear();
        let result = lightWeightSet.add("squirrel");
        expect(String(result)).assertEqual('true');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_4200
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0042";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        let result = lightWeightSet.toString(); // "sparrow,squirrel"
        console.log(JSON.stringify(result), 'result---toString----')
        expect(result).assertEqual("sparrow,squirrel");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_4300
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0043";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        let result = lightWeightSet.toString();
        expect(result).assertEqual("");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_440
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0044";
      try {
        let lightWeightSet = "null";
        let result = lightWeightSet.toString();
        expect(result).assertEqual("null");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_450
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0045";
      try {
        let lightWeightSet = "undefined";
        let result = lightWeightSet.toString();
        expect(result).assertEqual("undefined");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_4600
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0046";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("squirrel");
        let result = lightWeightSet.toString();
        expect(result).assertEqual("squirrel");
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_4700
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0047";
      try {
        let lightWeightSet: LightWeightSet<object> = new LightWeightSet<object>();
        let a: C1 = {
          name: "Dylon", age: "Dylon"
        };
        lightWeightSet.add(a);
        let result = lightWeightSet.toString();
        console.log(JSON.stringify(result), 'result-------')
        expect(JSON.stringify(lightWeightSet)).assertEqual('{"0":{"name":"Dylon","age":"Dylon"}}');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_4800
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0048";
      try {
        let lightWeightSet: LightWeightSet<number> = new LightWeightSet<number>();
        const MY_MAX: number = 1024000;
        lightWeightSet.add(MY_MAX);
        let result = lightWeightSet.toString();
        console.log(JSON.stringify(result), 'result-------')
        expect(result).assertEqual(MY_MAX + '');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_4900
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0049";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        let result = lightWeightSet.toArray();
        console.log(JSON.stringify(result), 'result-------') // ["sparrow","squirrel"]
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_5000
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0050";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        let result = lightWeightSet.toArray().length;
        expect(String(result)).assertEqual('0');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_5100
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0051";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("squirrel");
        let result = lightWeightSet.toArray();
        console.log(JSON.stringify(result), 'result-------') // ["squirrel"]
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    });

    /**
     * @tc.name   testLightWeightSet0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_5200
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0052";
      try {
        let lightWeightSet: LightWeightSet<object> = new LightWeightSet<object>();
        let a: C1 = {
          name: "Dylon", age: "Dylon"
        };
        lightWeightSet.add(a);
        let result = lightWeightSet.toArray();
        console.log(JSON.stringify(result), 'result-------') // [{"name":"Dylon","age":"Dylon"}]
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    })


    /**
     * @tc.name   testLightWeightSet0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_5300
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0053";
      try {
        let element = 0
        let lightWeightSet: LightWeightSet<number> = new LightWeightSet<number>();
        for (let index = 0; index < 1024; index++) {
          element = element += index;
        }
        lightWeightSet.add(element);
        let result = lightWeightSet.toArray();
        console.log(JSON.stringify(result), 'result-------') //[523776]
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   testLightWeightSet0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_5400
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0054";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        let iter = lightWeightSet.values();
        let index = 0;
        while (index < lightWeightSet.length) {
          console.log(JSON.stringify(iter.next().value), 'next----------');
          index++;
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   testLightWeightSet0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_5500
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0055";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        let iter = lightWeightSet.values();
        console.log(JSON.stringify(iter.next().value), 'next----------');
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   testLightWeightSet0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_5600
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0056";
      try {
        let element = ''
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        for (let index = 0; index < 100; index++) {
          element = element.concat('squirrel')
          lightWeightSet.add(element)
        }
        let iter = lightWeightSet.values();
        let index = 0;
        while (index < lightWeightSet.length) {
          console.log(JSON.stringify(iter.next().value), 'next----------');
          index++;
        }

      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   testLightWeightSet0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_5700
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0057";
      try {
        let lightWeightSet: LightWeightSet<number> = new LightWeightSet<number>();
        for (let index = 0; index < 1024; index++) {
          lightWeightSet.add(index++)
        }
        let iter = lightWeightSet.values();
        let index = 0;
        while (index < lightWeightSet.length) {
          console.log(JSON.stringify(iter.next().value), 'next----------');
          index++;
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    })


    /**
     * @tc.name   testLightWeightSet0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_5800
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0058";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        lightWeightSet.add("sparrow");
        lightWeightSet.add("gull");
        lightWeightSet.forEach((item ?: string, index ?: string) => {
          lightWeightSet.remove(item as string);
        });
        console.log(JSON.stringify(lightWeightSet), 'lightWeightSet-')
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   testLightWeightSet0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_5900
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0059";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        lightWeightSet.add("sparrow");
        lightWeightSet.add("gull");
        lightWeightSet.forEach((value ?: string, key ?: string) => {
          console.log("value:" + value, "key:" + key);
        });
        console.log(JSON.stringify(lightWeightSet), 'lightWeightSet-')
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   testLightWeightSet0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_5800
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0060";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        lightWeightSet.forEach((value ?: string, key ?: string) => {
          console.log("value:" + value, "key:" + key);
        });
        console.log(JSON.stringify(lightWeightSet), 'lightWeightSet-')
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   testLightWeightSet0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_6100
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0061";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        let iter = lightWeightSet.entries();
        let index = 0;
        while (index < lightWeightSet.length) {
          console.log(JSON.stringify(iter.next().value), 'iter.next====');
          index++;
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   testLightWeightSet0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_6200
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0062";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("squirrel");
        let iter = lightWeightSet.entries();
        let index = 0;
        while (index < lightWeightSet.length) {
          console.log(JSON.stringify(iter.next().value), 'iter.next====');
          index++;
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   testLightWeightSet0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_6300
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0063";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        let iter = lightWeightSet.entries();
        let index = 0;
        console.log(JSON.stringify(iter), 'iter.next====');
        while (index < lightWeightSet.length) {
          console.log(JSON.stringify(iter.next().value), 'iter.next====');
          index++;
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   testLightWeightSet0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_6400
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0064";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        let nums: Array<string> = lightWeightSet.toArray()
        for (let item of nums) {
          console.log("value:" + item);
        }

      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   testLightWeightSet0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_6500
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0065";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("sparrow");
        let iter = lightWeightSet.$_iterator();
        let temp: IteratorResult<string> = iter.next();
        while (!temp.done) {
          console.log("value:" + temp.value);
          temp = iter.next();
        }

      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   testLightWeightSet0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_6600
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0062";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        lightWeightSet.add("squirrel");
        lightWeightSet.add("squirrel");
        let iter = lightWeightSet.$_iterator().next();
        let index = 0;
        while (index < lightWeightSet.length) {
          console.log(JSON.stringify(iter.value), 'iter.next====');
          index++;
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   testLightWeightSet0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_6700
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0067";
      try {
        let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
        let iter = lightWeightSet.$_iterator().next();
        let index = 0;
        while (index < lightWeightSet.length) {
          console.log(JSON.stringify(iter.value), 'iter.next====');
          index++;
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   testLightWeightSet0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_6800
     * @tc.desc   Test the function foreach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0068";
      try {
        let lightWeightSet: LightWeightSet<number> = new LightWeightSet<number>();
        for (let i = 0; i < 10; i++) {
          lightWeightSet.add(i);
        }
        lightWeightSet.forEach(() => {
          expect(String(lightWeightSet.length)).assertEqual('10');
        });
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   testLightWeightSet0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_6900
     * @tc.desc   Test the function foreach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0069";
      try {
        let lightWeightSet: LightWeightSet<number> = new LightWeightSet<number>();
        for (let i = 0; i < 10; i++) {
          lightWeightSet.add(i);
        }
        lightWeightSet.forEach((value) => {
          expect(lightWeightSet.has(value)).assertTrue();
        });
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   testLightWeightSet0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_7000
     * @tc.desc   Test the function foreach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0070";
      try {
        let lightWeightSet: LightWeightSet<number> = new LightWeightSet<number>();
        for (let i = 0; i < 10; i++) {
          lightWeightSet.add(i);
        }
        lightWeightSet.forEach((value, index: number) => {
          expect(String(lightWeightSet.getIndexOf(value))).assertEqual(String(index));
        });
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   testLightWeightSet0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_7100
     * @tc.desc   Test the function foreach.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLightWeightSet0071";
      try {
        let lightWeightSet: LightWeightSet<number> = new LightWeightSet<number>();
        for (let i = 0; i < 10; i++) {
          lightWeightSet.add(i);
        }
        lightWeightSet.forEach((value, index: number, lightWeightSet: LightWeightSet<number>) => {
          expect(String(lightWeightSet.getIndexOf(value))).assertEqual(String(index));
        });
      } catch (err) {
        err = err as BusinessError;
        console.error(`${TAG} failed, error: ${err}`);
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   testLightWeightSet0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LIGHTWEIGHTSET_1710
     * @tc.desc   Test the function of the interface isEmpty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLightWeightSet0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let lightWeightSet: LightWeightSet<string> = new LightWeightSet<string>();
      expect(lightWeightSet.length).assertEqual(0);
      lightWeightSet.add("squirrel");
      lightWeightSet.add("squirrel");
      expect(lightWeightSet.length).assertEqual(1);
      lightWeightSet.add("sparrow");
      expect(lightWeightSet.length).assertEqual(2);
    });

  })
}

