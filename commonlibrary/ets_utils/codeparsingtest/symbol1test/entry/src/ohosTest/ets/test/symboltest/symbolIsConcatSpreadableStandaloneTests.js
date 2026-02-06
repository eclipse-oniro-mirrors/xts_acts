/*
* Copyright (C) 2025 HiHope Open Source Organization.
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
export const SymbolIsConcatSpreadableStandaloneTestUtils = {
    /**
     * 001. Array default behavior (isConcatSpreadable not set, defaults to true).
     * Feature: Arrays are spread by default in Array.prototype.concat().
     */
    async test001_ArrayDefaultSpread() {
        const arr1 = [1, 2];
        const arr2 = [3, 4];
        const result = arr1.concat(arr2);

        if (JSON.stringify(result) !== "[1,2,3,4]") {
            throw new Error(`Test001 failed: Default spread returned [${result}] (expected [1,2,3,4])`);
        }
        return "Test Passed: ArrayDefaultSpreadTest001";
    },

    /**
     * 002. Array with isConcatSpreadable=false (not spread).
     * Feature: Arrays with isConcatSpreadable=false are treated as single element in concat().
     */
    async test002_ArraySetFalseNotSpread() {
        const arr1 = [1, 2];
        const arr2 = [3, 4];
        arr2[Symbol.isConcatSpreadable] = false;
        const result = arr1.concat(arr2);

        if (JSON.stringify(result) !== "[1,2,[3,4]]") {
            throw new Error(`Test002 failed: Set false returned [${result}] (expected [1,2,[3,4]])`);
        }
        return "Test Passed: ArraySetFalseNotSpreadTest002";
    },

    /**
     * 003. Array-like object with isConcatSpreadable=true (spread).
     * Feature: Array-like objects (with length/index) are spread when property is true.
     */
    async test003_ArrayLikeSetTrueSpread() {
        const arrLike = {
            0: "a",
            1: "b",
            length: 2,
            [Symbol.isConcatSpreadable]: true
        };
        const result = [].concat(arrLike);

        if (JSON.stringify(result) !== '["a","b"]') {
            throw new Error(`Test003 failed: Array-like set true returned [${result}] (expected ["a","b"])`,);
        }
        return "Test Passed: ArrayLikeSetTrueSpreadTest003";
    },

    /**
     * 004. Array-like object default (not spread).
     * Feature: Array-like objects are not spread by default in concat().
     */
    async test004_ArrayLikeDefaultNotSpread() {
        const arrLike = {
            0: "a",
            1: "b",
            length: 2
        };
        const result = [].concat(arrLike);

        if (JSON.stringify(result) !== `[${JSON.stringify(arrLike)}]`) {
            throw new Error(`Test004 failed: Array-like default returned [${result}] (expected [object])`);
        }
        return "Test Passed: ArrayLikeDefaultNotSpreadTest004";
    },






    /**
     * 007. Nested array with isConcatSpreadable=false.
     * Feature: Nested arrays respect their own isConcatSpreadable setting.
     */
    async test007_NestedArraySpreadControl() {
        const outer = [1];
        const nested = [2, 3];
        nested[Symbol.isConcatSpreadable] = false;
        const result = outer.concat(nested);

        if (JSON.stringify(result) !== "[1,[2,3]]") {
            throw new Error(`Test007 failed: Nested set false returned [${result}] (expected [1,[2,3]])`);
        }
        return "Test Passed: NestedArraySpreadControlTest007";
    },


    /**
     * 009. Non-boolean values coerced to boolean.
     * Feature: Non-boolean values are coerced (0→false, 1→true) to control spread.
     */
    async test009_NonBooleanCoercion() {
        const arrTrue = [1, 2];
        arrTrue[Symbol.isConcatSpreadable] = 1;
        const arrFalse = [3, 4];
        arrFalse[Symbol.isConcatSpreadable] = 0;

        const result1 = [].concat(arrTrue);
        const result2 = [].concat(arrFalse);

        if (JSON.stringify(result1) !== "[1,2]" || JSON.stringify(result2) !== "[[3,4]]") {
            throw new Error(`Test009 failed: Non-boolean coercion returned (${JSON.stringify(result1)}, ${JSON.stringify(result2)}) (expected [1,2], [[3,4]])`,);
        }
        return "Test Passed: NonBooleanCoercionTest009";
    },

    /**
     * 011. Array-like object with isConcatSpreadable=false (not spread).
     * Feature: Array-like objects with property=false are treated as single element.
     */
    async test011_ArrayLikeSetFalseNotSpread() {
        const arrLike = {
            0: "x",
            1: "y",
            length: 2,
            [Symbol.isConcatSpreadable]: false
        };
        const result = [].concat(arrLike);

        if (result.length !== 1 || result[0] !== arrLike) {
            throw new Error(`Test011 failed: Array-like set false returned [${JSON.stringify(result)}] (expected [object])`);
        }
        return "Test Passed: ArrayLikeSetFalseNotSpreadTest011";
    },

    /**
     * 012. Empty array-like object with isConcatSpreadable=true (spread to empty).
     * Feature: Empty array-like (length=0) spreads to empty array.
     */
    async test012_EmptyArrayLikeSetTrueSpread() {
        const emptyArrLike = {
            length: 0,
            [Symbol.isConcatSpreadable]: true
        };
        const result = [1, 2].concat(emptyArrLike);

        if (JSON.stringify(result) !== "[1,2]") {
            throw new Error(`Test012 failed: Empty array-like spread returned [${result}] (expected [1,2])`);
        }
        return "Test Passed: EmptyArrayLikeSetTrueSpreadTest012";
    },

    /**
     * 014. Function (array-like) with isConcatSpreadable=true (spread to arguments).
     * Feature: Functions (array-like via arguments) spread when property=true.
     */
    async test014_FunctionArrayLikeSpread() {
        function testFunc() {
            this[Symbol.isConcatSpreadable] = true;
            return this;
        }
        const funcArrLike = testFunc.call({ 0: "arg1", 1: "arg2", length: 2 });
        const result = [].concat(funcArrLike);

        if (JSON.stringify(result) !== '["arg1","arg2"]') {
            throw new Error(`Test014 failed: Function array-like spread returned [${result}] (expected ["arg1","arg2"])`,);
        }
        return "Test Passed: FunctionArrayLikeSpreadTest014";
    },

    /**
     * 015. Symbol.isConcatSpreadable set to null (coerced to false).
     * Feature: Null value is coerced to false, object not spread.
     */
    async test015_SetToNullCoercion() {
        const arr = [1, 2];
        arr[Symbol.isConcatSpreadable] = null;
        const result = [3].concat(arr);

        if (JSON.stringify(result) !== "[3,[1,2]]") {
            throw new Error(`Test015 failed: Null coercion returned [${result}] (expected [3,[1,2]])`);
        }
        return "Test Passed: SetToNullCoercionTest015";
    },

    /**
     * 016. Symbol.isConcatSpreadable set to undefined (uses default behavior).
     * Feature: Undefined value uses default (arrays spread, array-like not).
     */
    async test016_SetToUndefinedDefault() {
        const arr = [1, 2];
        arr[Symbol.isConcatSpreadable] = undefined;
        const arrLike = { 0: "a", 1: "b", length: 2 };
        arrLike[Symbol.isConcatSpreadable] = undefined;

        const result1 = [3].concat(arr);
        const result2 = [].concat(arrLike);

        if (JSON.stringify(result1) !== "[3,1,2]" || result2.length !== 1) {
            throw new Error(`Test016 failed: Undefined default returned (${JSON.stringify(result1)}, ${JSON.stringify(result2)}) (expected [3,1,2], [object])`,);
        }
        return "Test Passed: SetToUndefinedDefaultTest016";
    },


    /**
     * 018. Mixed types concat (array + array-like + plain object).
     * Feature: Mixed types respect their own spread settings.
     */
    async test018_MixedTypesConcat() {
        const arr = [1];
        const arrLike = { 0: "a", 1: "b", length: 2, [Symbol.isConcatSpreadable]: true };
        const plainObj = { name: "obj" };

        const result = arr.concat(arrLike, plainObj);

        if (JSON.stringify(result) !== '[1,"a","b",{"name":"obj"}]') {
            throw new Error(`Test018 failed: Mixed types concat returned [${JSON.stringify(result)}] (expected [1,"a","b",{"name":"obj"}])`,);
        }
        return "Test Passed: MixedTypesConcatTest018";
    },

    /**
     * 019. Frozen array-like with isConcatSpreadable=true (still spread).
     * Feature: Frozen array-like objects can be spread if property=true.
     */
    async test019_FrozenArrayLikeSpread() {
        const frozenArrLike = Object.freeze({
            0: "f1",
            1: "f2",
            length: 2,
            [Symbol.isConcatSpreadable]: true
        });
        const result = [].concat(frozenArrLike);

        if (JSON.stringify(result) !== '["f1","f2"]') {
            throw new Error(`Test019 failed: Frozen array-like spread returned [${result}] (expected ["f1","f2"])`,);
        }
        return "Test Passed: FrozenArrayLikeSpreadTest019";
    },



    /**
     * 021. Array subclass instance default spread.
     * Feature: Subclass of Array inherits default spread behavior (true).
     */
    async test021_ArraySubclassDefaultSpread() {
        class ArraySubclass extends Array {}
        const subArr = new ArraySubclass(5, 6);
        const result = [1, 2].concat(subArr);

        if (JSON.stringify(result) !== "[1,2,5,6]") {
            throw new Error(`Test021 failed: Array subclass default spread returned [${result}] (expected [1,2,5,6])`);
        }
        return "Test Passed: ArraySubclassDefaultSpreadTest021";
    },

    /**
     * 022. Array subclass instance set false not spread.
     * Feature: Array subclass instance with property=false is not spread.
     */
    async test022_ArraySubclassSetFalseNotSpread() {
        class ArraySubclass extends Array {}
        const subArr = new ArraySubclass(5, 6);
        subArr[Symbol.isConcatSpreadable] = false;
        const result = [1, 2].concat(subArr);

        if (JSON.stringify(result) !== "[1,2,[5,6]]") {
            throw new Error(`Test022 failed: Array subclass set false returned [${result}] (expected [1,2,[5,6]])`);
        }
        return "Test Passed: ArraySubclassSetFalseNotSpreadTest022";
    },

    /**
     * 023. Symbol.isConcatSpreadable set to string "true" (coerced to true).
     * Feature: String "true" is coerced to true, array spread.
     */
    async test023_SetToStringTrueCoercion() {
        const arr = [7, 8];
        arr[Symbol.isConcatSpreadable] = "true";
        const result = [1].concat(arr);

        if (JSON.stringify(result) !== "[1,7,8]") {
            throw new Error(`Test023 failed: String "true" coercion returned [${result}] (expected [1,7,8])`);
        }
        return "Test Passed: SetToStringTrueCoercionTest023";
    },



    /**
     * 029. Dynamic array-like (add indices after property set).
     * Feature: Dynamic array-like spreads latest indexed properties (length updated).
     */
    async test029_DynamicArrayLikeSpread() {
        const dynamicArrLike = {
            length: 2,
            [Symbol.isConcatSpreadable]: true
        };
        dynamicArrLike[0] = "d1";
        dynamicArrLike[1] = "d2";
        dynamicArrLike.length = 3;
        dynamicArrLike[2] = "d3";

        const result = [].concat(dynamicArrLike);

        if (JSON.stringify(result) !== '["d1","d2","d3"]') {
            throw new Error(`Test029 failed: Dynamic array-like spread returned [${result}] (expected ["d1","d2","d3"])`,);
        }
        return "Test Passed: DynamicArrayLikeSpreadTest029";
    },

    /**
     * 030. Symbol.isConcatSpreadable on prototype chain (inherited setting).
     * Feature: Array-like inherits spread setting from prototype.
     */
    async test030_InheritedSpreadSetting() {
        const proto = {
            [Symbol.isConcatSpreadable]: true
        };
        const arrLike = Object.create(proto);
        arrLike[0] = "i1";
        arrLike[1] = "i2";
        arrLike.length = 2;

        const result = [].concat(arrLike);

        if (JSON.stringify(result) !== '["i1","i2"]') {
            throw new Error(`Test030 failed: Inherited spread setting returned [${result}] (expected ["i1","i2"])`,);
        }
        return "Test Passed: InheritedSpreadSettingTest030";
    }

};