/*
* Copyright (C) 2026 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

export function testToStringVsString() {
  'use strict';
  const str = 'test';
  const strObj = new String('test');
  return {
    primitiveString: String(str) === str.toString(),
    stringObject: String(strObj) === strObj.toString(),
    primitiveResult: str.toString(),
    objectResult: strObj.toString()
  };
}

export function testToStringVsTemplateLiteral() {
  'use strict';
  const str = 'test';
  const strObj = new String('test');
  return {
    primitiveMatch: `${str}` === str.toString(),
    objectMatch: `${strObj}` === strObj.toString()
  };
}

export function testToStringVsJsonStringify() {
  'use strict';
  const str = 'test';
  const strObj = new String('test');
  return {
    primitiveToString: str.toString(),
    primitiveJson: JSON.stringify(str),
    objectToString: strObj.toString(),
    objectJson: JSON.stringify(strObj)
  };
}

export function testFrozenStringObject() {
  'use strict';
  const strObj = new String('test');
  Object.freeze(strObj);
  return strObj.toString();
}

export function testSealedStringObject() {
  'use strict';
  const strObj = new String('test');
  Object.seal(strObj);
  return strObj.toString();
}

export function testProxyStringObject() {
  'use strict';
  const strObj = new String('test');
  const proxy = new Proxy(strObj, {
    get(target, prop) {
      if (prop === 'toString') {
        return target.toString.bind(target);
      }
      return target[prop];
    }
  });
  return proxy.toString();
}

export function testProxyInterceptToString() {
  'use strict';
  const strObj = new String('test');
  const proxy = new Proxy(strObj, {
    get(target, prop) {
      if (prop === 'toString') {
        return () => 'intercepted';
      }
      return target[prop];
    }
  });
  return proxy.toString();
}

export function testSymbolToPrimitive() {
  'use strict';
  const strObj = new String('test');
  strObj[Symbol.toPrimitive] = function(hint) {
    if (hint === 'string') {
      return 'custom string';
    }
    return this.toString();
  };
  return {
    withSymbolToPrimitive: String(strObj),
    toString: strObj.toString()
  };
}

export function testHasOwnPropertyToString() {
  'use strict';
  const str = 'test';
  const strObj = new String('test');
  return {
    primitiveHasOwn: str.hasOwnProperty('toString'),
    prototypeHasOwn: String.prototype.hasOwnProperty('toString'),
    objectHasOwn: strObj.hasOwnProperty('toString'),
    primitiveProtoMatch: str.toString === String.prototype.toString,
    objectProtoMatch: strObj.toString === String.prototype.toString
  };
}

export function testObjectPrototypeToString() {
  'use strict';
  const strObj = new String('test');
  return {
    stringProto: strObj.toString(),
    objectProto: Object.prototype.toString.call(strObj)
  };
}

export function testParameterIgnored() {
  'use strict';
  const str = 'test';
  return {
    withNull: str.toString(null),
    withUndefined: str.toString(undefined),
    withMultiple: str.toString(1, 2, 3)
  };
}

export function testPropertyDescriptor() {
  'use strict';
  const desc = Object.getOwnPropertyDescriptor(String.prototype, 'toString');
  return {
    writable: desc.writable,
    enumerable: desc.enumerable,
    configurable: desc.configurable
  };
}

export function testTryDeleteToString() {
  'use strict';
  const original = String.prototype.toString;
  const deleted = delete String.prototype.toString;
  let threwError = false;
  try {
    const str = 'test';
    str.toString();
  } catch (e) {
    threwError = true;
  }
  String.prototype.toString = original;
  return {
    deleted: deleted,
    threwError: threwError
  };
}

export function testNewStringNoParam() {
  'use strict';
  const strObj = new String();
  return {
    toString: strObj.toString(),
    length: strObj.length
  };
}

export function testStringNoParam() {
  'use strict';
  const str = String();
  return {
    value: str,
    type: typeof str,
    toString: str.toString()
  };
}

export function testNewStringUndefined() {
  'use strict';
  const strObj = new String(undefined);
  return {
    toString: strObj.toString(),
    valueOf: strObj.valueOf()
  };
}

export function testNewStringNull() {
  'use strict';
  const strObj = new String(null);
  return {
    toString: strObj.toString(),
    valueOf: strObj.valueOf()
  };
}

export function testSpecialNumericStrings() {
  'use strict';
  const nanStr = 'NaN';
  const infStr = 'Infinity';
  const negInfStr = '-Infinity';
  const negZeroStr = '-0';
  const nullStr = 'null';
  const undefStr = 'undefined';
  const trueStr = 'true';
  const falseStr = 'false';
  return {
    nan: nanStr.toString(),
    nanEqual: nanStr.toString() === nanStr,
    infinity: infStr.toString(),
    negInfinity: negInfStr.toString(),
    negZero: negZeroStr.toString(),
    nullString: nullStr.toString(),
    nullNotEqual: nullStr === null,
    undefinedString: undefStr.toString(),
    undefinedNotEqual: undefStr === undefined,
    trueString: trueStr.toString(),
    falseString: falseStr.toString()
  };
}

export function testScientificNotationStrings() {
  'use strict';
  const ePositive = '1e10';
  const eNegative = '1.5e-3';
  const eUpperCase = '2.5E+5';
  return {
    positiveExponent: ePositive.toString(),
    positiveEqual: ePositive.toString() === ePositive,
    negativeExponent: eNegative.toString(),
    negativeEqual: eNegative.toString() === eNegative,
    upperCaseE: eUpperCase.toString(),
    upperCaseEqual: eUpperCase.toString() === eUpperCase
  };
}

export function testWhitespaceCharacters() {
  'use strict';
  const str = '\t\n\r ';
  const multipleSpaces = '    ';
  return {
    mixed: str.toString(),
    mixedLength: str.toString().length,
    mixedEqual: str.toString() === str,
    spaces: multipleSpaces.toString(),
    spacesLength: multipleSpaces.toString().length
  };
}

export function testControlCharacters() {
  'use strict';
  let controlChars = '';
  for (let i = 0; i <= 0x1F; i++) {
    controlChars += String.fromCharCode(i);
  }
  const delChar = 'test\x7Ftest';
  return {
    controlChars: controlChars.toString(),
    controlEqual: controlChars.toString() === controlChars,
    delChar: delChar.toString(),
    delEqual: delChar.toString() === delChar
  };
}

export function testIdempotentCalls() {
  'use strict';
  const str = 'test';
  const strObj = new String('test');
  const r1 = str.toString();
  const r2 = str.toString();
  const r3 = str.toString();
  const o1 = strObj.toString();
  const o2 = strObj.toString();
  return {
    primitive: r1 === r2 && r2 === r3,
    object: o1 === o2,
    primitiveValue: r1,
    objectValue: o1
  };
}

export function testTypeErrorCatch() {
  'use strict';
  let caughtTypeError = false;
  let errorName = '';
  try {
    String.prototype.toString.call(123);
  } catch (e) {
    caughtTypeError = e instanceof TypeError;
    errorName = e.name;
  }
  return {
    caught: caughtTypeError,
    name: errorName
  };
}

export function testSafeToString() {
  'use strict';
  function safeToString(str) {
    try {
      return String.prototype.toString.call(str);
    } catch (e) {
      return String(str);
    }
  }
  return {
    withString: safeToString('test'),
    withNumber: safeToString(123)
  };
}

export function testBuiltInObjectTypeErrors() {
  'use strict';
  const types = [new Map(), new Set(), new WeakMap(), new WeakSet(), new Date(), /test/, new Error('test'), new TypeError('test'), Promise.resolve('test')];
  const results = [];
  types.forEach(type => {
    try {
      String.prototype.toString.call(type);
      results.push(false);
    } catch (e) {
      results.push(e instanceof TypeError);
    }
  });
  return {
    allThrewTypeError: results.every(r => r === true),
    results: results
  };
}

export function testBinaryDataObjectTypeErrors() {
  'use strict';
  const buffer = new ArrayBuffer(8);
  const dataView = new DataView(buffer);
  const typedArrays = [
    new Int8Array(8),
    new Uint8Array(8),
    new Int16Array(8),
    new Uint16Array(8),
    new Int32Array(8),
    new Uint32Array(8)
  ];
  const results = [];
  
  try {
    String.prototype.toString.call(buffer);
    results.push(false);
  } catch (e) {
    results.push(e instanceof TypeError);
  }
  
  try {
    String.prototype.toString.call(dataView);
    results.push(false);
  } catch (e) {
    results.push(e instanceof TypeError);
  }
  
  typedArrays.forEach(arr => {
    try {
      String.prototype.toString.call(arr);
      results.push(false);
    } catch (e) {
      results.push(e instanceof TypeError);
    }
  });
  
  return {
    allThrewTypeError: results.every(r => r === true),
    results: results
  };
}

export function testInternationalStrings() {
  'use strict';
  const arabic = 'مرحبا بالعالم';
  const hebrew = 'שלום עולם';
  const thai = 'สวัสดีโลก';
  const hindi = 'नमस्ते दुनिया';
  const japanese = 'こんにちは世界ハローワールド';
  const korean = '안녕하세요 세계';
  const greek = 'Γειά σου Κόσμε';
  const russian = 'Привет мир';
  
  return {
    arabic: arabic.toString(),
    arabicEqual: arabic.toString() === arabic,
    hebrew: hebrew.toString(),
    hebrewEqual: hebrew.toString() === hebrew,
    thai: thai.toString(),
    thaiEqual: thai.toString() === thai,
    hindi: hindi.toString(),
    hindiEqual: hindi.toString() === hindi,
    japanese: japanese.toString(),
    japaneseEqual: japanese.toString() === japanese,
    korean: korean.toString(),
    koreanEqual: korean.toString() === korean,
    greek: greek.toString(),
    greekEqual: greek.toString() === greek,
    russian: russian.toString(),
    russianEqual: russian.toString() === russian
  };
}

export function testSpecialUnicodeChars() {
  'use strict';
  const zwjSeq = '👨‍👩‍👧';
  const variant = '♠️';
  const control = 'test\u200E\u200Ftest';
  const privateUse = '\uE000\uE001\uF8FF';
  const isolatedSurrogate = '\uD800';
  
  return {
    zwj: zwjSeq.toString(),
    zwjEqual: zwjSeq.toString() === zwjSeq,
    variant: variant.toString(),
    variantEqual: variant.toString() === variant,
    control: control.toString(),
    controlEqual: control.toString() === control,
    privateUse: privateUse.toString(),
    privateUseEqual: privateUse.toString() === privateUse,
    isolated: isolatedSurrogate.toString(),
    isolatedEqual: isolatedSurrogate.toString() === isolatedSurrogate
  };
}

export function testChainCallOtherMethods() {
  'use strict';
  const strObj = new String('  hello  ');
  const str = 'hello';
  return {
    trim: strObj.toString().trim(),
    toUpperCase: strObj.toString().toUpperCase(),
    fromOtherMethod: str.toUpperCase().toString()
  };
}

export function testMultipleToStringCalls() {
  'use strict';
  const str = 'test';
  const strObj = new String('test');
  return {
    primitive: str.toString().toString().toString(),
    object: strObj.toString().toString().toString()
  };
}

export function testPerformanceFrequentCalls() {
  'use strict';
  const str = 'test';
  let allPassed = true;
  for (let i = 0; i < 100; i++) {
    const result = str.toString();
    if (result !== 'test') {
      allPassed = false;
      break;
    }
  }
  return allPassed;
}

export function testStringObjectInTemplate() {
  'use strict';
  const strObj = new String('world');
  const result = `Hello ${strObj}`;
  return result;
}

export function testStringObjectWithPlusOperator() {
  'use strict';
  const strObj = new String('world');
  const result = 'Hello ' + strObj;
  return result;
}

export function testStringObjectWithPlusEqual() {
  'use strict';
  let result = 'Hello ';
  const strObj = new String('world');
  result += strObj;
  return result;
}

export function testStringWithStringConversion() {
  'use strict';
  const strObj = new String('test');
  const result = String(strObj);
  return result;
}

export function testStringObjectAsPropertyKey() {
  'use strict';
  const obj = {};
  const strObj = new String('key');
  obj[strObj] = 'value';
  return obj['key'];
}

export function testStringObjectArrayJoin() {
  'use strict';
  const arr = [new String('a'), new String('b'), new String('c')];
  const result = arr.join('-');
  return result;
}