/*
 * Copyright (c) 2026 RKH Corp.
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

/**
 * Array.prototype.reduceRight() 基础测试函数库
 * 
 * 此文件包含可在 ArkTS 中调用的测试函数
 * 用于 BuiltinsArrayReduceRightTest.test.ets 和 BuiltinsArrayReduceRightExtendedTest.test.ets
 */



/**
 * @tc.name   ArrayReduceRightSumWithInitialTest0100
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_BASIC_SUM_0100
 * @tc.desc   Test reduceRight() with numeric array and initial value
 */
export function ArrayReduceRightSumWithInitialTest0100() {
    let arr = [1, 2, 3, 4];
    let sum = arr.reduceRight((acc, cur) => acc + cur, 0);
    return sum === 10;
}

/**
 * @tc.name   ArrayReduceRightStringConcatTest0200
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_BASIC_STRING_0200
 * @tc.desc   Test reduceRight() with string array concatenation
 */
export function ArrayReduceRightStringConcatTest0200() {
    let arr = ['a', 'b', 'c'];
    let result = arr.reduceRight((acc, cur) => acc + cur, '');
    return result === 'cba';
}

/**
 * @tc.name   ArrayReduceRightObjectPropertySumTest0300
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_BASIC_OBJPROP_0300
 * @tc.desc   Test reduceRight() summing object properties
 */
export function ArrayReduceRightObjectPropertySumTest0300() {
    let arr = [{x: 1}, {x: 2}, {x: 3}];
    let sum = arr.reduceRight((acc, cur) => acc + cur.x, 0);
    return sum === 6;
}

/**
 * @tc.name   ArrayReduceRightWithoutInitialTest0400
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_BASIC_NOINITIAL_0400
 * @tc.desc   Test reduceRight() without initial value (uses last element)
 */
export function ArrayReduceRightWithoutInitialTest0400() {
    let arr = [1, 2, 3, 4];
    let sum = arr.reduceRight((acc, cur) => acc + cur);
    return sum === 10;
}

/**
 * @tc.name   ArrayReduceRightSingleElementNoInitialTest0500
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_BASIC_SINGLE_0500
 * @tc.desc   Test reduceRight() with single element array without initial value
 */
export function ArrayReduceRightSingleElementNoInitialTest0500() {
    let arr = [5];
    let result = arr.reduceRight((acc, cur) => acc + cur);
    return result === 5;
}

/**
 * @tc.name   ArrayReduceRightReturnNumberTest0600
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_BASIC_RETNUMBER_0600
 * @tc.desc   Test reduceRight() returning number type
 */
export function ArrayReduceRightReturnNumberTest0600() {
    let arr = [1, 2, 3];
    let result = arr.reduceRight((acc, cur) => acc * cur, 1);
    return typeof result === 'number' && result === 6;
}

/**
 * @tc.name   ArrayReduceRightReturnStringTest0700
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_BASIC_RETSTRING_0700
 * @tc.desc   Test reduceRight() returning string type
 */
export function ArrayReduceRightReturnStringTest0700() {
    let arr = [1, 2, 3];
    let result = arr.reduceRight((acc, cur) => acc + cur.toString(), '');
    return typeof result === 'string' && result === '321';
}

/**
 * @tc.name   ArrayReduceRightReturnObjectTest0800
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_BASIC_RETOBJ_0800
 * @tc.desc   Test reduceRight() returning object type
 */
export function ArrayReduceRightReturnObjectTest0800() {
    let arr = [{a: 1}, {b: 2}];
    let result = arr.reduceRight((acc, cur) => ({...acc, ...cur}), {});
    return typeof result === 'object' && result.a === 1 && result.b === 2;
}

/**
 * @tc.name   ArrayReduceRightReturnArrayTest0900
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_BASIC_RETARRAY_0900
 * @tc.desc   Test reduceRight() returning array type
 */
