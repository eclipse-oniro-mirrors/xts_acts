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

export function testUndefinedParam() {
  return "test".charCodeAt(undefined);
}

export function testNullParam() {
  return "test".charCodeAt(null);
}

export function testNaNParam() {
  return "test".charCodeAt(NaN);
}

export function testEmptyObjectParam() {
  return "test".charCodeAt({});
}

export function testEmptyArrayParam() {
  let arr = new Array();
  return "test".charCodeAt(arr);
}

export function testSingleElementArrayParam() {
  return "test".charCodeAt([2]);
}

export function testArrayWithThreeParam() {
  return "test".charCodeAt([3]);
}

export function testObjectWithValueOf() {
  const objWithValueOf = {
    valueOf: function() {
      return 1.5;
    }
  };
  return "test".charCodeAt(objWithValueOf);
}

export function testObjectWithToString() {
  const objToString = {
    toString: function() {
      return "2.7";
    }
  };
  return "test".charCodeAt(objToString);
}

export function testObjectWithBoth() {
  const objBoth = {
    valueOf: function() {
      return 3;
    },
    toString: function() {
      return "4";
    }
  };
  return "test".charCodeAt(objBoth);
}

export function testSymbolParam() {
  const sym = Symbol("test");
  try {
    return "test".charCodeAt(sym);
  } catch (e) {
    return NaN;
  }
}

export function testObjectWithToPrimitive() {
  const objWithToPrimitive = {
    [Symbol.toPrimitive]: function(hint) {
      if (hint === 'number') {
        return 2.5;
      }
      return "2.5";
    }
  };
  return "test".charCodeAt(objWithToPrimitive);
}

export function testObjectWithToPrimitiveString() {
  const objWithToPrimitiveString = {
    [Symbol.toPrimitive]: function(hint) {
      return "3.8";
    }
  };
  return "test".charCodeAt(objWithToPrimitiveString);
}
