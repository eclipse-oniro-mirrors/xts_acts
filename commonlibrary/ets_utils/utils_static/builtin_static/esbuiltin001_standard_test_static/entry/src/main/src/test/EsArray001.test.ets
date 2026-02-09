/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import hilog from '@ohos.hilog'
import Utils from './Util.test';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
class A {}
class A_bool {
    toString1 = (): boolean => {
        return true;
    }
}
class A_num {
    toString1 = (): number => {
        return 0;
    }
}
class A_str {
    toString1 = (): string => {
        return '';
    }
}
class A_und {
    toString1 = (): undefined => {
        return undefined;
    }
}

class A_null {
    toString1 = (): null => {
        return null;
    }
}

class A_nan {
    toString1 = (): number => {
        return NaN;
    }
}
type FuncType = (val: number, idx: int, obj: Array<number>) => boolean;
export async function sleep(time: int): Promise<int> {
    return new Promise<int>((resolve, reject) => {
        setTimeout(() => {
            resolve(0);
        }, time);
    });
}

let originalArray: number[] = [0, 1, -2, 4, -8, 16];
let array: number[] = [0, 1, -2, 4, -8, 16];
let arrayIndex = -1;
function mapFn(value: number, index: int): number {
    arrayIndex++;
    expect(value).assertEqual(array[arrayIndex]);
    expect(index).assertEqual(arrayIndex);
    array.splice((array.length - 1), 1);
    return 127;
}