export function ArrayReduceRightReturnArrayTest0900() {
    let arr = [1, 2, 3];
    let result = arr.reduceRight((acc, cur) => [...acc, cur], []);
    return Array.isArray(result) && 
           result.length === 3 && 
           result[0] === 3 && 
           result[1] === 2 && 
           result[2] === 1;
}



/**
 * @tc.name   ArrayReduceRightCallbackParamsTest1000
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_PARAMS_CALLBACK_1000
 * @tc.desc   Test reduceRight() callback receives 4 parameters
 */
export function ArrayReduceRightCallbackParamsTest1000() {
    let arr = [1, 2, 3];
    let params = [];
    arr.reduceRight((acc, cur, index, array) => {
        params.push({acc, cur, index, isArray: array === arr});
        return acc + cur;
    }, 0);
    return params.length === 3 &&
           params[0].cur === 3 && params[0].index === 2 &&
           params[1].cur === 2 && params[1].index === 1 &&
           params[2].cur === 1 && params[2].index === 0 &&
           params.every(p => p.isArray);
}

/**
 * @tc.name   ArrayReduceRightInitialValueTest1100
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_PARAMS_INITIAL_1100
 * @tc.desc   Test reduceRight() with explicit initial value
 */
export function ArrayReduceRightInitialValueTest1100() {
    let arr = [1, 2, 3];
    let result = arr.reduceRight((acc, cur) => acc + cur, 100);
    return result === 106;
}

/**
 * @tc.name   ArrayReduceRightInitialUndefinedTest1200
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_PARAMS_UNDEF_1200
 * @tc.desc   Test reduceRight() with undefined as initial value
 */
export function ArrayReduceRightInitialUndefinedTest1200() {
    let arr = [1, 2];
    let firstAcc = undefined;

    arr.reduceRight((acc, cur) => {
        if (firstAcc === undefined) {
            firstAcc = acc;
        }
        return cur;
    }, undefined);

    return firstAcc === 2;
}

/**
 * @tc.name   ArrayReduceRightInitialNullTest1300
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_PARAMS_NULL_1300
 * @tc.desc   Test reduceRight() with null as initial value
 */
export function ArrayReduceRightInitialNullTest1300() {
    let arr = [1, 2, 3];
    let result = arr.reduceRight((acc, cur) => {
        return acc === null ? cur : acc + cur;
    }, null);
    return result === 6;
}



/**
 * @tc.name   ArrayReduceRightTraverseOrderTest1400
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_TRAVERSE_ORDER_1400
 * @tc.desc   Test reduceRight() traverses from right to left
 */
export function ArrayReduceRightTraverseOrderTest1400() {
    let arr = [1, 2, 3, 4, 5];
    let order = [];
    arr.reduceRight((acc, cur) => {
        order.push(cur);
        return acc + cur;
    }, 0);
    return order.length === 5 &&
           order[0] === 5 &&
           order[1] === 4 &&
           order[2] === 3 &&
           order[3] === 2 &&
           order[4] === 1;
}

/**
 * @tc.name   ArrayReduceRightIndexOrderTest1500
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_TRAVERSE_INDEX_1500
 * @tc.desc   Test reduceRight() index decreases from right to left
 */
export function ArrayReduceRightIndexOrderTest1500() {
    let arr = [10, 20, 30, 40];
    let indices = [];
    arr.reduceRight((acc, cur, index) => {
        indices.push(index);
        return acc + cur;
    }, 0);
    return indices.length === 4 &&
           indices[0] === 3 &&
           indices[1] === 2 &&
           indices[2] === 1 &&
           indices[3] === 0;
}

/**
 * @tc.name   ArrayReduceRightSparseArrayTest1600
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_SPARSE_MIDDLE_1600
 * @tc.desc   Test reduceRight() skips holes in sparse array
 */
export function ArrayReduceRightSparseArrayTest1600() {
    let arr = [1, , , 4]; // sparse array with holes
    let visited = [];
    arr.reduceRight((acc, cur, index) => {
        visited.push({index, value: cur});
        return acc + cur;
    }, 0);
    return visited.length === 2 &&
           visited[0].index === 3 &&
           visited[1].index === 0;
}

