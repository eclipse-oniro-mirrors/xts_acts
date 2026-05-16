'use static'
import buffer from '@ohos.buffer';


export function testAlloc0001() {
  const TAG = 'testAlloc0001';
  try {
    console.log(`${TAG} test start`);
    const size: int = 10;
    const buf = buffer.alloc(size);
    if (buf.length !== size) { throw new Error(`${TAG} length mismatch`); }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


export function testAllocUninitialized0001() {
  const TAG = 'testAllocUninitialized0001';
  try {
    console.log(`${TAG} test start`);
    const buf = buffer.allocUninitialized(10);
    if (buf.length !== 10) { throw new Error(`${TAG} length !== 10`); }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


export function testAllocUninitializedFromPool0001() {
  const TAG = 'testAllocUninitializedFromPool0001';
  try {
    console.log(`${TAG} test start`);
    const buf = buffer.allocUninitializedFromPool(10);
    if (buf.length !== 10) { throw new Error(`${TAG} length !== 10`); }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


export function testByteLength0001() {
  const TAG = 'testByteLength0001';
  try {
    console.log(`${TAG} test start`);
    const len = buffer.byteLength('abcd');
    if (len !== 4) { throw new Error(`${TAG} len !== 4`); }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


export function testIsBuffer0001() {
  const TAG = 'testIsBuffer0001';
  try {
    console.log(`${TAG} test start`);
    const buf = buffer.alloc(1);
    const flag = buffer.isBuffer(buf);
    if (flag !== true) { throw new Error(`${TAG} flag !== true`); }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


export function testIsEncoding0001() {
  const TAG = 'testIsEncoding0001';
  try {
    console.log(`${TAG} test start`);
    const arr = ['utf8', 'ascii', 'base64', 'hex'];
    for (const enc of arr) {
      const flag = buffer.isEncoding(enc);
      if (flag !== true) { throw new Error(`${TAG} ${enc} not supported`); }
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


export function testStaticCompare0001() {
  const TAG = 'testStaticCompare0001';
  try {
    console.log(`${TAG} test start`);
    const buf1 = buffer.from('1236');
    const buf2 = buffer.from('1235');
    const res = buffer.compare(buf1, buf2);
    if (res !== 1) { throw new Error(`${TAG} res !== 1`); }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


export function testConcat0001() {
  const TAG = 'testConcat0001';
  try {
    console.log(`${TAG} test start`);
    const buf1 = buffer.from('1236');
    const buf2 = buffer.from('1235');
    const buf = buffer.concat([buf1, buf2]);
    const str = buf.toString();
    if (str !== '12361235') { throw new Error(`${TAG} concat mismatch`); }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


export function testTranscode0001() {
  const TAG = 'testTranscode0001';
  try {
    console.log(`${TAG} test start`);
    const buf1 = buffer.from('1236');
    const buf = buffer.transcode(buf1, 'ascii', 'ucs2');
    const str = buf.toString('ucs2');
    if (str !== '1236') { throw new Error(`${TAG} transcode mismatch`); }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


export function testFill0001() {
  const TAG = 'testFill0001';
  try {
    console.log(`${TAG} test start`);
    const buf = buffer.alloc(3).fill('abc');
    const str = buf.toString();
    if (str !== 'abc') { throw new Error(`${TAG} fill mismatch`); }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


export function testWrite0001() {
  const TAG = 'testWrite0001';
  try {
    console.log(`${TAG} test start`);
    const buf = buffer.alloc(256);
    const len: int = buf.write('\u00bd + \u00bc = \u00be', 0);
    if (len !== 12) { throw new Error(`${TAG} write len !== 12`); }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.alloc
 ********************/

export function testBufferAlloc() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.alloc(3, 'a');
    if (buf.length !== 3) { throw new Error('length mismatch'); }
    if (buf.toString() !== 'aaa') { throw new Error('content mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.alloc failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.byteLength
 ********************/

export function testBufferByteLength() {
  const TAG = 'BufferConcurrentTest';
  try {
    const res = buffer.byteLength('\u00bd + \u00bc = \u00be');
    if (res !== 12) { throw new Error('byteLength mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.byteLength failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.concat
 ********************/

export function testBufferConcat() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf1 = buffer.from('1234');
    const buf2 = buffer.from('abcd');
    const buf = buffer.concat([buf1, buf2]);
    if (buf.length !== 8) { throw new Error('concat length mismatch'); }
    if (buf.toString('utf8') !== '1234abcd') { throw new Error('concat content mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.concat failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.from (ArrayBuffer)
 ********************/

export function testBufferFromArrayBuffer() {
  const TAG = 'BufferConcurrentTest';
  try {
    const ab = new ArrayBuffer(8);
    const buf = buffer.from(ab);
    if (buf.length !== 8) { throw new Error('from ArrayBuffer length mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.from ArrayBuffer failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.from (string)
 ********************/

export function testBufferFromString() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.from('this is a test');
    if (buf.length !== 14) { throw new Error('from string length mismatch'); }
    if (buf.toString() !== 'this is a test') { throw new Error('from string content mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.from string failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.compare
 ********************/

export function testBufferCompare() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf1 = buffer.from('1234');
    const buf2 = buffer.from('0123');
    const res = buf1.compare(buf2);
    if (res !== 1) { throw new Error('compare result mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.compare failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.transcode
 ********************/

export function testBufferTranscode() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.from('hello world');
    const newBuf = buffer.transcode(buf, 'utf-8', 'base64');
    if (newBuf.length !== 8) { throw new Error('transcode length mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.transcode failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.fill
 ********************/

export function testBufferFill() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.allocUninitializedFromPool(5);
    buf.fill(0x41);
    if (buf.toString('utf-8') !== 'AAAAA') { throw new Error('fill content mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.fill failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.copy
 ********************/

export function testBufferCopy() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf1 = buffer.allocUninitializedFromPool(26);
    const buf2 = buffer.allocUninitializedFromPool(26).fill('!');
    for (let i: int = 0; i < 26; i++) {
      buf1.writeInt8(i + 97, i);
    }
    buf1.copy(buf2);
    if (buf2.toString() !== 'abcdefghijklmnopqrstuvwxyz') { throw new Error('copy content mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.copy failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.equals
 ********************/

export function testBufferEquals() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf1 = buffer.from('ABC');
    const buf2 = buffer.from('414243', 'hex');
    if (!buf1.equals(buf2)) { throw new Error('equals mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.equals failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.includes
 ********************/

export function testBufferIncludes() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.from('hello world');
    if (!buf.includes('hello')) { throw new Error('includes true mismatch'); }
    if (buf.includes('be')) { throw new Error('includes false mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.includes failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.indexOf
 ********************/

export function testBufferIndexOf() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.from([101, 102, 103, 104]);
    const value = new Uint8Array([101, 102]);
    const index = buf.indexOf(value, 0);
    if (index !== 0) { throw new Error('indexOf mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.indexOf failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


/* ********************
 * buffer.lastIndexOf
 ********************/

export function testBufferLastIndexOf() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.from('this buffer is a buffer');
    const res = buf.lastIndexOf('buffer');
    if (res !== 17) { throw new Error('lastIndexOf mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.lastIndexOf failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.readBigInt64BE
 ********************/

export function testBufferReadBigInt64BE() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70,
      0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78]);
    const val = buf.readBigInt64BE();
    if (val.toString() !== '7161960797921896816') { throw new Error('readBigInt64BE mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.readBigInt64BE failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.readBigInt64LE
 ********************/

export function testBufferReadBigInt64LE() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.alloc(8);
    const expected = BigInt('0x0102030405060708');
    buf.writeBigInt64LE(expected, 0);
    const actual = buf.readBigInt64LE(0);
    if (actual.toString() !== expected.toString()) { throw new Error('readBigInt64LE mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.readBigInt64LE failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.readBigUInt64BE
 ********************/

export function testBufferReadBigUInt64BE() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70,
      0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78]);
    const val = buf.readBigUInt64BE(0);
    if (val.toString() !== '7161960797921896816') { throw new Error('readBigUInt64BE mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.readBigUInt64BE failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.readBigUInt64LE
 ********************/

export function testBufferReadBigUInt64LE() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70,
      0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78]);
    const val = buf.readBigUInt64LE(0);
    if (val.toString() !== '8100120198111388771') { throw new Error('readBigUInt64LE mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.readBigUInt64LE failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.readDoubleBE
 ********************/

export function testBufferReadDoubleBE() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.alloc(8);
    buf.writeDoubleBE(123.456, 0);
    const val = buf.readDoubleBE();
    if (val !== 123.456) { throw new Error('readDoubleBE mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.readDoubleBE failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.readDoubleLE
 ********************/

export function testBufferReadDoubleLE() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.from([1, 2, 3, 4, 5, 6, 7, 8]);
    const val = buf.readDoubleLE();
    if (val.toString() !== '5.447603722011605e-270') { throw new Error('readDoubleLE mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.readDoubleLE failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.readFloatBE
 ********************/

export function testBufferReadFloatBE() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.alloc(4);
    buf.writeFloatBE(123.456, 0);
    const val = buf.readFloatBE();
    if (val !== 123.45600128173828) { throw new Error('readFloatBE mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.readFloatBE failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.readFloatLE
 ********************/

export function testBufferReadFloatLE() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.alloc(4);
    buf.writeFloatLE(123.456, 0);
    const val = buf.readFloatLE();
    if (val !== 123.45600128173828) { throw new Error('readFloatLE mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.readFloatLE failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.readInt8
 ********************/

export function testBufferReadInt8() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.from([-42, 100]);
    const val: long = buf.readInt8();
    if (val.toString() !== '0') { throw new Error('readInt8 mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.readInt8 failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.readInt16BE
 ********************/

export function testBufferReadInt16BE() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.from([0x12, 0x34]);
    const val: long = buf.readInt16BE();
    if (val.toString() !== '4660') { throw new Error('readInt16BE mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.readInt16BE failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.readInt16LE
 ********************/

export function testBufferReadInt16LE() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.from([0, 5]);
    const val: long = buf.readInt16LE();
    if (val.toString() !== '1280') { throw new Error('readInt16LE mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.readInt16LE failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.readInt32BE
 ********************/

export function testBufferReadInt32BE() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.from([0, 0, 0, 5]);
    const val: long = buf.readInt32BE();
    if (val.toString() !== '5') { throw new Error('readInt32BE mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.readInt32BE failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.readInt32LE
 ********************/

export function testBufferReadInt32LE() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.from([0, 0, 0, 5]);
    const val: long = buf.readInt32LE();
    if (val.toString() !== '83886080') { throw new Error('readInt32LE mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.readInt32LE failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.readUInt8
 ********************/

export function testBufferReadUInt8() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.from([1, -2]);
    const val: long = buf.readUInt8();
    if (val.toString() !== '1') { throw new Error('readUInt8 mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.readUInt8 failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.readUInt16BE
 ********************/

export function testBufferReadUInt16BE() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.from([0x12, 0x34, 0x56]);
    const val: long = buf.readUInt16BE();
    if (val.toString(16) !== '1234') { throw new Error('readUInt16BE mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.readUInt16BE failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.readUInt16LE
 ********************/

export function testBufferReadUInt16LE() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.from([0x12, 0x34, 0x56]);
    const val: long = buf.readUInt16LE();
    if (val.toString(16) !== '3412') { throw new Error('readUInt16LE mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.readUInt16LE failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.readUInt32BE
 ********************/

export function testBufferReadUInt32BE() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.from([0x12, 0x34, 0x56, 0x78]);
    const val: long = buf.readUInt32BE();
    if (val.toString(16) !== '12345678') { throw new Error('readUInt32BE mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.readUInt32BE failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.readUInt32LE
 ********************/

export function testBufferReadUInt32LE() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.from([0x12, 0x34, 0x56, 0x78]);
    const val: long = buf.readUInt32LE();
    if (val.toString(16) !== '78563412') { throw new Error('readUInt32LE mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.readUInt32LE failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.subarray
 ********************/

export function testBufferSubarray() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf1 = buffer.allocUninitializedFromPool(26);
    for (let i: int = 0; i < 26; i++) {
      buf1.writeInt8(i + 97, i);
    }
    const buf2 = buf1.subarray(0, 3);
    const res = buf2.toString('ascii', 0, buf2.length);
    if (res !== 'abc') { throw new Error('subarray mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.subarray failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.toString
 ********************/

export function testBufferToString() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.allocUninitializedFromPool(26);
    for (let i: int = 0; i < 26; i++) {
      buf.writeInt8(i + 97, i);
    }
    const str = buf.toString();
    if (str !== 'abcdefghijklmnopqrstuvwxyz') { throw new Error('toString mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.toString failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.write
 ********************/

export function testBufferWrite() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.alloc(5);
    const len: int = buf.write('abc');
    if (len !== 3) { throw new Error('write mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.write failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.writeBigInt64BE
 ********************/

export function testBufferWriteBigInt64BE() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.allocUninitializedFromPool(8);
    const res: int = buf.writeBigInt64BE(BigInt(0x1234567890abcdef), 0);
    if (res !== 8) { throw new Error('writeBigInt64BE mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.writeBigInt64BE failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.writeBigInt64LE
 ********************/

export function testBufferWriteBigInt64LE() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.allocUninitializedFromPool(8);
    const res: int = buf.writeBigInt64LE(BigInt(0x0102030405060708), 0);
    if (res !== 8) { throw new Error('writeBigInt64LE mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.writeBigInt64LE failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.writeBigUInt64BE
 ********************/

export function testBufferWriteBigUInt64BE() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.allocUninitializedFromPool(8);
    const res: int = buf.writeBigUInt64BE(BigInt(0x0304), 0);
    if (res !== 8) { throw new Error('writeBigUInt64BE mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.writeBigUInt64BE failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.writeBigUInt64LE
 ********************/

export function testBufferWriteBigUInt64LE() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.allocUninitializedFromPool(8);
    const res: int = buf.writeBigUInt64LE(BigInt(0x0304), 0);
    if (res !== 8) { throw new Error('writeBigUInt64LE mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.writeBigUInt64LE failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.writeDoubleBE
 ********************/

export function testBufferWriteDoubleBE() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.allocUninitializedFromPool(8);
    const res = buf.writeDoubleBE(123.456, 0);
    if (res !== 8) { throw new Error('writeDoubleBE mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.writeDoubleBE failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.writeDoubleLE
 ********************/

export function testBufferWriteDoubleLE() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.allocUninitializedFromPool(8);
    const res = buf.writeDoubleLE(123.456, 0);
    if (res !== 8) { throw new Error('writeDoubleLE mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.writeDoubleLE failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.writeFloatBE
 ********************/

export function testBufferWriteFloatBE() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.alloc(5);
    const res = buf.writeFloatBE(123.456, 0);
    if (res !== 4) { throw new Error('writeFloatBE mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.writeFloatBE failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ********************
 * buffer.writeFloatLE
 ********************/

export function testBufferWriteFloatLE() {
  const TAG = 'BufferConcurrentTest';
  try {
    const buf = buffer.alloc(5);
    const res = buf.writeFloatLE(123.456, 0);
    if (res !== 4) { throw new Error('writeFloatLE mismatch'); }
  } catch (err) {
    console.error(`${TAG} buffer.writeFloatLE failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ---------------------  writeInt8  --------------------- */

export function testWriteInt8() {
  const TAG = 'BufferWriteConcurrent';
  const caseName = 'testBufferWriteInt80002';
  try {
    console.log(`${caseName} test start`);
    const buf = buffer.alloc(5);
    const len: int = buf.writeInt8(-2, 0);
    if (len !== 1) {
      throw new Error(`writeInt8 returned ${len}, expected 1`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ---------------------  writeInt16BE  --------------------- */

export function testWriteInt16BE() {
  const TAG = 'BufferWriteConcurrent';
  const caseName = 'testBufferWriteInt16BE0001';
  try {
    console.log(`${caseName} test start`);
    const buf = buffer.alloc(5);
    const len: int = buf.writeInt16BE(0x0304, 0);
    if (len !== 2) {
      throw new Error(`writeInt16BE returned ${len}, expected 2`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ---------------------  writeInt16LE  --------------------- */

export function testWriteInt16LE() {
  const TAG = 'BufferWriteConcurrent';
  const caseName = 'testBufferWriteInt16LE0001';
  try {
    console.log(`${caseName} test start`);
    const buf = buffer.alloc(5);
    const len: int = buf.writeInt16LE(0x0304, 0);
    if (len !== 2) {
      throw new Error(`writeInt16LE returned ${len}, expected 2`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ---------------------  writeInt32BE  --------------------- */

export function testWriteInt32BE() {
  const TAG = 'BufferWriteConcurrent';
  const caseName = 'testBufferWriteInt32BE0001';
  try {
    console.log(`${caseName} test start`);
    const buf = buffer.allocUninitializedFromPool(4);
    const len: int = buf.writeInt32BE(0x01020304, 0);
    if (len !== 4) {
      throw new Error(`writeInt32BE returned ${len}, expected 4`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ---------------------  writeInt32LE  --------------------- */

export function testWriteInt32LE() {
  const TAG = 'BufferWriteConcurrent';
  const caseName = 'testBufferWriteInt32LE0001';
  try {
    console.log(`${caseName} test start`);
    const buf = buffer.allocUninitializedFromPool(4);
    const len: int = buf.writeInt32LE(0x0304, 0);
    if (len !== 4) {
      throw new Error(`writeInt32LE returned ${len}, expected 4`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ---------------------  writeUInt8  --------------------- */

export function testWriteUInt8() {
  const TAG = 'BufferWriteConcurrent';
  const caseName = 'testBufferWriteUInt80001';
  try {
    console.log(`${caseName} test start`);
    const buf = buffer.allocUninitializedFromPool(4);
    const len: int = buf.writeUInt8(0x3, 0);
    if (len !== 1) {
      throw new Error(`writeUInt8 returned ${len}, expected 1`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ---------------------  writeUInt16BE  --------------------- */

export function testWriteUInt16BE() {
  const TAG = 'BufferWriteConcurrent';
  const caseName = 'testBufferWriteUInt16BE0001';
  try {
    console.log(`${caseName} test start`);
    const buf = buffer.allocUninitializedFromPool(4);
    const len: int = buf.writeUInt16BE(0xdead, 0);
    if (len !== 2) {
      throw new Error(`writeUInt16BE returned ${len}, expected 2`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ---------------------  writeUInt16LE  --------------------- */

export function testWriteUInt16LE() {
  const TAG = 'BufferWriteConcurrent';
  const caseName = 'testBufferWriteUInt16LE0001';
  try {
    console.log(`${caseName} test start`);
    const buf = buffer.allocUninitializedFromPool(4);
    const len: int = buf.writeUInt16LE(0x0304, 0);
    if (len !== 2) {
      throw new Error(`writeUInt16LE returned ${len}, expected 2`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ---------------------  writeUInt32BE  --------------------- */

export function testWriteUInt32BE() {
  const TAG = 'BufferWriteConcurrent';
  const caseName = 'testBufferWriteUInt32BE0001';
  try {
    console.log(`${caseName} test start`);
    const buf = buffer.allocUninitializedFromPool(4);
    const len: int = buf.writeUInt32BE(0x0304, 0);
    if (len !== 4) {
      throw new Error(`writeUInt32BE returned ${len}, expected 4`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ---------------------  writeUInt32LE  --------------------- */

export function testWriteUInt32LE() {
  const TAG = 'BufferWriteConcurrent';
  const caseName = 'testBufferWriteUInt32LE0001';
  try {
    console.log(`${caseName} test start`);
    const buf = buffer.allocUninitializedFromPool(4);
    const len: int = buf.writeUInt32LE(0x0304, 0);
    if (len !== 4) {
      throw new Error(`writeUInt32LE returned ${len}, expected 4`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}