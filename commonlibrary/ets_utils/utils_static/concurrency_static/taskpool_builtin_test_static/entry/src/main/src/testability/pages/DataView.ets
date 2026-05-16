'use static'

export function testDataViewSetuint32() {
  let TAG = 'testDataViewSetuint'
  try {
    const buffer = new ArrayBuffer(16);
    const dView = new DataView(buffer);
    dView.setUint32(0, 3);
    let value = dView.getUint32(1);
    if (value.toString() != '768') {
      throw new Error(`${TAG} value.toString() invalid: ${value.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}



export function testDataViewSetuint16() {
  let TAG = 'testDataViewSetuint'
  try {
    const buffer = new ArrayBuffer(8);
    const dView = new DataView(buffer);
    dView.setUint16(0, 3);
    let value = dView.getUint16(0);
    if (value.toString() != '3') {
      throw new Error(`${TAG} value.toString() invalid: ${value.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}



export function testDataViewSetuint8() {
  let TAG = 'testDataViewSetuint'
  try {
    const buffer = new ArrayBuffer(64);
    const dView = new DataView(buffer);
    dView.setUint8(0, 3);
    let value = dView.getUint8(1);
    if (value.toString() != '0') {
      throw new Error(`${TAG} value.toString() invalid: ${value.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testDataViewSetInt32() {
  let TAG = 'testDataViewSetInt32'
  try {
    const buffer = new ArrayBuffer(64);
    const dView = new DataView(buffer);
    dView.setInt32(0, 3);
    let value = dView.getInt32(1);
    if (value.toString() != '768') {
      throw new Error(`${TAG} value.toString() invalid: ${value.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testDataViewSetInt16() {
  let TAG = 'testDataViewSetInt16'
  try {
    try {
      const buffer = new ArrayBuffer(64);
      const dView = new DataView(buffer);
      dView.setInt16(-1, 3);
      let value = dView.getInt16(0);
    } catch (err) {
      if (err.message != 'getIndex < 0') {
        throw new Error(`${TAG} value.toString() invalid: ${err.message}`)
      }
    }

  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testDataViewSetInt8() {
  let TAG = 'testDataViewSetInt8'
  try {
    const buffer = new ArrayBuffer(64);
    const dView = new DataView(buffer);
    dView.setInt8(5, 3);
    let value = dView.getUint8(1);
    if (value.toString() != '0') {
      throw new Error(`${TAG} value.toString() invalid: ${value.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testDataViewSetFloat64() {
  let TAG = 'testDataViewSetFloat64'
  try {
    let value = new ArrayBuffer(16);
    let dView = new DataView(value);
    dView.setFloat64(0, 3);
    let result = dView.getFloat64(1);
    if (result.toString() != '3.785766995733679e-270') {
      throw new Error(`${TAG} value.toString() invalid: ${result.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testDataViewSetFloat32() {
  let TAG = 'testDataViewSetFloat32'
  try {
    const dataView = new DataView(new ArrayBuffer(4));
    const value = dataView.getFloat32(0);
    if (value.toString() != '0') {
      throw new Error(`${TAG} value.toString() invalid: ${value.toString()}`)
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function testDataViewSetBigUint64_4100() {
  const TAG = 'testDataViewSetBigUint64_4100';
  try {
    const buffer = new ArrayBuffer(10);
    const dView = new DataView(buffer);
    dView.setBigUint64(1, 4n);
    const value = dView.getBigUint64(1);
    if (value !== 4n) {
      throw new Error(`${TAG} value=${value}`);
    }

  } catch (err) {
    throw new Error(`${TAG} failed: ${err.message}`);
  }
}


export function testDataViewSetBigInt64_4600() {
  const TAG = 'testDataViewSetBigInt64_4600';
  try {
    const buffer = new ArrayBuffer(16);
    const dView = new DataView(buffer);
    dView.setBigInt64(0, 4n);
    const value = dView.getBigInt64(1);
    if (value.toString() !== '1024') {
      throw new Error(`${TAG} value=${value}`);
    }
  } catch (err) {
    throw new Error(`${TAG} failed: ${err.message}`);
  }
}


export function testDataViewByteOffset_5100() {
  const TAG = 'testDataViewByteOffset_5100';
  try {
    const buffer = new ArrayBuffer(8);
    const dataview = new DataView(buffer);
    const value = dataview.byteOffset;
    if (value !== 0) {
      throw new Error(`${TAG} value=${value}`);
    }
  } catch (err) {
    throw new Error(`${TAG} failed: ${err.message}`);
  }
}





export function testDataViewGetBigInt64() {
  const TAG = 'testDataViewGetBigInt64';
  try {
    const dataView = new DataView(new ArrayBuffer(8));
    const value = dataView.getBigInt64(0);
    if (value.toString() !== '0') {
      throw new Error(`${TAG} value=${value}`);
    }
  } catch (err) {
    throw new Error(`${TAG} failed: ${err.message}`);
  }
}


export function testDataViewGetBigUint64() {
  const TAG = 'testDataViewGetBigUint64';
  try {
    const dataView = new DataView(new ArrayBuffer(8));
    const value = dataView.getBigUint64(0);
    if (value.toString() !== '0') {
      throw new Error(`${TAG} value=${value}`);
    }
  } catch (err) {
    throw new Error(`${TAG} failed: ${err.message}`);
  }
}


export function testDataViewGetFloat32() {
  const TAG = 'testDataViewGetFloat32';
  try {
    const dataView = new DataView(new ArrayBuffer(4));
    const value = dataView.getFloat32(0);
    if (value !== 0) {
      throw new Error(`${TAG} value=${value}`);
    }
  } catch (err) {
    throw new Error(`${TAG} failed: ${err.message}`);
  }
}


export function testDataViewGetFloat64() {
  const TAG = 'testDataViewGetFloat64';
  try {
    const buffer = new ArrayBuffer(8);
    const dataview = new DataView(buffer);
    const res = dataview.getFloat64(0);
    if (res !== 0) {
      throw new Error(`${TAG} value=${res}`);
    }
  } catch (err) {
    throw new Error(`${TAG} failed: ${err.message}`);
  }
}


export function testDataViewGetInt8() {
  const TAG = 'testDataViewGetInt8';
  try {
    const buffer = new ArrayBuffer(16);
    const view = new DataView(buffer);
    const result = view.getInt8(0);
    if (result !== 0) {
      throw new Error(`${TAG} value=${result}`);
    }
  } catch (err) {
    throw new Error(`${TAG} failed: ${err.message}`);
  }
}


export function testDataViewGetInt16() {
  const TAG = 'testDataViewGetInt16';
  try {
    const buffer = new ArrayBuffer(8);
    const dataView = new DataView(buffer);
    const result = dataView.getInt16(0);
    if (result !== 0) {
      throw new Error(`${TAG} value=${result}`);
    }
  } catch (err) {
    throw new Error(`${TAG} failed: ${err.message}`);
  }
}


export function testDataViewGetInt32() {
  const TAG = 'testDataViewGetInt32';
  try {
    const buffer = new ArrayBuffer(8);
    const dataView = new DataView(buffer);
    const result = dataView.getInt32(0);
    if (result !== 0) {
      throw new Error(`${TAG} value=${result}`);
    }
  } catch (err) {
    throw new Error(`${TAG} failed: ${err.message}`);
  }
}


export function testDataViewGetUint8() {
  const TAG = 'testDataViewGetUint8';
  try {
    const buffer = new ArrayBuffer(8);
    const dataView = new DataView(buffer);
    const result = dataView.getUint8(0);
    if (result !== 0) {
      throw new Error(`${TAG} value=${result}`);
    }
  } catch (err) {
    throw new Error(`${TAG} failed: ${err.message}`);
  }
}


export function testDataViewGetUint16() {
  const TAG = 'testDataViewGetUint16';
  try {
    const buffer = new ArrayBuffer(8);
    const dataView = new DataView(buffer);
    const result = dataView.getUint16(0);
    if (result !== 0) {
      throw new Error(`${TAG} value=${result}`);
    }
  } catch (err) {
    throw new Error(`${TAG} failed: ${err.message}`);
  }
}


export function testDataViewGetUint32() {
  const TAG = 'testDataViewGetUint32';
  try {
    const buffer = new ArrayBuffer(8);
    const dataView = new DataView(buffer);
    const result = dataView.getUint32(0);
    if (result !== 0) {
      throw new Error(`${TAG} value=${result}`);
    }
  } catch (err) {
    throw new Error(`${TAG} failed: ${err.message}`);
  }
}


export function testDataViewByteLength() {
  const TAG = 'testDataViewByteLength';
  try {
    const buffer = new ArrayBuffer(8);
    const dataView = new DataView(buffer);
    const len = dataView.buffer.byteLength;
    if (len !== 8) {
      throw new Error(`${TAG} len=${len}`);
    }
  } catch (err) {
    throw new Error(`${TAG} failed: ${err.message}`);
  }
}