/**
 * @tc.name   ArrayReduceRightSparseStartTest1700
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_SPARSE_START_1700
 * @tc.desc   Test reduceRight() with holes at start
 */
export function ArrayReduceRightSparseStartTest1700() {
    let arr = [, , 3, 4, 5];
    let count = 0;
    arr.reduceRight((acc, cur) => {
        count++;
        return acc + cur;
    }, 0);
    return count === 3; // Only visits 5, 4, 3
}

/**
 * @tc.name   ArrayReduceRightSparseEndTest1800
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_SPARSE_END_1800
 * @tc.desc   Test reduceRight() with holes at end
 */
export function ArrayReduceRightSparseEndTest1800() {
    let arr = [1, 2, 3, , ,];
    let count = 0;
    arr.reduceRight((acc, cur) => {
        count++;
        return acc + cur;
    }, 0);
    return count === 3; // Only visits 3, 2, 1
}

/**
 * @tc.name   ArrayReduceRightSparseAllHolesWithInitialTest1900
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_SPARSE_ALL_WITH_1900
 * @tc.desc   Test reduceRight() on all-holes array with initial value
 */
export function ArrayReduceRightSparseAllHolesWithInitialTest1900() {
    let arr = new Array(5); // all holes
    let callbackCalled = false;
    let result = arr.reduceRight((acc, cur) => {
        callbackCalled = true;
        return acc;
    }, 10);
    return !callbackCalled && result === 10;
}



/**
 * @tc.name   ArrayReduceRightEmptyWithInitialTest2000
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_BOUND_EMPTY_WITH_2000
 * @tc.desc   Test reduceRight() on empty array with initial value
 */
export function ArrayReduceRightEmptyWithInitialTest2000() {
    let arr = [];
    let result = arr.reduceRight((acc, cur) => acc + cur, 0);
    return result === 0;
}

/**
 * @tc.name   ArrayReduceRightEmptyObjectInitialTest2100
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_BOUND_EMPTY_OBJ_2100
 * @tc.desc   Test reduceRight() on empty array with object initial value
 */
export function ArrayReduceRightEmptyObjectInitialTest2100() {
    let arr = [];
    let initialObj = {sum: 0};
    let result = arr.reduceRight((acc, cur) => {
        acc.sum += cur;
        return acc;
    }, initialObj);
    return result === initialObj && result.sum === 0;
}

/**
 * @tc.name   ArrayReduceRightSingleWithInitialTest2200
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_BOUND_SINGLE_WITH_2200
 * @tc.desc   Test reduceRight() on single element with initial value
 */
export function ArrayReduceRightSingleWithInitialTest2200() {
    let arr = [5];
    let result = arr.reduceRight((acc, cur) => acc + cur, 10);
    return result === 15;
}

/**
 * @tc.name   ArrayReduceRightSingleObjectNoInitialTest2300
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_BOUND_SINGLE_OBJ_2300
 * @tc.desc   Test reduceRight() on single object element without initial value
 */
export function ArrayReduceRightSingleObjectNoInitialTest2300() {
    let arr = [{x: 1, y: 2}];
    let result = arr.reduceRight((acc, cur) => acc);
    return result.x === 1 && result.y === 2;
}

/**
 * @tc.name   ArrayReduceRightLargeArrayTest2400
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_BOUND_LARGE_2400
 * @tc.desc   Test reduceRight() on large array (10000 elements)
 */
export function ArrayReduceRightLargeArrayTest2400() {
    let arr = [];
    for (let i = 1; i <= 10000; i++) {
        arr.push(i);
    }
    let sum = arr.reduceRight((acc, cur) => acc + cur, 0);
    return sum === 50005000; // sum of 1 to 10000
}

