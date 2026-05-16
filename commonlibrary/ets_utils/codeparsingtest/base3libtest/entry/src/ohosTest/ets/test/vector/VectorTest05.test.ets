import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Vector } from '@kit.ArkTS';

const sleep = (time: number): Promise<void> => {
  return new Promise<void>((resolve) => {
    setTimeout(resolve, time);
  });
};

export default function vectorTest05() {
  describe('VectorTest05', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
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
     * @tc.number    SUB_VECTOR_TEST05_0100
     * @tc.name      testVector05Chapter0001
     * @tc.desc      remove object({a:1, b:"test", c:[1,2,3]}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0001'
      let vector = new Vector<object>();

      class C1 {
        a: number = 1
        b: string = "test"
        c: Array<number> = [1, 2, 3]
      }

      let obj = new C1()
      vector.add(obj)
      vector.add({
        a: "hello world"
      })
      vector.add(obj)
      let result = vector.remove(obj)
      expect(result).assertEqual(true)
      expect(vector.length).assertEqual(2)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_0200
     * @tc.name      testVector05Chapter0002
     * @tc.desc      removeByRange number(existence index) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0002'
      let vector = new Vector<number>();
      vector.add(1)
      vector.add(2)
      vector.add(3)
      vector.removeByRange(0, 2)
      expect(vector[0]).assertEqual(3)
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_0300
     * @tc.name      testVector05Chapter0003
     * @tc.desc      removeByRange number(not exist index) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0003'
      try {
        let vector = new Vector<number>();
        vector.add(1)
        vector.removeByRange(1, 2)
        expect().assertFalse()
      } catch (err) {
        expect(err !== null).assertTrue()
      }
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_0400
     * @tc.name      testVector05Chapter0004
     * @tc.desc      removeByRange Int8Array([-128]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0004'
      let vector = new Vector<Int8Array>();
      let res1 = new Int8Array([-128])
      let res2 = new Int8Array([13])
      vector.add(res1)
      vector.add(res2)
      vector.removeByRange(0, 1)
      expect(vector[0]).assertEqual(res2)
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_0500
     * @tc.name      testVector05Chapter0005
     * @tc.desc      removeByRange Float32Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0005'
      let vector = new Vector<Float32Array>();
      let res1 = new Float32Array([Infinity])
      let res2 = new Float32Array([13])
      vector.add(res1)
      vector.add(res2)
      vector.removeByRange(0, 1)
      expect(vector[0]).assertEqual(res2)
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_0600
     * @tc.name      testVector05Chapter0006
     * @tc.desc      removeByRange Float32Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0006'
      let vector = new Vector<Float32Array>();
      let res1 = new Float32Array([-Infinity])
      let res2 = new Float32Array([13])
      vector.add(res1)
      vector.add(res2)
      vector.removeByRange(0, 1)
      expect(vector[0]).assertEqual(res2)
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_0700
     * @tc.name      testVector05Chapter0007
     * @tc.desc      removeByRange Float32Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0007'
      let vector = new Vector<Float32Array>();
      let res1 = new Float32Array([NaN])
      let res2 = new Float32Array([13])
      vector.add(res1)
      vector.add(res2)
      vector.removeByRange(0, 1)
      expect(vector[0]).assertEqual(res2)
      expect(vector.length).assertEqual(1)
    })


    /**
     * @tc.number    SUB_VECTOR_TEST05_0800
     * @tc.name      testVector05Chapter0008
     * @tc.desc      removeByRange string('👆') test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0008'
      let vector = new Vector<string>();
      let res1 = '👆';
      let res2 = '13';
      vector.add(res1)
      vector.add(res2)
      vector.removeByRange(0, 1)
      expect(vector[0]).assertEqual(res2)
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_0900
     * @tc.name      testVector05Chapter0009
     * @tc.desc      removeByRange number(0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0009'
      let vector = new Vector<number>();
      let res1 = 0;
      let res2 = 13;
      vector.add(res1)
      vector.add(res2)
      vector.removeByRange(0, 1)
      expect(vector[0]).assertEqual(res2)
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_1000
     * @tc.name      testVector05Chapter0010
     * @tc.desc      removeByRange boolean(true) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0010'
      let vector = new Vector<boolean>();
      let bool1 = true;
      let bool2 = false;
      vector.add(bool1)
      vector.add(bool2)
      vector.removeByRange(0, 1)
      expect(vector[0]).assertEqual(bool2)
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_1100
     * @tc.name      testVector05Chapter0011
     * @tc.desc      removeByRange Array(Contains non-numeric types) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0011'
      let vector = new Vector<Array<string | number | undefined | boolean>>();
      let arr1 = [72, "abc", true, null, undefined, 108]
      let arr2 = [13];
      vector.add(arr1)
      vector.add(arr2)
      vector.removeByRange(0, 1)
      expect(vector[0]).assertEqual(arr2)
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_1200
     * @tc.name      testVector05Chapter0012
     * @tc.desc      removeByRange object({a:1, b:"test", c:[1,2,3]}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0012'
      let vector = new Vector<object>();

      class C1 {
        a: number = 1
        b: string = "test"
        c: Array<number> = [1, 2, 3]
      }

      let obj = new C1()
      vector.add(obj)
      vector.add({ a: "hello world" })
      vector.removeByRange(0, 1)
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_1300
     * @tc.name      testVector05Chapter0013
     * @tc.desc      replaceAllElements value*2 test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0013'
      let vector = new Vector<number>();
      vector.add(1)
      vector.add(2)
      vector.replaceAllElements((value) => {
        return value * 2
      })
      expect(vector[0]).assertEqual(2)
      expect(vector[1]).assertEqual(4)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_1400
     * @tc.name      testVector05Chapter0014
     * @tc.desc      replaceAllElements Int8Array([-128]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0014'
      let vector = new Vector<Int8Array>();
      let res1 = new Int8Array([-128]);
      let res2 = new Int8Array([13]);
      vector.add(res1);
      vector.add(res2);
      vector.replaceAllElements((value) => {
        return value
      });
      expect(vector[0][0]).assertEqual(-128);
      expect(vector[1][0]).assertEqual(13);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_1500
     * @tc.name      testVector05Chapter0015
     * @tc.desc      replaceAllElements Float32Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0015'
      let vector = new Vector<Float32Array>();
      let res1 = new Float32Array([Infinity]);
      let res2 = new Float32Array([13]);
      vector.add(res1);
      vector.add(res2);
      vector.replaceAllElements((value) => {
        return value
      });
      expect(vector[0][0]).assertEqual(Infinity);
      expect(vector[1][0]).assertEqual(13);
    });

    /**
     * @tc.number    SUB_VECTOR_TEST05_1600
     * @tc.name      testVector05Chapter0016
     * @tc.desc      replaceAllElements Float32Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0016'
      let vector = new Vector<Float32Array>();
      let res1 = new Float32Array([-Infinity]);
      let res2 = new Float32Array([13]);
      vector.add(res1);
      vector.add(res2);
      vector.replaceAllElements((value) => {
        return value
      });
      expect(vector[0][0]).assertEqual(-Infinity);
      expect(vector[1][0]).assertEqual(13);
    });

    /**
     * @tc.number    SUB_VECTOR_TEST05_1700
     * @tc.name      testVector05Chapter0017
     * @tc.desc      replaceAllElements Float32Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0017'
      let vector = new Vector<Float32Array>();
      let res1 = new Float32Array([NaN]);
      let res2 = new Float32Array([13]);
      vector.add(res1);
      vector.add(res2);
      vector.replaceAllElements((value) => {
        return value
      });
      expect(isNaN(vector[0][0])).assertTrue(); // NaN 需用 isNaN 判断
      expect(vector[1][0]).assertEqual(13);
    });

    /**
     * @tc.number    SUB_VECTOR_TEST05_1800
     * @tc.name      testVector05Chapter0018
     * @tc.desc      replaceAllElements string('👆') test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0018'
      let vector = new Vector<string>();
      let res1 = '👆';
      let res2 = '13';
      vector.add(res1);
      vector.add(res2);
      vector.replaceAllElements((value) => {
        return value
      });
      expect(vector[0]).assertEqual('\ud83d\udc46');
      expect(vector[1]).assertEqual('13');
    });


    /**
     * @tc.number    SUB_VECTOR_TEST05_1900
     * @tc.name      testVector05Chapter0019
     * @tc.desc      replaceAllElements number(0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0019'
      let vector = new Vector<number>();
      let res1 = 0;
      let res2 = 13;
      vector.add(res1);
      vector.add(res2);
      vector.replaceAllElements((value) => {
        return value
      });
      expect(vector[0]).assertEqual(0);
      expect(vector[1]).assertEqual(13);
    });

    /**
     * @tc.number    SUB_VECTOR_TEST05_2000
     * @tc.name      testVector05Chapter0020
     * @tc.desc      replaceAllElements boolean(true) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0020'
      let vector = new Vector<boolean>();
      let res1 = true;
      let res2 = false;
      vector.add(res1);
      vector.add(res2);
      vector.replaceAllElements((value) => {
        return value
      });
      expect(vector[0]).assertEqual(true);
      expect(vector[1]).assertEqual(false);
    });

    /**
     * @tc.number    SUB_VECTOR_TEST05_2100
     * @tc.name      testVector05Chapter0021
     * @tc.desc      replaceAllElements Array(Contains non-numeric types) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0021'
      let vector = new Vector<Array<string | number | undefined | boolean>>();
      let arr1 = [72, "abc", true, null, undefined, 108]
      let arr2 = [13];
      vector.add(arr1);
      vector.add(arr2);
      vector.replaceAllElements((value) => {
        return value
      });
      expect(vector[0]).assertEqual(arr1);
      expect(vector[1]).assertEqual(arr2);
    });

    /**
     * @tc.number    SUB_VECTOR_TEST05_2200
     * @tc.name      testVector05Chapter0022
     * @tc.desc      replaceAllElements object({a:1, b:"test", c:[1,2,3]}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0022'
      let vector = new Vector<object>();

      class C1 {
        a: number = 1
        b: string = "test"
        c: Array<number> = [1, 2, 3]
      }

      let obj = new C1()
      vector.add(obj);
      vector.add({ a: "hello world" });
      vector.replaceAllElements((value) => {
        return value
      });
      expect(vector[0].a).assertEqual(1);
      expect(vector[0].b).assertEqual("test");
      expect((vector[0].c)[0]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_VECTOR_TEST05_2300
     * @tc.name      testVector05Chapter0023
     * @tc.desc      forEach Int8Array([-128]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0023'
      let vector = new Vector<Int8Array>();
      let res1=new Int8Array([-128])
      vector.add(res1);
      vector.forEach((value) => {
        expect(value).assertEqual(res1);
      });
    })


    /**
     * @tc.number    SUB_VECTOR_TEST05_2400
     * @tc.name      testVector05Chapter0024
     * @tc.desc      forEach Float32Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0024'
      let vector = new Vector<Float32Array>();
      let res1 = new Float32Array([Infinity]);
      vector.add(res1);
      vector.forEach((value) => {
        expect(value[0]).assertEqual(Infinity);
      });
    });

    /**
     * @tc.number    SUB_VECTOR_TEST05_2500
     * @tc.name      testVector05Chapter0025
     * @tc.desc      forEach Float32Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0025'
      let vector = new Vector<Float32Array>();
      let res1 = new Float32Array([-Infinity]);
      vector.add(res1);
      vector.forEach((value) => {
        expect(value[0]).assertEqual(-Infinity);
      });
    });

    /**
     * @tc.number    SUB_VECTOR_TEST05_2600
     * @tc.name      testVector05Chapter0026
     * @tc.desc      forEach Float32Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0026'
      let vector = new Vector<Float32Array>();
      let res1 = new Float32Array([NaN]);
      vector.add(res1);
      vector.forEach((value) => {
        expect(isNaN(value[0])).assertTrue();
      });
    });

    /**
     * @tc.number    SUB_VECTOR_TEST05_2700
     * @tc.name      testVector05Chapter0027
     * @tc.desc      forEach string("!"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~") test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0027'
      let vector = new Vector<string>();
      let res1 = '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
      vector.add(res1);
      vector.forEach((value) => {
        expect(value).assertEqual('!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~');
      });
    });

    /**
     * @tc.number    SUB_VECTOR_TEST05_2800
     * @tc.name      testVector05Chapter0028
     * @tc.desc      forEach number(0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0028'
      let vector = new Vector<number>();
      let res1 = 0;
      vector.add(res1);
      vector.forEach((value) => {
        expect(value).assertEqual(0);
      });
    });

    /**
     * @tc.number    SUB_VECTOR_TEST05_2900
     * @tc.name      testVector05Chapter0029
     * @tc.desc      forEach boolean(true) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0029'
      let vector = new Vector<boolean>();
      let res1 = true;
      vector.add(res1);
      vector.forEach((value) => {
        expect(value).assertEqual(true);
      });
    });

    /**
     * @tc.number    SUB_VECTOR_TEST05_3000
     * @tc.name      testVector05Chapter0030
     * @tc.desc      forEach Array(Contains non-numeric types) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0030'
      let vector = new Vector<Array<string | number | undefined | boolean>>();
      let arr1 = [72, "abc", true, null, undefined, 108]
      vector.add(arr1);
      vector.forEach((value) => {
        expect(value).assertEqual(arr1);
      });
    });

    /**
     * @tc.number    SUB_VECTOR_TEST05_3100
     * @tc.name      testVector05Chapter0031
     * @tc.desc      forEach object({a:1, b:"test", c:[1,2,3]}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0031'
      let vector = new Vector<object>();

      class C1 {
        a: number = 1
        b: string = "test"
        c: Array<number> = [1, 2, 3]
      }

      let obj = new C1()
      vector.add(obj);
      vector.forEach((value) => {
        expect((value as C1).a).assertEqual(1);
        expect((value as C1).b).assertEqual("test");
      });
    });

    /**
     * @tc.number    SUB_VECTOR_TEST05_3200
     * @tc.name      testVector05Chapter0032
     * @tc.desc      sort number test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0032'
      let vector = new Vector<number>();
      vector.add(3)
      vector.add(2)
      vector.add(1)
      vector.sort((first, second) => first - second)
      expect(vector[0]).assertEqual(1)
      expect(vector[1]).assertEqual(2)
      expect(vector[2]).assertEqual(3)
    });

    /**
     * @tc.number    SUB_VECTOR_TEST05_3300
     * @tc.name      testVector05Chapter0033
     * @tc.desc      sort Int8Array([-128]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0033'
      let vector = new Vector<Int8Array>();
      let res1 = new Int8Array([-128]) //小于13
      let res2 = new Int8Array([13])
      vector.add(res1)
      vector.add(res2)
      vector.sort((first, second) => second[0] - first[0]) //换位置
      expect(vector[0]).assertEqual(res2)
      expect(vector[1]).assertEqual(res1)
    });

    /**
     * @tc.number    SUB_VECTOR_TEST05_3400
     * @tc.name      testVector05Chapter0034
     * @tc.desc      sort Float32Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0034'
      let vector = new Vector<Float32Array>();
      let res1 = new Float32Array([Infinity]); // 无穷大
      let res2 = new Float32Array([1e38]); // 对比值
      vector.add(res1);
      vector.add(res2);
      vector.sort((first, second) => second[0] - first[0]); // 降序排序
      expect(vector[0]).assertEqual(res1);
      expect(vector[1]).assertEqual(res2);
    });

    /**
     * @tc.number    SUB_VECTOR_TEST05_3500
     * @tc.name      testVector05Chapter0035
     * @tc.desc      sort Float32Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0035'
      let vector = new Vector<Float32Array>();
      let res1 = new Float32Array([-Infinity]); // 负无穷大
      let res2 = new Float32Array([-1e38]); // 对比值
      vector.add(res1);
      vector.add(res2);
      vector.sort((first, second) => first[0] - second[0]); // 升序排序
      expect(vector[0]).assertEqual(res1);
      expect(vector[1]).assertEqual(res2);
    });

    /**
     * @tc.number    SUB_VECTOR_TEST05_3600
     * @tc.name      testVector05Chapter0036
     * @tc.desc      sort Float32Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0036'
      let vector = new Vector<Float32Array>();
      let res1 = new Float32Array([NaN]); // NaN
      let res2 = new Float32Array([0]); // 对比值
      vector.add(res1);
      vector.add(res2);
      vector.sort((first, second) => first[0] - second[0]);
      expect(vector[0]).assertEqual(res1);
      expect(vector[1]).assertEqual(res2);
    });

    /**
     * @tc.number    SUB_VECTOR_TEST05_3700
     * @tc.name      testVector05Chapter0037
     * @tc.desc      sort string(emoji) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0037'
      let vector = new Vector<string>();
      let res1 = '👆'; // 手指 emoji
      let res2 = '👿'; // 恶魔 emoji
      vector.add(res1);
      vector.add(res2);
      // 按 Unicode 编码排序
      vector.sort((a, b) => a.localeCompare(b));
      expect(vector[0]).assertEqual(res1);
      expect(vector[1]).assertEqual(res2);
    });

    /**
     * @tc.number    SUB_VECTOR_TEST05_3800
     * @tc.name      testVector05Chapter0038
     * @tc.desc      sort number(-0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0038'
      let vector = new Vector<number>();
      let res1 = -0;
      let res2 = 0;
      vector.add(res1);
      vector.add(res2);
      // -0 和 0 数值相等，排序后顺序不变
      vector.sort((a, b) => a - b);
      expect(vector[0]).assertEqual(res1);
      expect(vector[1]).assertEqual(res2);
    });

    /**
     * @tc.number    SUB_VECTOR_TEST05_3900
     * @tc.name      testVector05Chapter0039
     * @tc.desc      sort boolean(!'s') test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0039'
      let vector = new Vector<boolean>();
      let res1 = !'s'; // false
      let res2 = !0; // true
      vector.add(res1);
      vector.add(res2);
      vector.sort((a, b) => Number(a) - Number(b));
      expect(vector[0]).assertEqual(res1);
      expect(vector[1]).assertEqual(res2);
    });


    /**
     * @tc.number    SUB_VECTOR_TEST05_4000
     * @tc.name      testVector05Chapter0040
     * @tc.desc      sort Array(non-numeric types) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0040'
      let vector = new Vector<Array<string | number | undefined | boolean>>();
      let res1 = [72, "abc", true, null, undefined, 108];
      let res2 = [1, "def", false, null, undefined, 2];
      vector.add(res1);
      vector.add(res2);
      vector.sort((a, b) => a.length - b.length);
      expect(vector[0]).assertEqual(res1);
      expect(vector[1]).assertEqual(res2);
    });

    /**
     * @tc.number    SUB_VECTOR_TEST05_4100
     * @tc.name      testVector05Chapter0041
     * @tc.desc      sort object(with nested props) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0041'
      let vector = new Vector<object>();

      class C1 {
        a: number = 1
        b: string = "test"
        c: Array<number> = [1, 2, 3]
      }

      class C2 {
        a: number = 2
        b: string = "demo"
        c: Array<number> = [4, 5, 6]
      }

      let res1 = new C1();
      let res2 = new C2();
      vector.add(res1);
      vector.add(res2);
      vector.sort((a, b) => (a as C1).a - (b as C2).a);
      expect(vector[0]).assertEqual(res1);
      expect(vector[1]).assertEqual(res2);
    });

    /**
     * @tc.number    SUB_VECTOR_TEST05_4200
     * @tc.name      testVector05Chapter0042
     * @tc.desc      subVector test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0042'
      let vector = new Vector<number>();
      vector.add(1);
      vector.add(2);
      vector.add(3);
      let result = vector.subVector(0, 2)
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_4300
     * @tc.name      testVector05Chapter0043
     * @tc.desc      subVector Int8Array([-128]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0043'
      let vector = new Vector<Int8Array>();
      let res1 = new Int8Array([-128]);
      let res2 = new Int8Array([13]);
      vector.add(res1);
      vector.add(res2);
      let result = vector.subVector(0, 1)
      expect(result[0]).assertEqual(res1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_4400
     * @tc.name      testVector05Chapter0044
     * @tc.desc      subVector Float32Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0044'
      let vector = new Vector<Float32Array>();
      let res1 = new Float32Array([Infinity]); // 无穷大
      let res2 = new Float32Array([1e38]); // 对比值
      vector.add(res1);
      vector.add(res2);
      let result = vector.subVector(0, 1);
      expect(result[0]).assertEqual(res1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_4500
     * @tc.name      testVector05Chapter0045
     * @tc.desc      subVector Float32Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0045'
      let vector = new Vector<Float32Array>();
      let res1 = new Float32Array([-Infinity]); // 负无穷大
      let res2 = new Float32Array([-1e38]); // 对比值
      vector.add(res1);
      vector.add(res2);
      let result = vector.subVector(0, 1);
      expect(result[0]).assertEqual(res1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_4600
     * @tc.name      testVector05Chapter0046
     * @tc.desc      subVector Float32Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0046'
      let vector = new Vector<Float32Array>();
      let res1 = new Float32Array([NaN]); // NaN
      let res2 = new Float32Array([0]); // 对比值
      vector.add(res1);
      vector.add(res2);
      let result = vector.subVector(0, 1);
      expect(result[0]).assertEqual(res1);
    })


    /**
     * @tc.number    SUB_VECTOR_TEST05_4700
     * @tc.name      testVector05Chapter0047
     * @tc.desc      subVector string(emoji) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0047'
      let vector = new Vector<string>();
      let res1 = '👆'; // 手指 emoji
      let res2 = '👿'; // 恶魔 emoji
      vector.add(res1);
      vector.add(res2);
      let result = vector.subVector(0, 1);
      expect(result[0]).assertEqual(res1);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_VECTOR_TEST05_4800
     * @tc.name      testVector05Chapter0048
     * @tc.desc      subVector number(2**53-1) test (max safe integer)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0048'
      let vector = new Vector<number>();
      let res1 = 2**53 - 1; // 最大安全整数
      let res2 = 2**53; // 超出安全整数范围
      vector.add(res1);
      vector.add(res2);
      let result = vector.subVector(0, 1);
      expect(result[0]).assertEqual(res1);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_VECTOR_TEST05_4900
     * @tc.name      testVector05Chapter0049
     * @tc.desc      subVector boolean(!'s') test (false)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0049'
      let vector = new Vector<boolean>();
      let res1 = !'s'; // false
      let res2 = !0; // true
      vector.add(res1);
      vector.add(res2);
      let result = vector.subVector(0, 1);
      expect(result[0]).assertEqual(res1);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_VECTOR_TEST05_5000
     * @tc.name      testVector05Chapter0050
     * @tc.desc      subVector Array(with NaN/Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0050'
      let vector = new Vector<Array<number>>();
      let res1 = [72, 101, NaN, Infinity, 108, 111];
      let res2 = [1, 2, 3, 4, 5];
      vector.add(res1);
      vector.add(res2);
      let result = vector.subVector(0, 1);
      expect(result[0]).assertEqual(res1);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_VECTOR_TEST05_5100
     * @tc.name      testVector05Chapter0051
     * @tc.desc      subVector object(with nested props) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0051'
      let vector = new Vector<object>();

      class C1 {
        a: number = 1;
        b: string = "test";
        c: Array<number> = [1, 2, 3]
      }

      class C2 {
        a: number = 2;
        b: string = "demo";
        c: Array<number> = [4, 5, 6]
      }

      let res1 = new C1();
      let res2 = new C2();
      vector.add(res1);
      vector.add(res2);
      let result = vector.subVector(0, 1);
      expect(result[0]).assertEqual(res1);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_VECTOR_TEST05_5200
     * @tc.name      testVector05Chapter0052
     * @tc.desc      clear Int8Array([-128]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0052'
      let vector = new Vector<Int8Array>();
      vector.add(new Int8Array([-128]));
      vector.clear();
      expect(vector.length).assertEqual(0);
    })


    /**
     * @tc.number    SUB_VECTOR_TEST05_5300
     * @tc.name      testVector05Chapter0053
     * @tc.desc      clear Float32Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0053'
      let vector = new Vector<Float32Array>();
      vector.add(new Float32Array([Infinity]));
      vector.clear();
      expect(vector.length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_5400
     * @tc.name      testVector05Chapter0054
     * @tc.desc      clear Float32Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0054'
      let vector = new Vector<Float32Array>();
      vector.add(new Float32Array([-Infinity]));
      vector.clear();
      expect(vector.length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_5500
     * @tc.name      testVector05Chapter0055
     * @tc.desc      clear Float32Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0055'
      let vector = new Vector<Float32Array>();
      vector.add(new Float32Array([NaN]));
      vector.clear();
      expect(vector.length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_5600
     * @tc.name      testVector05Chapter0056
     * @tc.desc      clear string("!"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~") test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0056'
      let vector = new Vector<string>();
      vector.add('!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~');
      vector.clear();
      expect(vector.length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_5700
     * @tc.name      testVector05Chapter0057
     * @tc.desc      clear number(0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0057'
      let vector = new Vector<number>();
      vector.add(0);
      vector.clear();
      expect(vector.length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_5800
     * @tc.name      testVector05Chapter0058
     * @tc.desc      clear boolean(true) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0058'
      let vector = new Vector<boolean>();
      vector.add(true);
      vector.clear();
      expect(vector.length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_5900
     * @tc.name      testVector05Chapter0059
     * @tc.desc      clear Array(Contains non-numeric types) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0059'
      let vector = new Vector<Array<string | number | undefined | boolean>>();
      vector.add([72, "abc", true, null, undefined, 108]);
      vector.clear();
      expect(vector.length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_6000
     * @tc.name      testVector05Chapter0060
     * @tc.desc      clear object({a:1, b:"test", c:[1,2,3]}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0060'
      let vector = new Vector<object>();

      class C1 {
        a: number = 1;
        b: string = "test";
        c: Array<number> = [1, 2, 3]
      }

      vector.add(new C1());
      vector.clear();
      expect(vector.length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_6100
     * @tc.name      testVector05Chapter0061
     * @tc.desc      clone number test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0061'
      let vector = new Vector<number>();
      vector.add(1);
      let vectorClone = vector.clone();
      vector.add(2)
      expect(vector[0]).assertEqual(vectorClone[0]);
      expect(vector!==vectorClone).assertTrue()
      expect(vectorClone.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_6200
     * @tc.name      testVector05Chapter0062
     * @tc.desc      clone Int8Array([-128]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0062'
      let vector = new Vector<Int8Array>();
      let res = new Int8Array([-128]);
      vector.add(res);
      let vectorClone = vector.clone();
      vector.add(new Int8Array([13]));
      expect(vectorClone[0]).assertEqual(res);
      expect(vector[0]).assertEqual(vectorClone[0]);
      expect(vector!==vectorClone).assertTrue()
      expect(vectorClone.length).assertEqual(1);
    })


    /**
     * @tc.number    SUB_VECTOR_TEST05_6300
     * @tc.name      testVector05Chapter0063
     * @tc.desc      clone Float32Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0063'
      let vector = new Vector<Float32Array>();
      let res = new Float32Array([Infinity]);
      vector.add(res);
      let vectorClone = vector.clone();
      vector.add(new Float32Array([13]));
      expect(vectorClone[0]).assertEqual(res);
      expect(vector[0]).assertEqual(vectorClone[0]);
      expect(vector !== vectorClone).assertTrue()
      expect(vectorClone.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_6400
     * @tc.name      testVector05Chapter0064
     * @tc.desc      clone Float32Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0064'
      let vector = new Vector<Float32Array>();
      let res = new Float32Array([-Infinity]);
      vector.add(res);
      let vectorClone = vector.clone();
      vector.add(new Float32Array([13]));
      expect(vectorClone[0]).assertEqual(res);
      expect(vector[0]).assertEqual(vectorClone[0]);
      expect(vector !== vectorClone).assertTrue()
      expect(vectorClone.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_6500
     * @tc.name      testVector05Chapter0065
     * @tc.desc      clone Float32Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0065'
      let vector = new Vector<Float32Array>();
      let res = new Float32Array([NaN]);
      vector.add(res);
      let vectorClone = vector.clone();
      vector.add(new Float32Array([13]));
      // NaN 不能直接用 assertEqual，需特殊处理
      expect(vectorClone[0][0]).assertNaN();
      expect(vector[0][0]).assertNaN();
      expect(vector !== vectorClone).assertTrue()
      expect(vectorClone.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_6600
     * @tc.name      testVector05Chapter0066
     * @tc.desc      clone string('👆') test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0066'
      let vector = new Vector<string>();
      let res = '👆';
      vector.add(res);
      let vectorClone = vector.clone();
      vector.add("test");
      expect(vectorClone[0]).assertEqual(res);
      expect(vector[0]).assertEqual(vectorClone[0]);
      expect(vector !== vectorClone).assertTrue()
      expect(vectorClone.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_6700
     * @tc.name      testVector05Chapter0067
     * @tc.desc      clone number(0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0067'
      let vector = new Vector<number>();
      let res = 0;
      vector.add(res);
      let vectorClone = vector.clone();
      vector.add(13);
      expect(vectorClone[0]).assertEqual(res);
      expect(vector[0]).assertEqual(vectorClone[0]);
      expect(vector !== vectorClone).assertTrue()
      expect(vectorClone.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_6800
     * @tc.name      testVector05Chapter0068
     * @tc.desc      clone boolean(true) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0068'
      let vector = new Vector<boolean>();
      let res = true;
      vector.add(res);
      let vectorClone = vector.clone();
      vector.add(false);
      expect(vectorClone[0]).assertEqual(res);
      expect(vector[0]).assertEqual(vectorClone[0]);
      expect(vector !== vectorClone).assertTrue()
      expect(vectorClone.length).assertEqual(1);
    })


    /**
     * @tc.number    SUB_VECTOR_TEST05_6900
     * @tc.name      testVector05Chapter0069
     * @tc.desc      clone Array(special array with props) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0069'
      let vector = new Vector<Array<number>>();
      let res: Array<number> = [];
      res["abc"] = 111;
      res["aaa"] = 72;
      vector.add(res);
      let vectorClone = vector.clone();
      vector.add([13]);
      expect(vectorClone[0]).assertEqual(res);
      expect(vector[0]).assertEqual(vectorClone[0]);
      expect(vector !== vectorClone).assertTrue()
      expect(vectorClone.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_7000
     * @tc.name      testVector05Chapter0070
     * @tc.desc      clone object({a:1, b:"test", c:[1,2,3]}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0070'
      let vector = new Vector<object>();

      class C1 {
        a: number = 1;
        b: string = "test";
        c: Array<number> = [1, 2, 3]
      }

      let res = new C1();
      vector.add(res);
      let vectorClone = vector.clone();
      vector.add({ a: 13 });
      expect(vectorClone[0]).assertEqual(res);
      expect(vector[0]).assertEqual(vectorClone[0]);
      expect(vector !== vectorClone).assertTrue()
      expect(vectorClone.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_7100
     * @tc.name      testVector05Chapter0071
     * @tc.desc      getCapacity number test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0071'
      let vector = new Vector<number>();
      vector.add(1)
      let res1 = vector.getCapacity();
      for (let i = 0; i < 10; i++) {
        vector.add(i)
      }
      let res2 = vector.getCapacity();
      expect(res1).assertEqual(10);
      expect(res2).assertEqual(20);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_7200
     * @tc.name      testVector05Chapter0072
     * @tc.desc      getCapacity Int8Array([-128]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0072'
      let vector = new Vector<Int8Array>();
      let int8Arr = new Int8Array([-128]);
      vector.add(int8Arr);
      let length = vector.length;
      let capacity = vector.getCapacity();
      expect(capacity >= length).assertTrue();
      expect(length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_7300
     * @tc.name      testVector05Chapter0073
     * @tc.desc      getCapacity Float32Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0073'
      let vector = new Vector<Float32Array>();
      let float32Arr = new Float32Array([Infinity]);
      vector.add(float32Arr);
      let length = vector.length;
      let capacity = vector.getCapacity();
      expect(capacity >= length).assertTrue();
      expect(length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_7400
     * @tc.name      testVector05Chapter0074
     * @tc.desc      getCapacity Float32Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0074'
      let vector = new Vector<Float32Array>();
      let float32Arr = new Float32Array([-Infinity]);
      vector.add(float32Arr);
      let length = vector.length;
      let capacity = vector.getCapacity();
      expect(capacity >= length).assertTrue();
      expect(length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_7500
     * @tc.name      testVector05Chapter0075
     * @tc.desc      getCapacity Float32Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0075'
      let vector = new Vector<Float32Array>();
      let float32Arr = new Float32Array([NaN]);
      vector.add(float32Arr);
      let length = vector.length;
      let capacity = vector.getCapacity();
      expect(capacity >= length).assertTrue();
      expect(length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_7600
     * @tc.name      testVector05Chapter0076
     * @tc.desc      getCapacity string("") test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0076';
      let vector = new Vector<string>();
      vector.add("");
      let length = vector.length;
      let capacity = vector.getCapacity();
      expect(capacity >= length).assertTrue();
      expect(length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_7700
     * @tc.name      testVector05Chapter0077
     * @tc.desc      getCapacity number(0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0077';
      let vector = new Vector<number>();
      vector.add(0);
      let length = vector.length;
      let capacity = vector.getCapacity();
      expect(capacity >= length).assertTrue();
      expect(length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_7800
     * @tc.name      testVector05Chapter0078
     * @tc.desc      getCapacity boolean(true) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0078';
      let vector = new Vector<boolean>();
      vector.add(true);
      let length = vector.length;
      let capacity = vector.getCapacity();
      expect(capacity >= length).assertTrue();
      expect(length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_7900
     * @tc.name      testVector05Chapter0079
     * @tc.desc      getCapacity Array(has NaN/Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0079';
      let vector = new Vector<Array<number>>();
      vector.add([72, 101, NaN, Infinity, 108, 111]);
      let length = vector.length;
      let capacity = vector.getCapacity();
      expect(capacity >= length).assertTrue();
      expect(length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_8000
     * @tc.name      testVector05Chapter0080
     * @tc.desc      getCapacity object({a:1, b:"test", c:[1,2,3]}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0080';
      let vector = new Vector<object>();

      class C1 {
        a: number = 1;
        b: string = "test";
        c: Array<number> = [1, 2, 3]
      }

      vector.add(new C1());
      let length = vector.length;
      let capacity = vector.getCapacity();
      expect(capacity >= length).assertTrue();
      expect(length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_8100
     * @tc.name      testVector05Chapter0081
     * @tc.desc      convertToArray number test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0081';
      let vector = new Vector<number>();
      vector.add(1);
      vector.add(2);
      let arr = vector.convertToArray();
      expect(Array.isArray(arr)).assertTrue();
      expect(arr.length).assertEqual(vector.length);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(vector.get(i));
      }
      arr[0] = 100
      expect(vector[0]).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_8200
     * @tc.name      testVector05Chapter0082
     * @tc.desc      convertToArray Int8Array([-128]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0082';
      let vector = new Vector<Int8Array>();
      let res = new Int8Array([-128]);
      vector.add(res);
      let arr = vector.convertToArray();
      expect(Array.isArray(arr)).assertTrue();
      expect(arr.length).assertEqual(vector.length);
      expect(arr[0]).assertEqual(vector.get(0));
      arr[0] = new Int8Array([13])
      expect(vector[0]).assertEqual(res)
    })


    /**
     * @tc.number    SUB_VECTOR_TEST05_8300
     * @tc.name      testVector05Chapter0083
     * @tc.desc      convertToArray Float32Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0083';
      let vector = new Vector<Float32Array>();
      let res = new Float32Array([Infinity]);
      vector.add(res);
      let arr = vector.convertToArray();
      expect(Array.isArray(arr)).assertTrue();
      expect(arr.length).assertEqual(vector.length);
      expect(arr[0]).assertEqual(vector.get(0));
      arr[0] = new Float32Array([13])
      expect(vector[0]).assertEqual(res)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_8400
     * @tc.name      testVector05Chapter0084
     * @tc.desc      convertToArray Float32Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0084';
      let vector = new Vector<Float32Array>();
      let res = new Float32Array([-Infinity]);
      vector.add(res);
      let arr = vector.convertToArray();
      expect(Array.isArray(arr)).assertTrue();
      expect(arr.length).assertEqual(vector.length);
      expect(arr[0]).assertEqual(vector.get(0));
      arr[0] = new Float32Array([13])
      expect(vector[0]).assertEqual(res)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_8500
     * @tc.name      testVector05Chapter0085
     * @tc.desc      convertToArray Float32Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0085';
      let vector = new Vector<Float32Array>();
      let res = new Float32Array([NaN]);
      vector.add(res);
      let arr = vector.convertToArray();
      expect(Array.isArray(arr)).assertTrue();
      expect(arr.length).assertEqual(vector.length);
      expect(arr[0]).assertEqual(vector.get(0));
      arr[0] = new Float32Array([13])
      expect(vector[0]).assertEqual(res)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_8600
     * @tc.name      testVector05Chapter0086
     * @tc.desc      convertToArray string("!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~") test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0086';
      let vector = new Vector<string>();
      let res = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      vector.add(res);
      let arr = vector.convertToArray();
      expect(Array.isArray(arr)).assertTrue();
      expect(arr.length).assertEqual(vector.length);
      expect(arr[0]).assertEqual(vector.get(0));
      arr[0] = "test"
      expect(vector[0]).assertEqual(res)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_8700
     * @tc.name      testVector05Chapter0087
     * @tc.desc      convertToArray number(0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0087';
      let vector = new Vector<number>();
      let res = 0;
      vector.add(res);
      let arr = vector.convertToArray();
      expect(Array.isArray(arr)).assertTrue();
      expect(arr.length).assertEqual(vector.length);
      expect(arr[0]).assertEqual(vector.get(0));
      arr[0] = 13
      expect(vector[0]).assertEqual(res)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_8800
     * @tc.name      testVector05Chapter0088
     * @tc.desc      convertToArray boolean(true) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0088';
      let vector = new Vector<boolean>();
      let res = true;
      vector.add(res);
      let arr = vector.convertToArray();
      expect(Array.isArray(arr)).assertTrue();
      expect(arr.length).assertEqual(vector.length);
      expect(arr[0]).assertEqual(vector.get(0));
      arr[0] = false
      expect(vector[0]).assertEqual(res)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST05_8900
     * @tc.name      testVector05Chapter0089
     * @tc.desc      convertToArray Array(special array with props) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector05Chapter0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector05Chapter0089';
      let vector = new Vector<Array<number>>();
      let res: Array<number> = [];
      res["abc"] = 111;
      res["aaa"] = 72;
      vector.add(res);
      let arr = vector.convertToArray();
      expect(Array.isArray(arr)).assertTrue();
      expect(arr.length).assertEqual(vector.length);
      expect(arr[0]).assertEqual(vector.get(0));
      arr[0] = [13]
      expect(vector[0]).assertEqual(res)
    })


  })
}