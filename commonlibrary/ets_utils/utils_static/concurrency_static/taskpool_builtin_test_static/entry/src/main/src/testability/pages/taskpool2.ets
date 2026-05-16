'use static'

export function testUint8ArrayConstructor1() {
  let TAG = 'testUint8ArrayConstructor1'
  try {
    let array = new Uint8Array(10);
    array[0] = 3;
    if (array[0] !== 3) {
      throw new Error(`${TAG} Uint8Array constructor failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint8ArrayBytesPerElement1() {
  let TAG = 'testUint8ArrayBytesPerElement1'
  try {
    let bytes = Uint8Array.BYTES_PER_ELEMENT;
    if (bytes !== 1) {
      throw new Error(`${TAG} BYTES_PER_ELEMENT failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testBigUint64ArrayConstructor1() {
  let TAG = 'testBigUint64ArrayConstructor1'
  try {
    let array = new BigUint64Array(10);
    array[0] = 3n;
    if (array[0] !== 3n) {
      throw new Error(`${TAG} BigUint64Array constructor failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testBigUint64ArrayBytesPerElement1() {
  let TAG = 'testBigUint64ArrayBytesPerElement1'
  try {
    let bytes = BigUint64Array.BYTES_PER_ELEMENT;
    if (bytes !== 8) {
      throw new Error(`${TAG} BYTES_PER_ELEMENT failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testBigUint64ArrayFrom1() {
  let TAG = 'testBigUint64ArrayFrom1'
  try {
    let array = BigUint64Array.from([1n, 2n, 3n]);
    if (array[0] !== 1n || array[1] !== 2n || array[2] !== 3n) {
      throw new Error(`${TAG} from method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testBigUint64ArrayOf1() {
  let TAG = 'testBigUint64ArrayOf1'
  try {
    let array = BigUint64Array.of(21n, 31n);
    if (array[0] !== 21n || array[1] !== 31n) {
      throw new Error(`${TAG} of method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testBigUint64ArrayByteOffset1() {
  let TAG = 'testBigUint64ArrayByteOffset1'
  try {
    const buffer = new ArrayBuffer(64);
    const array = new BigUint64Array(buffer, 8);
    if (array.byteOffset !== 8) {
      throw new Error(`${TAG} byteOffset failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testBigUint64ArrayByteLength1() {
  let TAG = 'testBigUint64ArrayByteLength1'
  try {
    const buffer = new ArrayBuffer(64);
    const array = new BigUint64Array(buffer, 8);
    if (array.byteLength !== 56) {
      throw new Error(`${TAG} byteLength failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testBigUint64ArrayBuffer1() {
  let TAG = 'testBigUint64ArrayBuffer1'
  try {
    const buffer = new ArrayBuffer(64);
    const array = new BigUint64Array(buffer);
    if (array.buffer.byteLength !== 64) {
      throw new Error(`${TAG} buffer property failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testBigUint64ArrayLength1() {
  let TAG = 'testBigUint64ArrayLength1'
  try {
    let array = new BigUint64Array(8);
    if (array.length !== 8) {
      throw new Error(`${TAG} length property failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testBigUint64ArrayFromArray1() {
  let TAG = 'testBigUint64ArrayFromArray1'
  try {
    let array = BigUint64Array.from([0n, 1n, 2n, 3n, 4n]);
    if (array[0] !== 0n || array[1] !== 1n || array[2] !== 2n || array[3] !== 3n || array[4] !== 4n) {
      throw new Error(`${TAG} from Array failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint8ArrayFrom1() {
  let TAG = 'testUint8ArrayFrom1'
  try {
    let array = Uint8Array.from([1, 2, 3]);
    if (array[0] !== 1 || array[1] !== 2 || array[2] !== 3) {
      throw new Error(`${TAG} from method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint8ArrayOf1() {
  let TAG = 'testUint8ArrayOf1'
  try {
    let array = Uint8Array.of(21, 31);
    if (array[0] !== 21 || array[1] !== 31) {
      throw new Error(`${TAG} of method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint8ArrayByteOffset1() {
  let TAG = 'testUint8ArrayByteOffset1'
  try {
    const buffer = new ArrayBuffer(32);
    const array = new Uint8Array(buffer, 8);
    if (array.byteOffset !== 8) {
      throw new Error(`${TAG} byteOffset failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint8ArrayByteLength1() {
  let TAG = 'testUint8ArrayByteLength1'
  try {
    const buffer = new ArrayBuffer(32);
    const array = new Uint8Array(buffer, 8);
    if (array.byteLength !== 24) {
      throw new Error(`${TAG} byteLength failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint8ArrayBuffer1() {
  let TAG = 'testUint8ArrayBuffer1'
  try {
    const buffer = new ArrayBuffer(32);
    const array = new Uint8Array(buffer);
    if (array.buffer.byteLength !== 32) {
      throw new Error(`${TAG} buffer property failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint8ArrayLength1() {
  let TAG = 'testUint8ArrayLength1'
  try {
    let array = new Uint8Array(8);
    if (array.length !== 8) {
      throw new Error(`${TAG} length property failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint8ArrayFromArray1() {
  let TAG = 'testUint8ArrayFromArray1'
  try {
    let array = Uint8Array.from([0, 1, 2, 3, 4]);
    if (array[0] !== 0 || array[1] !== 1 || array[2] !== 2 || array[3] !== 3 || array[4] !== 4) {
      throw new Error(`${TAG} from Array failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint16ArrayConstructor1() {
  let TAG = 'testUint16ArrayConstructor1'
  try {
    let array = new Uint16Array(10);
    array[0] = 3;
    if (array[0] !== 3) {
      throw new Error(`${TAG} Uint16Array constructor failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint16ArrayBytesPerElement1() {
  let TAG = 'testUint16ArrayBytesPerElement1'
  try {
    let bytes = Uint16Array.BYTES_PER_ELEMENT;
    if (bytes !== 2) {
      throw new Error(`${TAG} BYTES_PER_ELEMENT failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint16ArrayFrom1() {
  let TAG = 'testUint16ArrayFrom1'
  try {
    let array = Uint16Array.from([1, 2, 3]);
    if (array[0] !== 1 || array[1] !== 2 || array[2] !== 3) {
      throw new Error(`${TAG} from method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint16ArrayOf1() {
  let TAG = 'testUint16ArrayOf1'
  try {
    let array = Uint16Array.of(21, 31);
    if (array[0] !== 21 || array[1] !== 31) {
      throw new Error(`${TAG} of method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint16ArrayByteOffset1() {
  let TAG = 'testUint16ArrayByteOffset1'
  try {
    const buffer = new ArrayBuffer(32);
    const array = new Uint16Array(buffer, 8);
    if (array.byteOffset !== 8) {
      throw new Error(`${TAG} byteOffset failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint16ArrayByteLength1() {
  let TAG = 'testUint16ArrayByteLength1'
  try {
    const buffer = new ArrayBuffer(32);
    const array = new Uint16Array(buffer, 8);
    if (array.byteLength !== 24) {
      throw new Error(`${TAG} byteLength failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint16ArrayBuffer1() {
  let TAG = 'testUint16ArrayBuffer1'
  try {
    const buffer = new ArrayBuffer(32);
    const array = new Uint16Array(buffer);
    if (array.buffer.byteLength !== 32) {
      throw new Error(`${TAG} buffer property failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint16ArrayLength1() {
  let TAG = 'testUint16ArrayLength1'
  try {
    let array = new Uint16Array(8);
    if (array.length !== 8) {
      throw new Error(`${TAG} length property failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint16ArrayFromArray1() {
  let TAG = 'testUint16ArrayFromArray1'
  try {
    let array = Uint16Array.from([0, 1, 2, 3, 4]);
    if (array[0] !== 0 || array[1] !== 1 || array[2] !== 2 || array[3] !== 3 || array[4] !== 4) {
      throw new Error(`${TAG} from Array failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint32ArrayConstructor1() {
  let TAG = 'testUint32ArrayConstructor1'
  try {
    let array = new Uint32Array(10);
    array[0] = 3;
    if (array[0] !== 3) {
      throw new Error(`${TAG} Uint32Array constructor failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint32ArrayBytesPerElement1() {
  let TAG = 'testUint32ArrayBytesPerElement1'
  try {
    let bytes = Uint32Array.BYTES_PER_ELEMENT;
    if (bytes !== 4) {
      throw new Error(`${TAG} BYTES_PER_ELEMENT failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint32ArrayFrom1() {
  let TAG = 'testUint32ArrayFrom1'
  try {
    let array = Uint32Array.from([1, 2, 3]);
    if (array[0] !== 1 || array[1] !== 2 || array[2] !== 3) {
      throw new Error(`${TAG} from method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint32ArrayOf1() {
  let TAG = 'testUint32ArrayOf1'
  try {
    let array = Uint32Array.of(21, 31);
    if (array[0] !== 21 || array[1] !== 31) {
      throw new Error(`${TAG} of method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint32ArrayByteOffset1() {
  let TAG = 'testUint32ArrayByteOffset1'
  try {
    const buffer = new ArrayBuffer(32);
    const array = new Uint32Array(buffer, 8);
    if (array.byteOffset !== 8) {
      throw new Error(`${TAG} byteOffset failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint32ArrayByteLength1() {
  let TAG = 'testUint32ArrayByteLength1'
  try {
    const buffer = new ArrayBuffer(32);
    const array = new Uint32Array(buffer, 8);
    if (array.byteLength !== 24) {
      throw new Error(`${TAG} byteLength failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint32ArrayBuffer1() {
  let TAG = 'testUint32ArrayBuffer1'
  try {
    const buffer = new ArrayBuffer(32);
    const array = new Uint32Array(buffer);
    if (array.buffer.byteLength !== 32) {
      throw new Error(`${TAG} buffer property failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint32ArrayLength1() {
  let TAG = 'testUint32ArrayLength1'
  try {
    let array = new Uint32Array(8);
    if (array.length !== 8) {
      throw new Error(`${TAG} length property failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint32ArrayFromArray1() {
  let TAG = 'testUint32ArrayFromArray1'
  try {
    let array = Uint32Array.from([0, 1, 2, 3, 4]);
    if (array[0] !== 0 || array[1] !== 1 || array[2] !== 2 || array[3] !== 3 || array[4] !== 4) {
      throw new Error(`${TAG} from Array failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint8ClampedArrayConstructor1() {
  let TAG = 'testUint8ClampedArrayConstructor1'
  try {
    let array = new Uint8ClampedArray(10);
    array[0] = 3;
    if (array[0] !== 3) {
      throw new Error(`${TAG} Uint8ClampedArray constructor failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint8ClampedArrayBytesPerElement1() {
  let TAG = 'testUint8ClampedArrayBytesPerElement1'
  try {
    let bytes = Uint8ClampedArray.BYTES_PER_ELEMENT;
    if (bytes !== 1) {
      throw new Error(`${TAG} BYTES_PER_ELEMENT failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint8ClampedArrayFrom1() {
  let TAG = 'testUint8ClampedArrayFrom1'
  try {
    let array = Uint8ClampedArray.from([1, 2, 3]);
    if (array[0] !== 1 || array[1] !== 2 || array[2] !== 3) {
      throw new Error(`${TAG} from method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint8ClampedArrayOf1() {
  let TAG = 'testUint8ClampedArrayOf1'
  try {
    let array = Uint8ClampedArray.of(21, 31);
    if (array[0] !== 21 || array[1] !== 31) {
      throw new Error(`${TAG} of method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint8ClampedArrayByteOffset1() {
  let TAG = 'testUint8ClampedArrayByteOffset1'
  try {
    const buffer = new ArrayBuffer(32);
    const array = new Uint8ClampedArray(buffer, 8);
    if (array.byteOffset !== 8) {
      throw new Error(`${TAG} byteOffset failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint8ClampedArrayByteLength1() {
  let TAG = 'testUint8ClampedArrayByteLength1'
  try {
    const buffer = new ArrayBuffer(32);
    const array = new Uint8ClampedArray(buffer, 8);
    if (array.byteLength !== 24) {
      throw new Error(`${TAG} byteLength failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint8ClampedArrayBuffer1() {
  let TAG = 'testUint8ClampedArrayBuffer1'
  try {
    const buffer = new ArrayBuffer(32);
    const array = new Uint8ClampedArray(buffer);
    if (array.buffer.byteLength !== 32) {
      throw new Error(`${TAG} buffer property failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint8ClampedArrayLength1() {
  let TAG = 'testUint8ClampedArrayLength1'
  try {
    let array = new Uint8ClampedArray(8);
    if (array.length !== 8) {
      throw new Error(`${TAG} length property failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testUint8ClampedArrayFromArray1() {
  let TAG = 'testUint8ClampedArrayFromArray1'
  try {
    let array = Uint8ClampedArray.from([0, 1, 2, 3, 4]);
    if (array[0] !== 0 || array[1] !== 1 || array[2] !== 2 || array[3] !== 3 || array[4] !== 4) {
      throw new Error(`${TAG} from Array failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testInt8ArrayConstructor1() {
  let TAG = 'testInt8ArrayConstructor1'
  try {
    let array = new Int8Array(10);
    array[0] = 3;
    if (array[0] !== 3) {
      throw new Error(`${TAG} Int8Array constructor failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testInt8ArrayBytesPerElement1() {
  let TAG = 'testInt8ArrayBytesPerElement1'
  try {
    let bytes = Int8Array.BYTES_PER_ELEMENT;
    if (bytes !== 1) {
      throw new Error(`${TAG} BYTES_PER_ELEMENT failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testInt8ArrayFrom1() {
  let TAG = 'testInt8ArrayFrom1'
  try {
    let array = Int8Array.from([1, 2, 3]);
    if (array[0] !== 1 || array[1] !== 2 || array[2] !== 3) {
      throw new Error(`${TAG} from method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testInt8ArrayOf1() {
  let TAG = 'testInt8ArrayOf1'
  try {
    let array = Int8Array.of(21, 31);
    if (array[0] !== 21 || array[1] !== 31) {
      throw new Error(`${TAG} of method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testInt8ArrayByteOffset1() {
  let TAG = 'testInt8ArrayByteOffset1'
  try {
    const buffer = new ArrayBuffer(32);
    const array = new Int8Array(buffer, 8);
    if (array.byteOffset !== 8) {
      throw new Error(`${TAG} byteOffset failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testInt8ArrayByteLength1() {
  let TAG = 'testInt8ArrayByteLength1'
  try {
    const buffer = new ArrayBuffer(32);
    const array = new Int8Array(buffer, 8);
    if (array.byteLength !== 24) {
      throw new Error(`${TAG} byteLength failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testInt8ArrayBuffer1() {
  let TAG = 'testInt8ArrayBuffer1'
  try {
    const buffer = new ArrayBuffer(32);
    const array = new Int8Array(buffer);
    if (array.buffer.byteLength !== 32) {
      throw new Error(`${TAG} buffer property failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testInt8ArrayLength1() {
  let TAG = 'testInt8ArrayLength1'
  try {
    let array = new Int8Array(8);
    if (array.length !== 8) {
      throw new Error(`${TAG} length property failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testInt8ArrayFromArray1() {
  let TAG = 'testInt8ArrayFromArray1'
  try {
    let array = Int8Array.from([0, 1, 2, 3, 4]);
    if (array[0] !== 0 || array[1] !== 1 || array[2] !== 2 || array[3] !== 3 || array[4] !== 4) {
      throw new Error(`${TAG} from Array failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testInt16ArrayConstructor1() {
  let TAG = 'testInt16ArrayConstructor1'
  try {
    let array = new Int16Array(10);
    array[0] = 3;
    if (array[0] !== 3) {
      throw new Error(`${TAG} Int16Array constructor failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testInt16ArrayBytesPerElement1() {
  let TAG = 'testInt16ArrayBytesPerElement1'
  try {
    let bytes = Int16Array.BYTES_PER_ELEMENT;
    if (bytes !== 2) {
      throw new Error(`${TAG} BYTES_PER_ELEMENT failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testInt16ArrayFrom1() {
  let TAG = 'testInt16ArrayFrom1'
  try {
    let array = Int16Array.from([1, 2, 3]);
    if (array[0] !== 1 || array[1] !== 2 || array[2] !== 3) {
      throw new Error(`${TAG} from method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testInt16ArrayOf1() {
  let TAG = 'testInt16ArrayOf1'
  try {
    let array = Int16Array.of(21, 31);
    if (array[0] !== 21 || array[1] !== 31) {
      throw new Error(`${TAG} of method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testInt16ArrayByteOffset1() {
  let TAG = 'testInt16ArrayByteOffset1'
  try {
    const buffer = new ArrayBuffer(32);
    const array = new Int16Array(buffer, 8);
    if (array.byteOffset !== 8) {
      throw new Error(`${TAG} byteOffset failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testInt16ArrayByteLength1() {
  let TAG = 'testInt16ArrayByteLength1'
  try {
    const buffer = new ArrayBuffer(32);
    const array = new Int16Array(buffer, 8);
    if (array.byteLength !== 24) {
      throw new Error(`${TAG} byteLength failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testInt16ArrayBuffer1() {
  let TAG = 'testInt16ArrayBuffer1'
  try {
    const buffer = new ArrayBuffer(32);
    const array = new Int16Array(buffer);
    if (array.buffer.byteLength !== 32) {
      throw new Error(`${TAG} buffer property failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testInt16ArrayLength1() {
  let TAG = 'testInt16ArrayLength1'
  try {
    let array = new Int16Array(8);
    if (array.length !== 8) {
      throw new Error(`${TAG} length property failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testInt16ArrayFromArray1() {
  let TAG = 'testInt16ArrayFromArray1'
  try {
    let array = Int16Array.from([0, 1, 2, 3, 4]);
    if (array[0] !== 0 || array[1] !== 1 || array[2] !== 2 || array[3] !== 3 || array[4] !== 4) {
      throw new Error(`${TAG} from Array failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testInt32ArrayConstructor1() {
  let TAG = 'testInt32ArrayConstructor1'
  try {
    let array = new Int32Array(10);
    array[0] = 3;
    if (array[0] !== 3) {
      throw new Error(`${TAG} Int32Array constructor failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testInt32ArrayBytesPerElement1() {
  let TAG = 'testInt32ArrayBytesPerElement1'
  try {
    let bytes = Int32Array.BYTES_PER_ELEMENT;
    if (bytes !== 4) {
      throw new Error(`${TAG} BYTES_PER_ELEMENT failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testInt32ArrayFrom1() {
  let TAG = 'testInt32ArrayFrom1'
  try {
    let array = Int32Array.from([1, 2, 3]);
    if (array[0] !== 1 || array[1] !== 2 || array[2] !== 3) {
      throw new Error(`${TAG} from method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testInt32ArrayOf1() {
  let TAG = 'testInt32ArrayOf1'
  try {
    let array = Int32Array.of(21, 31);
    if (array[0] !== 21 || array[1] !== 31) {
      throw new Error(`${TAG} of method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testInt32ArrayByteOffset1() {
  let TAG = 'testInt32ArrayByteOffset1'
  try {
    const buffer = new ArrayBuffer(32);
    const array = new Int32Array(buffer, 8);
    if (array.byteOffset !== 8) {
      throw new Error(`${TAG} byteOffset failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testInt32ArrayByteLength1() {
  let TAG = 'testInt32ArrayByteLength1'
  try {
    const buffer = new ArrayBuffer(32);
    const array = new Int32Array(buffer, 8);
    if (array.byteLength !== 24) {
      throw new Error(`${TAG} byteLength failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testInt32ArrayBuffer1() {
  let TAG = 'testInt32ArrayBuffer1'
  try {
    const buffer = new ArrayBuffer(32);
    const array = new Int32Array(buffer);
    if (array.buffer.byteLength !== 32) {
      throw new Error(`${TAG} buffer property failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testInt32ArrayLength1() {
  let TAG = 'testInt32ArrayLength1'
  try {
    let array = new Int32Array(8);
    if (array.length !== 8) {
      throw new Error(`${TAG} length property failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testInt32ArrayFromArray1() {
  let TAG = 'testInt32ArrayFromArray1'
  try {
    let array = Int32Array.from([0, 1, 2, 3, 4]);
    if (array[0] !== 0 || array[1] !== 1 || array[2] !== 2 || array[3] !== 3 || array[4] !== 4) {
      throw new Error(`${TAG} from Array failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testBigInt64ArrayConstructor1() {
  let TAG = 'testBigInt64ArrayConstructor1'
  try {
    let array = new BigInt64Array(10);
    array[0] = 3n;
    if (array[0] !== 3n) {
      throw new Error(`${TAG} BigInt64Array constructor failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testBigInt64ArrayBytesPerElement1() {
  let TAG = 'testBigInt64ArrayBytesPerElement1'
  try {
    let bytes = BigInt64Array.BYTES_PER_ELEMENT;
    if (bytes !== 8) {
      throw new Error(`${TAG} BYTES_PER_ELEMENT failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testBigInt64ArrayFrom1() {
  let TAG = 'testBigInt64ArrayFrom1'
  try {
    let array = BigInt64Array.from([1n, 2n, 3n]);
    if (array[0] !== 1n || array[1] !== 2n || array[2] !== 3n) {
      throw new Error(`${TAG} from method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testBigInt64ArrayOf1() {
  let TAG = 'testBigInt64ArrayOf1'
  try {
    let array = BigInt64Array.of(21n, 31n);
    if (array[0] !== 21n || array[1] !== 31n) {
      throw new Error(`${TAG} of method failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testBigInt64ArrayByteOffset1() {
  let TAG = 'testBigInt64ArrayByteOffset1'
  try {
    const buffer = new ArrayBuffer(64);
    const array = new BigInt64Array(buffer, 8);
    if (array.byteOffset !== 8) {
      throw new Error(`${TAG} byteOffset failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testBigInt64ArrayByteLength1() {
  let TAG = 'testBigInt64ArrayByteLength1'
  try {
    const buffer = new ArrayBuffer(64);
    const array = new BigInt64Array(buffer, 8);
    if (array.byteLength !== 56) {
      throw new Error(`${TAG} byteLength failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testBigInt64ArrayBuffer1() {
  let TAG = 'testBigInt64ArrayBuffer1'
  try {
    const buffer = new ArrayBuffer(64);
    const array = new BigInt64Array(buffer);
    if (array.buffer.byteLength !== 64) {
      throw new Error(`${TAG} buffer property failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testBigInt64ArrayLength1() {
  let TAG = 'testBigInt64ArrayLength1'
  try {
    let array = new BigInt64Array(8);
    if (array.length !== 8) {
      throw new Error(`${TAG} length property failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testBigInt64ArrayFromArray1() {
  let TAG = 'testBigInt64ArrayFromArray1'
  try {
    let array = BigInt64Array.from([0n, 1n, 2n, 3n, 4n]);
    if (array[0] !== 0n || array[1] !== 1n || array[2] !== 2n || array[3] !== 3n || array[4] !== 4n) {
      throw new Error(`${TAG} from Array failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testFloat32ArrayConstructor1() {
  let TAG = 'testFloat32ArrayConstructor1'
  try {
    let array = new Float32Array();
    if (array.toString() !== '') {
      throw new Error(`${TAG} Float32Array constructor failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testFloat32ArrayBytesPerElement1() {
  let TAG = 'testFloat32ArrayBytesPerElement1'
  try {
    let bytes = Float32Array.BYTES_PER_ELEMENT;
    if (bytes !== 4) {
      throw new Error(`${TAG} Float32Array.BYTES_PER_ELEMENT failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testFloat32ArrayFrom1() {
  let TAG = 'testFloat32ArrayFrom1'
  try {
    let array = Float32Array.from([1, 2, 3]);
    if (array[0] !== 1 || array[1] !== 2 || array[2] !== 3) {
      throw new Error(`${TAG} Float32Array.from failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testFloat32ArrayOf1() {
  let TAG = 'testFloat32ArrayOf1'
  try {
    let array = Float32Array.of(21, 31);
    if (array[0] !== 21 || array[1] !== 31) {
      throw new Error(`${TAG} Float32Array.of failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testFloat32ArrayByteOffset1() {
  let TAG = 'testFloat32ArrayByteOffset1'
  try {
    const buffer = new ArrayBuffer(32);
    const arrayOffSet0 = new Float32Array(buffer);
    if (arrayOffSet0.byteOffset !== 0) {
      throw new Error(`${TAG} Float32Array byteOffset failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testFloat32ArrayByteLength1() {
  let TAG = 'testFloat32ArrayByteLength1'
  try {
    const buffer = new ArrayBuffer(32);
    const arrayOffSet0 = new Float32Array(buffer);
    if (arrayOffSet0.byteLength !== 32) {
      throw new Error(`${TAG} Float32Array byteLength failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testFloat32ArrayBuffer1() {
  let TAG = 'testFloat32ArrayBuffer1'
  try {
    const buffer = new ArrayBuffer(32);
    const arrayOffSet0 = new Float32Array(buffer);
    if (arrayOffSet0.buffer.byteLength !== 32) {
      throw new Error(`${TAG} Float32Array buffer failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testFloat32ArrayLength1() {
  let TAG = 'testFloat32ArrayLength1'
  try {
    const buffer = new ArrayBuffer(32);
    const arrayOffSet0 = new Float32Array(buffer);
    if (arrayOffSet0.length !== 8) {
      throw new Error(`${TAG} Float32Array length failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testFloat64ArrayConstructor1() {
  let TAG = 'testFloat64ArrayConstructor1'
  try {
    let array = new Float64Array();
    if (array.toString() !== '') {
      throw new Error(`${TAG} Float64Array constructor failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testFloat64ArrayBytesPerElement1() {
  let TAG = 'testFloat64ArrayBytesPerElement1'
  try {
    let bytes = Float64Array.BYTES_PER_ELEMENT;
    if (bytes !== 8) {
      throw new Error(`${TAG} Float64Array.BYTES_PER_ELEMENT failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testFloat64ArrayFrom1() {
  let TAG = 'testFloat64ArrayFrom1'
  try {
    let array = Float64Array.from([1, 2, 3]);
    if (array[0] !== 1 || array[1] !== 2 || array[2] !== 3) {
      throw new Error(`${TAG} Float64Array.from failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testFloat64ArrayOf1() {
  let TAG = 'testFloat64ArrayOf1'
  try {
    let array = Float64Array.of(21, 31);
    if (array[0] !== 21 || array[1] !== 31) {
      throw new Error(`${TAG} Float64Array.of failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testFloat64ArrayByteOffset1() {
  let TAG = 'testFloat64ArrayByteOffset1'
  try {
    const buffer = new ArrayBuffer(32);
    const arrayOffSet0 = new Float64Array(buffer);
    if (arrayOffSet0.byteOffset !== 0) {
      throw new Error(`${TAG} Float64Array byteOffset failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testFloat64ArrayByteLength1() {
  let TAG = 'testFloat64ArrayByteLength1'
  try {
    const buffer = new ArrayBuffer(32);
    const arrayOffSet0 = new Float64Array(buffer);
    if (arrayOffSet0.byteLength !== 32) {
      throw new Error(`${TAG} Float64Array byteLength failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testFloat64ArrayBuffer1() {
  let TAG = 'testFloat64ArrayBuffer1'
  try {
    const buffer = new ArrayBuffer(32);
    const arrayOffSet0 = new Float64Array(buffer);
    if (arrayOffSet0.buffer.byteLength !== 32) {
      throw new Error(`${TAG} Float64Array buffer failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testFloat64ArrayLength1() {
  let TAG = 'testFloat64ArrayLength1'
  try {
    const buffer = new ArrayBuffer(32);
    const arrayOffSet0 = new Float64Array(buffer);
    if (arrayOffSet0.length !== 4) {
      throw new Error(`${TAG} Float64Array length failed`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}