/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

export function test1_BasicNumberProperty() {
    const obj = {
        _123: null,
        set 123(value) {
            this._123 = value;
        },
        get 123() {
            return this._123;
        }
    };

    obj[123] = 'test123';
    return obj[123] === 'test123' && obj._123 === 'test123'
}

export function test2_LargeNumberProperty() {
    const obj = {
        _bigNum: null,
        set 9999999999(val) {
            this._bigNum = val;
        },
        get 9999999999() {
            return this._bigNum;
        }
    };

    obj[9999999999] = 'large number';
    return obj[9999999999] === 'large number'
}

export function test3_NegativeNumberProperty() {
    const obj = {
        _neg: null,
        set [-100](val) {
            this._neg = val;
        },
        get [-100]() {
            return this._neg;
        }
    };

    obj[-100] = 'negative';
    return obj[-100] === 'negative'
}

export function test4_DecimalNumberProperty() {
    const obj = {
        _pi: null,
        set [3.14](val) {
            this._pi = val;
        },
        get [3.14]() {
            return this._pi;
        }
    };

    obj[3.14] = 'pi value';
    return obj[3.14] === 'pi value'
}

export function test5_ZeroProperty() {
    const obj = {
        _zero: null,
        set [0](val) {
            this._zero = val;
        },
        get [0]() {
            return this._zero;
        }
    };

    obj[0] = 'zero value';
    return obj[0] === 'zero value'
}

// ==================== Object.assign 相关测试 ====================
export function test6_ObjectAssignDoesNotCopyAccessors() {
    const obj = {
        _value: null,
        set [100](val) { this._value = val; },
        get [100]() { return this._value; }
    };

    obj[100] = 'original';
    const assignResult = Object.assign({}, obj);

    return obj[100] === 'original' &&
        assignResult[100] === 'original' &&
        typeof assignResult[100] === 'string'
}

export function test7_ObjectAssignMultipleSources() {
    const obj1 = {
        _val1: null,
        set [1](val) { this._val1 = val; }
    };
    const obj2 = {
        _val2: null,
        set [2](val) { this._val2 = val; }
    };

    obj1[1] = 'one';
    obj2[2] = 'two';
    const result = Object.assign({}, obj1, obj2);

    return result[1] === undefined &&
        result[2] === undefined
}

export function test8_ObjectAssignToExistingObject() {
    const target = { existing: 'prop' };
    const source = {
        _888: null,
        set [888](val) { this._888 = val; }
    };

    source[888] = 'new value';
    Object.assign(target, source);

    return target.existing === 'prop'
}

export function test9_ObjectAssignAfterSettingValue() {
    const obj = {
        _value: null,
        set [999](val) { this._value = val; },
        get [999]() { return this._value; }
    };

    obj[999] = 'before assign';
    const copy = Object.assign({}, obj);

    obj[999] = 'after assign';
    return copy[999] === 'before assign'
}

export function test10_ObjectAssignWithGetOnly() {
    const obj = {
        _val: 'default',
        get [42]() { return this._val; }
    };

    const copy = Object.assign({}, obj);
    copy[42] = 'try to set';

    return copy[42] === 'try to set'
}

// ==================== Object.defineProperty 测试 ====================
export function test11_DefinePropertyWithNumber() {
    const obj = {};
    let value = null;

    Object.defineProperty(obj, 42, {
        set: function(v) { value = v * 2; },
        get: function() { return value; },
        enumerable: true
    });

    obj[42] = 21;
    return obj[42] === 42
}

export function test12_DefinePropertyWithNegativeNumber() {
    const obj = {};
    let stored = null;

    Object.defineProperty(obj, -1, {
        set: function(v) { stored = v + ' processed'; },
        get: function() { return stored; }
    });

    obj[-1] = 'test';
    return obj[-1] === 'test processed'
}

export function test13_DefinePropertyGetOnly() {
    const obj = {};

    Object.defineProperty(obj, 777, {
        get: function() { return 'readonly'; },
        enumerable: true
    });

    let setFailed = false;
    try {
        obj[777] = 'new value';
    } catch (e) {
        setFailed = true;
    }

    return obj[777] === 'readonly' && setFailed
}

export function test14_DefinePropertySetOnly() {
    const obj = {};
    let lastValue = null;

    Object.defineProperty(obj, 555, {
        set: function(v) { lastValue = v; },
        enumerable: true
    });

    obj[555] = 'set only';
    return lastValue === 'set only' && obj[555] === undefined
}

// ==================== 扩展运算符测试 ====================
export function test15_SpreadOperatorWithNumberAccessors() {
    const obj = {
        _value: null,
        set [123](val) { this._value = val; },
        get [123]() { return this._value; }
    };

    obj[123] = 'spread test';
    const spreadCopy = { ...obj };

    return spreadCopy[123] === 'spread test' &&
        typeof spreadCopy[123] === 'string'
}

export function test16_SpreadMultipleObjects() {
    const obj1 = {
        _a: null,
        set [1](val) { this._a = val; }
    };
    const obj2 = {
        _b: null,
        set [2](val) { this._b = val; }
    };

    obj1[1] = 'first';
    obj2[2] = 'second';
    const merged = { ...obj1, ...obj2 };

    return merged[1] === undefined && merged[2] === undefined
}