/**
 * @tc.name   ArrayReduceRightNullElementsTest2500
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_BOUND_NULL_2500
 * @tc.desc   Test reduceRight() with null elements
 */
export function ArrayReduceRightNullElementsTest2500() {
    let arr = [1, null, 3];
    let result = arr.reduceRight((acc, cur) => acc + (cur || 0), 0);
    return result === 4;
}

/**
 * @tc.name   ArrayReduceRightUndefinedElementsTest2600
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_BOUND_UNDEF_2600
 * @tc.desc   Test reduceRight() with undefined elements
 */
export function ArrayReduceRightUndefinedElementsTest2600() {
    let arr = [1, undefined, 3];
    let result = arr.reduceRight((acc, cur) => acc + (cur || 0), 0);
    return result === 4;
}

/**
 * @tc.name   ArrayReduceRightAllNullTest2700
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_BOUND_ALLNULL_2700
 * @tc.desc   Test reduceRight() with all null elements
 */
export function ArrayReduceRightAllNullTest2700() {
    let arr = [null, null, null];
    let count = 0;
    arr.reduceRight((acc, cur) => {
        count++;
        return acc;
    }, 0);
    return count === 3;
}



/**
 * @tc.name   ArrayReduceRightInitialBooleanTest2800
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_INITIAL_BOOL_2800
 * @tc.desc   Test reduceRight() with boolean initial value
 */
export function ArrayReduceRightInitialBooleanTest2800() {
    let arr = [true, false, true];
    let result = arr.reduceRight((acc, cur) => acc && cur, true);
    return result === false;
}

/**
 * @tc.name   ArrayReduceRightInitialFunctionTest2900
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_INITIAL_FUNC_2900
 * @tc.desc   Test reduceRight() with function initial value
 */
export function ArrayReduceRightInitialFunctionTest2900() {
    let arr = [x => x * 2, x => x + 1];
    let result = arr.reduceRight((acc, cur) => {
        return x => cur(acc(x));
    }, x => x);
    return result(5) === 12; // (5 + 1) * 2 = 12
}

/**
 * @tc.name   ArrayReduceRightWithoutInitialCallbackCountTest3000
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_INITIAL_NOCALL_3000
 * @tc.desc   Test reduceRight() without initial value calls callback one less time
 */
export function ArrayReduceRightWithoutInitialCallbackCountTest3000() {
    let arr = [1, 2, 3];
    let countWithInitial = 0;
    let countWithoutInitial = 0;
    
    arr.reduceRight((acc, cur) => {
        countWithInitial++;
        return acc + cur;
    }, 0);
    
    arr.reduceRight((acc, cur) => {
        countWithoutInitial++;
        return acc + cur;
    });
    
    return countWithInitial === 3 && countWithoutInitial === 2;
}

/**
 * @tc.name   ArrayReduceRightInitialNaNTest3100
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_INITIAL_NAN_3100
 * @tc.desc   Test reduceRight() with NaN initial value
 */
export function ArrayReduceRightInitialNaNTest3100() {
    let arr = [1, 2, 3];
    let result = arr.reduceRight((acc, cur) => {
        if (Number.isNaN(acc)) return cur;
        return acc + cur;
    }, NaN);
    return result === 6;
}

/**
 * @tc.name   ArrayReduceRightInitialInfinityTest3200
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_INITIAL_INF_3200
 * @tc.desc   Test reduceRight() with Infinity initial value
 */
export function ArrayReduceRightInitialInfinityTest3200() {
    let arr = [1, 2, 3];
    let result = arr.reduceRight((acc, cur) => {
        return acc === Infinity ? cur : acc + cur;
    }, Infinity);
    return result === 6;
}



/**
 * @tc.name   ArrayReduceRightCallbackMustReturnTest3500
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_CB_RETURN_3500
 * @tc.desc   Test reduceRight() accumulator becomes undefined if callback has no return
 */
