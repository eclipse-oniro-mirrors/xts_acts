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

export function testRegCtrJs0006() {
    const re = new RegExp();
    return [re.source === '(?:)', re.flags === '', re.test('') == true];
}

export function testRegCtrJs0007() {
    const re1 = new RegExp(undefined);
    const re2 = new RegExp(null);
    return [re1.source === '(?:)', re2.source === 'null'];
}

export function testRegCtrJs0009() {
    const fakeReg = {
        [Symbol.match]: false,
        source: 'abc',
        flags: 'g'
    };
    const re = new RegExp(fakeReg);
    return [re.source === 'abc', re.flags === 'g', re.test('abc') === true];
}

export function testRegCtrJs0018() {
    const reProto = RegExp.prototype;
    const re = new RegExp(reProto);
    return [re.source === '(?:)', re.flags === ''];
}

export function testRegCtrJs0021() {
    const handler = { get(target, prop) { return target[prop]; } };
    const proxy = new Proxy(/abc/, handler);
    const re = new RegExp(proxy);
    return re.source === 'abc';
}

export function testRegCtrJs0022() {
    const obj = Object.create(null);
    obj.source = 'test';
    const re = new RegExp(obj);
    return re instanceof RegExp;
}

export function testRegCtrJs0023() {
    const pattern = { toString: () => 'xyz' };
    const re = new RegExp(pattern);
    return re.test('xyz');
}

export function testRegCtrJs0026() {
    const frozen = Object.freeze({ source: 'foo' });
    const re = new RegExp(frozen);
    return re.source;
}

export function testRegCtrJs0027() {
    class MyRegExp extends RegExp {}
    MyRegExp[Symbol.species] = RegExp;
    const re = new MyRegExp('abc');
    const newRe = new re.constructor('xyz');
    return newRe instanceof RegExp;
}

export function testRegCtrJs0030() {
    const obj = Object.defineProperty({}, 'source', {
        get() { throw new Error('source error'); }
    });
    let threw = false;
    try {
        new RegExp(obj);
    } catch (e) {
        threw = true;
    }
    return threw;
}

export function testRegCtrJs0032() {
    const re = new RegExp('foo', 'd');
    const result = re.exec('foo');
    return result?.indices?.[0][0];
}

export function testRegCtrJs0035() {
    const re = new RegExp();
    return [re.test(''), re.source === '(?:)'];
}

export function testRegCtrJs0036() {
    const re = new RegExp(undefined);
    return re.source;
}

export function testRegCtrJs0037() {
    let threw = false;
    try {
        new RegExp(Symbol('sym'));
    } catch (e) {
        threw = e instanceof TypeError;
    }
    return threw;
}

export function testRegCtrJs0039() {
    const custom = {
        [Symbol.match]: () => ['matched'],
        source: 'custom',
    };
    const re = new RegExp(custom);
    return re.source;
}

export function testRegCtrJs0050() {
    const re = new RegExp('a', 'gimsuyd');
    return re.hasIndices;
}

export function testRegCtrJs0051() {
    class MyRe extends RegExp {}
    const re1 = new MyRe('abc', 'i');
    const re2 = new re1.constructor('def', 'g');
    return [re2.source === 'def', re2.flags === 'g'];
}

export function testRegCtrJs0056() {
    const re1 = /abc/;
    re1.toString = () => 'overridden';
    const re2 = new RegExp(re1);
    return re2.source;
}

export function testRegCtrJs0057() {
    const obj = {
        [Symbol.match]: () => ['matched'],
        source: 'myPattern',
    };
    const re = new RegExp(obj);
    return re.source;
}

export function testRegCtrJs0060() {
    const re = new RegExp('x', 'gimsuyd');
    return re.hasIndices;
}

export function testRegCtrJs0063() {
    const obj = {
        [Symbol.toPrimitive]: () => '\\d+'
    };
    const re = new RegExp(obj);
    return re.test('123');
}

export function testRegCtrJs0064() {
    const obj = {};
    Object.defineProperty(obj, 'source', {
        get() { return obj; }
    });
    let threw = false;
    try {
        new RegExp(obj);
    } catch (e) {
        threw = true;
    }
    return threw;
}

export function testRegCtrJs0066() {
    const obj = { source: '\\d+', flags: 'g' };
    const re = new RegExp(obj);
    return [re.global, re.test('123')];
}

