import fastbuffer from '@ohos.fastbuffer';
import { buffer } from '@kit.ArkTS';

@Concurrent
export function testBufferAllocZeroWithZero() {
  const caseName = 'BufferAllocZeroWithZero';
  try {
    console.log(`${caseName} test start`);
    let buf4 = buffer.alloc(0, 0);
    const result = buf4.toString();
    console.log(`${caseName} result${result}`);
    if (buf4.length !== 0) {
      throw new Error(`${caseName} length mismatch`);
    }
    if (buf4.toString() !== '') {
      throw new Error(`${caseName} empty string mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


@Concurrent
export function testBufferByteLengthBuf() {
  const caseName = 'BufferByteLengthBuf';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from([0x62, 0x75, 0x66, 0x66, 0x65, 0x72]);
    const res = buffer.byteLength(buf);
    if (res !== 6) {
      throw new Error(`${caseName} byteLength mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


@Concurrent
export function testBufferConcatTwoBuf() {
  const caseName = 'BufferConcatTwoBuf';
  try {
    console.log(`${caseName} test start`);
    let buf1 = buffer.from('1234');
    let buf2 = buffer.from('abcd');
    let buf = buffer.concat([buf1, buf2]);
    if (buf.length !== 8) {
      throw new Error(`${caseName} length mismatch`);
    }
    if (buf.toString('utf8') !== '1234abcd') {
      throw new Error(`${caseName} content mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


@Concurrent
export function testBufferFromArrayBuffer() {
  const caseName = 'BufferFromArrayBuffer';
  try {
    console.log(`${caseName} test start`);
    const ab1 = new ArrayBuffer(8);
    const buf1 = buffer.from(ab1);
    if (buf1.length !== 8) {
      throw new Error(`${caseName} length mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testBufferFromSharedArrayBuffer() {
  const caseName = 'BufferFromSharedArrayBuffer';
  try {
    console.log(`${caseName} test start`);
    const ab2 = new SharedArrayBuffer(8);
    const buf2 = buffer.from(ab2);
    if (buf2.length !== 8) {
      throw new Error(`${caseName} length mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


@Concurrent
export function testBufferCompare() {
  const caseName = 'BufferCompare';
  try {
    console.log(`${caseName} test start`);
    let buf1 = buffer.from('1234');
    let buf2 = buffer.from('0123');
    let res = buf1.compare(buf2);
    if (res !== 1) {
      throw new Error(`${caseName} compare mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testBufferTranscodeSame() {
  const caseName = 'BufferTranscodeSame';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from('€')
    let newBuf = buffer.transcode(buf, 'base64', 'base64');
    if (newBuf.toString() !== '€') {
      throw new Error(`${caseName} content mismatch`);
    }
    if (newBuf.length !== 3) {
      throw new Error(`${caseName} length mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testBufferFillNumber() {
  const caseName = 'BufferFillNumber';
  try {
    console.log(`${caseName} test start`);
    const buf = buffer.allocUninitializedFromPool(5);
    buf.fill(0x41);
    const result = buf.toString('utf-8');
    if (result !== 'AAAAA') {
      throw new Error(`${caseName} fill mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


@Concurrent
export function testBufferIndexOfUint8Array() {
  const caseName = 'BufferIndexOfUint8Array';
  try {
    console.log(`${caseName} test start`);
    const buf = buffer.from([101, 102, 103, 104]);
    const value = new Uint8Array([101, 102]);
    const index = buf.indexOf(value, 1, 'utf-8');
    if (index !== -1) {
      throw new Error(`${caseName} index mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testBufferLastIndexOfString() {
  const caseName = 'BufferLastIndexOfString';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from('this buffer is a buffer');
    const idx = buf.lastIndexOf('buffer');
    if (idx !== 17) {
      throw new Error(`${caseName} lastIndex mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testBufferReadBigInt64BE() {
  const caseName = 'BufferReadBigInt64BE';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70,
      0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78]);
    const val = buf.readBigInt64BE().toString();
    if (val !== '7161960797921896816') {
      throw new Error(`${caseName} value mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testBufferReadBigInt64LE() {
  const caseName = 'BufferReadBigInt64LE';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.alloc(8);
    const expected = BigInt(0x0102030405060708);
    buf.writeBigInt64LE(expected, 0);
    const actual = buf.readBigInt64LE(0);
    if (actual.toString() !== expected.toString()) {
      throw new Error(`${caseName} value mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testBufferReadBigUInt64BE() {
  const caseName = 'BufferReadBigUInt64BE';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from([0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x70,
      0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78]);
    const val = buf.readBigUInt64BE(0).toString();
    if (val !== '7161960797921896816') {
      throw new Error(`${caseName} value mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testBufferReadBigUInt64LE() {
  const caseName = 'BufferReadBigUInt64LE';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.alloc(8);
    const expected = BigInt('8100120198111388771');
    buf.writeBigUInt64LE(expected, 0);
    const actual = buf.readBigUInt64LE(0);
    if (actual.toString() !== expected.toString()) {
      throw new Error(`${caseName} value mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testBufferReadDoubleBE() {
  const caseName = 'BufferReadDoubleBE';
  try {
    console.log(`${caseName} test start`);
    const buf = buffer.alloc(8);
    buf.writeDoubleBE(123.456, 0);
    const result = buf.readDoubleBE();
    if (result !== 123.456) {
      throw new Error(`${caseName} value mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testBufferReadDoubleLE() {
  const caseName = 'BufferReadDoubleLE';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from([1, 2, 3, 4, 5, 6, 7, 8]);
    const val = buf.readDoubleLE().toString();
    if (val !== '5.447603722011605e-270') {
      throw new Error(`${caseName} value mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testBufferReadFloatBE() {
  const caseName = 'BufferReadFloatBE';
  try {
    console.log(`${caseName} test start`);
    const buf = buffer.alloc(8);
    buf.writeFloatBE(123.456, 0);
    const result = buf.readFloatBE();
    if (result !== 123.45600128173828) {
      throw new Error(`${caseName} value mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testBufferReadFloatLE() {
  const caseName = 'BufferReadFloatLE';
  try {
    console.log(`${caseName} test start`);
    const buf = buffer.alloc(8);
    buf.writeFloatLE(123.456, 0);
    const result = buf.readFloatLE();
    if (result !== 123.45600128173828) {
      throw new Error(`${caseName} value mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testBufferReadInt8() {
  const caseName = 'BufferReadInt8';
  try {
    console.log(`${caseName} test start`);
    let buf = fastbuffer.from([-1, 5]);
    let ref1 = buf.readInt8(0).toString();
    let ref2 = buf.readInt8(1).toString();
    if (ref1 !== '-1' || ref2 !== '5') {
      throw new Error(`${caseName} value mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testBufferReadInt16BE() {
  const caseName = 'BufferReadInt16BE';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from([0x12, 0x34]);
    const val = buf.readInt16BE().toString();
    if (val !== '4660') {
      throw new Error(`${caseName} value mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testBufferReadInt16LE() {
  const caseName = 'BufferReadInt16LE';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from([0, 5]);
    const val = buf.readInt16LE().toString();
    if (val !== '1280') {
      throw new Error(`${caseName} value mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testBufferReadInt32BE() {
  const caseName = 'BufferReadInt32BE';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from([0, 0, 0, 5]);
    const val = buf.readInt32BE().toString();
    if (val !== '5') {
      throw new Error(`${caseName} value mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testBufferReadInt32LE() {
  const caseName = 'BufferReadInt32LE';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from([0, 0, 0, 5]);
    const val = buf.readInt32LE().toString();
    if (val !== '83886080') {
      throw new Error(`${caseName} value mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testBufferReadUInt8() {
  const caseName = 'BufferReadUInt8';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from([1, -2]);
    const val = buf.readUInt8().toString();
    if (val !== '1') {
      throw new Error(`${caseName} value mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testBufferReadUInt16BE() {
  const caseName = 'BufferReadUInt16BE';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from([0x12, 0x34, 0x56]);
    const val = buf.readUInt16BE().toString(16);
    if (val !== '1234') {
      throw new Error(`${caseName} value mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testBufferReadUInt16LE() {
  const caseName = 'BufferReadUInt16LE';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from([0x12, 0x34, 0x56]);
    const val = buf.readUInt16LE().toString(16);
    if (val !== '3412') {
      throw new Error(`${caseName} value mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testBufferReadUInt32BE() {
  const caseName = 'BufferReadUInt32BE';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from([0x12, 0x34, 0x56, 0x78]);
    const val = buf.readUInt32BE().toString(16);
    if (val !== '12345678') {
      throw new Error(`${caseName} value mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}

@Concurrent
export function testBufferReadUInt32LE() {
  const caseName = 'BufferReadUInt32LE';
  try {
    console.log(`${caseName} test start`);
    let buf = buffer.from([0x12, 0x34, 0x56, 0x78]);
    const val = buf.readUInt32LE().toString(16);
    if (val !== '78563412') {
      throw new Error(`${caseName} value mismatch`);
    }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} failed: ${err.message}`);
    throw new Error(`${caseName} catch error.`);
  }
}


@Concurrent
export function testWrite() {
  const caseName = 'testFastBufferWrite0026';
  try {
    try {
      const buf = buffer.alloc(10);
      const res = buf.write('abc', -Infinity, -Infinity, 'utf8');
    } catch (err) {
      if (err.code !== 10200001) {
        throw new Error(`${caseName} code mismatch`);
      }
    }
  } catch (err) {
    throw new Error(`${caseName} message mismatch`);
  }
}

/* ====================  writeBigInt64BE  ==================== */
@Concurrent
export function testWriteBigInt64BE() {
  const caseName = 'testFastBufferWriteBigInt64BE0001';
  try {
    const buf = buffer.allocUninitializedFromPool(8);
    const res = buf.writeBigInt64BE(BigInt(0x1234567890abcdef), 0);
    if (res !== 8) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeBigInt64LE  ==================== */
@Concurrent
export function testWriteBigInt64LE() {
  const caseName = 'testFastBufferWriteBigInt64LE0001';
  try {
    const buf = buffer.allocUninitializedFromPool(8);
    const res = buf.writeBigInt64LE(BigInt(0x0102030405060708), 0);
    if (res !== 8) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeBigUInt64BE  ==================== */
@Concurrent
export function testWriteBigUInt64BE() {
  const caseName = 'testFastBufferWriteBigUInt64BE0001';
  try {
    const buf = buffer.allocUninitializedFromPool(8);
    const res = buf.writeBigUInt64BE(BigInt(0x0304), 0);
    if (res !== 8) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeBigUInt64LE  ==================== */
@Concurrent
export function testWriteBigUInt64LE() {
  const caseName = 'testFastBufferWriteBigUInt64LE0001';
  try {
    const buf = buffer.allocUninitializedFromPool(8);
    const res = buf.writeBigUInt64LE(BigInt(0x0304), 0);
    if (res !== 8) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeDoubleBE  ==================== */
@Concurrent
export function testWriteDoubleBE() {
  const caseName = 'testFastBufferWriteDoubleBE0001';
  try {
    const buf = buffer.allocUninitializedFromPool(8);
    const res = buf.writeDoubleBE(0x0304, 0);
    if (res !== 8) {
      throw new Error(`${caseName} length mismatch`);
    }
    if (buf.readDoubleBE(0) !== 0x0304) {
      throw new Error(`${caseName} value mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeDoubleLE  ==================== */
@Concurrent
export function testWriteDoubleLE() {
  const caseName = 'testFastBufferWriteDoubleLE0001';
  try {
    const buf = buffer.allocUninitializedFromPool(8);
    const res = buf.writeDoubleLE(0x0304);
    if (res !== 8) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeFloatBE  ==================== */
@Concurrent
export function testWriteFloatBE() {
  const caseName = 'testFastBufferWriteFloatBE0001';
  try {
    const buf = buffer.alloc(4);
    const res = buf.writeFloatBE(0x0304, 0);
    if (res !== 4) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeFloatLE  ==================== */
@Concurrent
export function testWriteFloatLE() {
  const caseName = 'testFastBufferWriteFloatLE0001';
  try {
    const buf = buffer.alloc(5);
    const res = buf.writeFloatLE(0x0304, 0);
    if (res !== 4) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeInt8  ==================== */
@Concurrent
export function testWriteInt8() {
  const caseName = 'testFastBufferWriteInt80002';
  try {
    const buf = buffer.alloc(5);
    const res = buf.writeInt8(-2, 0);
    if (res !== 1) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeInt16BE  ==================== */
@Concurrent
export function testWriteInt16BE() {
  const caseName = 'testFastBufferWriteInt16BE0001';
  try {
    const buf = buffer.alloc(5);
    const res = buf.writeInt16BE(0x0304, 0);
    if (res !== 2) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeInt16LE  ==================== */
@Concurrent
export function testWriteInt16LE() {
  const caseName = 'testFastBufferWriteInt16LE0001';
  try {
    const buf = buffer.alloc(5);
    const res = buf.writeInt16LE(0x0304, 0);
    if (res !== 2) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeInt32BE  ==================== */
@Concurrent
export function testWriteInt32BE() {
  const caseName = 'testFastBufferWriteInt32BE0001';
  try {
    const buf = buffer.allocUninitializedFromPool(4);
    const res = buf.writeInt32BE(0x01020304, 0);
    if (res !== 4) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeInt32LE  ==================== */
@Concurrent
export function testWriteInt32LE() {
  const caseName = 'testFastBufferWriteInt32LE0001';
  try {
    const buf = buffer.allocUninitializedFromPool(4);
    const res = buf.writeInt32LE(0x0304, 0);
    if (res !== 4) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeUInt8  ==================== */
@Concurrent
export function testWriteUInt8() {
  const caseName = 'testFastBufferWriteUInt80001';
  try {
    const buf = buffer.allocUninitializedFromPool(4);
    const res = buf.writeUInt8(0x3, 0);
    if (res !== 1) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeUInt16BE  ==================== */
@Concurrent
export function testWriteUInt16BE() {
  const caseName = 'testFastBufferWriteUInt16BE0001';
  try {
    const buf = buffer.allocUninitializedFromPool(4);
    const res = buf.writeUInt16BE(0xdead, 0);
    if (res !== 2) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeUInt16LE  ==================== */
@Concurrent
export function testWriteUInt16LE() {
  const caseName = 'testFastBufferWriteUInt16LE0001';
  try {
    const buf = buffer.allocUninitializedFromPool(4);
    const res = buf.writeUInt16LE(0x0304, 0);
    if (res !== 2) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeUInt32BE  ==================== */
@Concurrent
export function testWriteUInt32BE() {
  const caseName = 'testFastBufferWriteUInt32BE0001';
  try {
    const buf = buffer.allocUninitializedFromPool(4);
    const res = buf.writeUInt32BE(0x0304, 0);
    if (res !== 4) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeUInt32LE  ==================== */
@Concurrent
export function testWriteUInt32LE() {
  const caseName = 'testFastBufferWriteUInt32LE0001';
  try {
    try {
      const buf = buffer.allocUninitializedFromPool(4);
      buf.writeUInt32LE(0x0304, 0);
    } catch (err) {
      if (err.code !== 10200001) {
        throw new Error(`${caseName} err.code error`);
      }
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

@Concurrent
export function testSubarray() {
  const caseName = 'testFastBufferWriteUInt32LE0001';
  try {
    let buf1 = buffer.allocUninitializedFromPool(26);
    for (let i = 0; i < 26; i++) {
      buf1.writeInt8(i + 97, i);
    }
    const buf2 = buf1.subarray();
    const res = buf2.toString('ascii', 0, buf2.length)
    if (res !== 'abcdefghijklmnopqrstuvwxyz') {
      throw new Error(`${caseName} res error`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

@Concurrent
export function testReadUIntLE() {
  const caseName = 'testFastBufferWriteUInt32LE0001';
  try {
    let buf = buffer.from([0x12, 0x34, 0x56, 0x78, 0x90, 0xab]);
    console.info(buf.readUIntLE(0, 6).toString(16));
    if (buf.readUIntLE(0, 6).toString(16) !== 'ab9078563412') {
      throw new Error(`${caseName} res error`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

@Concurrent
export function testErrorandDocoder() {
  const caseName = 'testFastBufferWriteUInt32LE0001';
  try {
    let buf = buffer.from([
      -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
      49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
      -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
      -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
      68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
      49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
      -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
      -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
      68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
      -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
      49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
      -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
      -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
      68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
      -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
      49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
      -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
      -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
      68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
      -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
      49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
      -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
      -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
      68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
      -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
      49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
      -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
      -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
      68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
      -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
      49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
      -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
      -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
      68, -38, 54, -89, 16, 72, -3, 46, 95, -28
    ])
    console.info(`buf: ${buf.length}`)
    if (buf.length !== 360) {
      throw new Error(`${caseName} buf.length error}`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

@Concurrent
export function testFastBufferWriteSecond() {
  const caseName = 'testFastBufferWrite';
  try {
    const buf = fastbuffer.alloc(256);
    const len = buf.write('\u00bd + \u00bc = \u00be', 0);
    const str = buf.toString('utf-8', 0, len);
    if (str !== '½ + ¼ = ¾') {
      throw new Error(`${caseName} value mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeBigInt64BE  ==================== */
@Concurrent
export function testFastBufferWriteSecondBigInt64BE2() {
  const caseName = 'testFastBufferWriteBigInt64BE';
  try {
    const buf = fastbuffer.allocUninitializedFromPool(8);
    const ref = buf.writeBigInt64BE(BigInt(0x0102030405060708), 0);
    if (ref !== 8) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeBigInt64LE  ==================== */
@Concurrent
export function testFastBufferWriteSecondBigInt64LE2() {
  const caseName = 'testFastBufferWriteBigInt64LE';
  try {
    const buf = fastbuffer.allocUninitializedFromPool(8);
    const ref = buf.writeBigInt64LE(BigInt(0x0102030405060708), 0);
    if (ref !== 8) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeBigUInt64BE  ==================== */
@Concurrent
export function testFastBufferWriteSecondBigUInt64BE2() {
  const caseName = 'testFastBufferWriteBigUInt64BE';
  try {
    const buf = fastbuffer.allocUninitializedFromPool(8);
    const ref = buf.writeBigUInt64BE(BigInt(0xdecafafecacefade), 0);
    if (ref !== 8) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeBigUInt64LE  ==================== */
@Concurrent
export function testFastBufferWriteSecondBigUInt64LE() {
  const caseName = 'testFastBufferWriteBigUInt64LE';
  try {
    const buf = fastbuffer.allocUninitializedFromPool(8);
    const ref = buf.writeBigUInt64LE(BigInt(0xdecafafecacefade), 0);
    if (ref !== 8) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeDoubleBE  ==================== */
@Concurrent
export function testFastBufferWriteSecondDoubleBE() {
  const caseName = 'testFastBufferWriteDoubleBE';
  try {
    const buf = fastbuffer.allocUninitializedFromPool(8);
    const ref = buf.writeDoubleBE(123.456, 0);
    if (ref !== 8) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeDoubleLE  ==================== */
@Concurrent
export function testFastBufferWriteSecondDoubleLE() {
  const caseName = 'testFastBufferWriteDoubleLE';
  try {
    const buf = fastbuffer.allocUninitializedFromPool(8);
    const ref = buf.writeDoubleLE(123.456, 0);
    if (ref !== 8) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeFloatBE  ==================== */
@Concurrent
export function testFastBufferWriteSecondFloatBE() {
  const caseName = 'testFastBufferWriteFloatBE';
  try {
    const buf = fastbuffer.allocUninitializedFromPool(8);
    const ref = buf.writeFloatBE(0xcafebabe, 0);
    if (ref !== 4) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeFloatLE  ==================== */
@Concurrent
export function testFastBufferWriteSecondFloatLE() {
  const caseName = 'testFastBufferWriteFloatLE';
  try {
    const buf = fastbuffer.allocUninitializedFromPool(8);
    const ref = buf.writeFloatLE(0xcafebabe, 0);
    if (ref !== 4) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeInt8  ==================== */
@Concurrent
export function testFastBufferWriteSecondInt8() {
  const caseName = 'testFastBufferWriteInt8';
  try {
    const buf = fastbuffer.allocUninitializedFromPool(2);
    const ref = buf.writeInt8(2, 0);
    if (ref !== 1) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeInt16BE  ==================== */
@Concurrent
export function testFastBufferWriteSecondInt16BE() {
  const caseName = 'testFastBufferWriteInt16BE';
  try {
    const buf = fastbuffer.alloc(2);
    const ref = buf.writeInt16BE(0x0102, 0);
    if (ref !== 2) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeInt16LE  ==================== */
@Concurrent
export function testFastBufferWriteSecondInt16LE() {
  const caseName = 'testFastBufferWriteInt16LE';
  try {
    const buf = fastbuffer.alloc(2);
    const ref = buf.writeInt16LE(0x0304, 0);
    if (ref !== 2) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeInt32BE  ==================== */
@Concurrent
export function testFastBufferWriteSecondInt32BE() {
  const caseName = 'testFastBufferWriteInt32BE';
  try {
    const buf = fastbuffer.alloc(4);
    const ref = buf.writeInt32BE(0x01020304, 0);
    if (ref !== 4) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeInt32LE  ==================== */
@Concurrent
export function testFastBufferWriteSecondInt32LE() {
  const caseName = 'testFastBufferWriteInt32LE';
  try {
    const buf = fastbuffer.alloc(4);
    const ref = buf.writeInt32LE(0x05060708, 0);
    if (ref !== 4) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeIntBE  ==================== */
@Concurrent
export function testFastBufferWriteSecondIntBE() {
  const caseName = 'testFastBufferWriteIntBE';
  try {
    const buf = fastbuffer.allocUninitializedFromPool(6);
    const ref = buf.writeIntBE(0x1234567890ab, 0, 6);
    if (ref !== 6) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeIntLE  ==================== */
@Concurrent
export function testFastBufferWriteSecondIntLE() {
  const caseName = 'testFastBufferWriteIntLE';
  try {
    const buf = fastbuffer.allocUninitializedFromPool(6);
    const ref = buf.writeIntLE(0x1234567890ab, 0, 6);
    if (ref !== 6) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeUInt8  ==================== */
@Concurrent
export function testFastBufferWriteSecondUInt8() {
  const caseName = 'testFastBufferWriteUInt8';
  try {
    const buf = fastbuffer.allocUninitializedFromPool(4);
    const ref = buf.writeUInt8(0x3, 0);
    if (ref !== 1) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeUInt16BE  ==================== */
@Concurrent
export function testFastBufferWriteSecondUInt16BE() {
  const caseName = 'testFastBufferWriteUInt16BE';
  try {
    const buf = fastbuffer.allocUninitializedFromPool(4);
    const ref = buf.writeUInt16BE(0xdead, 0);
    if (ref !== 2) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeUInt16LE  ==================== */
@Concurrent
export function testFastBufferWriteSecondUInt16LE() {
  const caseName = 'testFastBufferWriteUInt16LE';
  try {
    const buf = fastbuffer.allocUninitializedFromPool(4);
    const ref = buf.writeUInt16LE(0xdead, 0);
    if (ref !== 2) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeUInt32BE  ==================== */
@Concurrent
export function testFastBufferWriteSecondUInt32BE() {
  const caseName = 'testFastBufferWriteUInt32BE';
  try {
    const buf = fastbuffer.allocUninitializedFromPool(4);
    const ref = buf.writeUInt32BE(0xfeedface, 0);
    if (ref !== 4) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeUInt32LE  ==================== */
@Concurrent
export function testFastBufferWriteSecondUInt32LE() {
  const caseName = 'testFastBufferWriteUInt32LE';
  try {
    const buf = fastbuffer.allocUninitializedFromPool(4);
    const ref = buf.writeUInt32LE(0xfeedface, 0);
    if (ref !== 4) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeUIntBE  ==================== */
@Concurrent
export function testFastBufferWriteSecondUIntBE() {
  const caseName = 'testFastBufferWriteUIntBE';
  try {
    const buf = fastbuffer.allocUninitializedFromPool(6);
    const ref = buf.writeUIntBE(0x13141516, 0, 6);
    if (ref !== 6) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

/* ====================  writeUIntLE  ==================== */
@Concurrent
export function testFastBufferWriteSecondUIntLE() {
  const caseName = 'testFastBufferWriteUIntLE';
  try {
    const buf = fastbuffer.allocUninitializedFromPool(6);
    const ref = buf.writeUIntLE(0x1234567890ab, 0, 6);
    if (ref !== 6) {
      throw new Error(`${caseName} length mismatch`);
    }
  } catch (err) {
    throw new Error(`${caseName} catch error: ${(err as Error).message}`);
  }
}

// 01: fill
@Concurrent
export function testFill001() {
  try {
    let buf = fastbuffer.alloc(3).fill('$*$');
    let str = buf.toString();
    if (str !== '$*$') {
      throw new Error(`fill mismatch`);
    }
  } catch (err) {
    throw new Error(`catch error: ${err.message}`);
  }
}

// 02: write
@Concurrent
export function testWrite002() {
  try {
    let buf = fastbuffer.alloc(8);
    let offset = buf.write('abcde', 1);
    if (offset !== 5) {
      throw new Error(`write offset mismatch`);
    }
  } catch (err) {
    throw new Error(`catch error: ${err.message}`);
  }
}

// 03: compare
@Concurrent
export function testCompare003() {
  try {
    let buf1 = fastbuffer.from('1236');
    let buf2 = fastbuffer.from('1235');
    let res = buf1.compare(buf2);
    if (res !== 1) {
      throw new Error(`compare mismatch`);
    }
  } catch (err) {
    throw new Error(`catch error: ${err.message}`);
  }
}

// 04: equals
@Concurrent
export function testEquals004() {
  try {
    let buf1 = fastbuffer.from('1236');
    let buf2 = fastbuffer.from('1235');
    let res = buf1.equals(buf2);
    if (res !== false) {
      throw new Error(`equals mismatch`);
    }
  } catch (err) {
    throw new Error(`catch error: ${err.message}`);
  }
}

// 05: subarray
@Concurrent
export function testSubarray005() {
  try {
    let buf1 = fastbuffer.from('1236');
    let buf = buf1.subarray(0, 3);
    let str = buf.toString();
    if (str !== '123') {
      throw new Error(`subarray mismatch`);
    }
  } catch (err) {
    throw new Error(`catch error: ${err.message}`);
  }
}

// 06: copy
@Concurrent
export function testCopy006() {
  try {
    let buf1 = fastbuffer.from('1236');
    let buf2 = fastbuffer.from('1235');
    let num = buf1.copy(buf2);
    if (num !== 4) {
      throw new Error(`copy length mismatch`);
    }
    let str = buf2.toString();
    if (str !== '1236') {
      throw new Error(`copy content mismatch`);
    }
  } catch (err) {
    throw new Error(`catch error: ${err.message}`);
  }
}

// 07: toString
@Concurrent
export function testToString007() {
  try {
    let buf1 = fastbuffer.from('abc');
    let str = buf1.toString('base64');
    if (str !== 'YWJj') {
      throw new Error(`toString base64 mismatch`);
    }
  } catch (err) {
    throw new Error(`catch error: ${err.message}`);
  }
}

// 08: indexOf
@Concurrent
export function testIndexOf008() {
  try {
    let buf1 = fastbuffer.from('13236');
    let index = buf1.indexOf('3');
    if (index !== 1) {
      throw new Error(`indexOf mismatch`);
    }
  } catch (err) {
    throw new Error(`catch error: ${err.message}`);
  }
}

// 09: lastIndexOf
@Concurrent
export function testLastIndexOf009() {
  try {
    let buf1 = fastbuffer.from('13236');
    let index = buf1.lastIndexOf('3');
    if (index !== 3) {
      throw new Error(`lastIndexOf mismatch`);
    }
  } catch (err) {
    throw new Error(`catch error: ${err.message}`);
  }
}

// 10: includes
@Concurrent
export function testIncludes010() {
  try {
    let buf1 = fastbuffer.from('13236');
    let flag = buf1.includes('3');
    if (flag !== true) {
      throw new Error(`includes mismatch`);
    }
  } catch (err) {
    throw new Error(`catch error: ${err.message}`);
  }
}

// 11: swap16
@Concurrent
export function testSwap16011() {
  try {
    let buf1 = fastbuffer.from('1234567');
    try {
      buf1.swap64();
    } catch (err) {
      if (err.message !== 'The buffer size must be a multiple of 64-bits') {
        throw new Error(`catch error: ${err.message}`);
      }
    }
  } catch (err) {
    throw new Error(`catch error: ${err.message}`);
  }
}

// 12: swap32
@Concurrent
export function testSwap32012() {
  try {
    let buf1 = fastbuffer.from('1234567');
    try {
      buf1.swap32();
    } catch (err) {
      if (err.message !== 'The buffer size must be a multiple of 32-bits') {
        throw new Error(`catch error: ${err.message}`);
      }
    }
  } catch (err) {
    throw new Error(`catch error: ${err.message}`);
  }
}

// 13: keys
@Concurrent
export function testKeys013() {
  try {
    let buf1 = fastbuffer.from('1234');
    let keys = buf1.keys();
    let index = 0;
    for (const key of keys) {
      if (key !== index) {
        throw new Error(`keys mismatch`);
      }
      index++;
    }
  } catch (err) {
    throw new Error(`catch error: ${err.message}`);
  }
}

// 14: values
@Concurrent
export function testValues014() {
  try {
    let buf1 = fastbuffer.from('1234');
    let vals = buf1.values();
    let va = 49;
    for (const value of vals) {
      if (value !== va) {
        throw new Error(`values mismatch`);
      }
      va++;
    }
  } catch (err) {
    throw new Error(`catch error: ${err.message}`);
  }
}

// 15: from
@Concurrent
export function testFrom015() {
  try {
    const buf = fastbuffer.from('this is a test');
    let str = buf.toString();
    if (str !== 'this is a test') {
      throw new Error(`from string mismatch`);
    }
  } catch (err) {
    throw new Error(`catch error: ${err.message}`);
  }
}

// 16: writeInt32BE
@Concurrent
export function testWriteInt32BE016() {
  try {
    let buf = fastbuffer.alloc(4);
    let ref = buf.writeInt32BE(0x12345678, 0);
    if (ref !== 4) {
      throw new Error(`writeInt32BE mismatch`);
    }
  } catch (err) {
    throw new Error(`catch error: ${err.message}`);
  }
}

// 17: writeInt32LE
@Concurrent
export function testWriteInt32LE017() {
  try {
    let buf = fastbuffer.alloc(4);
    let ref = buf.writeInt32LE(0x12345678, 0);
    if (ref !== 4) {
      throw new Error(`writeInt32LE mismatch`);
    }
  } catch (err) {
    throw new Error(`catch error: ${err.message}`);
  }
}

// 18: writeUInt16BE
@Concurrent
export function testWriteUInt16BE018() {
  try {
    let buf = fastbuffer.allocUninitializedFromPool(4);
    let ref = buf.writeUInt16BE(0xdead, 0);
    if (ref !== 2) {
      throw new Error(`writeUInt16BE mismatch`);
    }
  } catch (err) {
    throw new Error(`catch error: ${err.message}`);
  }
}

// 19: writeUInt32BE
@Concurrent
export function testWriteUInt32BE019() {
  try {
    let buf = fastbuffer.allocUninitializedFromPool(4);
    let ref = buf.writeUInt32BE(0xfeedface, 0);
    if (ref !== 4) {
      throw new Error(`writeUInt32BE mismatch`);
    }
  } catch (err) {
    throw new Error(`catch error: ${err.message}`);
  }
}

// 20: readInt32BE
@Concurrent
export function testReadInt32BE020() {
  try {
    let buf = fastbuffer.alloc(4);
    buf.writeInt32BE(0x12345678, 0);
    let ref = buf.readInt32BE(0).toString(16);
    if (ref !== '12345678') {
      throw new Error(`readInt32BE mismatch`);
    }
  } catch (err) {
    throw new Error(`catch error: ${err.message}`);
  }
}

// 21: readUInt32LE
@Concurrent
export function testReadUInt32LE021() {
  try {
    let buf = fastbuffer.allocUninitializedFromPool(4);
    buf.writeUInt32LE(0x12345678, 0);
    let ref = buf.readUInt32LE(0).toString(16);
    if (ref !== '12345678') {
      throw new Error(`readUInt32LE mismatch`);
    }
  } catch (err) {
    throw new Error(`catch error: ${err.message}`);
  }
}

// 22: readDoubleBE
@Concurrent
export function testReadDoubleBE022() {
  try {
    let buf = fastbuffer.allocUninitializedFromPool(8);
    buf.writeDoubleBE(123.456, 0);
    let ref = buf.readDoubleBE();
    if (ref !== 123.456) {
      throw new Error(`readDoubleBE mismatch`);
    }
  } catch (err) {
    throw new Error(`catch error: ${err.message}`);
  }
}

// 23: readFloatLE
@Concurrent
export function testReadFloatLE023() {
  try {
    let buf = fastbuffer.allocUninitializedFromPool(4);
    buf.writeFloatLE(0xcabcbcbc, 0);
    let ref = buf.readFloatLE(0).toString(16);
    if (ref !== 'cabcbd00') {
      throw new Error(`readFloatLE mismatch`);
    }
  } catch (err) {
    throw new Error(`catch error: ${err.message}`);
  }
}

// 24: readBigUInt64BE
@Concurrent
export function testReadBigUInt64BE024() {
  try {
    let buf = fastbuffer.allocUninitializedFromPool(8);
    buf.writeBigUInt64BE(0xdecafafecacefaden, 0);
    let ref = buf.readBigUInt64BE(0).toString(16);
    if (ref !== 'decafafecacefade') {
      throw new Error(`readBigUInt64BE mismatch`);
    }
  } catch (err) {
    throw new Error(`catch error: ${err.message}`);
  }
}

// 25: length
@Concurrent
export function testBufferLength025() {
  try {
    let buf = fastbuffer.from('1236');
    let len = buf.length;
    if (len !== 4) {
      throw new Error(`buffer length mismatch`);
    }
  } catch (err) {
    throw new Error(`catch error: ${err.message}`);
  }
}

// 26: byteOffset
@Concurrent
export function testBufferByteOffset026() {
  try {
    let buf = fastbuffer.from('1236');
    let offset = buf.byteOffset;
    if (offset < 0) {
      throw new Error(`byteOffset mismatch`);
    }
  } catch (err) {
    throw new Error(`catch error: ${err.message}`);
  }
}

// 27: allocUninitialized
@Concurrent
export function testAllocUninitialized027() {
  try {
    let buf = fastbuffer.allocUninitialized(10);
    if (buf.length !== 10) {
      throw new Error(`allocUninitialized mismatch`);
    }
  } catch (err) {
    throw new Error(`catch error: ${err.message}`);
  }
}

// 28: byteLength
@Concurrent
export function testByteLength028() {
  try {
    let buf1 = fastbuffer.from('abc');
    let byteLen = fastbuffer.byteLength(buf1);
    if (byteLen !== 3) {
      throw new Error(`byteLength mismatch`);
    }
  } catch (err) {
    throw new Error(`catch error: ${err.message}`);
  }
}