export function ArrayReduceRightCallbackMustReturnTest3500() {
    let arr = [1, 2, 3];
    let result = arr.reduceRight((acc, cur) => {
        // no return
    }, 0);
    return result === undefined;
}

/**
 * @tc.name   ArrayReduceRightAccIsPrevReturnTest3600
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_CB_ACCPREV_3600
 * @tc.desc   Test reduceRight() accumulator is previous return value
 */
export function ArrayReduceRightAccIsPrevReturnTest3600() {
    let arr = [1, 2, 3];
    let history = [];
    arr.reduceRight((acc, cur) => {
        history.push(acc);
        return acc + cur;
    }, 0);
    return history.length === 3 &&
           history[0] === 0 &&
           history[1] === 3 &&
           history[2] === 5;
}

/**
 * @tc.name   ArrayReduceRightArrayParamTest3700
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_CB_ARRAY_3700
 * @tc.desc   Test reduceRight() array parameter is original array reference
 */
export function ArrayReduceRightArrayParamTest3700() {
    let arr = [1, 2, 3];
    let refs = [];
    arr.reduceRight((acc, cur, index, array) => {
        refs.push(array === arr);
        return acc;
    }, 0);
    return refs.every(r => r === true);
}

/**
 * @tc.name   ArrayReduceRightArrowThisTest3800
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_CB_ARROWTHIS_3800
 * @tc.desc   Test reduceRight() arrow function this binding
 */
export function ArrayReduceRightArrowThisTest3800() {
    let obj = {
        multiplier: 2,
        calc: function() {
            let arr = [1, 2, 3];
            return arr.reduceRight((acc, cur) => {
                return acc + cur * this.multiplier;
            }, 0);
        }
    };
    return obj.calc() === 12; // (3*2 + 2*2 + 1*2) = 12
}

/**
 * @tc.name   ArrayReduceRightModifyAccTest3900
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_CB_MODIFYACC_3900
 * @tc.desc   Test reduceRight() modifying object accumulator
 */
export function ArrayReduceRightModifyAccTest3900() {
    let arr = [1, 2, 3];
    let result = arr.reduceRight((acc, cur) => {
        acc.sum += cur;
        acc.values.push(cur);
        return acc;
    }, {sum: 0, values: []});
    return result.sum === 6 && 
           result.values.length === 3 &&
           result.values[0] === 3;
}

/**
 * @tc.name   ArrayReduceRightModifyArrayTest4000
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_CB_MODIFYARR_4000
 * @tc.desc   Test reduceRight() modifying original array in callback
 */
export function ArrayReduceRightModifyArrayTest4000() {
    let arr = [1, 2, 3, 4];
    let result = arr.reduceRight((acc, cur, index, array) => {
        if (index === 2) array.push(5);
        return acc + cur;
    }, 0);
    return result === 10; // 4 + 3 + 2 + 1 = 10
}



/**
 * @tc.name   ArrayReduceRightVsReduceDirectionTest4100
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_VS_DIR_4100
 * @tc.desc   Test reduceRight() vs reduce() direction difference
 */
export function ArrayReduceRightVsReduceDirectionTest4100() {
    let arr = ['a', 'b', 'c'];
    let rightOrder = [];
    let leftOrder = [];
    
    arr.reduceRight((acc, cur) => {
        rightOrder.push(cur);
        return acc;
    }, '');
    
    arr.reduce((acc, cur) => {
        leftOrder.push(cur);
        return acc;
    }, '');
    
    return rightOrder[0] === 'c' && rightOrder[2] === 'a' &&
           leftOrder[0] === 'a' && leftOrder[2] === 'c';
}

/**
 * @tc.name   ArrayReduceRightVsReduceSubtractionTest4200
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_VS_SUB_4200
 * @tc.desc   Test reduceRight() vs reduce() subtraction difference
 */
