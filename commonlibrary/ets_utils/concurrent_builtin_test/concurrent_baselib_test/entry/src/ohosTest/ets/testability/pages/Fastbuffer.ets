import buffer from '@ohos.fastbuffer';

/* ---------------------  alloc --------------------- */
@Concurrent
export function testBufferAllocEmoji() {
  const TAG = 'testBufferAllocEmoji0001';
  try {
    console.log(`${TAG} test start`);
    const emoji = '\ud83d\ude0a';
    const buf1 = buffer.alloc(4, emoji, 'utf8');
    const buf2 = buffer.alloc(8, emoji, 'utf8');
    const buf3 = buffer.alloc(12, emoji, 'utf8');
    if (buf1.toString('utf-8') !== '😊') {
      throw new Error(`buf1 mismatch`);
    }
    if (buf2.toString('utf-8') !== '😊😊') {
      throw new Error(`buf2 mismatch`);
    }
    if (buf3.toString('utf-8') !== '😊😊😊') {
      throw new Error(`buf3 mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ---------------------  byteLength --------------------- */
@Concurrent
export function testBufferByteLengthEmoji() {
  const TAG = 'testBufferByteLength0001';
  try {
    console.log(`${TAG} test start`);
    const emoji = '\ud83d\ude0a';
    const num = buffer.byteLength(emoji);
    if (num !== 4) {
      throw new Error(`byteLength returned ${num}, expected 4`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ---------------------  isEncoding --------------------- */
@Concurrent
export function testBufferIsEncodingEmoji() {
  const TAG = 'testBufferIsEncoding0001';
  try {
    console.log(`${TAG} test start`);
    const emoji = '\ud83d\ude0a';
    const flag = buffer.isEncoding(emoji);
    if (flag !== false) {
      throw new Error(`isEncoding returned ${flag}, expected false`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ---------------------  fill --------------------- */
@Concurrent
export function testBufferFillEmoji() {
  const TAG = 'testfillEmoji_0001';
  try {
    console.log(`${TAG} test start`);
    const emoji = '\ud83d\ude0a';
    const result1 = buffer.allocUninitializedFromPool(6).fill(emoji);
    const result2 = buffer.allocUninitializedFromPool(10).fill(emoji);
    const result3 = buffer.allocUninitializedFromPool(14).fill(emoji);
    if (result1.toString() !== '😊ð') {
      throw new Error(`result1 mismatch`);
    }
    if (result2.toString() !== '😊😊ð') {
      throw new Error(`result2 mismatch`);
    }
    if (result3.toString() !== '😊😊😊ð') {
      throw new Error(`result3 mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ---------------------  includes --------------------- */
@Concurrent
export function testBufferIncludesEmoji() {
  const TAG = 'testincludesEmoji_0001';
  try {
    console.log(`${TAG} test start`);
    const emoji = '\ud83d\ude0a';
    const buf = buffer.from(emoji);
    const result = buf.includes(buf);
    if (result.toString() !== 'true') {
      throw new Error(`includes returned ${result}, expected true`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ---------------------  toJSON --------------------- */
@Concurrent
export function testBufferToJSONEmoji() {
  const TAG = 'testBuffertoJSONEmoji0001';
  try {
    console.log(`${TAG} test start`);
    const buf1 = buffer.from([0xF0, 0x9F, 0x98, 0x8A]);
    const obj = buf1.toJSON();
    if (JSON.stringify(obj) !== '{"type":"FastBuffer","data":[240,159,152,138]}') {
      throw new Error(`toJSON mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ---------------------  toString --------------------- */
@Concurrent
export function testBufferToStringEmoji() {
  const TAG = 'testBuffertoStringEmoji0001';
  try {
    console.log(`${TAG} test start`);
    const emoji = '\ud83d\ude0a';
    const buf1 = buffer.from(emoji, 'utf-8');
    if (buf1.toString('utf-8') !== '😊') {
      throw new Error(`toString mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ---------------------  write --------------------- */
@Concurrent
export function testBufferWriteEmoji() {
  const TAG = 'testBufferwriteEmoji0001';
  try {
    console.log(`${TAG} test start`);
    const buf = buffer.alloc(256);
    const emoji = '\ud83d\ude0a';
    const length1 = buf.write('😊', 0);
    if (length1 !== 4) {
      throw new Error(`write returned ${length1}, expected 4`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ---------------------  alloc --------------------- */
@Concurrent
export function testBufferAllocEscape() {
  const TAG = 'testBufferAllocEscape0001';
  try {
    console.log(`${TAG} test start`);
    const escape = 'aaa\b';
    const buf1 = buffer.alloc(4, escape, 'utf8');
    if (buf1.toString('utf-8') !== escape) {
      throw new Error(`alloc mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ---------------------  byteLength --------------------- */
@Concurrent
export function testBufferByteLengthEscape() {
  const TAG = 'testBufferbyteLengthEscape0001';
  try {
    console.log(`${TAG} test start`);
    const escape = 'aaa\b';
    const len = buffer.byteLength(escape, 'utf8');
    if (len !== 4) {
      throw new Error(`byteLength returned ${len}, expected 4`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ---------------------  compare --------------------- */
@Concurrent
export function testBufferCompareEscape() {
  const TAG = 'testBufferCompareEscape0001';
  try {
    console.log(`${TAG} test start`);
    const escape = 'aaa\b';
    const escape1 = 'aa';
    const buf1 = buffer.from(escape, 'utf8');
    const buf2 = buffer.from(escape1, 'utf8');
    const res = buf1.compare(buf2);
    if (res !== 1) {
      throw new Error(`compare returned ${res}, expected 1`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ---------------------  from --------------------- */
@Concurrent
export function testBufferFromEscape() {
  const TAG = 'testBufferFromEscape0001';
  try {
    console.log(`${TAG} test start`);
    const escape = 'aaa\b';
    const buf1 = buffer.from(escape, 'utf8');
    if (buf1.toString('utf-8') !== escape) {
      throw new Error(`from mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ---------------------  isEncoding --------------------- */
@Concurrent
export function testBufferIsEncodingEscape() {
  const TAG = 'testBufferIsEncodingEscape0001';
  try {
    console.log(`${TAG} test start`);
    const escape = 'aaa\b';
    const flag = buffer.isEncoding(escape);
    if (flag !== false) {
      throw new Error(`isEncoding returned ${flag}, expected false`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ---------------------  fill --------------------- */
@Concurrent
export function testBufferFillEscape() {
  const TAG = 'testfillEscape0001';
  try {
    console.log(`${TAG} test start`);
    const escape = 'aaa\b';
    const result1 = buffer.allocUninitializedFromPool(4).fill(escape);
    if (result1.toString('utf-8') !== escape) {
      throw new Error(`fill mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ---------------------  includes --------------------- */
@Concurrent
export function testBufferIncludesEscape() {
  const TAG = 'testincludesEscape0001';
  try {
    console.log(`${TAG} test start`);
    const escape = 'aaa\b';
    const buf = buffer.from(escape);
    const result = buf.includes(buf);
    if (result.toString() !== 'true') {
      throw new Error(`includes returned ${result}, expected true`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ---------------------  toString --------------------- */
@Concurrent
export function testBufferToStringEscape() {
  const TAG = 'testBuffertoStringEscape0001';
  try {
    console.log(`${TAG} test start`);
    const buf1 = buffer.from([0x08]);
    if (buf1.toString('utf-8') !== '\b') {
      throw new Error(`toString mismatch`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

/* ---------------------  write --------------------- */
@Concurrent
export function testBufferWriteEscape() {
  const TAG = 'testBufferwriteESCAPE0001';
  try {
    console.log(`${TAG} test start`);
    const escape = 'aaa\b';
    const buf = buffer.alloc(256);
    const length1 = buf.write(escape, 0);
    if (length1 !== 4) {
      throw new Error(`write returned ${length1}, expected 4`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}


@Concurrent
export function testWriteUInt16LE() {
  const caseName = 'testWriteUInt16LE0005';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUInt16LE(undefined);
  } catch (err) {
    if (err.code !== 401) {
      throw new Error(`${caseName} err.code !== 401`);
    }
    console.log(`${caseName} test end`);
  }
}

@Concurrent
export function testWriteUInt32BE() {
  const caseName = 'testWriteUInt32BE001';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUInt32BE(0xfeedface, 0);
    if (ref !== 4){
      throw new Error(`${caseName} ref !== 4`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testWriteUInt32LE() {
  const caseName = 'testWriteUInt32LE0001';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUInt32LE(0xfeedface, 0);
    if (ref !== 4) {
      throw new Error(`${caseName} ref !== 4`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testWriteUIntBE() {
  const caseName = 'testWriteUIntBE0001';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUIntBE(0x13141516, 0, 4);
    if (ref !== 4) {
      throw new Error(`${caseName} ref !== 4`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testWriteUIntLE() {
  const caseName = 'testWriteUIntLE0001';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.allocUninitializedFromPool(4);
    let ref = buf.writeUIntLE(0x13141516, 0, 4);
    if (ref !== 4) {
      throw new Error(`${caseName} ref !== 4`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testReadBigInt64BE() {
  const caseName = 'testReadBigInt64BE0001';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.allocUninitializedFromPool(8);
    buf.writeBigInt64BE(0x0102030405060708n, 0);
    let ref = buf.readBigInt64BE(0).toString(16);
    if (ref !== '102030405060708') {
      throw new Error(`${caseName} ref mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testReadBigInt64LE() {
  const caseName = 'testReadBigInt64LE0001';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.allocUninitializedFromPool(8);
    buf.writeBigInt64BE(0x0102030405060708n, 0);
    let ref = buf.readBigInt64LE(0).toString(16);
    if (ref !== '807060504030201') {
      throw new Error(`${caseName} ref mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testReadBigUInt64BE() {
  const caseName = 'testReadBigUInt64BE0001';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.allocUninitializedFromPool(8);
    buf.writeBigUInt64BE(0xdecafafecacefaden, 0);
    let ref = buf.readBigUInt64BE(0).toString(16);
    if (ref !== 'decafafecacefade') {
      throw new Error(`${caseName} ref mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testReadBigUInt64LE() {
  const caseName = 'testReadBigUInt64LE0001';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.allocUninitializedFromPool(8);
    buf.writeBigUInt64LE(0xdecafafecacefaden, 0);
    let ref = buf.readBigUInt64LE(0).toString(16);
    if (ref !== 'decafafecacefade') {
      throw new Error(`${caseName} ref mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testReadDoubleBE() {
  const caseName = 'testReadDoubleBE0001';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.allocUninitializedFromPool(8);
    buf.writeDoubleBE(123.456, 0);
    let ref = buf.readDoubleBE();
    if (ref !== 123.456) {
      throw new Error(`${caseName} ref !== 123.456`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testReadDoubleLE() {
  const caseName = 'testReadDoubleLE0001';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.allocUninitializedFromPool(8);
    buf.writeDoubleLE(123.456, 0);
    let ref = buf.readDoubleLE();
    if (ref !== 123.456) {
      throw new Error(`${caseName} ref !== 123.456`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testReadFloatBE() {
  const caseName = 'testReadFloatBE0001';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeFloatBE(0xcabcbcbc, 0);
    let ref = buf.readFloatBE(0).toString(16);
    if (ref !== 'cabcbd00') {
      throw new Error(`${caseName} ref mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testReadFloatLE() {
  const caseName = 'testReadFloatLE0001';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeFloatLE(0xcabcbcbc, 0);
    let ref = buf.readFloatLE(0).toString(16);
    if (ref !== 'cabcbd00') {
      throw new Error(`${caseName} ref mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testReadInt8() {
  const caseName = 'testReadInt80001';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.allocUninitializedFromPool(2);
    buf.writeInt8(0x12);
    let ref = buf.readInt8(0).toString(16);
    if (ref !== '12') {
      throw new Error(`${caseName} ref mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testReadInt16BE() {
  const caseName = 'testReadInt16BE0001';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.alloc(2);
    buf.writeInt16BE(0x1234, 0);
    let ref = buf.readInt16BE(0).toString(16);
    if (ref !== '1234') {
      throw new Error(`${caseName} ref mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testReadInt16LE() {
  const caseName = 'testReadInt16LE0001';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.alloc(2);
    buf.writeInt16LE(0x1234, 0);
    let ref = buf.readInt16LE(0).toString(16);
    if (ref !== '1234') {
      throw new Error(`${caseName} ref mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testReadInt32BE() {
  const caseName = 'testReadInt32BE0001';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.alloc(4);
    buf.writeInt32BE(0x12345678, 0);
    let ref = buf.readInt32BE(0).toString(16);
    if (ref !== '12345678') {
      throw new Error(`${caseName} ref mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testReadInt32LE() {
  const caseName = 'testReadInt32LE0001';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.alloc(4);
    buf.writeInt32LE(0x12345678, 0);
    let ref = buf.readInt32LE(0).toString(16);
    if (ref !== '12345678') {
      throw new Error(`${caseName} ref mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testReadIntBE() {
  const caseName = 'testReadIntBE0001';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.allocUninitializedFromPool(6);
    buf.writeIntBE(0x123456789011, 0, 6);
    let ref = buf.readIntBE(0, 5).toString(16);
    if (ref !== '1234567890') {
      throw new Error(`${caseName} ref mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testReadIntLE() {
  const caseName = 'testReadIntLE0001';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.allocUninitializedFromPool(6);
    buf.writeIntLE(0x123456789011, 0, 6);
    let ref = buf.readIntLE(0, 5).toString(16);
    if (ref !== '3456789011') {
      throw new Error(`${caseName} ref mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testReadUInt8() {
  const caseName = 'testReadUInt80001';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUInt8(0x42);
    let ref = buf.readUInt8(0).toString(16);
    if (ref !== '42'){
      throw new Error(`${caseName} ref mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testReadUInt16BE() {
  const caseName = 'testReadUInt16BE0001';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUInt16BE(0x1234, 0);
    let ref = buf.readUInt16BE(0).toString(16);
    if (ref !== '1234') {
      throw new Error(`${caseName} ref mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testEquals() {
  const caseName = 'testEquals0002';
  try {
    console.log(`${caseName} test start`);
    let buf1 = buffer.from('1236测试');
    let buf2 = buffer.from('1236测试');
    let res = buf1.equals(buf2);
    if (res !== true) {
      throw new Error(`${caseName} res !== true`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testSubarray() {
  const caseName = 'testSubarray0001';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from('1236');
    let subBuf = buf.subarray(0, 3);
    let str = subBuf.toString();
    if (str !== '123') {
      throw new Error(`${caseName} str mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testCopy() {
  const caseName = 'testCopy0001';
  try {
    console.log(`${caseName} test start`);
    let buf1 = buffer.from('1236');
    let buf2 = buffer.from('1235');
    let num = buf1.copy(buf2);
    if (num !== 4) {
      throw new Error(`${caseName} num !== 4`);
    }
    let str = buf2.toString();
    if (str !== '1236') {
      throw new Error(`${caseName} str mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testToString() {
  const caseName = 'testToString0001';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from('1236');
    let str = buf.toString();
    if (str !== '1236') {
      throw new Error(`${caseName} str mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testToJSON() {
  const caseName = 'testToJSON0001';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from('1236');
    let obj = buf.toJSON();
    if (JSON.parse(JSON.stringify(obj)).data.join('') !== '49505154') {
      throw new Error(`${caseName} obj mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testIndexOf() {
  const caseName = 'testIndexOf0001';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from('13236');
    let index = buf.indexOf('3');
    if (index !== 1){
      throw new Error(`${caseName} index !== 1`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testLastIndexOf() {
  const caseName = 'testLastIndexOf0001';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from('13236');
    let index = buf.lastIndexOf('3');
    if (index !== 3) {
      throw new Error(`${caseName} index !== 3`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    throw new Error(`${caseName} catch error.`);
  }
}


@Concurrent
export function testLastIndexOfNull() {
  const caseName = 'testLastIndexOf0010';
  const TAG = caseName;
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from('123 ');
    try {
      buf.lastIndexOf(null);
      throw new Error(`${TAG} should throw`);
    } catch (err) {
      if (err.code !== 401) {
        throw new Error(`${TAG} err.code !== 401`);
      }
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

@Concurrent
export function testLastIndexOfBigOffset() {
  const caseName = 'testLastIndexOf0013';
  const TAG = caseName;
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from('13236235');
    let index = buf.lastIndexOf('23', 9999999);
    if (index !== 5) {
      throw new Error(`${TAG} index !== 5`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

@Concurrent
export function testIncludesNormal() {
  const caseName = 'testIncludes0001';
  const TAG = caseName;
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from('13236');
    let flag = buf.includes('3');
    if (flag !== true) {
      throw new Error(`${TAG} flag !== true`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

@Concurrent
export function testSwap16Normal() {
  const caseName = 'testSwap160001';
  const TAG = caseName;
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from('');
    buf.swap16();
    let str = buf.toString();
    if (str !== '') {
      console.info('=========testSwap16Normal',str)
      throw new Error(`${TAG} str mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

@Concurrent
export function testSwap32Normal() {
  const caseName = 'testSwap320001';
  const TAG = caseName;
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from('');
    buf.swap32();
    let str = buf.toString();
    if (str !== '') {
      throw new Error(`${TAG} str mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

@Concurrent
export function testSwap64Normal() {
  const caseName = 'testSwap640001';
  const TAG = caseName;
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from('');
    buf.swap64();
    let str = buf.toString();
    if (str !== '') {
      throw new Error(`${TAG} str mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

@Concurrent
export function testKeysNormal() {
  const caseName = 'testKeys0001';
  const TAG = caseName;
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from('1234');
    let keys = buf.keys();
    let index = 0;
    for (const key of keys) {
      if (key !== index) {
        throw new Error(`${TAG} key !== index`);
      }
      index++;
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

@Concurrent
export function testValuesNormal() {
  const caseName = 'testValues0001';
  const TAG = caseName;
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from('1234');
    let values = buf.values();
    let va = 49;
    for (const value of values) {
      if (value !== va) {
        throw new Error(`${TAG} value !== va`);
      }
      va++;
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

@Concurrent
export function testEntriesNormal() {
  const caseName = 'testEntries0001';
  const TAG = caseName;
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from('1234');
    let entries = buf.entries();
    let va :number= 49;
    let index :number= 0;
    for (const entry of entries) {
      if (entry[0] !== index){
        throw new Error(`${TAG} entry[0] !== index`);
      }
      if (entry[1] !== va){
        throw new Error(`${TAG} entry[1] !== va`);
      }
      va++;
      index++;
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

@Concurrent
export function testFromUint8Array() {
  const caseName = 'testFrom0001';
  const TAG = caseName;
  try {
    console.log(`${caseName} test start`);
    let uArr = new Uint8Array(3);
    uArr[0] = 0x12;
    uArr[1] = 0x34;
    uArr[2] = 0x56;
    let buf = buffer.from(uArr);
    let str = buf.toString('hex');
    if (str !== '123456') {
      throw new Error(`${TAG} str mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

@Concurrent
export function testBufferLength() {
  const caseName = 'testBlobLength0001';
  const TAG = caseName;
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from('1236');
    let len = buf.length;
    if (len !== 4){
      throw new Error(`${TAG} len !== 4`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

@Concurrent
export function testBufferByteOffset() {
  const caseName = 'testBlobByteOffset0001';
  const TAG = caseName;
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from('1236');
    let offset = buf.byteOffset;
    if (offset < 0) {
      throw new Error(`${TAG} offset < 0`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

@Concurrent
export function testReadUInt16LE() {
  const caseName = 'testReadUInt16LE0001';
  const TAG = caseName;
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUInt16LE(0x1234, 0);
    let ref = buf.readUInt16LE(0).toString(16);
    if (ref !== '1234'){
      throw new Error(`${TAG} ref mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

@Concurrent
export function testReadUInt32BE() {
  const caseName = 'testReadUInt32BE0001';
  const TAG = caseName;
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUInt32BE(0x12345678, 0);
    let ref = buf.readUInt32BE(0).toString(16);
    if (ref !== '12345678') {
      throw new Error(`${TAG} ref mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

@Concurrent
export function testReadUInt32LE() {
  const caseName = 'testReadUInt32LE0001';
  const TAG = caseName;
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUInt32LE(0x12345678, 0);
    let ref = buf.readUInt32LE(0).toString(16);
    if (ref !== '12345678') {
      throw new Error(`${TAG} ref mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

@Concurrent
export function testReadUIntBE() {
  const caseName = 'testReadUIntBE0001';
  const TAG = caseName;
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUIntBE(0x13141516, 0, 4);
    let ref = buf.readUIntBE(0, 3).toString(16);
    if (ref !== '131415'){
      throw new Error(`${TAG} ref mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

@Concurrent
export function testReadUIntLE() {
  const caseName = 'testReadUIntLE0001';
  const TAG = caseName;
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.allocUninitializedFromPool(4);
    buf.writeUIntLE(0x13141516, 0, 4);
    let ref = buf.readUIntLE(0, 3).toString(16);
    if (ref !== '141516') {
      throw new Error(`${TAG} ref mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

@Concurrent
export function testBufferCompare() {
  const caseName = 'testBufferCompare0001';
  const TAG = caseName;
  try {
    console.log(`${caseName} test start`);
    let buf1 = buffer.from([1, 2, 3, 4, 5, 6, 7, 8]);
    let buf2 = buffer.from([8, 7, 6, 5, 4, 3, 2, 1]);
    let result = buf1.compare(buf2);
    if (result !== -1) {
      throw new Error(`${TAG} result !== -1`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}





@Concurrent
export function testToStringUtf8() {
  const caseName = 'testToString0018';
  const TAG = caseName;
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from([1, 2, 3, 4]);
    let ref = buf.toString('utf8');
    if (encodeURI(ref) !== '%01%02%03%04'){
      throw new Error(`${TAG} encodeURI mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

@Concurrent
export function testToStringDefault() {
  const caseName = 'testToString0021';
  const TAG = caseName;
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from([1, 2, 3, 4]);
    let ref = buf.toString();
    if (encodeURI(ref) !== '%01%02%03%04') {
      throw new Error(`${TAG} encodeURI mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

@Concurrent
export function testWriteNormal() {
  const caseName = 'testWrite0001';
  const TAG = caseName;
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.alloc(256);
    let len = buf.write('\u00bd + \u00bc = \u00be', 0);
    if (encodeURI(len.toString()) !== '12') {
      throw new Error(`${TAG} encodeURI len mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}