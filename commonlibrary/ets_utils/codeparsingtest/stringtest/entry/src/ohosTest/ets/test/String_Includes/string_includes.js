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

// Test functions for String.prototype.includes() exception handling

export function testIncludesRegExp001() {
  try {
    const result = "Hello World".includes(/Hello/);
    return { hasError: false, result: result };
  } catch (e) {
    return { hasError: true, isTypeError: e instanceof TypeError };
  }
}

export function testIncludesRegExp002() {
  try {
    const regex = /World/;
    const result = "Hello World".includes(regex);
    return { hasError: false, result: result };
  } catch (e) {
    return { hasError: true, isTypeError: e instanceof TypeError };
  }
}

export function testIncludesNaN001() {
  const str = "Hello World";
  return str.includes(NaN);
}

export function testIncludesNaN002() {
  const str = "Hello World";
  return str.includes("NaN");
}

export function testIncludesThisNull() {
  try {
    const result = String.prototype.includes.call(null, "test");
    return { hasError: false, result: result };
  } catch (e) {
    return { hasError: true, isTypeError: e instanceof TypeError };
  }
}

export function testIncludesThisUndefined() {
  try {
    const result = String.prototype.includes.call(undefined, "test");
    return { hasError: false, result: result };
  } catch (e) {
    return { hasError: true, isTypeError: e instanceof TypeError };
  }
}

export function testIncludesThisNumber001() {
  return String.prototype.includes.call(123, "1");
}

export function testIncludesThisNumber002() {
  return String.prototype.includes.call(123, "4");
}

export function testIncludesThisNumber003() {
  return String.prototype.includes.call(123, "23");
}

export function testIncludesThisBoolean001() {
  return String.prototype.includes.call(true, "t");
}

export function testIncludesThisBoolean002() {
  return String.prototype.includes.call(true, "rue");
}

export function testIncludesThisBoolean003() {
  return String.prototype.includes.call(false, "fa");
}

export function testIncludesThisObject() {
  const obj = { toString: () => "Hello World" };
  return String.prototype.includes.call(obj, "Hello");
}

export function testIncludesThisObject002() {
  const obj = { toString: () => "Hello World" };
  return String.prototype.includes.call(obj, "World");
}

export function testIncludesThisArray001() {
  return String.prototype.includes.call([1, 2, 3], "1,2");
}

export function testIncludesThisArray002() {
  return String.prototype.includes.call([1, 2, 3], "2");
}

export function testIncludesThisArray003() {
  return String.prototype.includes.call(['a', 'b'], "a,b");
}

export function testIncludesVsIndexOf001() {
  const str = "Hello World";
  return {
    includes: str.includes("World"),
    indexOfNotNegOne: str.indexOf("World") !== -1
  };
}

export function testIncludesVsIndexOf002() {
  const str = "Hello World";
  return {
    includes: str.includes("xyz"),
    indexOfIsNegOne: str.indexOf("xyz") === -1
  };
}

export function testIncludesVsIndexOf003() {
  const str = "Hello Hello World";
  return {
    includes: str.includes("World", 6),
    indexOfNotNegOne: str.indexOf("World", 6) !== -1
  };
}

export function testIncludesVsIndexOf004() {
  const str = "test";
  return {
    includes: str.includes(""),
    indexOf: str.indexOf("")
  };
}

export function testIncludesVsIndexOf005() {
  const str = "test";
  return {
    includes: str.includes("", 5),
    indexOf: str.indexOf("", 5)
  };
}

export function testIncludesVsStartsWith001() {
  const str = "Hello World";
  return {
    includes: str.includes("Hello"),
    startsWith: str.startsWith("Hello")
  };
}

export function testIncludesVsStartsWith002() {
  const str = "Hello World";
  return {
    includes: str.includes("World"),
    startsWith: str.startsWith("World")
  };
}

export function testIncludesVsEndsWith001() {
  const str = "Hello World";
  return {
    includes: str.includes("World"),
    endsWith: str.endsWith("World")
  };
}

export function testIncludesVsEndsWith002() {
  const str = "Hello World";
  return {
    includes: str.includes("Hello"),
    endsWith: str.endsWith("Hello")
  };
}

export function testIncludesChained001() {
  const str = "Hello World";
  return str.toLowerCase().includes("hello");
}

export function testIncludesChained002() {
  const str = "  Hello World  ";
  return str.trim().includes("Hello World");
}

export function testIncludesChained003() {
  const str = "Hello World";
  return str.slice(0, 5).includes("Hello");
}

export function testIncludesChained004() {
  const str = "abc";
  return str.repeat(3).includes("abcabc");
}

export function testIncludesPractical001() {
  const text = "The quick brown fox jumps over the lazy dog";
  return text.includes("fox");
}

export function testIncludesPractical002() {
  const filename = "document.pdf";
  return filename.includes(".pdf");
}

export function testIncludesPractical003() {
  const path = "C:/Users/Documents/file.txt";
  return path.includes("/");
}

export function testIncludesPractical004() {
  const url = "https://www.example.com";
  return url.includes("https://");
}

export function testIncludesPractical005() {
  const url = "https://www.example.com";
  return url.includes("example.com");
}

export function testIncludesPractical006() {
  const email = "user@example.com";
  return email.includes("@");
}

export function testIncludesUndefined() {
  const str = "Hello World";
  return str.includes(undefined);
}

export function testIncludesNull() {
  const str = "Hello World";
  return str.includes(null);
}

export function testIncludesNoParam() {
  const str = "Hello World";
  return str.includes();
}

export function testIncludesNumber() {
  const str = "Hello 123 World";
  return str.includes(123);
}

export function testIncludesNumberNotFound() {
  const str = "Hello 123 World";
  return str.includes(456);
}

export function testIncludesEmptyArray() {
  const str = "Hello World";
  return str.includes([]);
}

export function testIncludesArray() {
  const str = "Hello World";
  return str.includes([1, 2]);
}

export function testIncludesTrue() {
  const str = "Hello World";
  return str.includes(true);
}

export function testIncludesFalse() {
  const str = "Hello World";
  return str.includes(false);
}