export function ArrayReduceRightVsReduceSubtractionTest4200() {
    let arr = [1, 2, 3];
    let reduceResult = arr.reduce((acc, cur) => acc - cur);
    let reduceRightResult = arr.reduceRight((acc, cur) => acc - cur);
    return reduceResult === -4 && reduceRightResult === 0;
    // reduce: 1-2-3 = -4
    // reduceRight: 3-2-1 = 0
}



/**
 * @tc.name   ArrayReduceRightFlattenArrayTest4300
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_FLATTEN_4300
 * @tc.desc   Test reduceRight() flattening nested array
 */
export function ArrayReduceRightFlattenArrayTest4300() {
    let arr = [[1, 2], [3, 4], [5, 6]];
    let result = arr.reduceRight((acc, cur) => acc.concat(cur), []);
    return result.length === 6 &&
           result[0] === 5 && result[1] === 6 &&
           result[2] === 3 && result[3] === 4 &&
           result[4] === 1 && result[5] === 2;
}

/**
 * @tc.name   ArrayReduceRightGroupByTest4400
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_GROUPBY_4400
 * @tc.desc   Test reduceRight() grouping objects by property
 */
export function ArrayReduceRightGroupByTest4400() {
    let arr = [
        {name: 'Alice', age: 25},
        {name: 'Bob', age: 30},
        {name: 'Alice', age: 28}
    ];
    let result = arr.reduceRight((acc, cur) => {
        if (!acc[cur.name]) acc[cur.name] = [];
        acc[cur.name].push(cur.age);
        return acc;
    }, {});
    return result.Alice.length === 2 && result.Bob.length === 1;
}

/**
 * @tc.name   ArrayReduceRightComposeFunctionsTest4500
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_COMPOSE_4500
 * @tc.desc   Test reduceRight() composing functions
 */
export function ArrayReduceRightComposeFunctionsTest4500() {
    let arr = [
        x => x * 2,
        x => x + 1,
        x => x - 3
    ];
    let composed = arr.reduceRight((acc, cur) => {
        return x => cur(acc(x));
    }, x => x);
    // composed(x) = (x - 3 + 1) * 2 = (x - 2) * 2
    return composed(5) === 6;
}

/**
 * @tc.name   ArrayReduceRightRemoveDuplicatesTest4600
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_DEDUP_4600
 * @tc.desc   Test reduceRight() removing duplicates while preserving order
 */
export function ArrayReduceRightRemoveDuplicatesTest4600() {
    let arr = [1, 2, 2, 3, 4, 4, 5];
    let result = arr.reduceRight((acc, cur) => {
        if (!acc.includes(cur)) acc.unshift(cur);
        return acc;
    }, []);
    return result.length === 5 &&
           result[0] === 1 && result[4] === 5;
}

/**
 * @tc.name   ArrayReduceRightCountOccurrencesTest4700
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_COUNT_4700
 * @tc.desc   Test reduceRight() counting occurrences
 */
export function ArrayReduceRightCountOccurrencesTest4700() {
    let arr = ['a', 'b', 'a', 'c', 'b', 'a'];
    let result = arr.reduceRight((acc, cur) => {
        acc[cur] = (acc[cur] || 0) + 1;
        return acc;
    }, {});
    return result.a === 3 && result.b === 2 && result.c === 1;
}



/**
 * @tc.name   ArrayReduceRightInt8ArrayTest4900
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_TYPED_INT8_4900
 * @tc.desc   Test reduceRight() on Int8Array
 */
export function ArrayReduceRightInt8ArrayTest4900() {
    let arr = new Int8Array([1, 2, 3, 4, 5]);
    let sum = arr.reduceRight((acc, cur) => acc + cur, 0);
    return sum === 15;
}

/**
 * @tc.name   ArrayReduceRightFloat32ArrayTest5000
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_TYPED_FLOAT32_5000
 * @tc.desc   Test reduceRight() on Float32Array
 */
export function ArrayReduceRightFloat32ArrayTest5000() {
    let arr = new Float32Array([1.5, 2.5, 3.5]);
    let sum = arr.reduceRight((acc, cur) => acc + cur, 0);
    return Math.abs(sum - 7.5) < 0.001;
}