// ==================== Object.create 测试 ====================
export function test17_ObjectCreateWithNumberAccessors() {
    const proto = {
        _value: null,
        set [888](val) { this._value = val; },
        get [888]() { return this._value; }
    };

    const obj = Object.create(proto);
    obj[888] = 'inherited';
    console.log(obj[888])
    console.log(proto._value)
    console.log(obj._value)
    return obj[888] === 'inherited' &&
        proto._value === null &&
        obj._value === 'inherited'      // xts结果为null
}

export function test18_ObjectCreateShadowProperty() {
    const proto = {
        _value: 'proto',
        get [999]() { return this._value; }
    };

    const obj = Object.create(proto);
    obj._value = 'own';

    return obj[999] === 'own'
}

// ==================== JSON 序列化测试 ====================
export function test19_JSONStringifyWithNumberGetter() {
    const obj = {
        normal: 'value',
        get [42]() { return 'answer'; },
        get [3.14]() { return 'pi'; }
    };

    const json = JSON.stringify(obj);
    const parsed = JSON.parse(json);

    return parsed.normal === 'value' &&
        parsed['42'] === "answer"
}

export function test20_JSONStringifyWithValue() {
    const obj = {
        _value: 'stored',
        set [100](val) { this._value = val; },
        get [100]() { return this._value; }
    };

    obj[100] = 'new value';
    const json = JSON.stringify(obj);
    const parsed = JSON.parse(json);

    return parsed._value === 'new value' && parsed['100'] === 'new value'
}

// ==================== for...in 和 Object.keys 测试 ====================
export function test21_ForInWithNumberAccessors() {
    const obj = {
        a: 1,
        set [2](val) { this._2 = val; },
        get [2]() { return this._2; },
        b: 3
    };

    const keys = [];
    for (let key in obj) {
        keys.push(key);
    }

    return keys.includes('2') &&
    keys.includes('a') &&
    keys.includes('b') &&
        keys.length === 3
}

export function test22_ObjectKeysWithNumberAccessors() {
    const obj = {
        x: 1,
        set [10](val) { this._10 = val; },
        get [10]() { return this._10; },
        y: 2
    };

    const keys = Object.keys(obj);
    return keys.includes('10') && keys.length === 3
}

// ==================== 属性描述符测试 ====================
export function test23_GetOwnPropertyDescriptor() {
    const obj = {};
    Object.defineProperty(obj, 7, {
        set: function(v) { this._7 = v; },
        get: function() { return this._7; },
        enumerable: true
    });

    const descriptor = Object.getOwnPropertyDescriptor(obj, 7);
    return typeof descriptor.set === 'function' &&
        typeof descriptor.get === 'function' &&
        descriptor.enumerable === true
}

export function test24_PropertyDescriptorForDefinedAccessor() {
    const obj = {
        set [99](val) { this._99 = val; },
        get [99]() { return this._99; }
    };

    const descriptor = Object.getOwnPropertyDescriptor(obj, 99);
    return descriptor !== undefined &&
        typeof descriptor.set === 'function' &&
        typeof descriptor.get === 'function'
}

// ==================== 其他对象方法测试 ====================
export function test25_ObjectEntriesWithNumberAccessors() {
    const obj = {
        name: 'test',
        set [1](val) { this._1 = val; },
        get [1]() { return this._1; }
    };

    obj[1] = 'one';
    const entries = Object.entries(obj);

    return entries.some(([key, value]) => key === '1' && value === 'one')
}

export function test26_ObjectValuesWithNumberAccessors() {
    const obj = {
        a: 'A',
        set [2](val) { this._2 = val; },
        get [2]() { return this._2; }
    };

    obj[2] = 'two';
    const values = Object.values(obj);

    return values.includes('two') && values.includes('A')
}

export function test27_ObjectFromEntriesWithNumber() {
    const entries = [
        ['a', 1],
        ['2', 2],
        [3, 'three']
    ];

    const obj = Object.fromEntries(entries);
    return obj.a === 1 &&
        obj[2] === 2 &&
        obj[3] === 'three' &&
        typeof obj[2] === 'number'
}

// ==================== 特殊场景测试 ====================
export function test28_SameNumberDifferentProperties() {
    const obj = {
        set [1](val) { this._1 = val; },
        get [1]() { return this._1; },
        '1': 'string property'
    };

    const stringPropValue = obj['1'];
    const numberPropValue = obj[1];
    obj[1] = 'new value';

    return stringPropValue === 'string property' &&
        numberPropValue === 'string property' &&
        obj._1 === undefined &&
        obj['1'] === 'new value'
}

export function test29_ArrayLikeObjectWithNumberSetter() {
    const obj = {
        length: 0,
        set [0](val) {
            this._0 = val;
            if (val) this.length = 1;
        },
        get [0]() { return this._0; }
    };

    obj[0] = 'first';
    return obj.length === 1 && obj[0] === 'first'
}

export function test30_ClassWithNumberAccessors() {
    class NumberAccessor {
        constructor() {
            this._data = {};
        }

        set [100](value) {
            this._data[100] = value + ' processed';
        }

        get [100]() {
            return this._data[100];
        }
    }

    const instance = new NumberAccessor();
    instance[100] = 'input';
    console.log(instance[100])
    return instance[100] === 'input processed'
}