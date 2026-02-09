'use static'
import { stream } from '@kit.ArkTS';
import { TestReadable, TestWritable, writeSuccess } from './importclass';


export function writableStreamWrite() {
  let TAG = 'writableStreamWrite'
  try {
    try {
      let writableStream = new TestWritable();
      writableStream.write();
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
      if (err.message !== 'Parameter error. The type of undefined must be string or UintArray') {
        throw new Error(`${TAG} value.toString() invalid: ${err.message.toString()}`)
      }
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function writableStreamEnd() {
  let TAG = 'writableStreamEnd'
  try {
    try {
      let writableStream = new TestWritable();
      let res = writableStream.end('finish');
      if (res.writable !== false) {
        throw new Error(`${TAG} value.toString() invalid: ${res.writable.toString()}`)
      }
      if (writeSuccess !== true) {
        throw new Error(`${TAG} value.toString() invalid: ${writeSuccess.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function setDefaultEncoding() {
  let TAG = 'setDefaultEncoding'
  try {
    try {
      const x = new stream.Writable;
      if (x.setDefaultEncoding() !== false) {
        throw new Error(`${TAG} value.toString() invalid: ${x.setDefaultEncoding().toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function readableStreamResume() {
  let TAG = ' readableStreamResume'
  try {
    try {
      let readableStream = new TestReadable();
      readableStream.resume();
      if (readableStream.isPaused() !== false) {
        throw new Error(`${TAG} value.toString() invalid: ${readableStream.isPaused().toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function readableStreamRead() {
  let TAG = 'readableStreamRead'
  try {
    try {
      let readableStream = new TestReadable();
      let dataChunk = readableStream.read();
      if (dataChunk !== null) {
        throw new Error(`${TAG} value.toString() invalid: ${dataChunk.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function readableStreamPause() {
  let TAG = 'readableStreamPause'
  try {
    try {
      let readableStream = new TestReadable();
      readableStream.pause();
      if (readableStream.isPaused() !== false) {
        throw new Error(`${TAG} value.toString() invalid: ${readableStream.isPaused().toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function readableStreamIsPaused() {
  let TAG = 'readableStreamIsPaused'
  try {
    try {
      let readableStream = new TestReadable();
      if (readableStream.isPaused() !== false) {
        throw new Error(`${TAG} value.toString() invalid: ${readableStream.isPaused().toString()}`)
      }
      readableStream.pause();
      if (readableStream.isPaused() !== true) {
        throw new Error(`${TAG} value.toString() invalid: ${readableStream.isPaused().toString()}`)
      }
      readableStream.resume();
      if (readableStream.isPaused() !== false) {
        throw new Error(`${TAG} value.toString() invalid: ${readableStream.isPaused().toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

class TestWritable3 extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    callback.unsafeCall(new Error());
  }
}

export function writableStreamOn() {
  let TAG = 'writableStreamOn'
  try {
    try {
      let callbackwriteSuccess = false;
      let writable = new TestWritable3();
      writable.on('error', () => {
        console.info('Writable event test', callbackwriteSuccess.toString());
      })
      writable.write('hello', 'utf8', () => {
      })
      if (writable.write('hello', 'utf8', () => {
      }).toString() !== 'false') {
        throw new Error(`${TAG} value.toString() invalid: ${writable.write('hello', 'utf8', () => {
        }).toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

class TestReadable2 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: number) {
    // this.readable.push('test');
    // this.readable.push(null);
  }
}

class TestWritable2 extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let TAG = 'TestWritable2_doWrite'
    if (chunk !== 'test') {
      throw new Error(`${TAG} value.toString() invalid: ${chunk.toString()}`)
    }
    console.info('Readable test pipe', chunk);
    callback.unsafeCall();
  }
}

export function readAblePipe() {
  let TAG = 'readAblePipe'
  try {
    try {

      let readable = new TestReadable2();
      let writable = new TestWritable2();
      readable.pipe(writable);
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

class TestReadable4 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: number) {
    
  }
}

class TestWritable4 extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let TAG = 'TestWritable4_doWrite'
    if (chunk !== 'test') {
      throw new Error(`${TAG} value.toString() invalid: ${chunk.toString()}`)
    }
    let aaa = true;
    console.info('Readable test pipe', chunk);
    callback.unsafeCall();
  }
}
export function readAbleUnpipe() {
  let TAG = 'readAbleUnpipe'
  try {
    try {
            let readable = new TestReadable4();
      let writable = new TestWritable4();
      let aaa = false;
      readable.pipe(writable);
      readable.unpipe(writable);
      readable.on('data', () => {
        console.info('Readable test unpipe data event writeSuccess');
      })
      setTimeout(() => {
        if (aaa !== false) {
          throw new Error(`${TAG} value.toString() invalid: ${aaa.toString()}`)
        }
        console.log('Readable test pipe true');

      });
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

class TestReadable1 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: number) {
    throw new Error('Simulated error');
  }
}

export function readAbleOff() {
  let TAG = 'readAbleOff'
  try {
    try {
      let readable = new TestReadable1();
      let writeSuccess = false;
      readable.push('test');
      readable.on('close', () => {
        writeSuccess = true;
      });
      readable.off('close');
      setTimeout(() => {
        if (writeSuccess !== false) {
          throw new Error(`${TAG} value.toString() invalid: ${writeSuccess.toString()}`)
        }
      });
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}


export function streamDuplex() {
  let TAG = 'streamDuplex'
  try {
    try {
      let x = new stream.Duplex();
      console.error(`${TAG} catch error: ${x.writableObjectMode}`);
      if (x.writableObjectMode !== false) {
        throw new Error(`${TAG} value.toString() invalid: ${x.writableObjectMode.toString()}`)
      }
    } catch (err) {
      console.error(`${TAG} failed, error: ${err.message}`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`)
  }
}