/**
 * @tc.name   ArrayReduceRightEmptyNoInitialTest4800
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_EXCEPT_EMPTY_4800
 * @tc.desc   Test reduceRight() on empty array without initial value throws TypeError
 */
export function ArrayReduceRightEmptyNoInitialTest4800() {
    let arr = [];
    try {
        arr.reduceRight((acc, cur) => acc + cur);
        return false; // Should have thrown
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * @tc.name   ArrayReduceRightSparseAllHolesNoInitialTest4900
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_EXCEPT_SPARSE_4900
 * @tc.desc   Test reduceRight() on all-holes array without initial value throws TypeError
 */
export function ArrayReduceRightSparseAllHolesNoInitialTest4900() {
    let arr = new Array(5); // all holes
    try {
        arr.reduceRight((acc, cur) => acc);
        return false; // Should have thrown
    } catch (e) {
        return e instanceof TypeError;
    }
}

/**
 * @tc.name   ArrayReduceRightCallbackThrowsTest5000
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_EXCEPT_THROW_5000
 * @tc.desc   Test reduceRight() callback exception propagates
 */
export function ArrayReduceRightCallbackThrowsTest5000() {
    let arr = [1, 2, 3];
    try {
        arr.reduceRight((acc, cur) => {
            if (cur === 2) throw new Error('Test error');
            return acc + cur;
        }, 0);
        return false;
    } catch (e) {
        return e.message === 'Test error';
    }
}



/**
 * @tc.name   ArrayReduceRightChainWithMapTest5100
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_CHAIN_MAP_5100
 * @tc.desc   Test reduceRight() chained with map()
 */
export function ArrayReduceRightChainWithMapTest5100() {
    let arr = [1, 2, 3, 4, 5];
    let result = arr
        .map(x => x * 2)
        .reduceRight((acc, cur) => acc + cur, 0);
    return result === 30; // 10 + 8 + 6 + 4 + 2 = 30
}

/**
 * @tc.name   ArrayReduceRightChainWithFilterTest5200
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_CHAIN_FILTER_5200
 * @tc.desc   Test reduceRight() chained with filter()
 */
export function ArrayReduceRightChainWithFilterTest5200() {
    let arr = [1, 2, 3, 4, 5, 6];
    let result = arr
        .filter(x => x % 2 === 0)
        .reduceRight((acc, cur) => acc + cur, 0);
    return result === 12; // 6 + 4 + 2 = 12
}

/**
 * @tc.name   ArrayReduceRightChainWithReverseTest5300
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_CHAIN_REVERSE_5300
 * @tc.desc   Test reduceRight() chained with reverse()
 */
export function ArrayReduceRightChainWithReverseTest5300() {
    let arr = [1, 2, 3];
    let result = arr
        .reverse()
        .reduceRight((acc, cur) => acc + cur, 0);
    return result === 6; // 1 + 2 + 3 = 6 (after reverse: [3,2,1])
}



/**
 * @tc.name   ArrayReduceRightHugeArrayTest5400
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_PERF_HUGE_5400
 * @tc.desc   Test reduceRight() on huge array (100000 elements)
 */
export function ArrayReduceRightHugeArrayTest5400() {
    let arr = [];
    for (let i = 1; i <= 100000; i++) {
        arr.push(1);
    }
    let sum = arr.reduceRight((acc, cur) => acc + cur, 0);
    return sum === 100000;
}

/**
 * @tc.name   ArrayReduceRightManyCallbacksTest5500
 * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_PERF_CALLBACKS_5500
 * @tc.desc   Test reduceRight() with many callback invocations
 */
export function ArrayReduceRightManyCallbacksTest5500() {
    let arr = new Array(5000).fill(1);
    let count = 0;
    arr.reduceRight((acc, cur) => {
        count++;
        return acc + cur;
    }, 0);
    return count === 5000;
}
