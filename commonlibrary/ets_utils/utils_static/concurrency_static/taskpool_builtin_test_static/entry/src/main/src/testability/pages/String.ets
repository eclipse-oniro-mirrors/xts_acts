'use static'

/* ---------- 1. String.fromCharCode ---------- */

export function testFromCharCode() {
  const TAG = 'testFromCharCode';
  try {
    const res = String.fromCharCode(65, 66, 67);
    if (res !== 'ABC') {
      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    console.error(`${TAG}`, err.message);
    throw new Error(`${TAG} catch error`);
  }
}

/* ---------- 2. String.fromCodePoint ---------- */

export function testFromCodePoint() {
  const TAG = 'testFromCodePoint';
  try {
    const res = String.fromCodePoint(65, 90);
    if (res !== 'AZ') {
      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    console.error(`${TAG}`, err.message);
    throw new Error(`${TAG} catch error`);
  }
}

/* ---------- 5. charCodeAt ---------- */

export function testCharCodeAt() {
  const TAG = 'testCharCodeAt';
  try {
    const res = 'ABC'.charCodeAt(0);
    if (res !== 65) {
      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    console.error(`${TAG}`, err.message);
    throw new Error(`${TAG} catch error`);
  }
}

/* ---------- 6. codePointAt ---------- */

export function testCodePointAt() {
  const TAG = 'testCodePointAt';
  try {
    const res = '😍'.codePointAt(0);
    if (res !== 128525) {
      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    console.error(`${TAG}`, err.message);
    throw new Error(`${TAG} catch error`);
  }
}

/* ---------- 7. concat ---------- */

export function testConcat() {
  const TAG = 'testConcat';
  try {
    const res = 'Hello'.concat('World');
    if (res !== 'HelloWorld') {
      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    console.error(`${TAG}`, err.message);
    throw new Error(`${TAG} catch error`);
  }
}

/* ---------- 8. endsWith ---------- */

export function testEndsWith() {
  const TAG = 'testEndsWith';
  try {
    const res = 'my hello world'.endsWith('world');
    if (!res) {
      throw new Error(`${TAG} should be true`);
    }
  } catch (err) {
    console.error(`${TAG}`, err.message);
    throw new Error(`${TAG} catch error`);
  }
}

/* ---------- 9. includes ---------- */

export function testIncludes() {
  const TAG = 'testIncludes';
  try {
    const res = 'Hello World'.includes('World');
    if (!res) {
      throw new Error(`${TAG} should be true`);
    }
  } catch (err) {
    console.error(`${TAG}`, err.message);
    throw new Error(`${TAG} catch error`);
  }
}

/* ---------- 10. indexOf ---------- */

export function testIndexOf() {
  const TAG = 'testIndexOf';
  try {
    const res = 'hello world'.indexOf('world');
    if (res !== 6) {
      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    console.error(`${TAG}`, err.message);
    throw new Error(`${TAG} catch error`);
  }
}

/* ---------- 11. lastIndexOf ---------- */

export function testLastIndexOf() {
  const TAG = 'testLastIndexOf';
  try {
    const res = 'HelloWorld'.lastIndexOf('World');
    if (res !== 5) {
      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    console.error(`${TAG}`, err.message);
    throw new Error(`${TAG} catch error`);
  }
}

/* ---------- 12. matchAll ---------- */

export function testMatchAll() {
  const TAG = 'testMatchAll';
  try {
    const str = 'test1test2';
    const regex = new RegExp("t(e)(st(\\d?))", "g");
    const matches = Array.from(str.matchAll(regex));
    if (matches.length !== 2) {
      throw new Error(`${TAG} count mismatch`);
    }
  } catch (err) {
    console.error(`${TAG}`, err.message);
    throw new Error(`${TAG} catch error`);
  }
}

/* ---------- 13. normalize ---------- */

export function testNormalize() {
  const TAG = 'testNormalize';
  try {
    const res = '\u00F1'.normalize('NFD').length;
    if (res !== 2) {
      throw new Error(`${TAG} length mismatch`);
    }
  } catch (err) {
    console.error(`${TAG}`, err.message);
    throw new Error(`${TAG} catch error`);
  }
}

/* ---------- 14. padEnd ---------- */

export function testPadEnd() {
  const TAG = 'testPadEnd';
  try {
    const res = 'Breaded Mushrooms'.padEnd(25, '.');
    if (res !== 'Breaded Mushrooms........') {
      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    console.error(`${TAG}`, err.message);
    throw new Error(`${TAG} catch error`);
  }
}

/* ---------- 15. padStart ---------- */

export function testPadStart() {
  const TAG = 'testPadStart';
  try {
    const res = '5'.padStart(2, '0');
    if (res !== '05'){
      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    console.error(`${TAG}`, err.message);
    throw new Error(`${TAG} catch error`);
  }
}

/* ---------- 16. repeat ---------- */

export function testRepeat() {
  const TAG = 'testRepeat';
  try {
    const res = '1'.repeat(3);
    if (res !== '111') {
      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    console.error(`${TAG}`, err.message);
    throw new Error(`${TAG} catch error`);
  }
}

/* ---------- 17. replace ---------- */

export function testReplace() {
  const TAG = 'testReplace';
  try {
    const res = '1'.replace('1', '2');
    if (res !== '2') {
      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    console.error(`${TAG}`, err.message);
    throw new Error(`${TAG} catch error`);
  }
}

/* ---------- 18. replaceAll ---------- */

export function testReplaceAll() {
  const TAG = 'testReplaceAll';
  try {
    const res = '123321'.replaceAll('1', '2');
    if (res !== '223322') {
      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    console.error(`${TAG}`, err.message);
    throw new Error(`${TAG} catch error`);
  }
}

/* ---------- 19. search ---------- */

export function testSearch() {
  const TAG = 'testSearch';
  try {
    const paragraph = 'I think Ruth\'s dog is cuter than your dog!';
    const regex = new RegExp("[^\\w\\s']", "g");
    let flag1 = paragraph.search(regex);
    if (flag1 !== 41) {
      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    console.error(`${TAG}`, err.message);
    throw new Error(`${TAG} catch error`);
  }
}

/* ---------- 20. slice ---------- */

export function testSlice() {
  const TAG = 'testSlice';
  try {
    const res = 'Brave new world'.slice(-4);
    if (res !== 'orld') {
      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    console.error(`${TAG}`, err.message);
    throw new Error(`${TAG} catch error`);
  }
}

/* ---------- 21. split ---------- */

export function testSplit() {
  const TAG = 'testSplit';
  try {
    const res = 'a b c'.split(' ')[1];
    if (res !== 'b') {
      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    console.error(`${TAG}`, err.message);
    throw new Error(`${TAG} catch error`);
  }
}

/* ---------- 22. startsWith ---------- */

export function testStartsWith() {
  const TAG = 'testStartsWith';
  try {
    const res = 'Saturday night'.startsWith('Sat');
    if (!res) {
      throw new Error(`${TAG} should be true`);
    }
  } catch (err) {
    console.error(`${TAG}`, err.message);
    throw new Error(`${TAG} catch error`);
  }
}

/* ---------- 23. substring ---------- */

export function testSubstring() {
  const TAG = 'testSubstring';
  try {
    const res = 'Mozilla'.substring(1, 3);
    if (res !== 'oz') {
      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    console.error(`${TAG}`, err.message);
    throw new Error(`${TAG} catch error`);
  }
}

/* ---------- 24. toLocaleLowerCase ---------- */

export function testToLocaleLowerCase() {
  const TAG = 'testToLocaleLowerCase';
  try {
    const res = 'İstanbul'.toLocaleLowerCase('en-US');
    if (res !== 'i̇stanbul') {
      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    console.error(`${TAG}`, err.message);
    throw new Error(`${TAG} catch error`);
  }
}

/* ---------- 25. toLocaleUpperCase ---------- */

export function testToLocaleUpperCase() {
  const TAG = 'testToLocaleUpperCase';
  try {
    const res = 'istanbul'.toLocaleUpperCase('en-US');
    if (res !== 'ISTANBUL') {
      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    console.error(`${TAG}`, err.message);
    throw new Error(`${TAG} catch error`);
  }
}

/* ---------- 26. toLowerCase ---------- */

export function testToLowerCase() {
  const TAG = 'testToLowerCase';
  try {
    const res = 'ABC'.toLowerCase();
    if (res !== 'abc') {
      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    console.error(`${TAG}`, err.message);
    throw new Error(`${TAG} catch error`);
  }
}

/* ---------- 27. toString ---------- */

export function testToString() {
  const TAG = 'testToString';
  try {
    const res = 'foo';
    if (res.toString() !== 'foo') {
      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    console.error(`${TAG}`, err.message);
    throw new Error(`${TAG} catch error`);
  }
}

/* ---------- 28. toUpperCase ---------- */

export function testToUpperCase() {
  const TAG = 'testToUpperCase';
  try {
    const res = 'abc'.toUpperCase();
    if (res !== 'ABC') {
      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    console.error(`${TAG}`, err.message);
    throw new Error(`${TAG} catch error`);
  }
}

/* ---------- 29. trim ---------- */

export function testTrim() {
  const TAG = 'testTrim';
  try {
    const res = '  abc  '.trim();
    if (res !== 'abc') {
      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    console.error(`${TAG}`, err.message);
    throw new Error(`${TAG} catch error`);
  }
}

/* ---------- 30. trimEnd ---------- */

export function testTrimEnd() {
  const TAG = 'testTrimEnd';
  try {
    const res = '  abc  '.trimEnd();
    if (res !== '  abc') {
      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    console.error(`${TAG}`, err.message);
    throw new Error(`${TAG} catch error`);
  }
}

/* ---------- 31. trimStart ---------- */

export function testTrimStart() {
  const TAG = 'testTrimStart';
  try {
    const res = '  abc  '.trimStart();
    if (res !== 'abc  ') {
      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    console.error(`${TAG}`, err.message);
    throw new Error(`${TAG} catch error`);
  }
}

/* ---------- 32. valueOf ---------- */

export function testValueOf() {
  const TAG = 'testValueOf';
  try {
    const res:string = 'foo';
    if (res.valueOf() !== 'foo') {
      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    console.error(`${TAG}`, err.message);
    throw new Error(`${TAG} catch error`);
  }
}

// 3500 - indexOf 测试

export function testStringIndexOf3500() {
  const TAG = 'testStringIndexOf3500';
  try {
    const str = 'brie, pepper jack, cheddar';
    let str1 = str.indexOf('cheddar');
    if (str1 !== 19) {
      throw new Error(`${TAG} failed: expected 19, got ${str1}`);
    }
    return true;
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error: ${err.message}`);
  }
}

// 4300 - lastIndexOf 测试

export function testStringLastIndexOf4300() {
  const TAG = 'testStringLastIndexOf4300';
  try {
    const str = 'canal';
    let str1 = str.lastIndexOf('a');
    if (str1 !== 3) {
      throw new Error(`${TAG} failed: expected 3, got ${str1}`);
    }
    return true;
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error: ${err.message}`);
  }
}

// 6600 - localeCompare 测试

export function testStringLocaleCompare6600() {
  const TAG = 'testStringLocaleCompare6600';
  try {
    const str = 'Banana';
    let str1 = str.localeCompare('Apple');
    if (str1 !== 1) {
      throw new Error(`${TAG} failed: expected 1, got ${str1}`);
    }
    return true;
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error: ${err.message}`);
  }
}