export default function EsArrayTest001(){
    describe('EsArrayTest001', ():void => {
        // Defines a test suite. Two parameters are supported: test suite name and test suite function.
        beforeAll(():void => {
            // Presets an action, which is performed only once before all test cases of the test suite start.
            // This API supports only one parameter: preset action function.
        })
        beforeEach(async ():Promise<void> => {
            await sleep(10);
            // Presets an action, which is performed before each unit test case starts.
            // The number of execution times is the same as the number of test cases defined by **it**.
            // This API supports only one parameter: preset action function.
        })
        afterEach(():void => {
            // Presets a clear action, which is performed after each unit test case ends.
            // The number of execution times is the same as the number of test cases defined by **it**.
            // This API supports only one parameter: clear action function.
        })
        afterAll(():void => {
            // Presets a clear action, which is performed after all test cases of the test suite end.
            // This API supports only one parameter: clear action function.
        })

        /**
         * @tc.number ES_BUILTINS_ARRAY_0001
         * @tc.name ESBuiltinsArrayTest0001
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0001';
            console.info(`${caseName}, test start`);
            let a = Array.from(array, mapFn);
            expect(a.length).assertEqual(originalArray.length / 2);
            for (let j = 0; j < originalArray.length / 2; j++) {
                expect(a[j]).assertEqual(127);
            }
            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0002
         * @tc.name ESBuiltinsArrayTest0002
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0002';
            console.info(`${caseName}, test start`);
            let array: Array<number | string> = [0, 'foo', 1, Infinity];
            let result = Array.from(array);

            expect(result.length).assertEqual(4);
            expect(result[0]).assertEqual(0);
            expect(result[1]).assertEqual('foo');
            expect(result[2]).assertEqual(1);
            expect(result[3]).assertEqual(Infinity);

            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0003
         * @tc.name ESBuiltinsArrayTest0003
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0003';
            console.info(`${caseName}, test start`);
            let arrLikeSource = 'Test';
            let result = Array.from(arrLikeSource);

            expect(result.length).assertEqual(4);
            expect(result[0]).assertEqual('T');
            expect(result[1]).assertEqual('e');
            expect(result[2]).assertEqual('s');
            expect(result[3]).assertEqual('t');

            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0004
         * @tc.name ESBuiltinsArrayTest0004
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0004';
            console.info(`${caseName}, test start`);
            let array = [Number.MAX_VALUE, Number.MIN_VALUE, Number.NaN, Number.NEGATIVE_INFINITY, Number.POSITIVE_INFINITY];
            let a = Array.from(array);

            expect(a.length).assertEqual(array.length);
            expect(a[0]).assertEqual(Number.MAX_VALUE);
            expect(a[1]).assertEqual(Number.MIN_VALUE);
            expect(Number.NaN === Number.NaN).assertFalse();
            expect(a[2] === Number.NaN).assertFalse();
            expect(a[2] === a[2]).assertFalse();
            expect(a[3]).assertEqual(Number.NEGATIVE_INFINITY);
            expect(a[4]).assertEqual(Number.POSITIVE_INFINITY);

            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0005
         * @tc.name ESBuiltinsArrayTest0005
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0005';
            console.info(`${caseName}, test start`);

            expect(Array.isArray(undefined)).assertEqual(false);
            expect(Array.isArray(null)).assertEqual(false);

            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0006
         * @tc.name ESBuiltinsArrayTest0006
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0006';
            console.info(`${caseName}, test start`);
            let a = new Array<String>(0);
            expect(a.length).assertEqual(0);

            let b = new Array<Double>(1);
            expect(b.length).assertEqual(1);
            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0007
         * @tc.name ESBuiltinsArrayTest0007
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0007';
            console.info(`${caseName}, test start`);
            let x = new Array<int>(1, 2);
            x.length = 2;
            expect(x.length).assertEqual(2);
            x.length = 1;
            expect(x.length).assertEqual(1);
            let threw = false;
            try {
                x.length = 2;
                expect(false).assertTrue();
            } catch (err) {
                if (err instanceof RangeError) threw = true;
            }
            expect(threw).assertEqual(true);
            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0008
         * @tc.name ESBuiltinsArrayTest0008
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0008';
            console.info(`${caseName}, test start`);
            let x = new Array<int>(1, 2);
            x.length = 2;
            expect(x.length).assertEqual(2);
            x.length = 1;
            expect(x.length).assertEqual(1);
            let threw = false;
            try {
                x.length = -1;
                expect(false).assertTrue();
            } catch (err) {
                if (err instanceof RangeError) threw = true;
            }
            expect(threw).assertEqual(true);
            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0009
         * @tc.name ESBuiltinsArrayTest0009
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0009';
            console.info(`${caseName}, test start`);
            let x = new Array<int>(1, 2);
            x.length = 2;
            expect(x.length).assertEqual(2);
            x.length = 1;
            expect(x.length).assertEqual(1);
            x.length = 0;
            expect(x.length).assertEqual(0);
            x.length = 0;
            expect(x.length).assertEqual(0);
            let threw = false;
            try {
                x.length = 1;
                expect(false).assertTrue();
            } catch (err) {
                if (err instanceof RangeError) threw = true;
            }
            expect(threw).assertEqual(true);
            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0010
         * @tc.name ESBuiltinsArrayTest0010
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0010';
            console.info(`${caseName}, test start`);
            let a = new Array<string>();
            expect(typeof a).assertEqual('object');
            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0011
         * @tc.name ESBuiltinsArrayTest0011
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0011';
            console.info(`${caseName}, test start`);
            let x = new Array<number|undefined>(1000);
            x[2] = 4;
            x[10] = 20;
            x[500] = 100;
            expect(x[2]).assertEqual(4);
            expect(x[10]).assertEqual(20);
            expect(x[500]).assertEqual(100);
            expect(x[0]).assertEqual(undefined);
            expect(x[999]).assertEqual(undefined);
            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0012
         * @tc.name ESBuiltinsArrayTest0012
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0012';
            console.info(`${caseName}, test start`);
            expect(new Array<string>().length).assertEqual(0);
            expect(new Array<number>(0, 1, 0, 1).length).assertEqual(4);
            expect(new Array<undefined>(undefined, undefined).length).assertEqual(2);
            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0013
         * @tc.name ESBuiltinsArrayTest0013
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0013';
            console.info(`${caseName}, test start`);
            let x = new Array<number>(
                0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
                10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
                20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
                30, 31, 32, 33, 34, 35, 36, 37, 38, 39,
                40, 41, 42, 43, 44, 45, 46, 47, 48, 49,
                50, 51, 52, 53, 54, 55, 56, 57, 58, 59,
                60, 61, 62, 63, 64, 65, 66, 67, 68, 69,
                70, 71, 72, 73, 74, 75, 76, 77, 78, 79,
                80, 81, 82, 83, 84, 85, 86, 87, 88, 89,
                90, 91, 92, 93, 94, 95, 96, 97, 98, 99
            );
            let result = true;
            for (let i = 0; i < 100; i++) {
                if (x[i] !== i) {
                    result = false;
                }
            }
            expect(result).assertEqual(true);
            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0014
         * @tc.name ESBuiltinsArrayTest0014
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0014';
            console.info(`${caseName}, test start`);
            let x = new Array<number>(100);
            x[0] = 1;
            expect(x.length).assertEqual(100);
            x[98] = 1;
            expect(x.length).assertEqual(100);
            x[99] = 1;
            expect(x.length).assertEqual(100);
            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0015
         * @tc.name ESBuiltinsArrayTest0015
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0015';
            console.info(`${caseName}, test start`);
            let x = Array<number>(101);
            x[100] = 1;
            expect(x.length).assertEqual(101);
            let threw = false;
            try {
                x[199] = 1;
                expect(false).assertTrue();
            } catch (err) {
                if (err instanceof RangeError) threw = true;
            }
            expect(threw).assertEqual(true);
            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0016
         * @tc.name ESBuiltinsArrayTest0016
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0016';
            console.info(`${caseName}, test start`);
            let x: Array<number> = new Array<number>();
            expect(x.length).assertEqual(0);
            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0017
         * @tc.name ESBuiltinsArrayTest0017
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0017';
            console.info(`${caseName}, test start`);
            let x: Array<number> = Array.create<number>(11, 15);
            expect(x.length).assertEqual(11);
            x[1] = 1;
            expect(x.length).assertEqual(11);
            x[1] = 1;
            expect(x.length).assertEqual(11);
            x[9] = 1;
            expect(x.length).assertEqual(11);
            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0001
         * @tc.name ESArrayPrototypeTest0001
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0001';
            console.info(`${caseName}, test start`);
            let a = new Array<Int>(3, 2, 1, 0);
            expect(a.at(0)).assertEqual(3);
            expect(a.at(2)).assertEqual(1);
            expect(a.at(1)).assertEqual(2);
            expect(a.at(3)).assertEqual(0);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0002
         * @tc.name ESArrayPrototypeTest0002
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0002';
            console.info(`${caseName}, test start`);
            let a = new Array<int>(5);
            a[0] = 0;
            a[2] = 2;
            a[3] = 2;
            expect(a.at(0)).assertEqual(0);
            expect(a.at(2)).assertEqual(2);
            expect(a.at(3)).assertEqual(2);
            let threw = false;
            try {
                a.at(1);
                expect(false).assertTrue();
            } catch (err) {
                if (err instanceof ClassCastError) threw = true;
            }
            expect(threw).assertEqual(true);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0003
         * @tc.name ESArrayPrototypeTest0003
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0003';
            console.info(`${caseName}, test start`);
            let x = new Array<Int>();
            let y = new Array<Int>(0, 1);
            let z = new Array<Int>(2, 3, 4);
            let arr = x.concat(y, z);

            expect(arr[0]).assertEqual(0);
            expect(arr[1]).assertEqual(1);
            expect(arr[2]).assertEqual(2);
            expect(arr[3]).assertEqual(3);
            expect(arr[4]).assertEqual(4);
            expect(arr.length).assertEqual(5);

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0004
         * @tc.name ESArrayPrototypeTest0004
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0004';
            console.info(`${caseName}, test start`);
            let x = new Array<Int>(0, 1);
            let arr = x.concat();

            expect(arr[0]).assertEqual(0);
            expect(arr[1]).assertEqual(1);
            expect(arr.length).assertEqual(2);
            expect(arr === x).assertEqual(false);

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0005
         * @tc.name ESArrayPrototypeTest0005
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0005';
            console.info(`${caseName}, test start`);
            let a = new Array<Int>();
            a.push(0);
            expect(a.length).assertEqual(1);

            a.push(0);
            a.push(2);
            expect(a[1]).assertEqual(0);
            expect(a[2]).assertEqual(2);
            expect(a.hasOwnProperty('1')).assertEqual(true);
            expect(a.hasOwnProperty('2')).assertEqual(true);
            expect(a.hasOwnProperty('3')).assertEqual(false);

            let b = a.concat();
            expect(b.length).assertEqual(3);
            expect(b[0]).assertEqual(0);
            expect(b[1]).assertEqual(0);
            expect(b[2]).assertEqual(2);
            expect(b.hasOwnProperty('1')).assertEqual(true);
            expect(b.hasOwnProperty('2')).assertEqual(true);
            expect(b.hasOwnProperty('3')).assertEqual(false);

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0006
         * @tc.name ESArrayPrototypeTest0006
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0006';
            console.info(`${caseName}, test start`);
            let arr = new Array<Int>(0, 1, 1, 1, 2);
            arr.copyWithin(0, 1, 4);

            expect(arr.length).assertEqual(5);
            expect(arr[0]).assertEqual(1);
            expect(arr[4]).assertEqual(2);
            expect(arr.hasOwnProperty(1)).assertEqual(true);
            expect(arr.hasOwnProperty(2)).assertEqual(true);
            expect(arr.hasOwnProperty(3)).assertEqual(true);

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0007
         * @tc.name ESArrayPrototypeTest0007
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0007';
            console.info(`${caseName}, test start`);
            let a = new Array<Int>(0, 1, 2, 3);
            let aresult1 = a.copyWithin(0, 1, 6);
            expect(aresult1.toString()).assertEqual("1,2,3,3");

            a = new Array<Int>(0, 1, 2, 3);
            let aresult2 = a.copyWithin(0, 1);
            expect(aresult2.toString()).assertEqual("1,2,3,3");

            let b = new Array<Int>(0, 1, 2, 3, 4, 5);
            let bresult1 = b.copyWithin(1, 3, 6);
            expect(bresult1.toString()).assertEqual("0,3,4,5,4,5");

            b = new Array<Int>(0, 1, 2, 3, 4, 5);
            let bresult2 = b.copyWithin(1, 3);
            expect(bresult2.toString()).assertEqual("0,3,4,5,4,5");

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0008
         * @tc.name ESArrayPrototypeTest0008
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0008';
            console.info(`${caseName}, test start`);
            let a = new Array<Int>(0, 1, 2, 3, 4, 5);
            let result1 = a.copyWithin(6, 0);
            expect(result1.toString()).assertEqual("0,1,2,3,4,5");

            a = new Array<Int>(0, 1, 2, 3, 4, 5);
            result1 = a.copyWithin(7, 0);
            expect(result1.toString()).assertEqual("0,1,2,3,4,5");

            a = new Array<Int>(0, 1, 2, 3, 4, 5);
            result1 = a.copyWithin(0, 0);
            expect(result1.toString()).assertEqual("0,1,2,3,4,5");

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0009
         * @tc.name ESArrayPrototypeTest0009
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0009';
            console.info(`${caseName}, test start`);
            let a = new Array<Int>(0, 1, 2, 3, 4, 5);
            let result1 = a.copyWithin(6, 2);
            expect(result1.toString()).assertEqual("0,1,2,3,4,5");

            a = new Array<Int>(0, 1, 2, 3, 4, 5);
            result1 = a.copyWithin(7, 2);
            expect(result1.toString()).assertEqual("0,1,2,3,4,5");

            a = new Array<Int>(0, 1, 2, 3, 4, 5);
            result1 = a.copyWithin(6, 2);
            expect(result1.toString()).assertEqual("0,1,2,3,4,5");
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0010
         * @tc.name ESArrayPrototypeTest0010
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0010';
            console.info(`${caseName}, test start`);
            let a = new Array<Int>(0, 1, 2, 3, 4, 5);
            let result1 = a.copyWithin(0, 6);
            expect(result1.toString()).assertEqual("0,1,2,3,4,5");

            a = new Array<Int>(0, 1, 2, 3, 4, 5);
            result1 = a.copyWithin(0, 7);
            expect(result1.toString()).assertEqual("0,1,2,3,4,5");

            a = new Array<Int>(0, 1, 2, 3, 4, 5);
            result1 = a.copyWithin(2, 6);
            expect(result1.toString()).assertEqual("0,1,2,3,4,5");
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0011
         * @tc.name ESArrayPrototypeTest0011
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0011';
            console.info(`${caseName}, test start`);
            let a = new Array<Int>(0, 1, 2, 3, 4, 5);
            let result1 = a.copyWithin(1, 7);
            expect(result1.toString()).assertEqual("0,1,2,3,4,5");

            a = new Array<Int>(0, 1, 2, 3, 4, 5);
            result1 = a.copyWithin(3, 6);
            expect(result1.toString()).assertEqual("0,1,2,3,4,5");

            a = new Array<Int>(0, 1, 2, 3, 4, 5);
            result1 = a.copyWithin(6, 6);
            expect(result1.toString()).assertEqual("0,1,2,3,4,5");

            a = new Array<Int>(0, 1, 2, 3, 4, 5);
            result1 = a.copyWithin(10, 10);
            expect(result1.toString()).assertEqual("0,1,2,3,4,5");
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0012
         * @tc.name ESArrayPrototypeTest0012
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0012';
            console.info(`${caseName}, test start`);
            let a = new Array<string>('a', 'b', 'c', 'd', 'e', 'f');
            let result1 = a.copyWithin(0, 0);
            expect(result1.toString()).assertEqual("a,b,c,d,e,f");

            a = new Array<string>('a', 'b', 'c', 'd', 'e', 'f');
            result1 = a.copyWithin(0, 2);
            expect(result1.toString()).assertEqual("c,d,e,f,e,f");

            a = new Array<string>('a', 'b', 'c', 'd', 'e', 'f');
            result1 = a.copyWithin(3, 0);
            expect(result1.toString()).assertEqual("a,b,c,a,b,c");

            let b = new Array<Int>(0, 1, 2, 3, 4, 5);
            let result2 = b.copyWithin(1, 4);
            expect(result2.toString()).assertEqual("0,4,5,3,4,5");

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0013
         * @tc.name ESArrayPrototypeTest0013
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0013';
            console.info(`${caseName}, test start`);
            let a = new Array<Int>(0, 1, 2, 3);
            let result1 = a.copyWithin(0, 0, 0);
            expect(result1.toString()).assertEqual("0,1,2,3");

            a = new Array<Int>(0, 1, 2, 3);
            result1 = a.copyWithin(0, 0, 2);
            expect(result1.toString()).assertEqual("0,1,2,3");

            a = new Array<Int>(0, 1, 2, 3);
            result1 = a.copyWithin(0, 1, 2);
            expect(result1.toString()).assertEqual("1,1,2,3");

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0014
         * @tc.name ESArrayPrototypeTest0014
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0014';
            console.info(`${caseName}, test start`);
            let a = new Array<Int>(0, 1, 2, 3);
            let result1 = a.copyWithin(0, 1, undefined);
            expect(result1.toString()).assertEqual("1,2,3,3");

            let b = new Array<Int>(0, 1, 2, 3);
            let result2 = b.copyWithin(0, 1);
            expect(result2.toString()).assertEqual("1,2,3,3");

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0015
         * @tc.name ESArrayPrototypeTest0015
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0015';
            console.info(`${caseName}, test start`);
            let array = new Array<string>();
            let iterator = array.entries();

            array.push('a');

            let result = iterator.next();
            expect(result.done).assertEqual(false);
            expect(array[0]).assertEqual("a");

            result = iterator.next();
            expect(result.done).assertEqual(true);
            expect(result.value).assertEqual(undefined);

            array.push('b');

            result = iterator.next();
            expect(result.done).assertEqual(true);

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0016
         * @tc.name ESArrayPrototypeTest0016
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0016';
            console.info(`${caseName}, test start`);
            let arr = new Array<Int>(1, 2, 3, 4, 5);
            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => {
                arr[4] = 6;
                return val < 6 ? true : false;
            };
            expect(arr.every(callbackfn)).assertEqual(false);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0017
         * @tc.name ESArrayPrototypeTest0017
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0017';
            console.info(`${caseName}, test start`);
            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => val > 10;
            let a = new Array<Int>(11, 9);
            expect(a.every(callbackfn)).assertEqual(false);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0018
         * @tc.name ESArrayPrototypeTest0018
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0018';
            console.info(`${caseName}, test start`);
            let calledForThree = false;
            let arr = new Array<Int>(1, 2, 4, 5);
            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => {
                arr[2] = 3;
                if (val == 3) calledForThree = true;
                return true;
            };

            let res = arr.every(callbackfn);
            expect(calledForThree).assertEqual(true);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0019
         * @tc.name ESArrayPrototypeTest0019
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0019';
            console.info(`${caseName}, test start`);
            let arr = new Array<Int>(1, 2, 3, 4, 5);
            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => val !== 3;
            expect(arr.every(callbackfn)).assertEqual(false);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0020
         * @tc.name ESArrayPrototypeTest0020
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0020';
            console.info(`${caseName}, test start`);
            let arr = new Array<Int>(1, 2, 3, 4, 6);
            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => {
                arr.length = 3;
                return val < 4;
            };

            expect(arr.every(callbackfn)).assertEqual(true);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0021
         * @tc.name ESArrayPrototypeTest0021
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0021';
            console.info(`${caseName}, test start`);
            let arr = new Array<Int>(3);
            arr[0] = 0;
            arr[1] = 1;
            arr[2] = 2;
            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => {
                arr[2] = 3;
                return val < 3;
            };
            expect(arr.every(callbackfn)).assertEqual(false);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0022
         * @tc.name ESArrayPrototypeTest0022
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0022';
            console.info(`${caseName}, test start`);
            let arr = new Array<Int>(1, 2, 3, 4, 5);
            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => val !== 3;
            let res = arr.every(callbackfn);
            expect(res).assertEqual(false);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0023
         * @tc.name ESArrayPrototypeTest0023
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0023';
            console.info(`${caseName}, test start`);
            let arr = new Array<Int>(1, 2, 3, 4, 5);
            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => val !== 3;
            let res = arr.every(callbackfn);
            expect(res).assertEqual(false);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0024
         * @tc.name ESArrayPrototypeTest0024
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0024';
            console.info(`${caseName}, test start`);
            let callCnt = 0;
            let arr = new Array<Int>(10);
            arr[1] = 1;
            let callbackfn = (val: int | undefined, idx: int, obj: Array<Int>): boolean => {
                if(val) {
                    callCnt++;
                }
                return true;
            };
            arr.every(callbackfn);
            expect(callCnt).assertEqual(1);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0025
         * @tc.name ESArrayPrototypeTest0025
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0025';
            console.info(`${caseName}, test start`);
            let called = 0;
            let a = new Array<Int>();
            a.push(11);
            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => {
                called++;
                return val === 11;
            };
            expect(a.every(callbackfn)).assertEqual(true);
            expect(called).assertEqual(1);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0026
         * @tc.name ESArrayPrototypeTest0026
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0026';
            console.info(`${caseName}, test start`);
            let callCnt = 0;
            let arr = new Array<Int>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => {
                callCnt++;
                return idx <= 5;
            };
            expect(arr.every(callbackfn)).assertEqual(false);
            expect(callCnt).assertEqual(7);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0028
         * @tc.name ESArrayPrototypeTest0028
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0028';
            console.info(`${caseName}, test start`);
            let arr = new Array<Int>(0, 1, 2, 3, 4, 5);
            let lastIdx = 0;
            let called = 0;
            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => {
                called++;
                if (lastIdx !== idx) {
                    return false;
                } else {
                    lastIdx++;
                    return true;
                }
            };

            expect(arr.every(callbackfn)).assertEqual(true);
            expect(arr.length).assertEqual(called);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0029
         * @tc.name ESArrayPrototypeTest0029
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0029';
            console.info(`${caseName}, test start`);
            let called = 0;

            let callbackfn = (): boolean => {
                called++;
                return true;
            };

            let a = new Array<Int>(11, 12);

            expect(a.every(callbackfn)).assertEqual(true);
            expect(called).assertEqual(2);

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0030
         * @tc.name ESArrayPrototypeTest0030
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0030';
            console.info(`${caseName}, test start`);
            let called = 0;

            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => {
                called++;
                return val > 10;
            };

            let arr = new Array<Int>(11, 12);
            expect(arr.every(callbackfn)).assertEqual(true);
            expect(called).assertEqual(2);

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0031
         * @tc.name ESArrayPrototypeTest0031
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0031';
            console.info(`${caseName}, test start`);
            let accessed = false;

            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => {
                accessed = true;
                return accessed;
            };

            let a = new Array<Int>();
            a.push(11);

            expect(a.every(callbackfn)).assertEqual(true);
            expect(accessed).assertEqual(true);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0032
         * @tc.name ESArrayPrototypeTest0032
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0032';
            console.info(`${caseName}, test start`);
            let foo = new Array<Int>(1, 2, 3);

            let cb = (val: Int): boolean => {
                if (val > 2)
                    return false;
                else
                    return true;
            };

            let i = foo.every(cb);
            expect(i).assertEqual(false);

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0033
         * @tc.name ESArrayPrototypeTest0033
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0033';
            console.info(`${caseName}, test start`);
            let callCnt = 0;

            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => {
                callCnt++;
                return true;
            };

            let arr = new Array<Int>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);

            expect(arr.every(callbackfn)).assertEqual(true);
            expect(callCnt).assertEqual(10);

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0034
         * @tc.name ESArrayPrototypeTest0034
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0034';
            console.info(`${caseName}, test start`);
            let callCnt = 0;

            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => {
                callCnt++;
                return true;
            };

            let arr = new Array<Int>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
            expect(arr.every(callbackfn)).assertEqual(true);
            expect(callCnt).assertEqual(10);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0035
         * @tc.name ESArrayPrototypeTest0035
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0035';
            console.info(`${caseName}, test start`);
            let a1 = new Array<Int>(0, 0, 0);
            let rt1 = a1.fill(8, 1, 2);
            expect(rt1.toString()).assertEqual("0,8,0");

            let a2 = new Array<Int>(0, 0, 0, 0, 0);
            let rt2 = a2.fill(8, -3, 4);
            expect(rt2.toString()).assertEqual("0,0,8,8,0");

            let a3 = new Array<Int>(0, 0, 0, 0, 0);
            let rt3 = a3.fill(8, -2, -1);
            expect(rt3.toString()).assertEqual("0,0,0,8,0");

            let a4 = new Array<Int>(0, 0, 0, 0, 0);
            let rt4 = a4.fill(8, -1, -3);
            expect(rt4.toString()).assertEqual("0,0,0,0,0");
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0036
         * @tc.name ESArrayPrototypeTest0036
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0036';
            console.info(`${caseName}, test start`);
            let a1 = new Array<Int>(0, 0, 0);
            let rt1 = a1.fill(8, 0, 1);
            expect(rt1.toString()).assertEqual("8,0,0");

            let a2 = new Array<Int>(0, 0, 0);
            let rt2 = a2.fill(8, 0, -1);
            expect(rt2.toString()).assertEqual("8,8,0");

            let a3 = new Array<Int>(0, 0, 0);
            let rt3 = a3.fill(8, 0, 5);
            expect(rt3.toString()).assertEqual("8,8,8");
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0037
         * @tc.name ESArrayPrototypeTest0037
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0037';
            console.info(`${caseName}, test start`);
            let a1 = new Array<Int>(0, 0, 0);
            let rt1 = a1.fill(8, 1);
            expect(rt1.toString()).assertEqual("0,8,8");

            let a2 = new Array<Int>(0, 0, 0);
            let rt2 = a2.fill(8, 4);
            expect(rt2.toString()).assertEqual("0,0,0");

            let a3 = new Array<Int>(0, 0, 0);
            let rt3 = a3.fill(8, -1);
            expect(rt3.toString()).assertEqual("0,0,8");
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0038
         * @tc.name ESArrayPrototypeTest0038
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0038';
            console.info(`${caseName}, test start`);
            let a1 = new Array<Int>();
            let rt1 = a1.fill(8);
            expect(rt1.toString()).assertEqual("");
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0039
         * @tc.name ESArrayPrototypeTest0039
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0039';
            console.info(`${caseName}, test start`);
            let a3 = new Array<Int>(0, 0, 0);
            let rt3 = a3.fill(8);
            expect(rt3.toString()).assertEqual("8,8,8");
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0044
         * @tc.name ESArrayPrototypeTest0044
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0044';
            console.info(`${caseName}, test start`);
            let srcArr = new Array<Int>(1, 2, 3, 4, 5);
            let callbackfn = (val: Int, idx: int, obj: Array<Int>) => {
                srcArr[2] = 3;
                srcArr[4] = 6;
                return true;
            };
            let resArr = srcArr.filter(callbackfn);

            expect(resArr.length).assertEqual(5);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0045
         * @tc.name ESArrayPrototypeTest0045
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0045';
            console.info(`${caseName}, test start`);
            let srcArr = new Array<Int>(1, 2, 3, 4, 5);
            let callbackfn = (val: int, idx: int, obj: Array<Int>) => {
                srcArr[2] = -1;
                srcArr[4] = -1;
                return val > 0;
            };
            let resArr = srcArr.filter(callbackfn);

            expect(resArr.length).assertEqual(3);
            expect(resArr[0]).assertEqual(1);
            expect(resArr[2]).assertEqual(4);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0046
         * @tc.name ESArrayPrototypeTest0046
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0046';
            console.info(`${caseName}, test start`);
            let srcArr = new Array<Int>(1, 2, 3, 4, 6);
            let callbackfn = (val: int, idx: int, obj: Array<Int>) => {
                srcArr.length = 2;
                return true;
            };
            let resArr = srcArr.filter(callbackfn);

            expect(resArr.length).assertEqual(2);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0047
         * @tc.name ESArrayPrototypeTest0047
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0047';
            console.info(`${caseName}, test start`);
            let srcArr = new Array<Int>(10);
            srcArr[1] = 1;
            srcArr[2] = 2;

            let callbackfn = (val: int | undefined, idx: int, obj: Array<Int>) => {
                if(val) {
                    srcArr[1] = 3;
                    return true;
                }
                return false;
            };
            let resArr = srcArr.filter(callbackfn);
            expect(resArr.length).assertEqual(2);
            expect(resArr[0]).assertEqual(1);
            expect(resArr[1]).assertEqual(2);
            expect(srcArr[1]).assertEqual(3);
            expect(srcArr[2]).assertEqual(2);

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0049
         * @tc.name ESArrayPrototypeTest0049
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0049';
            console.info(`${caseName}, test start`);
            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => {
                return (idx === 0) && (val === 12);
            };

            let a = new Array<Int>();
            a.push(12);

            let newArr = a.filter(callbackfn);

            expect(newArr.length).assertEqual(1);
            expect(newArr[0]).assertEqual(12);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0050
         * @tc.name ESArrayPrototypeTest0050
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0050';
            console.info(`${caseName}, test start`);
            let lastToIdx = 0;
            let called = 0;

            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => {
                called++;
                if (lastToIdx !== idx) {
                    return false;
                } else {
                    lastToIdx++;
                    return true;
                }
            };

            let arr = new Array<Int>(0, 1, 2, 3, 4);
            let newArr = arr.filter(callbackfn);

            expect(newArr.length).assertEqual(5);
            expect(called).assertEqual(5);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0051
         * @tc.name ESArrayPrototypeTest0051
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0051';
            console.info(`${caseName}, test start`);
            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => true;

            let srcArr = new Array<Int>(1, 2, 3, 4, 5);
            srcArr.filter(callbackfn);

            expect(srcArr[0]).assertEqual(1);
            expect(srcArr[1]).assertEqual(2);
            expect(srcArr[2]).assertEqual(3);
            expect(srcArr[3]).assertEqual(4);
            expect(srcArr[4]).assertEqual(5);

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0053
         * @tc.name ESArrayPrototypeTest0053
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0053';
            console.info(`${caseName}, test start`);
            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => val % 2 !== 0;

            let srcArr = new Array<Int>(1, 2, 3, 4, 5);
            let resArr = srcArr.filter(callbackfn);

            expect(resArr.length).assertEqual(3);
            expect(resArr[0]).assertEqual(1);
            expect(resArr[1]).assertEqual(3);
            expect(resArr[2]).assertEqual(5);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0054
         * @tc.name ESArrayPrototypeTest0054
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0054';
            console.info(`${caseName}, test start`);
            let called = false;

            let predicate = () => {
                called = true;
                return true;
            };

            let arr: Array<number> = new Array<number>();
            let result = arr.find(predicate);

            expect(called).assertEqual(false);
            expect(result).assertEqual(undefined);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0055
         * @tc.name ESArrayPrototypeTest0055
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0055';
            console.info(`${caseName}, test start`);
            let arr: Array<string> = new Array<string>('Shoes', 'Car', 'Bike');
            let results: Array<string> = new Array<string>();

            arr.findIndex((kValue: string, index: int, arr: Array<string>) => {
                if (results.length === 0) {
                    arr.splice(1, 1);
                }
                results.push(kValue);
                return true;
            });

            expect(results.length).assertEqual(1);
            expect(results[0]).assertEqual('Shoes');

            results = new Array<string>();
            arr = new Array<string>('Skateboard', 'Barefoot');
            arr.findIndex((kValue: string, index: int) => {
                if (results.length === 0) {
                    arr.push('Motorcycle');
                    arr[1] = 'Magic Carpet';
                }

                results.push(kValue);
                return true;
            });

            expect(results.length).assertEqual(1);
            expect(results[0]).assertEqual('Skateboard');

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0056
         * @tc.name ESArrayPrototypeTest0056
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0056';
            let called = false;
            let predicate = () => {
                called = true;
                return true;
            };

            let array = new Array<boolean>();
            let result = array.findIndex(predicate);

            expect(called).assertEqual(false);
            expect(result).assertEqual(-1);

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0057
         * @tc.name ESArrayPrototypeTest0057
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0057';
            console.info(`${caseName}, test start`);
            let callCnt = 0;
            let callbackfn = (val: int, idx: int, arr: Array<Int>): void => {
                callCnt++;
            };
            let arr = new Array<Int>(1, 2, 3, 4, 5);
            arr.forEach(callbackfn);
            expect(callCnt).assertEqual(5);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0058
         * @tc.name ESArrayPrototypeTest0058
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0058';
            console.info(`${caseName}, test start`);
            let sample: Array<number> = new Array<number>(7, 7, 7, 7);
            expect(sample.includes(7, 4)).assertEqual(false);
            expect(sample.includes(7, 5)).assertEqual(false);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0059
         * @tc.name ESArrayPrototypeTest0059
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0059';
            console.info(`${caseName}, test start`);
            let sample: Array<number> = new Array<number>(42, 43);
            expect(sample.includes(42, -0)).assertTrue()
            expect(sample.includes(43, -0)).assertTrue()
            expect(sample.includes(44, -0)).assertFalse()
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0060
         * @tc.name ESArrayPrototypeTest0060
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0060';
            console.info(`${caseName}, test start`);
            let calls = 0;
            let sample = new Array<number>();
            expect(sample.includes(0)).assertFalse()
            expect(calls).assertEqual(0)
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0061
         * @tc.name ESArrayPrototypeTest0061
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0061';
            console.info(`${caseName}, test start`);
            let sample = new Array<number>(42, 0, 1, NaN);
            expect(sample.includes(42.0)).assertTrue()
            expect(sample.includes(-0)).assertTrue()
            expect(sample.includes(NaN)).assertTrue()
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0062
         * @tc.name ESArrayPrototypeTest0062
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0062';
            console.info(`${caseName}, test start`);
            let sample = new Array<string>("a", "b", "c");
            expect(sample.includes("a", 0)).assertEqual(true);
            expect(sample.includes("a", 1)).assertEqual(false);
            expect(sample.includes("a", 2)).assertEqual(false);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0063
         * @tc.name ESArrayPrototypeTest0063
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0063';
            console.info(`${caseName}, test start`);
            let sample = new Array<string>("a", "b", "c");
            expect(sample.includes("b", 0)).assertEqual(true);
            expect(sample.includes("b", 1)).assertEqual(true);
            expect(sample.includes("b", 2)).assertEqual(false);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0064
         * @tc.name ESArrayPrototypeTest0064
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0064';
            console.info(`${caseName}, test start`);
            let sample = new Array<string>("a", "b", "c");
            expect(sample.includes("c", 0)).assertEqual(true);
            expect(sample.includes("c", 1)).assertEqual(true);
            expect(sample.includes("c", 2)).assertEqual(true);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0065
         * @tc.name ESArrayPrototypeTest0065
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0065';
            console.info(`${caseName}, test start`);
            let sample = new Array<string>("a", "b", "c");
            expect(sample.includes("a", -1)).assertEqual(false);
            expect(sample.includes("a", -2)).assertEqual(false);
            expect(sample.includes("a", -3)).assertEqual(true);
            expect(sample.includes("a", -4)).assertEqual(true);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0066
         * @tc.name ESArrayPrototypeTest0066
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0066';
            console.info(`${caseName}, test start`);
            let sample = new Array<string>("a", "b", "c");
            expect(sample.includes("b", -1)).assertEqual(false);
            expect(sample.includes("b", -2)).assertEqual(true);
            expect(sample.includes("b", -3)).assertEqual(true);
            expect(sample.includes("b", -4)).assertEqual(true);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0067
         * @tc.name ESArrayPrototypeTest0067
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0067';
            console.info(`${caseName}, test start`);
            let sample = new Array<string>("a", "b", "c");
            expect(sample.includes("c", -1)).assertEqual(true);
            expect(sample.includes("c", -2)).assertEqual(true);
            expect(sample.includes("c", -3)).assertEqual(true);
            expect(sample.includes("c", -4)).assertEqual(true);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0068
         * @tc.name ESArrayPrototypeTest0068
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0068';
            console.info(`${caseName}, test start`);
            let array: Array<number> = new Array<number>();
            let i = array.indexOf(42);
            expect(i).assertEqual(-1);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0069
         * @tc.name ESArrayPrototypeTest0069
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0069';
            console.info(`${caseName}, test start`);
            let a: Array<number> = new Array<number>(1, 2, 3);
            expect(a.indexOf(1, undefined)).assertEqual(0);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0070
         * @tc.name ESArrayPrototypeTest0070
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0070';
            console.info(`${caseName}, test start`);
            let arr: Array<boolean> = new Array<boolean>(true);
            expect(arr.indexOf(true, 0)).assertEqual(0);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0071
         * @tc.name ESArrayPrototypeTest0071
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0071';
            console.info(`${caseName}, test start`);
            let arr: Array<boolean> = new Array<boolean>(true);
            expect(arr.indexOf(true, +0)).assertEqual(0);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0072
         * @tc.name ESArrayPrototypeTest0072
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0072';
            console.info(`${caseName}, test start`);
            let arr: Array<boolean> = new Array<boolean>(true);
            expect(arr.indexOf(true, -0)).assertEqual(0);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0073
         * @tc.name ESArrayPrototypeTest0073
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0073';
            console.info(`${caseName}, test start`);
            let targetObj: A = {}
            let a1: Array<number | object> = new Array<number | object>(0, targetObj, 2);
            let a2: Array<number | object> = new Array<number | object>(0, 1, targetObj);
            expect(a1.indexOf(targetObj, 2)).assertEqual(-1);
            expect(a2.indexOf(targetObj, 2)).assertEqual(2);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0074
         * @tc.name ESArrayPrototypeTest0074
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0074';
            console.info(`${caseName}, test start`);
            let targetObj: A = {}
            let a1: Array<number | object> = new Array<number | object>(0, targetObj, 2);
            let a2: Array<number | object> = new Array<number | object>(0, 1, targetObj);

            expect(a1.indexOf(targetObj, -1)).assertEqual(-1);
            expect(a2.indexOf(targetObj, -1)).assertEqual(2);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0075
         * @tc.name ESArrayPrototypeTest0075
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0075';
            console.info(`${caseName}, test start`);
            let targetObj: A = {}
            let a1: Array<number | object> = new Array<number | object>(0, targetObj, 2);
            let a2: Array<number | object> = new Array<number | object>(0, 1, targetObj);

            expect(a1.indexOf(targetObj, 2)).assertEqual(-1);
            expect(a2.indexOf(targetObj, 2)).assertEqual(2);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0076
         * @tc.name ESArrayPrototypeTest0076
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0076';
            console.info(`${caseName}, test start`);
            let targetObj: A = {}
            let a1: Array<number | object> = new Array<number | object>(0, targetObj, 2);
            let a2: Array<number | object> = new Array<number | object>(0, 1, targetObj);

            expect(a1.indexOf(targetObj, -1)).assertEqual(-1);
            expect(a2.indexOf(targetObj, -1)).assertEqual(2);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0077
         * @tc.name ESArrayPrototypeTest0077
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0077';
            console.info(`${caseName}, test start`);
            let a: Array<number> = new Array<number>(0, 1, 2, 3, 4);
            expect(a.indexOf(0, 0)).assertEqual(0);
            expect(a.indexOf(2, 1)).assertEqual(2);
            expect(a.indexOf(2, 2)).assertEqual(2);
            expect(a.indexOf(4, 2)).assertEqual(4);
            expect(a.indexOf(4, 4)).assertEqual(4);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0078
         * @tc.name ESArrayPrototypeTest0078
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0078';
            console.info(`${caseName}, test start`);
            let a: Array<number> = new Array<number>(1, 2, 3);
            expect(a.indexOf(1, 5)).assertEqual(-1);
            expect(a.indexOf(1, 3)).assertEqual(-1);

            let a2: Array<number> = new Array<number>();
            expect(a2.indexOf(1, 0)).assertEqual(-1);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0079
         * @tc.name ESArrayPrototypeTest0079
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0079';
            console.info(`${caseName}, test start`);
            let a1: Array<number> = new Array<number>(1, 2, 3);
            expect(a1.indexOf(1, 2)).assertEqual(-1);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0080
         * @tc.name ESArrayPrototypeTest0080
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0080';
            console.info(`${caseName}, test start`);
            let a1: Array<number> = new Array<number>(1, 2, 3);
            expect(a1.indexOf(3, 2)).assertEqual(2);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0081
         * @tc.name ESArrayPrototypeTest0081
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0081';
            console.info(`${caseName}, test start`);
            let a1: Array<number> = new Array<number>(1, 2, 3);
            expect(a1.indexOf(1, 1)).assertEqual(-1);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0082
         * @tc.name ESArrayPrototypeTest0082
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0082';
            console.info(`${caseName}, test start`);
            let a1: Array<number> = new Array<number>(1, 2, 3);
            expect(a1.indexOf(1, 1)).assertEqual(-1);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0083
         * @tc.name ESArrayPrototypeTest0083
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0083';
            console.info(`${caseName}, test start`);
            let a: Array<number> = new Array<number>(1, 2, 3);
            expect(a.indexOf(2, -1)).assertEqual(-1);
            expect(a.indexOf(2, -2)).assertEqual(1);
            expect(a.indexOf(1, -3)).assertEqual(0);
            expect(a.indexOf(1, -5)).assertEqual(0);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0084
         * @tc.name ESArrayPrototypeTest0084
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0084';
            console.info(`${caseName}, test start`);
            let a1: Array<number> = new Array<number>(1, 2, 3, 4);
            expect(a1.indexOf(4, -1)).assertEqual(3);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0085
         * @tc.name ESArrayPrototypeTest0085
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0085';
            console.info(`${caseName}, test start`);
            let a1: Array<number> = new Array<number>(1, 2, 3, 4);
            expect(a1.indexOf(1, -3)).assertEqual(-1);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0086
         * @tc.name ESArrayPrototypeTest0086
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0086';
            console.info(`${caseName}, test start`);
            let a1: Array<number> = new Array<number>(1, 2, 3, 4);
            expect(a1.indexOf(0, -4)).assertEqual(-1);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0087
         * @tc.name ESArrayPrototypeTest0087
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0087';
            console.info(`${caseName}, test start`);
            let obj: A_bool = {
                toString1: (): boolean => {
                    return true;
                }
            };
            let _false = false;
            let a: Array<object | string | undefined | number | boolean | null> =
                new Array<object | string | undefined | number | boolean | null>(obj, "true", undefined, 0, _false, null, 1, "str", 0,
                    1, true, false, true, false);

            expect(a.indexOf(true)).assertEqual(10);
            expect(a.indexOf(false)).assertEqual(4);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0088
         * @tc.name ESArrayPrototypeTest0088
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0088';
            console.info(`${caseName}, test start`);
            let obj: A_num = {
                toString1: (): number => {
                    return 0;
                }
            };
            let one = 1;
            let _float = -(4 / 3);
            let a: Array<object | string | undefined | number | boolean | null> =
                new Array<object | string | undefined | number | boolean | null>(false, undefined, null, "0", obj, -1.3333333333333, "str", -0, true, +0, one, 1, 0, false, _float, -(4 / 3));

            expect(a.indexOf(-(4 / 3))).assertEqual(14);
            expect(a.indexOf(0)).assertEqual(7);
            expect(a.indexOf(-0)).assertEqual(7);
            expect(a.indexOf(1)).assertEqual(10);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0089
         * @tc.name ESArrayPrototypeTest0089
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0089';
            console.info(`${caseName}, test start`);
            let obj: A_str = {
                toString1: (): string => {
                    return 'false';
                }
            };
            let szFalse = "false";
            let a: Array<object | string | undefined | number | boolean | null> =
                new Array<object | string | undefined | number | boolean | null>("false1", undefined, 0, false, null, 1, obj, 0, szFalse, "false");

            expect(a.indexOf("false")).assertEqual(8);

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0090
         * @tc.name ESArrayPrototypeTest0090
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0090';
            console.info(`${caseName}, test start`);
            let obj: A_und = {
                toString1: (): undefined => {
                    return undefined;
                }
            };
            let _undefined1 = undefined;
            let _undefined2: undefined;
            let a: Array<object | string | undefined | number | boolean | null> =
                new Array<object | string | undefined | number | boolean | null>(true, 0, false, null, 1, "undefined", obj, 1, _undefined2, _undefined1, undefined);

            expect(a.indexOf(undefined)).assertEqual(8);

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0091
         * @tc.name ESArrayPrototypeTest0091
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0091';
            console.info(`${caseName}, test start`);
            let obj1: A_str = {
                toString1: (): string => {
                    return 'false';
                }
            };
            let obj2: A_str = {
                toString1: (): string => {
                    return 'false';
                }
            };
            let obj3 = obj1;
            let a: Array<object | string | undefined | number | boolean | null> =
                new Array<object | string | undefined | number | boolean | null>(false, undefined, 0, false, null, obj2, "false", obj2, obj1, obj3);

            expect(a.indexOf(obj3)).assertEqual(8);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0092
         * @tc.name ESArrayPrototypeTest0092
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0092';
            console.info(`${caseName}, test start`);
            let obj: A_null = {
                toString1: (): null => {
                    return null;
                }
            };
            let _null = null;
            let a: Array<object | string | undefined | number | boolean | null> =
                new Array<object | string | undefined | number | boolean | null>(true, undefined, 0, false, _null, 1, "str", 0, 1, obj, true, false, null);

            expect(a.indexOf(null)).assertEqual(4);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0093
         * @tc.name ESArrayPrototypeTest0093
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0093';
            console.info(`${caseName}, test start`);
            let a: Array<number> = new Array<number>(0, 1, 2, 3);
            let arr: Array<number | Array<number>> = new Array<number | Array<number>>(0, 1, a, 3);
            expect(arr.indexOf(a)).assertEqual(2);
            expect(arr.indexOf(3)).assertEqual(3);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0094
         * @tc.name ESArrayPrototypeTest0094
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0094';
            console.info(`${caseName}, test start`);
            let b: Array<string> = new Array<string>("0,1");
            let a: Array<string | number | Array<string>> = new Array<string | number | Array<string>>(0, b, "0,1", 3);
            expect(a.indexOf(b.toString())).assertEqual(2);
            expect(a.indexOf("0,1")).assertEqual(2);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0095
         * @tc.name ESArrayPrototypeTest0095
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0095';
            console.info(`${caseName}, test start`);
            let obj: A_nan = {
                toString1: (): number => {
                    return NaN;
                }
            };
            let _NaN = NaN;
            let a: Array<object | string | undefined | number | boolean | null> =
                new Array<object | string | undefined | number | boolean | null>("NaN", undefined, 0, false, null, obj, "false", _NaN, NaN);

            expect(a.indexOf(NaN)).assertEqual(-1);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0096
         * @tc.name ESArrayPrototypeTest0096
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0096';
            console.info(`${caseName}, test start`);
            let arr: Array<boolean> = new Array<boolean>(true, true, true);
            expect(arr.indexOf(true)).assertEqual(0);
            arr[0] = false;
            expect(arr.indexOf(true)).assertEqual(1);
            arr[1] = false;
            expect(arr.indexOf(true)).assertEqual(2);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0097
         * @tc.name ESArrayPrototypeTest0097
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0097';
            console.info(`${caseName}, test start`);
            let a1: Array<string | boolean> = new Array<string | boolean>("true");
            expect(a1.indexOf(true)).assertEqual(-1);

            let a2: Array<string | number> = new Array<string | number>("0");
            expect(a2.indexOf(0)).assertEqual(-1);

            let a3: Array<boolean | number> = new Array<boolean | number>(false);
            expect(a3.indexOf(0)).assertEqual(-1);

            let a4: Array<undefined | number> = new Array<undefined | number>(undefined);
            expect(a4.indexOf(0)).assertEqual(-1);

            let a5: Array<null | number> = new Array<null | number>(null);
            expect(a5.indexOf(0)).assertEqual(-1);

            let arr: Array<number> = new Array<number>();
            let a6: Array<Array<number> | number> = new Array<Array<number> | number>(arr);
            expect(a6.indexOf(0)).assertEqual(-1);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0098
         * @tc.name ESArrayPrototypeTest0098
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0098';
            console.info(`${caseName}, test start`);
            let arr: Array<undefined> = new Array<undefined>(undefined);
            // expect([undefined].indexOf()).assertEqual(0);
            expect(arr.indexOf(undefined)).assertEqual(0);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0099
         * @tc.name ESArrayPrototypeTest0099
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0099';
            console.info(`${caseName}, test start`);
            let arr: Array<null> = new Array<null>(null);
            expect(arr.indexOf(null)).assertEqual(0);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0100
         * @tc.name ESArrayPrototypeTest0100
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0100';
            console.info(`${caseName}, test start`);
            let arr: Array<number> = new Array<number>(+NaN, NaN, -NaN);
            expect(arr.indexOf(NaN)).assertEqual(-1);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0101
         * @tc.name ESArrayPrototypeTest0101
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0101';
            console.info(`${caseName}, test start`);
            let arr: Array<number> = new Array<number>(+NaN, NaN, -NaN);
            expect(arr.indexOf(-NaN)).assertEqual(-1);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0102
         * @tc.name ESArrayPrototypeTest0102
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0102';
            console.info(`${caseName}, test start`);
            let arr: Array<number> = new Array<number>(+0);
            expect(arr.indexOf(-0)).assertEqual(-1);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0103
         * @tc.name ESArrayPrototypeTest0103
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0103';
            console.info(`${caseName}, test start`);
            let arr: Array<number> = new Array<number>(-0);
            expect(arr.indexOf(+0)).assertEqual(-1);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0104
         * @tc.name ESArrayPrototypeTest0104
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0104';
            console.info(`${caseName}, test start`);
            let arr: Array<number> = new Array<number>(-1, 0, 1);
            expect(arr.indexOf(1)).assertEqual(2);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0105
         * @tc.name ESArrayPrototypeTest0105
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0105';
            console.info(`${caseName}, test start`);
            let arr: Array<string> = new Array<string>("", "ab", "bca", "abc");
            expect(arr.indexOf("abc")).assertEqual(3);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0106
         * @tc.name ESArrayPrototypeTest0106
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0106';
            console.info(`${caseName}, test start`);
            let arr: Array<boolean> = new Array<boolean>(false, true);
            expect(arr.indexOf(true)).assertEqual(1);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0107
         * @tc.name ESArrayPrototypeTest0107
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0107';
            console.info(`${caseName}, test start`);
            let obj: A = {};
            let obj1: A = {};
            let obj2: A = {};
            let obj3: A = obj2;
            let arr: Array<object> = new Array<object>(obj, obj1, obj2);
            expect(arr.indexOf(obj3)).assertEqual(2);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0108
         * @tc.name ESArrayPrototypeTest0108
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0108';
            console.info(`${caseName}, test start`);
            let arr: Array<number> = new Array<number>(1, 2, 2, 1, 2);
            expect(arr.indexOf(2)).assertEqual(1);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0109
         * @tc.name ESArrayPrototypeTest0109
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0109';
            console.info(`${caseName}, test start`);
            let a: Array<number | string | object | undefined | null | boolean> = new Array<number | string | object | undefined | null | boolean>(123457);
            let b: object = new Object();
            a[100] = 1;
            a[99999] = "";
            a[10] = b;
            a[5555] = 5.5;
            a[123456] = "str";
            //a[5] = 1E+309;

            expect(a.indexOf(1)).assertEqual(100);
            expect(a.indexOf("")).assertEqual(99999);
            expect(a.indexOf("str")).assertEqual(123456);
            //expect(a.indexOf(1E+309)).assertEqual(5); //Infinity
            expect(a.indexOf(5.5)).assertEqual(5555);

            expect(a.indexOf(true)).assertEqual(-1);
            expect(a.indexOf(5)).assertEqual(-1);
            expect(a.indexOf("str1")).assertEqual(-1);
            expect(a.indexOf(null)).assertEqual(-1);
            expect(a.indexOf(new Object())).assertEqual(-1);

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0110
         * @tc.name ESArrayPrototypeTest0110
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0110';
            console.info(`${caseName}, test start`);
            let x: Array<number> = new Array<number>();
            expect(x.join()).assertEqual("");
            x = new Array<number>();
            x.push(1);
            x.length = 0;
            expect(x.join()).assertEqual("");
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0111
         * @tc.name ESArrayPrototypeTest0111
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0111';
            console.info(`${caseName}, test start`);
            let x: Array<number> = new Array<number>(0, 1, 2, 3);
            expect(x.join()).assertEqual("0,1,2,3");

            x = new Array<number>(4);
            x[0] = 0;
            x[3] = 3;
            expect(x.join()).assertEqual("0,,,3");

            x = new Array<number>();
            x.push(0);
            expect(x.join()).assertEqual("0");
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0112
         * @tc.name ESArrayPrototypeTest0112
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0112';
            console.info(`${caseName}, test start`);
            let x: Array<number> = new Array<number>(0, 1, 2, 3);
            expect(x.join(undefined)).assertEqual("0,1,2,3");

            x = new Array<number>(4);
            x[0] = 0;
            x[3] = 3;
            expect(x.join(undefined)).assertEqual("0,,,3");

            x = new Array<number>();
            x.push(0);
            expect(x.join(undefined)).assertEqual("0");
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0113
         * @tc.name ESArrayPrototypeTest0113
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0113';
            console.info(`${caseName}, test start`);
            let x: Array<number | undefined | null> = new Array<number | undefined | null>();
            x.push(undefined);
            expect(x.join()).assertEqual("");

            x = new Array<number | undefined | null>();
            x.push(null);
            expect(x.join()).assertEqual("");

            x = new Array<number | undefined | null>(undefined, 1, null, 3);
            expect(x.join()).assertEqual(",1,,3");
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0114
         * @tc.name ESArrayPrototypeTest0114
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0114';
            console.info(`${caseName}, test start`);
            let x: Array<number> = new Array<number>(0, 1, 2, 3);
            expect(x.join("")).assertEqual("0123");
            x = new Array<number>(0, 1, 2, 3);
            expect(x.join("\\")).assertEqual("0\\1\\2\\3");
            expect(x.join("&")).assertEqual("0&1&2&3");
            // expect(x.join(true)).assertEqual("0true1true2true3");
            // expect(x.join(Infinity)).assertEqual("0Infinity1Infinity2Infinity3");
            // expect(x.join(null)).assertEqual("0null1null2null3");
            expect(x.join(undefined)).assertEqual("0,1,2,3");
            // expect(x.join(NaN)).assertEqual("0NaN1NaN2NaN3");
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0115
         * @tc.name ESArrayPrototypeTest0115
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0115';
            console.info(`${caseName}, test start`);
            let x: Array<string> = new Array<string>("", "", "");
            expect(x.join("")).assertEqual("");

            let x1: Array<string> = new Array<string>("\\", "\\", "\\");
            expect(x1.join("\\")).assertEqual("\\\\\\\\\\");

            let x2: Array<string> = new Array<string>("&", "&", "&");
            expect(x2.join("&")).assertEqual("&&&&&");
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0116
         * @tc.name ESArrayPrototypeTest0116
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0116';
            console.info(`${caseName}, test start`);
            let x3: Array<boolean> = new Array<boolean>(true, true, true);
            expect(x3.join()).assertEqual("true,true,true");

            let x4: Array<null> = new Array<null>(null, null, null);
            expect(x4.join()).assertEqual(",,");

            let x5: Array<undefined> = new Array<undefined>(undefined, undefined, undefined);
            expect(x5.join()).assertEqual(",,");
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0117
         * @tc.name ESArrayPrototypeTest0117
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0117';
            console.info(`${caseName}, test start`);
            let x6: Array<number> = new Array<number>(Infinity, Infinity, Infinity);
            expect(x6.join()).assertEqual("Infinity,Infinity,Infinity");

            let x7: Array<number> = new Array<number>(NaN, NaN, NaN);
            expect(x7.join()).assertEqual("NaN,NaN,NaN");
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0118
         * @tc.name ESArrayPrototypeTest0118
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0118';
            console.info(`${caseName}, test start`);
            let array: Array<string> = new Array<string>();
            let iterator = array.keys();
            let result: IteratorResult<number>;

            array.push('a');

            result = iterator.next();
            expect(result.done).assertEqual(false);
            expect(result.value).assertEqual(0);

            result = iterator.next();
            expect(result.done).assertEqual(true);
            expect(result.value).assertEqual(undefined);

            array.push('b');

            result = iterator.next();
            expect(result.done).assertEqual(true);
            expect(result.value).assertEqual(undefined);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0119
         * @tc.name ESArrayPrototypeTest0119
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0119';
            console.info(`${caseName}, test start`);
            let array: Array<string> = new Array<string>('a', 'b', 'c');
            let iterator = array.keys();
            let result: IteratorResult<number>;

            result = iterator.next();
            expect(result.value).assertEqual(0);
            expect(result.done).assertEqual(false);

            result = iterator.next();
            expect(result.value).assertEqual(1);
            expect(result.done).assertEqual(false);

            result = iterator.next();
            expect(result.value).assertEqual(2);
            expect(result.done).assertEqual(false);

            result = iterator.next();
            expect(result.value).assertEqual(undefined);
            expect(result.done).assertEqual(true);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0120
         * @tc.name ESArrayPrototypeTest0120
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0120';
            console.info(`${caseName}, test start`);
            let kIndex: Array<number> = new Array<number>();
            let i = kIndex.lastIndexOf(42);

            expect(i).assertEqual(-1);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0121
         * @tc.name ESArrayPrototypeTest0121
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0121';
            console.info(`${caseName}, test start`);
            let a: Array<number> = new Array<number>(1, 2, 1);

            expect(a.lastIndexOf(2, 1)).assertEqual(1);
            expect(a.lastIndexOf(2, 0)).assertEqual(-1);
            expect(a.lastIndexOf(1, 0)).assertEqual(0);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0122
         * @tc.name ESArrayPrototypeTest0122
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0122';
            console.info(`${caseName}, test start`);
            let a: Array<number> = new Array<number>(1, 2, 1);

            expect(a.lastIndexOf(2, undefined)).assertEqual(-1);
            expect(a.lastIndexOf(1, undefined)).assertEqual(0);
            expect(a.lastIndexOf(1)).assertEqual(2);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0123
         * @tc.name ESArrayPrototypeTest0123
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0123';
            console.info(`${caseName}, test start`);
            let arr: Array<number> = new Array<number>(0, 1, 2, 3, 4);

            expect(arr.lastIndexOf(0)).assertEqual(arr.lastIndexOf(0, 4));
            expect(arr.lastIndexOf(2)).assertEqual(arr.lastIndexOf(2, 4));
            expect(arr.lastIndexOf(4)).assertEqual(arr.lastIndexOf(4, 4));

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0124
         * @tc.name ESArrayPrototypeTest0124
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0124';
            console.info(`${caseName}, test start`);
            let arr1: Array<number> = new Array<number>(0, 100);
            let arr2: Array<number> = new Array<number>(200, 0);
            expect(arr1.lastIndexOf(100, 0)).assertEqual(-1);
            expect(arr2.lastIndexOf(200, 0)).assertEqual(0);

            arr1 = new Array<number>(0, 1, 2);
            arr2 = new Array<number>(0, 2, 1);
            expect(arr1.lastIndexOf(1, 1)).assertEqual(1);
            expect(arr2.lastIndexOf(1, 1)).assertEqual(-1);

            arr1 = new Array<number>(0, 1, 2);
            arr2 = new Array<number>(0, 2, 1);
            expect(arr1.lastIndexOf(1, -2)).assertEqual(1);
            expect(arr2.lastIndexOf(1, -2)).assertEqual(-1);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0125
         * @tc.name ESArrayPrototypeTest0125
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0125';
            console.info(`${caseName}, test start`);
            let arr: Array<number> = new Array<number>(0, 1, 2, 3, 4);
            expect(arr.lastIndexOf(0, 0)).assertEqual(0);
            expect(arr.lastIndexOf(0, 2)).assertEqual(0);
            expect(arr.lastIndexOf(2, 2)).assertEqual(2);
            expect(arr.lastIndexOf(2, 4)).assertEqual(2);
            expect(arr.lastIndexOf(4, 4)).assertEqual(4);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0126
         * @tc.name ESArrayPrototypeTest0126
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0126';
            console.info(`${caseName}, test start`);
            let a: Array<number> = new Array<number>(1, 2, 3);

            expect(a.lastIndexOf(3, 5)).assertEqual(2);
            expect(a.lastIndexOf(3, 3)).assertEqual(2);

            let arr: Array<number> = new Array<number>(1, 2, 3);
            expect(arr.lastIndexOf(3, 2)).assertEqual(2);

            arr = new Array<number>(1, 2, 3);
            expect(arr.lastIndexOf(3, 1)).assertEqual(-1);

            arr = new Array<number>();
            expect(arr.lastIndexOf(1, 0)).assertEqual(-1);

            arr = new Array<number>(1, 2, 3);
            expect(arr.lastIndexOf(3, 1)).assertEqual(-1);

            arr = new Array<number>(1, 2, 3);
            expect(arr.lastIndexOf(2, 1)).assertEqual(1);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0127
         * @tc.name ESArrayPrototypeTest0127
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0127';
            console.info(`${caseName}, test start`);
            let a: Array<number> = new Array<number>(1, 2, 3);

            expect(a.lastIndexOf(2, -2)).assertEqual(1);
            expect(a.lastIndexOf(2, -3)).assertEqual(-1);
            expect(a.lastIndexOf(1, -5)).assertEqual(-1);

            let arr: Array<number> = new Array<number>(1, 2, 3, 4);
            expect(arr.lastIndexOf(4, -1)).assertEqual(3);

            arr = new Array<number>(1, 2, 3, 4);
            expect(arr.lastIndexOf(3, -3)).assertEqual(-1);

            arr = new Array<number>(1, 2, 3, 4);
            expect(arr.lastIndexOf(2, -4)).assertEqual(-1);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0128
         * @tc.name ESArrayPrototypeTest0128
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0128';
            console.info(`${caseName}, test start`);
            let obj: A_bool = {
                toString1: (): boolean => {
                    return true;
                }
            };
            let _false = false;
            let a: Array<number | string | undefined | null | boolean | object> =
                new Array<number | string | undefined | null | boolean | object>(false, true, false, obj, _false, true, "true", undefined, 0, null, 1, "str", 0, 1);

            expect(a.lastIndexOf(true)).assertEqual(5);
            expect(a.lastIndexOf(false)).assertEqual(4);

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0129
         * @tc.name ESArrayPrototypeTest0129
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0129';
            console.info(`${caseName}, test start`);
            let obj: A_num = {
                toString1: (): number => {
                    return 0;
                }
            };
            let one = 1;
            let _float = -(4 / 3);
            let a: Array<number | string | undefined | null | boolean | object> =
                new Array<number | string | undefined | null | boolean | object>(+0, true, 0, -0, false, undefined, null, "0", obj, _float, -(4 / 3), -1.3333333333333, "str", one, 1, false);

            expect(a.lastIndexOf(-(4 / 3))).assertEqual(10);
            expect(a.lastIndexOf(0)).assertEqual(3);
            expect(a.lastIndexOf(-0)).assertEqual(3);
            expect(a.lastIndexOf(1)).assertEqual(14);

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0130
         * @tc.name ESArrayPrototypeTest0130
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0130';
            console.info(`${caseName}, test start`);
            let obj: A_str = {
                toString1: (): string => {
                    return "false1";
                }
            };
            let szFalse = "false";
            let a: Array<number | string | undefined | null | boolean | object> =
                new Array<number | string | undefined | null | boolean | object>(szFalse, "false", "false1", undefined, 0, false, null, 1, obj, 0);

            expect(a.lastIndexOf("false")).assertEqual(1);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0131
         * @tc.name ESArrayPrototypeTest0131
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0131';
            console.info(`${caseName}, test start`);
            let obj: A_und = {
                toString1: (): undefined => {
                    return undefined;
                }
            };
            let _undefined1 = undefined;
            let _undefined2: undefined;
            let a: Array<number | string | undefined | null | boolean | object> =
                new Array<number | string | undefined | null | boolean | object>(_undefined1, _undefined2, undefined, true, 0, false, null, 1, "undefined", obj, 1);

            expect(a.lastIndexOf(undefined)).assertEqual(2);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0132
         * @tc.name ESArrayPrototypeTest0132
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0132';
            console.info(`${caseName}, test start`);
            let obj1: A_str = {
                toString1: (): string => {
                    return "false";
                }
            };
            let obj2: A_str = {
                toString1: (): string => {
                    return "false";
                }
            };
            let obj3: A_str = obj1;
            let a: Array<number | string | undefined | null | boolean | object> =
                new Array<number | string | undefined | null | boolean | object>(obj2, obj1, obj3, false, undefined, 0, false, null, obj2, "false");

            expect(a.lastIndexOf(obj3)).assertEqual(2);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0133
         * @tc.name ESArrayPrototypeTest0133
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0133';
            console.info(`${caseName}, test start`);
            let obj: A_null = {
                toString1: (): null => {
                    return null;
                }
            };
            let _null = null;
            let a: Array<number | string | undefined | null | boolean | object> =
                new Array<number | string | undefined | null | boolean | object>(true, undefined, 0, false, null, 1, "str", 0, 1, null, true, false, undefined, _null, "null", undefined, "str", obj);

            expect(a.lastIndexOf(null)).assertEqual(13);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0134
         * @tc.name ESArrayPrototypeTest0134
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0134';
            console.info(`${caseName}, test start`);
            let a = new Array<object>(0, 1, 2, 3);
            a[2] = a;

            expect(a.lastIndexOf(a)).assertEqual(2);
            expect(a.lastIndexOf(3)).assertEqual(3);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0135
         * @tc.name ESArrayPrototypeTest0135
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0135';
            console.info(`${caseName}, test start`);
            let b: Array<string> = new Array<string>("0,1");
            let a: Array<number | string | Array<string>> = new Array<number | string | Array<string>>(0, b, "0,1", 3);

            expect(a.lastIndexOf(b.toString())).assertEqual(2);
            expect(a.lastIndexOf("0,1")).assertEqual(2);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0136
         * @tc.name ESArrayPrototypeTest0136
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0136';
            console.info(`${caseName}, test start`);
            let obj: A_nan = {
                toString1: (): number => {
                    return NaN;
                }
            };
            let _NaN = NaN;
            let a: Array<number | string | undefined | null | boolean | object> =
                new Array<number | string | undefined | null | boolean | object>("NaN", _NaN, NaN, undefined, 0, false, null, obj,
                    "false");

            expect(a.lastIndexOf(NaN)).assertEqual(-1);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0137
         * @tc.name ESArrayPrototypeTest0137
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0137';
            console.info(`${caseName}, test start`);
            let arr: Array<boolean> = new Array<boolean>(true, true, true);
            expect(arr.lastIndexOf(true)).assertEqual(2);
            arr[2] = false;
            expect(arr.lastIndexOf(true)).assertEqual(1);
            arr[1] = false;
            expect(arr.lastIndexOf(true)).assertEqual(0);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0138
         * @tc.name ESArrayPrototypeTest0138
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0138';
            console.info(`${caseName}, test start`);
            let a1: Array<string | boolean> = new Array<string | boolean>("true");
            expect(a1.lastIndexOf(true)).assertEqual(-1);

            let a2: Array<string | number> = new Array<string | number>("0");
            expect(a2.lastIndexOf(0)).assertEqual(-1);

            let a3: Array<boolean | number> = new Array<boolean | number>(false);
            expect(a3.lastIndexOf(0)).assertEqual(-1);

            let a4: Array<undefined | number> = new Array<undefined | number>(undefined);
            expect(a4.lastIndexOf(0)).assertEqual(-1);

            let a5: Array<null | number> = new Array<null | number>(null);
            expect(a5.lastIndexOf(0)).assertEqual(-1);

            let arr: Array<number> = new Array<number>();
            let a6: Array<Array<number> | number> = new Array<Array<number> | number>(arr);
            expect(a6.lastIndexOf(0)).assertEqual(-1);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0139
         * @tc.name ESArrayPrototypeTest0139
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0139';
            console.info(`${caseName}, test start`);
            let arr: Array<undefined> = new Array<undefined>(undefined);
            // expect(arr.lastIndexOf()).assertEqual(0);
            expect(arr.lastIndexOf(undefined)).assertEqual(0);

            let arrNull: Array<null> = new Array<null>(null);
            expect(arrNull.lastIndexOf(null)).assertEqual(0);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0140
         * @tc.name ESArrayPrototypeTest0140
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0140';
            console.info(`${caseName}, test start`);
            let arrNaN1: Array<number> = new Array<number>(+NaN, NaN, -NaN);
            expect(arrNaN1.lastIndexOf(NaN)).assertEqual(-1);

            let arrNaN2: Array<number> = new Array<number>(+NaN, NaN, -NaN);
            expect(arrNaN2.lastIndexOf(-NaN)).assertEqual(-1);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0141
         * @tc.name ESArrayPrototypeTest0141
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0141';
            console.info(`${caseName}, test start`);
            let arrPos0: Array<number> = new Array<number>(+0);
            expect(arrPos0.lastIndexOf(-0)).assertEqual(-1);

            let arrNeg0: Array<number> = new Array<number>(-0);
            expect(arrNeg0.lastIndexOf(+0)).assertEqual(-1);

            let arrNums: Array<number> = new Array<number>(-1, 0, 1);
            expect(arrNums.lastIndexOf(-1)).assertEqual(0);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0142
         * @tc.name ESArrayPrototypeTest0142
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0142';
            console.info(`${caseName}, test start`);
            let arrStr: Array<string> = new Array<string>("abc", "ab", "bca", "");
            expect(arrStr.lastIndexOf("abc")).assertEqual(0);

            let arrBool: Array<boolean> = new Array<boolean>(false, true);
            expect(arrBool.lastIndexOf(true)).assertEqual(1);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0143
         * @tc.name ESArrayPrototypeTest0143
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0143';
            console.info(`${caseName}, test start`);
            let obj1: A = {};
            let obj2: A = {};
            let obj3: A = obj2;

            let arr: Array<object> = new Array<object>(obj2, obj1);
            expect(arr.lastIndexOf(obj3)).assertEqual(0);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0144
         * @tc.name ESArrayPrototypeTest0144
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0144';
            console.info(`${caseName}, test start`);
            let arr: Array<number> = new Array<number>(2, 1, 2, 2, 1);
            expect(arr.lastIndexOf(2)).assertEqual(3);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0145
         * @tc.name ESArrayPrototypeTest0145
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0145';
            console.info(`${caseName}, test start`);
            let a: Array<number | string | object | undefined | null | boolean> = new Array<number | string | object | undefined | null | boolean>(123457);
            let b: object = new Object();
            a[100] = 1;
            a[99999] = "";
            a[10] = b;
            a[5555] = 5.5;
            a[123456] = "str";
            //a[5] = 1E+309;

            expect(a.lastIndexOf(1)).assertEqual(100);
            expect(a.lastIndexOf("")).assertEqual(99999);
            expect(a.lastIndexOf("str")).assertEqual(123456);
            expect(a.lastIndexOf(5.5)).assertEqual(5555);
            //expect(a.lastIndexOf(1E+309)).assertEqual(5);

            expect(a.lastIndexOf(true)).assertEqual(-1);
            expect(a.lastIndexOf(5)).assertEqual(-1);
            expect(a.lastIndexOf("str1")).assertEqual(-1);
            expect(a.lastIndexOf(null)).assertEqual(-1);
            expect(a.lastIndexOf(new Object())).assertEqual(-1);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0146
         * @tc.name ESArrayPrototypeTest0146
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0146';
            console.info(`${caseName}, test start`);
            let callbackfn: FuncType = (val: number, idx: int, obj: Array<number>): boolean => {
                return val > 10;
            }
            let arr: Array<number> = new Array<number>(12, 11);
            let testResult = arr.map(callbackfn);

            expect(testResult.length).assertEqual(2);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0147
         * @tc.name ESArrayPrototypeTest0147
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0147';
            console.info(`${caseName}, test start`);
            let callbackfn: FuncType = (val: number, idx: int, obj: Array<number>): boolean => {
                return val > 10;
            }
            let arr: Array<number> = new Array<number>(11, 9);

            let testResult = arr.map(callbackfn);

            expect(testResult.length).assertEqual(2);
            expect(testResult[0]).assertEqual(true);
            expect(testResult[1]).assertEqual(false);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0148
         * @tc.name ESArrayPrototypeTest0148
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0148';
            console.info(`${caseName}, test start`);
            let innerThisCorrect = false;
            let callbackfn: FuncType = (val: number, idx: int, obj: Array<number>): boolean => {
                innerThisCorrect = true;
                return true;
            }
            let arr: Array<number> = new Array<number>();
            arr.push(1);
            arr.map(callbackfn);

            expect(innerThisCorrect).assertEqual(true);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0149
         * @tc.name ESArrayPrototypeTest0149
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0149';
            console.info(`${caseName}, test start`);
            let callbackfn: FuncType = (val: number, idx: int, obj: Array<number>): boolean => {
                return true;
            }
            let arr: Array<number> = new Array<number>();
            arr.push(11);

            let newArr = arr.map(callbackfn);

            expect(Array.isArray(newArr)).assertEqual(true);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0150
         * @tc.name ESArrayPrototypeTest0150
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0150';
            console.info(`${caseName}, test start`);

            let callbackfn: FuncType = (val: number, idx: int, obj: Array<number>): boolean => {
                return true;
            }
            let arr: Array<number> = new Array<number>();
            arr.push(11);

            let newArr = arr.map(callbackfn);

            expect(newArr instanceof Array).assertEqual(true);
            console.info(`${caseName}, test end`);
        });
		
    })
}