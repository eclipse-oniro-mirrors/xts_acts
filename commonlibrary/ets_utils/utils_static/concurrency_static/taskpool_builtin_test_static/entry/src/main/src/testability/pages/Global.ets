'use static'
/* 1. encodeURI */

export function testGlobalEncodeURI() {
  const TAG = 'testGlobalEncodeURI';
  try {
    const input = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEF" +
      'GHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
    const expect =
      "%20!%22#$%25&'()*+,-./0123456789:;%3C=%3E?@ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D~";
    console.info('==========1',encodeURI(input))
    if (encodeURI(input) !== expect) {
      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    throw new Error(`${TAG} failed: ${err.message}`);
  }
}

/* 2. decodeURI */

export function testGlobalDecodeURI() {
  const TAG = 'testGlobalDecodeURI';
  try {
    const input =
      "%20!%22#$%25&'()*+,-./0123456789:;%3C=%3E?@ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D~";
    const expect = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
    if (decodeURI(input) !== expect) {
      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    throw new Error(`${TAG} failed: ${err.message}`);
  }
}

/* 3. encodeURIComponent */

export function testGlobalEncodeURIComponent() {
  const TAG = 'testGlobalEncodeURIComponent';
  try {
    const input = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEF" +
      'GHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
    const expect =
      "%20!%22%23%24%25%26'()*%2B%2C-.%2F0123456789%3A%3B%3C%3D%3E%3F%40ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D~";
    console.info('=================3',encodeURIComponent(input))
    if (encodeURIComponent(input) !== expect) {

      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    throw new Error(`${TAG} failed: ${err.message}`);
  }
}


/* 4. decodeURIComponent */

export function testGlobalDecodeURIComponent() {
  const TAG = 'testGlobalDecodeURIComponent';
  try {
    const input =
      "%20!%22%23%24%25%26'()*%2B%2C-.%2F0123456789%3A%3B%3C%3D%3E%3F%40ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D~";
    const expect = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
    if (decodeURIComponent(input) !== expect) {
      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    throw new Error(`${TAG} failed: ${err.message}`);
  }
}

/* 5. escape */

export function testGlobalEscape() {
  const TAG = 'testGlobalEscape';
  try {
    const input = '!\\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEF' +
      'GHIJKLMNOPQRSTUVWXYZ[\\\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
    const expect =
      '%21%5C%22%23%24%25%26%27%28%29*+%2C-./0123456789%3A%3B%3C%3D%3E%3F@ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D%7E';
    if (escape(input) !== expect) {
      console.info('========test',escape(input))
      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    throw new Error(`${TAG} failed: ${err.message}`);

  }
}

/* 6. unescape */

export function testGlobalUnescape() {
  const TAG = 'testGlobalUnescape';
  try {
    let result = unescape('%20%21%22%23%24%25%26%27%28%29*+%2C-./0123456789%3A' +
      '%3B%3C%3D%3E%3F@ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D%7E');
    const expect =' !"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
    if (result !== expect) {
      console.info('========test2',result)
      throw new Error(`${TAG} mismatch`);
    }
  } catch (err) {
    throw new Error(`${TAG} failed: ${err.message}`);
  }
}

/* 7. isFinite */

export function testGlobalIsFinite() {
  const TAG = 'testGlobalIsFinite';
  try {
    if (isFinite(123) !== true) {
      throw new Error(`${TAG} 123`);
    }
    if (isFinite(Infinity) !== false) {
      throw new Error(`${TAG} Infinity`);
    }
  } catch (err) {
    throw new Error(`${TAG} failed: ${err.message}`);
  }
}

/* 8. isNaN */

export function testGlobalIsNaN() {
  const TAG = 'testGlobalIsNaN';
  try {
    if (isNaN(123) !== false) {
      throw new Error(`${TAG} 123`);
    }
    if (isNaN(NaN) !== true) {
      throw new Error(`${TAG} NaN`);
    }
  } catch (err) {
    throw new Error(`${TAG} failed: ${err.message}`);
  }
}