export function testRegCtrJs0068() {
    const handler = {
        get(target, prop) {
            if (prop === 'source') return 'abc';
            return target[prop];
        }
    };
    const proxy = new Proxy({}, handler);
    const re = new RegExp(proxy);
    return re.source;
}

export function testRegCtrJs0080() {
    const patternObj = { toString() { return '\\d+'; } };
    const re = new RegExp(patternObj);
    return [re.test('123'), re.test('abc')];
}

export function testRegExecJs0089() {
    const regex = /\d/g;
    Object.defineProperty(regex, "lastIndex", {
        get() { return 0; },
        set() { /* ignore */ },
    });
    const result = regex.exec("123");
    return result?.[0];
}

export function testRegExecJs0133() {
    const regex = /\d+/;
    const result = RegExp.prototype.exec.call(regex, 456);
    return result?.[0];
}

export function testRegExecJs0134() {
    const regex = /true/;
    const result = RegExp.prototype.exec.call(regex, true);
    return result?.[0];
}

export function testRegExecJs0140() {
    const regex = /\d+/g;
    Object.freeze(regex);
    regex.lastIndex = 5; // should have no effect
    const result = regex.exec("12345 67890");
    return result?.[0];
}

export function testRegSearchJs0053() {
    const str = "[object Object]";
    const obj = ({}).toString();
    const result = str.search(obj);
    return result;
}

export function testRegSearchJs0054() {
    const obj = { toString() { return "abc"; } };
    const str = "123abc456";
    const result = str.search(obj.toString());
    return result;
}

export function testRegSearchJs0055() {
    const obj = { [Symbol.search]: (s) => 42 };
    const str = "anything";
    const result = str.search(obj);
    return result;
}

export function testRegSearchJs0057() {
    const regex = Object.freeze(/abc/);
    const str = "abc";
    const result = str.search(regex);
    return result;
}

export function testRegSearchJs0058() {
    const regex = new Proxy(/abc/, {
        get(target, prop, receiver) {
            if (prop === 'exec') return () => Object.assign(["abc"], { index: 0 });
            return Reflect.get(target, prop, receiver);
        }
    });
    const str = "abc";
    const result = str.search(regex);
    return result;
}

export function testRegSearchJs0059() {
    const regex = /abc/;
    regex.exec = () =>  Object.assign(["abc"], { index: 0 });
    const str = "abc";
    const result = str.search(regex);
    return result;
}

export function testRegSplitJs0074() {
    const pattern = Object.freeze(/a/);
    const str = "a1a2a3";
    const result = str.split(pattern);
    return result;
}

export function testRegSplitJs0075() {
    const pattern = new Proxy(/a/, {
        get(target, prop) {
            return Reflect.get(target, prop);
        }
    });
    const str = "a1a2a3";
    const result = str.split(pattern);
    return result;
}

export function testRegSplitJs0076() {
    const pattern = /a/;
    pattern.exec = function() { return null; };
    const str = "a1a2";
    const result = str.split(pattern);
    return result;
}

export function testRegSplitJs0077() {
    const pattern = /a/;
    pattern[Symbol.split] = () => ["fixed"];
    const str = "a1a2";
    const result = str.split(pattern);
    return result;
}

export function testRegSplitJs0079() {
    const pattern = /a/;
    pattern[Symbol.split] = () => "abc";
    const str = "a1a2";
    const result = str.split(pattern);
    return result;
}

export function testRegSplitJs0082() {
    const str = "abcundefinedxyz";
    const result = str.split(String(undefined));
    return result;
}

export function testRegSplitJs0083() {
    const str = "abcnullxyz";
    const result = str.split(null);
    return result;
}

export function testRegSplitJs0084() {
    const str = "abc123xyz";
    const result = str.split(123);
    return result;
}

export function testRegSplitJs0085() {
    const str = "abctruexyz";
    const result = str.split(true);
    return result;
}

export function testRegSplitJs0086() {
    const str = "a,b,ab";
    const result = str.split(["a","b"]);
    return result;
}

export function testRegSplitJs0087() {
    const str = "abcXYZdef";
    const obj = { toString: () => "X" };
    const result = str.split(obj);
    return result;
}

export function testRegSplitJs0088() {
    const obj = { [Symbol.split]: () => ["split"] };
    const str = "abcXYZ";
    const result = str.split(obj);
    return result;
}