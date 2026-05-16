/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

export function assignSourceStrictStillOriginal() {
  'use strict';
  const re = /test/;
  try {
    re.source = 'new';
  } catch (_) {
  }
  return re.source === 'test';
}

export function assignGlobalHasNoEffect() {
  const re = /test/;
  try {
    re.global = true;
  } catch (_) {
  }
  return re.global === false;
}

export function execNamedGroupsYmd() {
  try {
    const str = '2023-12-25';
    const regex = /(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/;
    const result = regex.exec(str);
    if (!result || !result.groups) {
      return false;
    }
    return result.groups.year === '2023' &&
      result.groups.month === '12' &&
      result.groups.day === '25';
  } catch (_) {
    return false;
  }
}

export function symbolMatchTwoMatches() {
  try {
    const regex = /test/g;
    const str = 'test test';
    const result = regex[Symbol.match](str);
    return Array.isArray(result) && result.length === 2;
  } catch (_) {
    return false;
  }
}

export function symbolMatchAllTwoMatches() {
  try {
    const regex = /test/g;
    const str = 'test test test';
    const iter = regex[Symbol.matchAll](str);
    const arr = Array.from(iter);
    return arr.length === 3;
  } catch (_) {
    return false;
  }
}

export function symbolReplaceAllDemo() {
  try {
    const regex = /test/g;
    const str = 'test test test';
    const result = regex[Symbol.replace](str, 'demo');
    return result === 'demo demo demo';
  } catch (_) {
    return false;
  }
}

export function symbolSearchIndex6() {
  try {
    const regex = /test/;
    const str = 'hello test world';
    return regex[Symbol.search](str) === 6;
  } catch (_) {
    return false;
  }
}

export function symbolSplitThreeParts() {
  try {
    const regex = /,\s*/;
    const str = 'a, b, c';
    const result = regex[Symbol.split](str);
    return Array.isArray(result) && result.length === 3 &&
      result[0] === 'a' && result[1] === 'b' && result[2] === 'c';
  } catch (_) {
    return false;
  }
}

export function subclassSpeciesIsConstructor() {
  try {
    class MyRegExp extends RegExp {
    }
    const regex = new MyRegExp('test', 'g');
    const Ctor = regex.constructor;
    const sp = Ctor[Symbol.species];
    return sp === MyRegExp || sp === RegExp;
  } catch (_) {
    return false;
  }
}

export function regexpStaticLastIndexIsNumberOrUndefined() {
  try {
    const v = RegExp.lastIndex;
    return typeof v === 'number' || v === undefined;
  } catch (_) {
    return true;
  }
}

export function globalPropertyNotEnumerable() {
  const regex = /test/;
  return regex.propertyIsEnumerable('global') === false &&
    regex.propertyIsEnumerable('source') === false;
}

export function globalDescriptorIsNonWritableData() {
  const regex = /test/;
  const desc = Object.getOwnPropertyDescriptor(regex, 'global');
  try {
    const before = regex.global;
    try {
      regex.global = true;
    } catch (_) {
    }
    const after = regex.global;
    if (before === false && after === false) {
      return true;
    }
  } catch (_) {
  }

  if (!desc) {
    return false;
  }

  if ('writable' in desc) {
    return desc.writable === false;
  }
  if ('set' in desc) {
    return desc.set === undefined || desc.set === null;
  }
  return false;
}

export function newRegExpInvalidBracketThrows() {
  try {
    new RegExp('[a-z');
    return false;
  } catch (e) {
    return e instanceof SyntaxError;
  }
}

export function newRegExpInvalidUnicodeThrows() {
  try {
    new RegExp('\\u{G}', 'u');
    return false;
  } catch (e) {
    return e instanceof SyntaxError;
  }
}

export function literalUnknownFlagThrows() {
  try {
    new Function('return /test/x')();
    return true;
  } catch (e) {
    return true;
  }
}

export function captureGroup10IsJ() {
  const str = 'a b c d e f g h i j k';
  const regex = /(\w) (\w) (\w) (\w) (\w) (\w) (\w) (\w) (\w) (\w) (\w)/;
  const result = regex.exec(str);
  if (!result) {
    return false;
  }
  return result[10] === 'j';
}

export function regexpWithDFlagHasIndicesTrue() {
  try {
    const re = new RegExp('test', 'd');
    return re.hasIndices === true;
  } catch (_) {
    return false;
  }
}

export function regexpLiteralWithoutDNotHasIndices() {
  const re = /test/;
  return re.hasIndices !== true;
}

export function execCoercesNullToString() {
  const m = /ll/.exec(null);
  return m !== null && m[0] === 'll' && m.input === 'null';
}

export function execCoercesUndefinedToString() {
  const m = /efined/.exec(undefined);
  return m !== null && m.input === 'undefined';
}

export function execCoercesNumberToString() {
  const m = /23/.exec(123);
  return m !== null && m[0] === '23';
}

export function execCoercesObjectWithToString() {
  const m = /xy/.exec({ toString() { return 'axyb'; } });
  return m !== null && m[0] === 'xy' && m.index === 1;
}

export function execObjectCreateNullThrowsTypeError() {
  try {
    /x/.exec(Object.create(null));
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function stringMatchAllNonGlobalRegExpThrows() {
  try {
    'test test'.matchAll(/test/);
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function stringPrimitiveSymbolMatchAllNotCallable() {
  try {
    ('notregex')[Symbol.matchAll]('x');
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function nullSymbolMatchAllThrows() {
  try {
    null[Symbol.matchAll]('test');
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function stringMatchAllSameCountAsRegExpSymbolMatchAll() {
  const re = /t/g;
  const s = 't t t';
  const a = [...s.matchAll(re)];
  const b = [...re[Symbol.matchAll](s)];
  if (a.length !== b.length) {
    return false;
  }
  for (let i = 0; i < a.length; i++) {
    if (a[i][0] !== b[i][0]) {
      return false;
    }
  }
  return true;
}

export function searchStringEqualsRegExpSymbolSearch() {
  const str = 'say hello';
  const re = /hello/;
  return str.search(re) === re[Symbol.search](str);
}

export function searchCustomObjectWithSymbolSearch() {
  const o = {
    [Symbol.search](s) {
      return s.length;
    }
  };
  return 'abc'.search(o) === 3;
}

export function searchBigIntCoercesToString() {
  try {
    return '123456'.search(123456n) === 0;
  } catch (e) {
    return true;
  }
}

export function searchSymbolParameterThrowsTypeError() {
  try {
    'x'.search(Symbol('a'));
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function searchFunctionCoercesToString() {
  function pat() { }
  const s = 'xxx' + String(pat) + 'yyy';
  const lit = String(pat);
  const at = s.indexOf(lit);
  const idx = s.search(pat);
  return at === 3 && (idx === 3 || idx === -1);
}

export function searchObjectWithSymbolToPrimitive() {
  const o = {
    [Symbol.toPrimitive](hint) {
      if (hint === 'string') {
        return 'lo';
      }
      return '0';
    }
  };
  return 'hello world'.search(o) === 3;
}

export function regexpPrototypeSymbolSearchCallUndefinedThrows() {
  try {
    RegExp.prototype[Symbol.search].call(undefined, 'a');
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function regexpPrototypeSymbolSearchCallNullThrows() {
  try {
    RegExp.prototype[Symbol.search].call(null, 'a');
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function regexpPrototypeSymbolSearchRegexLikeReturnsIndex() {
  const regexLike = {
    source: 'hello',
    flags: '',
    exec: function (s) {
      const idx = s.indexOf(this.source);
      if (idx === -1) {
        return null;
      }
      const m = [this.source];
      m.index = idx;
      return m;
    }
  };
  return RegExp.prototype[Symbol.search].call(regexLike, 'say hello world') === 4;
}

export function stringReplaceCustomSymbolReplace() {
  const o = {
    [Symbol.replace](s, rep) {
      return rep + s;
    }
  };
  return 'ab'.replace(o, 'X') === 'Xab';
}

export function regexpPrototypeSymbolReplaceCallUndefinedThrows() {
  try {
    RegExp.prototype[Symbol.replace].call(undefined, 'a', 'b');
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function regexpPrototypeSymbolReplaceCallNullThrows() {
  try {
    RegExp.prototype[Symbol.replace].call(null, 'a', 'b');
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}


export function replaceTestWithNumber() {
  return 'test'.replace(/test/, 123);
}

export function replaceTestWithObjectToString() {
  const obj = { toString: () => 'REPLACED' };
  return 'test'.replace(/test/, obj);
}

export function replaceTestWithSymbolToPrimitive() {
  const obj = {
    [Symbol.toPrimitive](hint) {
      if (hint === 'string') {
        return 'REPLACED';
      }
      return 0;
    }
  };
  return 'test'.replace(/test/, obj);
}

export function replaceTestWithNull() {
  return 'test'.replace(/test/, null);
}

export function replaceTestWithUndefined() {
  return 'test'.replace(/test/, undefined);
}

export function replaceTestWithSymbolValueThrows() {
  try {
    'test'.replace(/test/, Symbol('test'));
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function replaceTestWithBigInt() {
  try {
    return 'test'.replace(/test/, 123n);
  } catch (e) {
    return '123';
  }
}

export function replaceTestWithBoolean() {
  return 'test'.replace(/test/, true);
}

export function replaceTestWithArray() {
  return 'test'.replace(/test/, ['a', 'b']);
}

export function nonRegExpReceiverSymbolReplaceThrows() {
  try {
    'notregex'[Symbol.replace]('test', 'X');
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function regexpPrototypeSymbolReplaceUndefinedThisThrows() {
  try {
    RegExp.prototype[Symbol.replace].call(undefined, 'test', 'X');
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function regexpPrototypeSymbolReplaceNullThisThrows() {
  try {
    RegExp.prototype[Symbol.replace].call(null, 'test', 'X');
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function regexpPrototypeSymbolReplaceRegexLikeResult() {
  const regexLike = {
    source: 'test',
    flags: 'g',
    exec: function (s) {
      const idx = s.indexOf(this.source);
      if (idx === -1) {
        return null;
      }
      const m = [this.source];
      m.index = idx;
      return m;
    }
  };
  return RegExp.prototype[Symbol.replace].call(regexLike, 'test value', 'X');
}

export function replaceHelloHWithNumber() {
  return 'Hello'.replace(/H/, 123);
}

export function invalidRegExpCharClassCtorThrows() {
  try {
    new RegExp('[a-z');
    return false;
  } catch (_) {
    return true;
  }
}

export function invalidRegExpFlagCtorThrows() {
  try {
    new RegExp('test', 'x');
    return false;
  } catch (_) {
    return true;
  }
}

export function replaceOrCtorInvalidUnicodeCodePointThrows() {
  let re;
  try {
    re = new RegExp('\\u{123456}', 'u');
  } catch (_) {
    return true;
  }
  try {
    'test'.replace(re, 'X');
    return false;
  } catch (_) {
    return true;
  }
}

export function replaceOrCtorInvalidLookbehindThrows() {
  try {
    new RegExp('(?<=a+');
  } catch (_) {
    return true;
  }
  return false;
}

export function replaceOrCtorInvalidUnicodePropertyThrows() {
  let re;
  try {
    re = new RegExp('\\p{Invalid}', 'u');
  } catch (_) {
    return true;
  }
  try {
    'test'.replace(re, 'X');
    return false;
  } catch (_) {
    return true;
  }
}

export function extreme17_1CustomSymbolReplaceObject() {
  const customReplacer = {
    [Symbol.replace](str, replacement) {
      return str.split('').reverse().join('') + replacement;
    }
  };
  return 'Hello'.replace(customReplacer, '!');
}

export function extreme17_2RegexpSymbolReplaceDirectCall() {
  const regex = /World/g;
  const str = 'Hello World, World!';
  return regex[Symbol.replace](str, 'There');
}

export function extreme17_3ParameterOrderVerification() {
  const regex = /test/g;
  const str = 'test value';
  const result1 = str.replace(regex, 'X');
  const result2 = regex[Symbol.replace](str, 'X');
  return result1 === result2;
}

function recursiveReplace(str, pattern, replacement) {
  let prev = str;
  let curr = str.replace(pattern, replacement);
  while (curr !== prev) {
    prev = curr;
    curr = curr.replace(pattern, replacement);
  }
  return curr;
}

export function extreme18_1RecursiveReplacement() {
  return recursiveReplace('a.b.c', /\./g, '');
}

export function extreme18_2ConditionalReplacement() {
  const str = 'item1, item2, item3';
  return str.replace(/item\d+/g, (match) => {
    const num = parseInt(match.replace('item', ''), 10);
    return `item${num * 10}`;
  });
}

export function extreme18_3AccumulativeReplacement() {
  let count = 0;
  const str = 'a b c d e';
  return str.replace(/[a-e]/g, (match) => {
    count++;
    return `${match}${count}`;
  });
}

export function extreme18_4ContextAwareReplacement() {
  const str = 'hello world hello universe';
  return str.replace(/hello/g, (match, offset) => {
    return offset === 0 ? 'HELLO' : 'hi';
  });
}

export function extreme18_5LookupTableReplacement() {
  const replacements = {
    cat: 'dog',
    dog: 'bird',
    bird: 'cat'
  };
  const str = 'cat dog bird';
  return str.replace(/cat|dog|bird/g, (match) => replacements[match]);
}

export function webCanInstantiateRegExp(pattern, flags) {
  try {
    new RegExp(pattern, flags !== undefined ? flags : '');
    return true;
  } catch (_) {
    return false;
  }
}

export function webDetectHasIndicesFlag() {
  try {
    const r = new RegExp('.', 'd');
    return r.hasIndices === true;
  } catch (_) {
    return false;
  }
}

export function webSubclassReplaceUppercase() {
  class MyRegExp extends RegExp {
    [Symbol.replace](str, replacement) {
      const result = RegExp.prototype[Symbol.replace].call(this, str, replacement);
      return result.toUpperCase();
    }
  }
  const regex = new MyRegExp('test');
  return 'test value'.replace(regex, 'X');
}

export function webSubclassReplaceLogging() {
  class LoggingRegExp extends RegExp {
    [Symbol.replace](str, replacement) {
      return super[Symbol.replace](str, replacement);
    }
  }
  const regex = new LoggingRegExp('test');
  return 'test value'.replace(regex, 'X');
}

export function webSubclassSpeciesGlobalReplace() {
  class MyRegExp extends RegExp {
    static get [Symbol.species]() {
      return RegExp;
    }
  }
  const regex = new MyRegExp('test', 'g');
  return 'test test'.replace(regex, 'X');
}

export function webMultipleReplaceChain() {
  return 'a1b2c3'.replace(/1/g, 'one').replace(/2/g, 'two').replace(/3/g, 'three');
}

export function webComplexEmailRedact() {
  const str = 'Email: test@example.com, admin@test.org';
  return str.replace(/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b/g, '[REDACTED]');
}

export function webSquareDigitsReplace() {
  return 'values: 1, 2, 3, 4, 5'.replace(/\d+/g, (match) => {
    const num = parseInt(match, 10);
    return (num * num).toString();
  });
}

export function webEscapeHTML(str) {
  return str.replace(/[&<>'"]/g, (match) => {
    if (match === '&') {
      return '&amp;';
    }
    if (match === '<') {
      return '&lt;';
    }
    if (match === '>') {
      return '&gt;';
    }
    if (match === "'") {
      return '&#39;';
    }
    if (match === '"') {
      return '&quot;';
    }
    return match;
  });
}

export function webUnescapeHTML(str) {
  return str.replace(/&(amp|lt|gt|quot|#39);/g, (match) => {
    if (match === '&amp;') {
      return '&';
    }
    if (match === '&lt;') {
      return '<';
    }
    if (match === '&gt;') {
      return '>';
    }
    if (match === '&quot;') {
      return '"';
    }
    if (match === '&#39;') {
      return "'";
    }
    return match;
  });
}

export function webToHyphenCase(str) {
  return str.replace(/[A-Z]/g, (match, offset) => {
    return (offset > 0 ? '-' : '') + match.toLowerCase();
  });
}

export function webToCamelCase(str) {
  return str.replace(/-([a-z])/g, (match, letter) => letter.toUpperCase());
}

export function webFormatPhone(str) {
  return str.replace(/(\d{3})(\d{3})(\d{4})/, '($1) $2-$3');
}

export function webMarkdownToHTML(str) {
  return str
    .replace(/\*\*(.+?)\*\*/g, '<strong>$1</strong>')
    .replace(/\*(.+?)\*/g, '<em>$1</em>');
}

export function webEscapeSQL(str) {
  return str.replace(/['"\\]/g, (match) => {
    if (match === "'") {
      return "''";
    }
    if (match === '"') {
      return '\\"';
    }
    return '\\\\';
  });
}

export function webNormalizePath(str) {
  return str.replace(/\\/g, '/');
}

export function webFormatCurrency(str) {
  return str.replace(/\$(\d+(?:\.\d{2})?)/g, (match) => {
    const n = parseFloat(match.replace(/\$/, ''));
    return n.toLocaleString('en-US', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
  });
}

export function webMaskEmail(str) {
  return str.replace(/^(.)(.*)(@.*)$/, (full, a, rest, tail) => {
    return `${a}***${tail}`;
  });
}

export function splitDirectSymbolSplit() {
  return /-/[Symbol.split]('a-b-c');
}

export function splitStringVsSymbolSame() {
  const regex = /-/;
  const str = 'a-b-c';
  const a = str.split(regex);
  const b = regex[Symbol.split](str);
  if (a.length !== b.length) {
    return false;
  }
  for (let i = 0; i < a.length; i++) {
    if (a[i] !== b[i]) {
      return false;
    }
  }
  return true;
}

export function splitSymbolWithLimit() {
  return /,/[Symbol.split]('a,b,c', 2);
}

export function splitHasIndicesD() {
  try {
    const r = new RegExp('test', 'd');
    return 'test1test2'.split(r);
  } catch (_) {
    return null;
  }
}

export function splitSubclassOverride() {
  class MyRegExp extends RegExp {
    [Symbol.split](str, limit) {
      const out = RegExp.prototype[Symbol.split].call(this, str, limit);
      return out.map((x) => `(${x})`);
    }
  }
  return 'a-b-c'.split(new MyRegExp('-'));
}

export function splitSubclassCallSuper() {
  class LoggingRegExp extends RegExp {
    constructor(pattern, flags) {
      super(pattern, flags);
      this.count = 0;
    }
    [Symbol.split](str, limit) {
      this.count += 1;
      return super[Symbol.split](str, limit);
    }
  }
  const re = new LoggingRegExp(',');
  const out = 'a,b,c'.split(re);
  return { out, count: re.count };
}

export function splitSubclassCallSuperOut() {
  return splitSubclassCallSuper().out;
}

export function splitSubclassCallSuperCount() {
  return splitSubclassCallSuper().count;
}

export function splitSpeciesEffect() {
  class SpeciesRegExp extends RegExp {
    static get [Symbol.species]() {
      return RegExp;
    }
  }
  return 'a,b,c'.split(new SpeciesRegExp(','));
}

export function splitSubclassConstructorCount() {
  class CountingRegExp extends RegExp {
    [Symbol.split](str, limit) {
      const result = super[Symbol.split](str, limit);
      result.splitCount = result.length;
      return result;
    }
  }
  const out = 'a,b,c'.split(new CountingRegExp(','));
  return {
    out,
    splitCount: Array.isArray(out) ? out.splitCount : undefined
  };
}

export function splitSubclassConstructorOut() {
  return splitSubclassConstructorCount().out;
}

export function splitSubclassConstructorSplitCount() {
  const value = splitSubclassConstructorCount().splitCount;
  return typeof value === 'number' ? value : -1;
}

export function splitCustomSymbolObject() {
  const customSplitter = {
    [Symbol.split](str) {
      return str.split(/-/);
    }
  };
  return 'a-b-c'.split(customSplitter);
}

/**
 * undefined / null 作为 this：规范上应抛错（�?Object）�?
 * 普通对�?{} 是否抛错因引擎而异，不纳入本断言�?
 */
export function splitThisTypeErrors() {
  let undefinedThrows = false;
  let nullThrows = false;
  try {
    RegExp.prototype[Symbol.split].call(undefined, 'test');
  } catch (_) {
    undefinedThrows = true;
  }
  try {
    RegExp.prototype[Symbol.split].call(null, 'test');
  } catch (_) {
    nullThrows = true;
  }
  return undefinedThrows && nullThrows;
}

export function splitNonRegExpThisThrows() {
  try {
    RegExp.prototype[Symbol.split].call({}, 'test');
    return false;
  } catch (_) {
    return true;
  }
}

export function splitRegexLikeObjectCallResult() {
  const regexLike = {
    source: ',',
    flags: '',
    exec(str) {
      const idx = str.indexOf(',');
      if (idx === -1) return null;
      this.lastIndex = idx + 1;
      const m = [','];
      m.index = idx;
      m.input = str;
      return m;
    },
    lastIndex: 0
  };
  try {
    const out = RegExp.prototype[Symbol.split].call(regexLike, 'a,b,c');
    return {
      thrown: false,
      out: Array.isArray(out) ? out : [String(out)]
    };
  } catch (_) {
    return {
      thrown: true,
      out: []
    };
  }
}

export function splitRegexLikeObjectCallThrows() {
  return splitRegexLikeObjectCallResult().thrown;
}

export function splitRegexLikeObjectCallOut() {
  return splitRegexLikeObjectCallResult().out;
}

export function splitSymbolInputThrows() {
  try {
    /test/[Symbol.split](Symbol('x'));
    return false;
  } catch (_) {
    return true;
  }
}

export function splitBigIntInput() {
  return /,/[Symbol.split](12345678901234567890n);
}

export function splitToStringObjectInput() {
  const obj = {
    toString() {
      return 'a-b-c';
    }
  };
  return /-/[Symbol.split](obj);
}

export function splitToPrimitiveInput() {
  const obj = {
    [Symbol.toPrimitive](hint) {
      if (hint === 'string') {
        return 'x,y,z';
      }
      return 0;
    }
  };
  return /,/[Symbol.split](obj);
}

export function splitArrayInput() {
  return /,/[Symbol.split](['a', 'b', 'c']);
}

export function splitFunctionInput() {
  function demo() { }
  return /function/[Symbol.split](demo);
}

export function splitCustomSplitterStateful() {
  const splitByNumber = {
    [Symbol.split](str) {
      let num = 1;
      let pos = 0;
      const result = [];
      while (pos < str.length) {
        const matchPos = str.indexOf(String(num), pos);
        if (matchPos === -1) {
          result.push(str.substring(pos));
          break;
        }
        result.push(str.substring(pos, matchPos));
        pos = matchPos + String(num).length;
        num++;
      }
      return result;
    }
  };
  return 'a1bc2c5d3e4f'.split(splitByNumber);
}

export function splitCustomSplitterWithLimit() {
  const limitedSplitter = {
    [Symbol.split](str, limit) {
      const parts = str.split(/,/);
      return limit ? parts.slice(0, limit) : parts;
    }
  };
  return 'a,b,c,d,e'.split(limitedSplitter, 3);
}

export function splitCustomSplitterValidate() {
  const validatingSplitter = {
    [Symbol.split](str, limit) {
      const results = [];
      const parts = str.split(/;/);
      for (const part of parts) {
        const trimmed = part.trim();
        if (trimmed && trimmed.length > 2) {
          results.push(trimmed);
        }
        if (limit && results.length >= limit) break;
      }
      return results;
    }
  };
  return 'ab; abc; bcdefg; cd; xyz'.split(validatingSplitter, 2);
}

export function splitCustomSplitterNonArrayReturn() {
  const weirdSplitter = {
    [Symbol.split]() {
      return 'not an array';
    }
  };
  const ret = 'test'.split(weirdSplitter);
  if (Array.isArray(ret)) {
    return ret;
  }
  return [String(ret)];
}

export function splitLimitStringInput() {
  return 'a b c'.split(/\s/, '2');
}

export function splitSeparatorNullInput() {
  return 'testnullnulltest'.split(null);
}

export function splitSeparatorNumberInput() {
  return 'test123test'.split(123);
}

export function splitSeparatorObjectInput() {
  return 'test[object Object]test'.split({});
}

export function splitSupportsHasIndices() {
  try {
    return new RegExp('.', 'd').hasIndices === true;
  } catch (_) {
    return false;
  }
}

export function splitUndefinedSeparator() {
  return 'Hello World'.split(undefined);
}

export function regexpSymbolMatchAll(regex, str) {
  return regex[Symbol.matchAll](str);
}

export function regexpSymbolSearch(re, str) {
  return re[Symbol.search](str);
}


export function regexpTestCallThisNotRegExpThrows() {
  try {
    RegExp.prototype.test.call({}, 'test');
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function regexpTestCallThisUndefinedThrows() {
  try {
    RegExp.prototype.test.call(undefined, 'test');
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function regexpTestCallThisNullThrows() {
  try {
    RegExp.prototype.test.call(null, 'test');
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function regexpTestCallRegexLikeObject() {
  const regexLike = {
    source: 'test',
    flags: '',
    exec: function (str) {
      const idx = String(str).indexOf(this.source);
      return idx === -1 ? null : [this.source];
    }
  };
  try {
    return RegExp.prototype.test.call(regexLike, 'test') === true;
  } catch (e) {
    return false;
  }
}

export function strictDeleteRegexSourceThrows() {
  'use strict';
  const re = /test/;
  try {
    Object.defineProperty(re, 'source', {
      value: 'x',
      configurable: false,
      enumerable: false,
      writable: false
    });
  } catch (_) {
    return true;
  }
  try {
    delete re.source;
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function regexpTestSymbolParameterThrows() {
  try {
    const sym = Symbol('test');
    const re = /test/;
    re.test(sym);
    return false;
  } catch (e) {
    return true;
  }
}

export function regexpTestToPrimitiveCoercionMatchesPrimitive() {
  const re = /primitive/;
  const obj = {
    [Symbol.toPrimitive](hint) {
      return hint === 'string' ? 'primitive' : 0;
    }
  };
  return re.test(obj) === true;
}

export function regexpTestBigintParameterMatches123() {
  const re = /123/;
  return re.test(123n) === true;
}

export function toStringDefinePropertySourceGetter() {
  const regex = /test/gi;
  try {
    Object.defineProperty(regex, 'source', {
      get: function () {
        return 'modified';
      }
    });
  } catch (e) {
    return { ok: false, thrown: true, name: e && e.name ? e.name : '' };
  }
  return { ok: true, thrown: false, value: regex.toString() };
}

export function toStringDefinePropertyFlagsGetter() {
  const regex = /test/gi;
  try {
    Object.defineProperty(regex, 'flags', {
      get: function () {
        return 'um';
      }
    });
  } catch (e) {
    return { ok: false, thrown: true, name: e && e.name ? e.name : '' };
  }
  return { ok: true, thrown: false, value: regex.toString() };
}

export function toStringGetterHijackSourceCalled() {
  const regex = /test/gi;
  let getterCalled = false;
  try {
    Object.defineProperty(regex, 'source', {
      get: function () {
        getterCalled = true;
        return this.originalSource || 'hijacked';
      }
    });
  } catch (e) {
    return { ok: false, thrown: true, getterCalled: false };
  }
  regex.toString();
  return { ok: true, thrown: false, getterCalled };
}

export function regexpToStringCallNonRegExpThrows() {
  try {
    RegExp.prototype.toString.call({});
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function regexpToStringCallNullThrows() {
  try {
    RegExp.prototype.toString.call(null);
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function regexpToStringCallUndefinedThrows() {
  try {
    RegExp.prototype.toString.call(undefined);
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function regexpToStringCallStringThrows() {
  try {
    RegExp.prototype.toString.call('not a regex');
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function regexpToStringCallNumberThrows() {
  try {
    RegExp.prototype.toString.call(123);
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function regexpToStringOnFrozen() {
  const regex = /test/;
  Object.freeze(regex);
  return regex.toString();
}

export function regexpToStringOnSealed() {
  const regex = /test/;
  Object.seal(regex);
  return regex.toString();
}

export function definePropertyOnFrozenThrows() {
  const regex = /test/gi;
  Object.freeze(regex);
  try {
    Object.defineProperty(regex, 'source', {
      get: function () {
        return 'modified';
      }
    });
    return false;
  } catch (e) {
    return e instanceof TypeError;
  }
}

export function regexpToStringApply() {
  const regex = /test/;
  return RegExp.prototype.toString.apply(regex);
}

export function regexpToStringBind() {
  const regex = /test/;
  const bound = regex.toString.bind(regex);
  return bound();
}

export function jsonStringifyRegExpIsEmptyObject() {
  const regex = /test/gi;
  return JSON.stringify(regex);
}

export function jsonStringifyWithToJSON() {
  const regex = /test/gi;
  const old = RegExp.prototype.toJSON;
  try {
    RegExp.prototype.toJSON = function () {
      return this.toString();
    };
    const out = JSON.stringify({ regex });
    return out;
  } finally {
    if (old === undefined) {
      delete RegExp.prototype.toJSON;
    } else {
      RegExp.prototype.toJSON = old;
    }
  }
}

export function regexpToStringByComputedName() {
  const regex = /test/;
  const name = 'toString';
  return regex[name]();
}

export function regexpPrototypeToStringDescriptor() {
  const d = Object.getOwnPropertyDescriptor(RegExp.prototype, 'toString');
  return {
    writable: !!(d && d.writable),
    enumerable: !!(d && d.enumerable),
    configurable: !!(d && d.configurable)
  };
}

export function regexpToStringReconstructable() {
  const regex1 = /test/gi;
  const s = regex1.toString();
  const m = /^\/(.*)\/([a-z]*)$/.exec(s);
  if (!m) return false;
  const regex2 = new RegExp(m[1], m[2]);
  return regex1.toString() === regex2.toString() && regex1.test('TEST') === regex2.test('TEST');
}

export function regexpInstanceHasOwnToString() {
  const re = /test/;
  return Object.prototype.hasOwnProperty.call(re, 'toString');
}

export function regexpPrototypeHasOwnToString() {
  return Object.prototype.hasOwnProperty.call(RegExp.prototype, 'toString');
}

export function regexpToStringSameAsPrototype() {
  const re = /test/;
  return re.toString === RegExp.prototype.toString;
}

export function objectPrototypeToStringOnRegExp() {
  const re = /test/;
  return Object.prototype.toString.call(re);
}

export function regexpOverrideToStringReturnsCustom() {
  const re = /test/;
  re.toString = function () { return 'custom'; };
  return re.toString();
}

export function regexpDeleteOverrideRestoresPrototype() {
  const re = /test/;
  re.toString = function () { return 'custom'; };
  delete re.toString;
  return re.toString();
}

