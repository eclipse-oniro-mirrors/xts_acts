/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from "../../../hypium/index";
import buffer from "@ohos.buffer";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import stream from '@ohos.util.stream';
import util from '@ohos.util';

class MyWritable003 extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall(new Error());
    expect(this.writable).assertEqual(false);
  }
}

class MyWritable005 extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    let fn = (chunk: string | Uint8Array, encoding: string, callback: Function) => { }
    let wrappedFn = mustCall(fn, 0);
    wrappedFn.unsafeCall(chunk, encoding, callback);
  }
}

class MyWritableCbError001 extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall(new Error());
  }
}

class MyWritableCbTwice001 extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    let func: Function = (chunk: string | Uint8Array, encoding: string, callback: Function): void => {
        callback.unsafeCall();
        callback.unsafeCall();
    }
    let wrappedFn: Function = mustCallDoWrite(func);
    wrappedFn(chunk, encoding, callback);
  }
}

class MyWritableCbTwice002 extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
    setTimeout(() => {
      callback.unsafeCall();
    }, 0);
  }
}

class MyWritableCbTwice003 extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    setTimeout(() => {
      callback.unsafeCall();
    }, 0);
    setTimeout(() => {
      callback.unsafeCall();
    }, 0);
  }
}

class MyWritableWriteError001 extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
  }
}

class MyWritableWriteError003 extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

class MyWritableWritevFinish001 extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall(new Error('write test error'));
  }
}

class MyWritableWritevFinish002 extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    setTimeout(() => {
      callback.unsafeCall(new Error('write error'));
    });
  }
}

class MyWritableEndedState001 extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(this.writableEnded).assertEqual(false);
    callback.unsafeCall();
  }
}

class MyWritableFinished002 extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(this.writableFinished).assertEqual(false);
    callback.unsafeCall();
  }
}

class MyWritableProperties005 extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    setTimeout(() => {
      callback.unsafeCall();
    });
  }
}

class MyWritableProperties010 extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    setTimeout(() => {
      callback.unsafeCall();
    }, 10);
  }
}

let dataWritten_Cork001 = '';
class MyWritableCork001 extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    dataWritten_Cork001 += chunk;
    callback.unsafeCall();
  }
}

let dataWritten_Cork002 = '';
class MyWritableCork002 extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    dataWritten_Cork002 += chunk;
    callback.unsafeCall();
  }
}

let dataWritten_Cork003 = '';
class MyWritableCork003 extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    dataWritten_Cork003 += chunk;
    callback.unsafeCall();
  }
}

class MyWritableDrain001 extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    setTimeout(() => {
      callback.unsafeCall();
    }, 0);
  }
}

let doWriteVCalled_Writev001 = false;
class MyWritableWritev001 extends stream.Writable {
  constructor() {
    super();
  }
  doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
    let fn = (chunks: string[] | Uint8Array[], callback: Function) => {
      doWriteVCalled_Writev001 = true;
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWritev(fn);
    wrappedFn.unsafeCall(chunks, callback);
  }
}

class MyDuplexEnd001 extends stream.Duplex {
  constructor() {
    super();
  }
  doRead(size: int): void {
  }
}

class MyDuplexWritableFinished002 extends stream.Duplex {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    expect(this.writableFinished).assertEqual(false);
    callback.unsafeCall();
  }
}

let written_001: string | Uint8Array = '';
class MyDuplex001 extends stream.Duplex {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    written_001 = chunk;
    callback.unsafeCall();
  }
  doRead(size: int): void {
  }
}

class MyDuplex002 extends stream.Duplex {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
  doRead(size: int): void {
    let fn = (size: int) => {
      expect(size).assertEqual(16384);
      this.push('duplex test');
      this.push(null);
    }
    let wrappedFn = mustCallSizeArgs(fn);
    wrappedFn.unsafeCall(size);
  }
}

class MyReadableProperties003 extends stream.Readable {
  constructor() {
    super();
  }
  doRead(size: int): void {
    throw new Error('Simulated error');
  }
}

class MyReadableProperties005 extends stream.Readable {
  constructor() {
    super();
  }
  doRead(size: int): void {
  }
}

let dRCalled_ConstructorSetMethods001 = true;
class MyReadableConstructorSetMethods001 extends stream.Readable {
  constructor() {
    super();
  }
  doRead(size: int): void {
    this.push(null);
    dRCalled_ConstructorSetMethods001 = true;
  }
}

let dataSource_Data002 = ["x"];
class MyReadableData002 extends stream.Readable {
  constructor() {
    super();
  }
  doRead(size: int): void {
    let data = dataSource_Data002.shift();
    this.push(data);
  }
}

let dataSource_Data003 = ["1"];
class MyReadableData003 extends stream.Readable {
  constructor() {
    super()
  }

  constructor(opt: stream.ReadableOptions) {
    super(opt)
  }

  doRead(size: int): void {
    const chunk: String|undefined = dataSource_Data003.shift();
    if (chunk !== undefined) {
      this.push(chunk);
    } else {
      this.push(null);
    }
  }
}

class MyReadableData006 extends stream.Readable {
  constructor() {
    super()
  }

  constructor(opt: stream.ReadableOptions) {
    super(opt)
  }

  doRead(size: int): void {
    this.push('first');
    this.push('second');
    this.push(null);
  }
}

class MyReadableData007 extends stream.Readable {
  constructor() {
    super()
  }

  constructor(opt: stream.ReadableOptions) {
    super(opt)
  }

  doRead(size: int): void {
    this.push(null);
  }
}

class MyReadableData008 extends stream.Readable {
  constructor() {
    super()
  }

  constructor(opt: stream.ReadableOptions) {
    super(opt)
  }

  doRead(size: int): void {
    this.push('data');
    this.push(null);
  }
}

class MyReadableData010 extends stream.Readable {
  constructor() {
    super()
  }

  constructor(opt: stream.ReadableOptions) {
    super(opt)
  }

  doRead(size: int): void {
    this.push('data');
    this.push(null);
  }
}

class MyReadableData011 extends stream.Readable {
  constructor() {
    super()
  }

  constructor(opt: stream.ReadableOptions) {
    super(opt)
  }

  doRead(size: int): void {
    setTimeout(() => {
      this.push('async');
      this.push(null);
    }, 100);
  }
}

class MyReadableEnded002 extends TestReadable {
  constructor() {
    super()
  }

  doRead(size: int): void {
    expect(this.readableEnded).assertEqual(false);
    this.push('asd');
    expect(this.readableEnded).assertEqual(false);
    this.push(null);
    expect(this.readableEnded).assertEqual(false);
  }
}

let count_Hwm0Async001 = 5;
class MyReadableHwm0Async001 extends stream.Readable {
  constructor() {
    super()
  }

  doRead(size: int): void {
    setTimeout(() => {
      if (count_Hwm0Async001--) {
        this.push('a');
      } else {
        this.push(null);
      }
    }, 0);
  }
}

class MyTransformCallbackTwice001 extends stream.Transform {
  constructor() {
    super()
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    callback.unsafeCall();
    callback.unsafeCall();
  }
}

class MyTransform001 extends stream.Transform {
  constructor() {
    super()
  }

  doTransform(chunk: string, encoding: string, next: Function): void {
    let transformedChunk = chunk.toString().toUpperCase();
    this.push(transformedChunk);
    next.unsafeCall();
  }
}

class MyTransform002 extends stream.Transform {
  constructor() {
    super()
  }

  doTransform(chunk: string, encoding: string, next: Function): void {
    next.unsafeCall();
  }
}

let doInitializeCalled_003 = false;
class MyTransform003 extends stream.Transform {
  doInitialize(callback: Function) {
    super.doInitialize(callback);
    doInitializeCalled_003 = true;
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    super.doWrite(chunk, encoding, callback);
  }
}

let dataSource_005 = ["x"];
class MyTransform005 extends stream.Transform {
  constructor() {
    super()
  }

  doRead(size: int): void {
    let data = dataSource_005.shift();
    this.push(data);
  }
}

let doReadCalled_012 = false;
class MyTransform012 extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function) {
    callback.unsafeCall();
  }

  doRead(size: int): void {
    let fn = (size: int) => {
      doReadCalled_012 = true;
    }
    let wrappedFn = mustCallSizeArgs(fn);
    wrappedFn(size);
  }
}

class MyTransformEvent001 extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function) {
    let transformedChunk = chunk.toString().toUpperCase();
    this.push(transformedChunk);
    callback.unsafeCall();
  }
}

class MyTransformEvent002 extends stream.Transform {
  constructor() {
    super();
  }

  doWritev(chunks: string[] | Uint8Array[], callback: Function): void{
    callback.unsafeCall();
  }

  doTransform(chunk: string, encoding: string, callback: Function) {
    let fn = (chunk: string, encoding: string, callback: Function) => {
      expect(chunk).assertEqual('data1');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoTransform(fn);
    wrappedFn(chunk, encoding, callback);
  }
}

class MyTransformEvent003 extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function) {
    let fn = (chunk: string, encoding: string, callback: Function) => {
      expect(chunk).assertEqual('test');
      callback.unsafeCall(new Error('Write error'));
    }
    let wrappedFn = mustCallDoTransform(fn);
    wrappedFn(chunk, encoding, callback);
  }
}

class MyReadablePipe003 extends TestReadable {
  constructor() {
    super();
  }
  doRead(size: int): void {
    this.push('test data');
    this.push(null);
  }
}
class MyWritablePipe003 extends CustomWritable {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    let fn = (chunk: string | Uint8Array, encoding: string, callback: Function) => {
      expect(chunk as string).assertEqual('test data');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn);
    wrappedFn(chunk, encoding, callback);
  }
}

class MyReadablePipe009 extends stream.Readable {
  constructor() {
    super()
  }

  doRead(size: int): void {
    this.push(null);
  }
}

class MyWriteablePipe009 extends stream.Writable {
  constructor() {
    super()

  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

let callCount_Pipe015 = 0;
class Pipe015MyReadable extends stream.Readable {
  constructor() {
    super();
  }

  constructor(opt: stream.ReadableOptions) {
    super(opt);
  }

  doRead(size: int): void {
    this.push('data1');
    this.push('data2');
    this.push(null);
  }
}
class Pipe015MyWriteable extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callCount_Pipe015 ++;
    callback.unsafeCall();
  }
}

let callCount_Pipe018 = 0;
class Pipe018MyReadable extends stream.Readable {
  constructor() {
    super()
  }

  constructor(opt: stream.ReadableOptions) {
    super(opt)
  }

  doRead(size: int): void {
    this.push('data1');
    this.push('data2');
    this.push('data3');
    this.push(null);
  }
}
class Pipe018MyWriteable extends stream.Writable {
  constructor() {
    super()

  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callCount_Pipe018 ++;
    callback.unsafeCall();
  }
}

class DuplexDoWritev001 extends stream.Duplex {
  data: string;

  constructor() {
    super();
    this.data = '';
  }

  doWritev(chunks: string[] | Uint8Array[], callback: Function) {
    for (const chunk of chunks) {
      this.data += chunk
    }
    callback.unsafeCall();
  }
}

class Encoding001 extends stream.Writable {
  constructor() {
    super()
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string, encoding: string, callback: Function) => {
      expect(chunk).assertEqual('测试');
      expect(encoding).assertEqual('gb18030');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding002 extends stream.Writable {
  constructor() {
    super()
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string, encoding: string, callback: Function) => {
      expect(chunk).assertEqual('你好');
      expect(encoding).assertEqual('gbk');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding003 extends stream.Writable {
  constructor() {
    super()
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string, encoding: string, callback: Function) => {
      expect(chunk).assertEqual('你好');
      expect(encoding).assertEqual('gb2312');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding004 extends stream.Writable {
  constructor() {
    super()
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string, encoding: string, callback: Function) => {
      expect(chunk).assertEqual('测试');
      expect(encoding).assertEqual('gb18030');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding005 extends stream.Writable {
  constructor() {
    super()
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string, encoding: string, callback: Function) => {
      expect(chunk).assertEqual('你好');
      expect(encoding).assertEqual('gbk');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding006 extends stream.Writable {
  constructor() {
    super()
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string, encoding: string, callback: Function) => {
      expect(chunk).assertEqual('你好');
      expect(encoding).assertEqual('gb2312');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding007 extends stream.Writable {
  constructor() {
    super()
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string, encoding: string, callback: Function) => {
      expect(chunk).assertEqual('你好');
      expect(encoding).assertEqual('gb18030');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding008 extends stream.Writable {
  constructor() {
    super()
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string, encoding: string, callback: Function) => {
      expect(chunk).assertEqual('你好');
      expect(encoding).assertEqual('gbk');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding009 extends stream.Writable {
  constructor() {
    super()
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string, encoding: string, callback: Function) => {
      expect(chunk).assertEqual('你好');
      expect(encoding).assertEqual('gb2312');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding016 extends stream.Duplex {
  constructor() {
    super()
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string, encoding: string, callback: Function) => {
      expect(chunk).assertEqual('你好');
      expect(encoding).assertEqual('gb18030');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding017 extends stream.Duplex {
  constructor() {
    super()
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string, encoding: string, callback: Function) => {
      expect(chunk).assertEqual('你好');
      expect(encoding).assertEqual('gbk');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding018 extends stream.Duplex {
  constructor() {
    super()
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string, encoding: string, callback: Function) => {
      expect(chunk).assertEqual('你好');
      expect(encoding).assertEqual('gb2312');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding019 extends stream.Duplex {
  constructor() {
    super()
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string, encoding: string, callback: Function) => {
      expect(chunk).assertEqual('测试');
      expect(encoding).assertEqual('gb18030');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding020 extends stream.Duplex {
  constructor() {
    super()
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string, encoding: string, callback: Function) => {
      expect(chunk).assertEqual('测试');
      expect(encoding).assertEqual('gbk');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding021 extends stream.Duplex {
  constructor() {
    super()
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string, encoding: string, callback: Function) => {
      expect(chunk).assertEqual('测试');
      expect(encoding).assertEqual('gb2312');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding022 extends stream.Duplex {
  constructor() {
    super()
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string, encoding: string, callback: Function) => {
      expect(encoding).assertEqual('gb18030');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding023 extends stream.Duplex {
  constructor() {
    super()
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string, encoding: string, callback: Function) => {
      expect(encoding).assertEqual('gbk');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding024 extends stream.Duplex {
  constructor() {
    super()
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string, encoding: string, callback: Function) => {
      expect(encoding).assertEqual('gb2312');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding025 extends stream.Transform {
  constructor() {
    super()
  }
  doTransform(chunk: string, encoding: string, callback: Function) {
    let fn = (chunk: string, encoding: string, callback: Function) => {
      expect(encoding).assertEqual('gb18030');
      expect(chunk).assertEqual('你好123');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoTransform(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding026 extends stream.Transform {
  constructor() {
    super()
  }
  doTransform(chunk: string, encoding: string, callback: Function) {
    let fn = (chunk: string, encoding: string, callback: Function) => {
      expect(encoding).assertEqual('gbk');
      expect(chunk).assertEqual('你好123');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoTransform(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding027 extends stream.Transform {
  constructor() {
    super()
  }
  doTransform(chunk: string, encoding: string, callback: Function) {
    let fn = (chunk: string, encoding: string, callback: Function) => {
      expect(encoding).assertEqual('gb2312');
      expect(chunk).assertEqual('你好123');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoTransform(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding028_34 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: int) {
  }
}

class WritableUintArr001 extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    callback.unsafeCall(new Error());
    expect(this.writable).assertEqual(false);
  }
}

class WritableUintArr003 extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    setTimeout(() => {
      callback.unsafeCall(new Error('new error'));
    }, 0);
  }
}

class WritableUintArrCbTwice002 extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    callback.unsafeCall();
    setTimeout(() => {
      callback.unsafeCall();
    }, 0);
  }
}

class WritableUintArrCbTwice003 extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    setTimeout(() => {
      callback.unsafeCall();
    }, 0);
    setTimeout(() => {
      callback.unsafeCall();
    }, 0);
  }
}

class WritableUintArrConstructorSetMethods001 extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    callback.unsafeCall();
  }

  doWritev(chunk: Array<String>|Array<Uint8Array>, callback: Function) {
    expect(chunk.length).assertEqual(2);
    callback.unsafeCall();
  }
}

class WritableUintArrProperties001 extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    setTimeout(() => {
      callback.unsafeCall();
    });
  }
}

let T_Cork0010203 = new Uint8Array(0);
class WritableUintArrCork0010203 extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    if (chunk instanceof Uint8Array) {
      const merged = new Uint8Array(T_Cork0010203.length + chunk.length);
      merged.set(T_Cork0010203);
      merged.set(chunk, T_Cork0010203.length);
      T_Cork0010203 = merged;
    }
    callback.unsafeCall();
  }
}

class WritableUintArrDrain001 extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    setTimeout(() => {
      callback.unsafeCall();
    }, 0);
  }
}

let doWriteVCalled_WritevUintArr001 = false;
class WritableWritevUintArr001 extends stream.Writable {
  constructor() {
    super();
  }

  doWritev(chunk: string[] | Uint8Array[], cb: Function) {
    doWriteVCalled_WritevUintArr001 = false;
    let fn = (chunk: string[] | Uint8Array[], cb: Function) => {
      doWriteVCalled_WritevUintArr001 = true;
      cb.unsafeCall();
    }
    let wrappedFn = mustCallDoWritev(fn, 1);
    wrappedFn(chunk, cb);
  }
}

class Encoding04041 extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string | Uint8Array, encoding: string, callback: Function) => {
      expect(chunk).assertEqual('你好');
      expect(encoding).assertEqual('GBK');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding042 extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string | Uint8Array, encoding: string, callback: Function) => {
      expect(chunk).assertEqual('你好');
      expect(encoding).assertEqual('gbk');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding04344 extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string | Uint8Array, encoding: string, callback: Function) => {
      expect(chunk).assertEqual('你好');
      expect(encoding).assertEqual('GB2312');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding045 extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string | Uint8Array, encoding: string, callback: Function) => {
      expect(chunk).assertEqual('你好');
      expect(encoding).assertEqual('gb2312');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding04647 extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string | Uint8Array, encoding: string, callback: Function) => {
      expect(chunk).assertEqual('你好');
      expect(encoding).assertEqual('GB18030');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding048 extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string | Uint8Array, encoding: string, callback: Function) => {
      expect(chunk).assertEqual('你好');
      expect(encoding).assertEqual('gb18030');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding049 extends stream.Duplex {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string | Uint8Array, encoding: string, callback: Function) => {
      expect(chunk).assertEqual('你好');
      expect(encoding).assertEqual('GBK');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding050 extends stream.Duplex {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string | Uint8Array, encoding: string, callback: Function) => {
      expect(chunk).assertEqual('测试');
      expect(encoding).assertEqual('GBK');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding051 extends stream.Duplex {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string | Uint8Array, encoding: string, callback: Function) => {
      expect(encoding).assertEqual('gbk');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding052 extends stream.Duplex {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string | Uint8Array, encoding: string, callback: Function) => {
      expect(chunk).assertEqual('你好');
      expect(encoding).assertEqual('GB2312');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding053 extends stream.Duplex {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string | Uint8Array, encoding: string, callback: Function) => {
      expect(chunk).assertEqual('测试');
      expect(encoding).assertEqual('GB2312');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding054 extends stream.Duplex {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string | Uint8Array, encoding: string, callback: Function) => {
      expect(encoding).assertEqual('gb2312');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding055 extends stream.Duplex {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string | Uint8Array, encoding: string, callback: Function) => {
      expect(chunk).assertEqual('你好');
      expect(encoding).assertEqual('GB18030');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding056 extends stream.Duplex {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string | Uint8Array, encoding: string, callback: Function) => {
      expect(chunk).assertEqual('测试');
      expect(encoding).assertEqual('GB18030');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class Encoding057 extends stream.Duplex {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    let fn = (chunk: string | Uint8Array, encoding: string, callback: Function) => {
      expect(encoding).assertEqual('gb18030');
      callback.unsafeCall();
    }
    let wrappedFn = mustCallDoWrite(fn, 1);
    wrappedFn(chunk, encoding, callback);
  }
}

class WriteProperty extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
  }
}

class ReadableProperty extends stream.Readable {
  constructor() {
    super();
  }
  doRead(size: int): void {
  }
}

class DuplexProperty extends stream.Duplex {
  constructor() {
    super();
  }
  doRead(size: int): void {
  }
}

export default function streamTest() {
  describe('streamTest',(): void =>  {
    afterEach(async () => {
      await mustCallCheckAll();
    })

    /**
     * @tc.name   testStreamWritable001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_00100
     * @tc.desc   Create a writable stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStreamWritable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let writableStream = new stream.Writable();
      expect(writableStream.writable).assertEqual(true);
      writableStream.end();
      expect(writableStream.writable).assertEqual(false);
    });

    /**
     * @tc.name   testStreamWritable002
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_00200
     * @tc.desc   The state when closing the flow.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStreamWritable002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let writableStream = new stream.Writable();
      expect(writableStream.writable).assertEqual(true);
      writableStream.end();
      expect(writableStream.writable).assertEqual(false);
      expect(writableStream.writableEnded).assertEqual(true);
    })

    /**
     * @tc.name   testStreamWritable003
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_00300
     * @tc.desc   The state of the writable attribute of a writable stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStreamWritable003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let writableStream = new MyWritable003();
      expect(writableStream.writable).assertEqual(true);
      writableStream.write('test');
      expect(writableStream.writable).assertEqual(false);
      writableStream.on('error', mustCall());
    });

    /**
     * @tc.name   testStreamWritable005
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_00500
     * @tc.desc   DoWrite not called.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testStreamWritable005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let writableStream = new MyWritable005();
      expect(writableStream.writable).assertEqual(true);
      writableStream.end();
      expect(writableStream.writable).assertEqual(false);
    });

    /**
     * @tc.name   testStreamWritableCbError001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_00600
     * @tc.desc   Write data failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStreamWritableCbError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let callbackCalled = false;
      let writable = new MyWritableCbError001();
      writable.on('error', mustCall(() => {
        expect(callbackCalled).assertEqual(true);
      }));
      writable.write('hello', 'utf8', mustCall(() => {
        callbackCalled = true;
      }));
    });

    /**
     * @tc.name   testStreamWritableCbError002
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_00700
     * @tc.desc   Write data failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStreamWritableCbError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let writableStream = new MyWritableCbError001();
      writableStream.on('error', () => {
      })
      let num: int = 0;
      while (writableStream.write('t')) {
        num++;
      }
      expect(num).assertEqual(0);
    });

    /**
     * @tc.name   testStreamWritableCbTwice001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_00800
     * @tc.desc   Multiple callbacks.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStreamWritableCbTwice001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let writableStream = new MyWritableCbTwice001();
      writableStream.write('test');
      writableStream.on('error', mustCallOnError((error: Error) => {
        expect(error.message).assertEqual('Callback called multiple times.');
        expect(error.name).assertEqual('BusinessError');
      }));
      await mustCallCheckAll();
    });

    /**
     * @tc.name   testStreamWritableCbTwice002
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_00900
     * @tc.desc   Multiple callbacks.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStreamWritableCbTwice002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let writableStream = new MyWritableCbTwice002();
      writableStream.write('test');
      writableStream.on('error', mustCallOnError((error: Error) => {
        expect(error.message).assertEqual('Callback called multiple times.');
        expect(error.name).assertEqual('BusinessError');
      }));
    });

    /**
     * @tc.name   testStreamWritableCbTwice003
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_01000
     * @tc.desc   Multiple callbacks.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStreamWritableCbTwice003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let writableStream = new MyWritableCbTwice003();
      writableStream.write('test');
      writableStream.on('error', mustCallOnError((error: Error) => {
        expect(error.message).assertEqual('Callback called multiple times.');
        expect(error.name).assertEqual('BusinessError');
      }));
    });

    /**
     * @tc.name   testStreamWritableWriteError001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_01100
     * @tc.desc   Write data error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStreamWritableWriteError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let writableStream = new MyWritableWriteError001();
      let ticked = false;
      writableStream.end();
      writableStream.write('test', 'utf8', mustCallOnError((error: Error) => {
        expect(ticked).assertEqual(true);
        expect(error.message).assertEqual('Write after end.');
      }));
      ticked = true;
      writableStream.on('error', mustCallOnError((error: Error) => {
        expect(error.message).assertEqual('Write after end.');
      }));
    });

    /**
     * @tc.name   testStreamWritableWriteError003
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_01300
     * @tc.desc   Write data error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStreamWritableWriteError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let err: Error = new Error();
      try {
        let writableStream = new MyWritableWriteError003();
        writableStream.write('my', 'test');
      } catch (e) {
        e = e as Error;
        err = e;
      }
      expect((err as BusinessError).message).assertEqual('Parameter error. The type of test must be string.');
    });

    /**
     * @tc.name   testStreamWritableWritevFinish001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_01400
     * @tc.desc   Finish event for different writev scenarios of writable streams.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStreamWritableWritevFinish001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): void => {
      let writableStream = new MyWritableWritevFinish001();
      writableStream.on('finish', mustNotCall());
      writableStream.on('prefinish', mustNotCall());
      writableStream.on('error', mustCallOnError((error: Error) => {
        expect(error.message).assertEqual('write test error');
      }));
      writableStream.end('my test');
      done()
    });

    /**
     * @tc.name   testStreamWritableWritevFinish002
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_01500
     * @tc.desc   Finish event for different writev scenarios of writable streams.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStreamWritableWritevFinish002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let writable = new MyWritableWritevFinish002();
      writable.on('finish', mustNotCall());
      writable.on('prefinish', mustNotCall());
      writable.on('error', mustCallOnError((error: Error) => {
        expect(error.message).assertEqual('write error');
      }));
      writable.end('my test');
    });

    /**
     * @tc.name   testStreamWritableConstructorSetMethods001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_02000
     * @tc.desc   Writable constructor Set Methods.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStreamWritableConstructorSetMethods001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let writableStream = new stream.Writable();
      let err: Error = new Error();
      try {
        writableStream.end('test');
      } catch (e) {
        e = e as Error;
        err = e;
      }
      expect((err as BusinessError).message).assertEqual('The doWrite() method is not implemented.');
    });

    /**
     * @tc.name   testStreamWritableEndedState001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_02300
     * @tc.desc   The status of writableEnded.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableEndedState001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let writableStream = new MyWritableEndedState001();
      let endCalled = false;
      expect(writableStream.writable).assertEqual(true);
      expect(writableStream.writableEnded).assertEqual(false);
      writableStream.end('testing ended', 'utf8', () => {
        expect(writableStream.writable).assertEqual(false);
        expect(writableStream.writableEnded).assertEqual(true);
        endCalled = true;
      });
      expect(writableStream.writable).assertEqual(false);
      expect(writableStream.writableEnded).assertEqual(true);
      writableStream.on('finish', () => {
        expect(endCalled).assertEqual(true);
      });
    });

    /**
     * @tc.name   testStreamWritableFinished002
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_02500
     * @tc.desc   The status of the writableFinished attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableFinished002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let writable = new MyWritableFinished002();
      writable.on('finish', mustCall(() => {
        expect(writable.writableFinished).assertEqual(true);
      }));
      writable.end('testing finished state', undefined, mustCall(() => {
        expect(writable.writableFinished).assertEqual(true);
      }));
    });

    /**
     * @tc.name   testStreamWritableFinished003
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_02600
     * @tc.desc   The status of the writableFinished attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableFinished003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let writableStream = new MyWritableWriteError003();
      let finishCalled = false;
      writableStream.end();
      writableStream.on('finish', () => {
        finishCalled = true;
      });
      writableStream.on('finish', () => {
        expect(finishCalled).assertEqual(true);
      });
    });

    /**
     * @tc.name   testStreamWritableFinished004
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_02700
     * @tc.desc   The status of the writableFinished attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableFinished004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let writableStream = new MyWritableWriteError003();
      let sync = true;
      writableStream.on('prefinish', () => {
        expect(sync).assertEqual(true);
      });
      writableStream.end();
      sync = false;
    });

    /**
     * @tc.name   testStreamWritableFinished005
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_02800
     * @tc.desc   The status of the writableFinished attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableFinished005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let sync = true;
      let writableStream = new MyWritableWriteError003();
      writableStream.on('finish', () => {
        sync = false;
      });
      writableStream.on('prefinish', () => {
        expect(sync).assertEqual(true);
      });
      writableStream.end();
      sync = false;
    });

    /**
     * @tc.name   testStreamWritableProperties001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_02900
     * @tc.desc   Writable Properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableProperties001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let writableStream = new stream.Writable();
      expect(writableStream.writableCorked).assertEqual(0);
      writableStream.uncork();
      expect(writableStream.writableCorked).assertEqual(0);
      writableStream.cork();
      expect(writableStream.writableCorked).assertEqual(1);
      writableStream.cork();
      expect(writableStream.writableCorked).assertEqual(2);
      writableStream.uncork();
      expect(writableStream.writableCorked).assertEqual(1);
      writableStream.uncork();
      expect(writableStream.writableCorked).assertEqual(0);
      writableStream.uncork();
      expect(writableStream.writableCorked).assertEqual(0);
    });

    /**
     * @tc.name   testStreamWritableProperties002
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_03000
     * @tc.desc   Writable Properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableProperties002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let writableStream = new stream.Writable();
      expect(writableStream.writableObjectMode).assertEqual(false);
    });

    /**
     * @tc.name   testStreamWritableProperties003
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_03100
     * @tc.desc   Writable Properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableProperties003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let writableStream = new stream.Writable();
      expect(writableStream.writableHighWatermark).assertEqual(16 * 1024);
    });

    /**
     * @tc.name   testStreamWritableProperties005
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_03300
     * @tc.desc   Writable Properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableProperties005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let writableStream = new MyWritableProperties005();
      writableStream.write('hello');
      expect(writableStream.writableLength).assertEqual(5);
    });

    /**
     * @tc.name   testStreamWritableProperties006
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_03400
     * @tc.desc   Writable Properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableProperties006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let writableStream = new stream.Writable();
      expect(writableStream.writableLength).assertEqual(0);
    });

    /**
     * @tc.name   testStreamWritableProperties007
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_03500
     * @tc.desc   Writable Properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableProperties007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let customWritable = new CustomWritable();
      customWritable.write('hello');
      expect(customWritable.writableLength).assertEqual(5);
    });

    /**
     * @tc.name   testStreamWritableProperties008
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_03600
     * @tc.desc   Writable Properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableProperties008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let customWritable = new CustomWritable();
      customWritable.write('hello');
      customWritable.write('world');
      expect(customWritable.writableLength).assertEqual(10);
    });

    /**
     * @tc.name   testStreamWritableProperties009
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_03700
     * @tc.desc   Writable Properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableProperties009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let customWritable = new CustomWritable();
      customWritable.write('hello');
      expect(customWritable.writableLength).assertEqual(5);
      customWritable.end();
      await customWritable.waitForFinish();
      expect(customWritable.writableLength).assertEqual(0);
    });

    /**
     * @tc.name   testStreamWritableProperties010
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_03800
     * @tc.desc   Writable Properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableProperties010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const largeData = 'ab'.repeat(Math.floor(16384 / 2).toInt());
      let writableStream = new MyWritableProperties010();
      let writeResult = writableStream.write(largeData);
      expect(writeResult).assertEqual(false);
    });

    /**
     * @tc.name   testStreamWritableProperties011
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_03900
     * @tc.desc   Writable Properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableProperties011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const largeData = 'ab'.repeat(Math.floor(16384 / 2).toInt());
      let writableStream = new CustomWritable();
      writableStream.write(largeData);
      writableStream.write(largeData, 'utf8', mustCall(() => {
      }));
      await new Promise<void>((resolve) => {
        writableStream.on('drain', (): void => {
          resolve(undefined);
        });
      });
      expect(writableStream.writable).assertEqual(true);
    });

    /**
     * @tc.name   testStreamWritableProperties012
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_04000
     * @tc.desc   Writable Properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableProperties012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const largeData = 'ab'.repeat(Math.floor(16384 / 2).toInt());
      let writableStream = new CustomWritable();
      writableStream.write(largeData);
      writableStream.on('drain', mustCall(() => {
      }));
      await writableStream.waitForDrain();
      expect(writableStream.writableEnded).assertEqual(false);
    });

    /**
     * @tc.name   testStreamWritableProperties013
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_04100
     * @tc.desc   Writable Properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableProperties013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const largeData = 'ab'.repeat(Math.floor(16384 / 2).toInt());
      let writableStream = new CustomWritable();
      writableStream.write(largeData);
      expect(writableStream.writable).assertEqual(true);
      writableStream.end();
      expect(writableStream.writable).assertEqual(false);
    });

    /**
     * @tc.name   testStreamWritableProperties014
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_04200
     * @tc.desc   Writable Properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableProperties014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let writableStream = new CustomWritable();
      expect(writableStream.writableCorked).assertEqual(0);
      writableStream.cork();
      expect(writableStream.writableCorked).assertEqual(1);
      writableStream.write('Hello ');
      writableStream.write('World!');
      writableStream.uncork();
      expect(writableStream.writableCorked).assertEqual(0);
    });

    /**
     * @tc.name   testStreamWritableProperties015
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_04300
     * @tc.desc   Writable Properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableProperties015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let errorEvent = new ErrorEventWritable();
      let chunks = 'C';
      errorEvent.write(chunks);
      errorEvent.on('error', (error: Error) => {
        expect(error.message).assertEqual('error');
      });
    });

    /**
     * @tc.name   testStreamWritableProperties016
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_04400
     * @tc.desc   Writable Properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableProperties016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let writableStream = new ErrorEventWritable();
      let chunks = 'C';
      writableStream.write(chunks);
      writableStream.on('error', (error: Error) => {
        expect(error.message).assertEqual('error');
      });
      writableStream.end();
    });

    /**
     * @tc.name   testStreamWritableCork001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_04600
     * @tc.desc   Calling the core and uncork methods in Writable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableCork001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let writableStream = new MyWritableCork001();
      writableStream.cork();
      writableStream.write('a');
      writableStream.write('b');
      writableStream.uncork();
      expect(dataWritten_Cork001).assertEqual('ab');
    });

    /**
     * @tc.name   testStreamWritableCork002
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_04700
     * @tc.desc   Calling the core and uncork methods in Writable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableCork002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let writableStream = new MyWritableCork002();
      writableStream.cork();
      writableStream.write('a');
      writableStream.cork();
      writableStream.write('b');
      writableStream.cork();
      writableStream.write('c');
      writableStream.uncork();
      writableStream.uncork();
      writableStream.uncork();
      expect(dataWritten_Cork002).assertEqual('abc');
    });

    /**
     * @tc.name   testStreamWritableCork003
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_04800
     * @tc.desc   Calling the core and uncork methods in Writable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableCork003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let writableStream = new MyWritableCork003();
      writableStream.cork();
      writableStream.write('a');
      writableStream.cork();
      writableStream.write('b');
      writableStream.cork();
      writableStream.write('c');
      writableStream.uncork();
      expect(dataWritten_Cork003).assertEqual('');
    });

    /**
     * @tc.name   testStreamWritableOff001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_04900
     * @tc.desc   Remove listeners from Writable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableOff001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let writableStream = new MyWritableWriteError003();
      let testListenerCalled = false;
      let testListener = () => {
        testListenerCalled = true;
      };
      writableStream.on('finish', testListener);
      writableStream.off('finish');
      writableStream.write('test');
      writableStream.end();
      setTimeout(() => {
        expect(testListenerCalled).assertEqual(false);
      }, 0);
    });

    /**
     * @tc.name   testStreamWritableOff002
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_05000
     * @tc.desc   Remove listeners from Writable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableOff002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let writableStream = new MyWritableWriteError003();
      let testListener1Called = false;
      let testListener2Called = false;
      let testListener1 = () => {
        testListener1Called = true;
      };
      let testListener2 = () => {
        testListener2Called = true;
      };
      writableStream.on('finish', testListener1);
      writableStream.on('finish', testListener2);
      writableStream.off('finish');
      writableStream.write('test');
      writableStream.end();
      setTimeout(() => {
        expect(testListener1Called).assertEqual(false);
        expect(testListener2Called).assertEqual(false);
      }, 0);
    });

    /**
     * @tc.name   testStreamWritableChangeDefaultEncoding001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_05100
     * @tc.desc   Default encoding in Writable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableChangeDefaultEncoding001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let testWritable = new TestWritable((chunk, type, enc) => {
        expect(enc).assertEqual('utf-8');
      });
      testWritable.write('test');
      testWritable.end();
    });

    /**
     * @tc.name   testStreamWritableChangeDefaultEncoding002
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_05200
     * @tc.desc   Default encoding in Writable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableChangeDefaultEncoding002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let testWritable = new TestWritable((chunk, type, enc) => {
        expect(enc).assertEqual('utf-8');
        expect(type).assertEqual('string');
      });
      testWritable.setDefaultEncoding('ascii');
      testWritable.write('car');
      testWritable.end();
    });

    /**
     * @tc.name   testStreamWritableChangeDefaultEncoding003
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_05300
     * @tc.desc   Default encoding in Writable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableChangeDefaultEncoding003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let err: Error = new Error();
      try {
        let testWritable = new TestWritable(
          (type, enc) => {
          });
        testWritable.setDefaultEncoding("abc");
        testWritable.write('bar');
        testWritable.end();
      } catch (e) {
        e = e as Error;
        err = e;
      }
      expect((err as BusinessError).message).assertEqual('Parameter error. The type of abc must be string.');
    });

    /**
     * @tc.name   testStreamWritableDrain001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_05500
     * @tc.desc   Trigger of drain event in Writable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableDrain001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let writableStream = new MyWritableDrain001();
      let drainCalled = false;
      writableStream.on('drain', () => {
        drainCalled = true;
      });
      expect(drainCalled).assertEqual(false);
      writableStream.write('test');
      writableStream.end();
    });

    /**
     * @tc.name   testStreamWritableWritev001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_05600
     * @tc.desc   Trigger doWritev event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableWritev001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let writable = new MyWritableWritev001();
      writable.write('test', 'utf8', mustCallNull());
      expect(doWriteVCalled_Writev001).assertEqual(true);
    });

    /**
     * @tc.name   testStreamDuplexEnd001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_05700
     * @tc.desc   Duplex stream end read.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamDuplexEnd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let duplex = new MyDuplexEnd001();
      let finishCalled = false;
      duplex.on('finish', () => {
        finishCalled = true;
      });
      duplex.resume();
      duplex.push(null);
      expect(finishCalled).assertEqual(false);
    });

    /**
     * @tc.name   testStreamDuplexWritableFinished002
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_05900
     * @tc.desc   writableFinished property for Duplex stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamDuplexWritableFinished002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let duplex = new MyDuplexWritableFinished002();
      duplex.on('finish', mustCallNoArgs(() => {
        expect(duplex.writableFinished).assertEqual(true);
      }));
      duplex.end('testing finished state', 'utf8', mustCallNoArgs(() => {
        expect(duplex.writableFinished).assertEqual(true);
      }));
    });

    /**
     * @tc.name   testStreamDuplex001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_06000
     * @tc.desc   The basic functions of Duplex stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamDuplex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let duplex = new MyDuplex001();
      expect(duplex instanceof stream.Duplex).assertEqual(true);
      let read: Object = {};
      duplex.on('data', (obj: Object) => {
        read = obj;
      });
      duplex.push('read');
      duplex.end('written');
      setTimeout(() => {
        expect(read.toString()).assertEqual('read');
        expect(written_001).assertEqual('written');
      }, 0);
    });

    /**
     * @tc.name   testStreamDuplex002
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_06100
     * @tc.desc   The basic functions of Duplex stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamDuplex002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let duplex = new MyDuplex002();
      duplex.write('duplex test', 'utf8',mustCallNull());
      duplex.on('data', mustCallOneObjectArgs((chunk: Object) => {
        expect(chunk.toString()).assertEqual('duplex test');
      }));
    });

    /**
     * @tc.name   testStreamDuplex004
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_06300
     * @tc.desc   The basic functions of Duplex stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamDuplex004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let duplex = new stream.Duplex();
      duplex.on('data', (...chunk: Object[]) => {
        if (chunk.length > 0 && chunk[0] instanceof string) {
          expect(chunk[0].toString()).assertEqual('Sync data');
        }
      });
      duplex.write('Test data');
    });

    /**
     * @tc.name   testStreamDuplexProperties001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_06400
     * @tc.desc   Duplex Properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamDuplexProperties001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let duplex = new stream.Duplex();
      expect(duplex.writableObjectMode).assertEqual(false);
    });

    /**
     * @tc.name   testStreamReadableResumePause001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_06500
     * @tc.desc   The resume and pause methods for Readable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableResumePause001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let readable = new TestReadable();
      let dataEmittedAfterResume = false;
      let dataCalled = false;
      readable.on('data', mustCallNoArgs(() => {
        if (!dataEmittedAfterResume) {
          readable.pause();
          setTimeout(() => {
            readable.resume();
            dataEmittedAfterResume = true;
            readable.push('test');
          }, 50);
        }
        dataCalled = true;
      }, 2));
      readable.push('test');
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve(undefined);
        }, 80);
      });
      expect(dataCalled).assertEqual(true);
    });

    /**
     * @tc.name   testStreamReadableResumePause002
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_06600
     * @tc.desc   The resume and pause methods for Readable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableResumePause002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new TestReadable();
      readable.push('test');
      readable.pause();
      let dataChunk = readable.read();
      expect((dataChunk as Object).toString()).assertEqual('test');
    });

    /**
     * @tc.name   testStreamReadableResumePause003
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_06700
     * @tc.desc   The resume and pause methods for Readable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableResumePause003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new TestReadable();
      readable.pause();
      readable.on('readable', mustCallNull());
      setTimeout(() => {
        readable.resume();
        readable.push('test');
      }, 10);
      expect(readable.readable).assertEqual(true);
    });

    /**
     * @tc.name   testStreamReadableResumePause004
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_06800
     * @tc.desc   The resume and pause methods for Readable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableResumePause004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new TestReadable();
      expect(readable.isPaused()).assertEqual(false);
    });

    /**
     * @tc.name   testStreamReadableResumePause005
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_06900
     * @tc.desc   The resume and pause methods for Readable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableResumePause005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new TestReadable();
      readable.pause();
      expect(readable.isPaused()).assertEqual(true);
    });

    /**
     * @tc.name   testStreamReadableResumePause006
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_07000
     * @tc.desc   The resume and pause methods for Readable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableResumePause006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new TestReadable();
      readable.pause();
      readable.resume();
      expect(readable.isPaused()).assertEqual(false);
    });

    /**
     * @tc.name   testStreamReadableProperties001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_07100
     * @tc.desc   Readable properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableProperties001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new stream.Readable();
      expect(readable.readableObjectMode).assertEqual(false);
    });

    /**
     * @tc.name   testStreamReadableProperties002
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_07200
     * @tc.desc   Readable properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableProperties002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new stream.Readable();
      expect(readable.readable).assertEqual(true);
    });

    /**
     * @tc.name   testStreamReadableProperties003
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_07300
     * @tc.desc   Readable properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableProperties003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new MyReadableProperties003();
      readable.push('test');
      expect(readable.readable).assertEqual(true);
      readable.on('error', mustCallNoArgs(() => {
        expect(readable.readable).assertEqual(false);
      }));
    });

    /**
     * @tc.name   testStreamReadableProperties004
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_07400
     * @tc.desc   Readable properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableProperties004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new stream.Readable();
      expect(readable.readableHighWatermark).assertEqual(16 * 1024);
    });

    /**
     * @tc.name   testStreamReadableProperties005
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_07500
     * @tc.desc   Readable properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableProperties005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new MyReadableProperties005();
      readable.on('data', () => {
      });
      expect(readable.readableFlowing).assertEqual(true);
    });

    /**
     * @tc.name   testStreamReadableProperties006
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_07600
     * @tc.desc   Readable properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableProperties006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new MyReadableProperties005();
      readable.resume();
      expect(readable.readableFlowing).assertEqual(true);
    });

    /**
     * @tc.name   testStreamReadableProperties007
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_07700
     * @tc.desc   Readable properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableProperties007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new stream.Readable();
      expect(readable.readableLength).assertEqual(0);
    });

    /**
     * @tc.name   testStreamReadableProperties008
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_07800
     * @tc.desc   Readable properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableProperties008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new MyReadableProperties005();
      let testData = 'Hello world';
      readable.push(testData);
      expect(readable.readableLength).assertEqual(testData.length);
    });

    /**
     * @tc.name   testStreamReadableProperties009
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_07900
     * @tc.desc   Readable properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableProperties009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new MyReadableProperties005();
      let testData = 'Hello world!';
      readable.push(testData);
      let chunk = readable.read((testData.length / 2).toInt());
      readable.setEncoding('utf8');
      expect(chunk !== null).assertTrue();
      expect((chunk)!.length).assertEqual(testData.length / 2);
      expect(readable.readableLength).assertEqual(testData.length / 2);
      let remainingChunk = readable.read((testData.length / 2).toInt());
      expect(remainingChunk !== null).assertTrue();
      expect((remainingChunk)!.length).assertEqual(testData.length / 2);
      expect(readable.readableLength).assertEqual(0);
    });

    /**
     * @tc.name   testStreamReadableProperties010
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_08000
     * @tc.desc   Readable properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableProperties010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new MyReadableProperties005();
      readable.push('Some data');
      readable.push(null);
      readable.on('data', () => {
      });
      readable.on('end', () => {
        expect(readable.readableLength).assertEqual(0);
      });
    });

    /**
     * @tc.name   testStreamReadableProperties011
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_08100
     * @tc.desc   Readable properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableProperties011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new MyReadableProperties005();
      let testData1 = 'First part';
      let testData2 = 'Second part';
      readable.push(testData1);
      expect(readable.readableLength).assertEqual(testData1.length);
      readable.push(testData2);
      expect(readable.readableLength).assertEqual(testData1.length + testData2.length);
    });

    /**
     * @tc.name   testStreamReadableProperties012
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_08200
     * @tc.desc   Readable properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableProperties012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new MyReadableProperties005();
      readable.push('test data');
      readable.read();
      expect(readable.readableEnded).assertEqual(false);
      readable.read();
      expect(readable.readableEnded).assertEqual(false);
    });

    /**
     * @tc.name   testStreamReadableProperties013
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_08300
     * @tc.desc   Readable properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableProperties013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new stream.Readable();
      expect(readable.readable).assertEqual(true);
    });

    /**
     * @tc.name   testStreamReadableProperties014
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_08400
     * @tc.desc   Readable properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableProperties014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new MyReadableProperties005();
      readable.push('test data');
      expect(readable.readableFlowing).assertEqual(null);
    });

    /**
     * @tc.name   testStreamReadableProperties015
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_08500
     * @tc.desc   Readable properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableProperties015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new MyReadableProperties005();
      expect(readable.readableEnded).assertEqual(false);
    });

    /**
     * @tc.name   testStreamReadableProperties016
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_08600
     * @tc.desc   Readable properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableProperties016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new MyReadableProperties005();
      readable.push('Some data');
      readable.push(null);
      readable.on('finished', mustCallNoArgs(() => {
        expect(readable.readableEnded).assertEqual(true);
      }, 0));
    });

    /**
     * @tc.name   testStreamReadableProperties017
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_08700
     * @tc.desc   Readable properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableProperties017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new MyReadableProperties005();
      readable.pause();
      expect(readable.readable).assertEqual(true);
      readable.resume();
      expect(readable.readable).assertEqual(true);
    });

    /**
     * @tc.name   testStreamReadableConstructorSetMethods001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_08800
     * @tc.desc   Readable stream set methods.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableConstructorSetMethods001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readableStream = new MyReadableConstructorSetMethods001();
      readableStream.resume();
      expect(dRCalled_ConstructorSetMethods001).assertEqual(true);
    });

    /**
     * @tc.name   testStreamReadableData002
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_09000
     * @tc.desc   Data events in a Readable stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableData002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readableStream = new MyReadableData002();
      readableStream.on('data', (chunk: Object) => {
        expect(chunk.toString()).assertEqual('x');
      });
    });

    /**
     * @tc.name   testStreamReadableData003
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_23000
     * @tc.desc   Data events in a Readable stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableData003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let src = new MyReadableData003();
      src.on('data', (chunk: Object) => {
        expect(chunk.toString()).assertEqual("1");
      });
    });

    /**
     * @tc.name   testStreamReadableData007
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_23200
     * @tc.desc   should handle empty stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableData007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dataEmitted = false;
      let src = new MyReadableData007();
      src.on('data', (chunk: Object) => {
        dataEmitted = true
      });
      src.on('end', () => {
        expect(dataEmitted).assertEqual(false);
      });
    });

    /**
     * @tc.name   testStreamReadableData008
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_24300
     * @tc.desc   should handle remove data listener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableData008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let called = false;
      let src = new MyReadableData008();
      let dataHandler = () => {
        called = true;
      }
      src.on('data', dataHandler);
      src.off('data', dataHandler);

      src.on('end', () => {
        expect(called).assertEqual(false);
      });
    });

    /**
     * @tc.name   testStreamReadableData010
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_22900
     * @tc.desc   should handle remove data listener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableData010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let src = new MyReadableData010();
      expect(src.readable).assertEqual(true);
      src.on('end', () => {
        expect(src.readable).assertEqual(false);
      });

      src.resume();
    });

    /**
     * @tc.name   testStreamReadableData011
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_23800
     * @tc.desc   should handle remove data listener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableData011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let src = new MyReadableData011();
      src.on('data', (chunk: Object) => {
        expect(chunk.toString()).assertEqual('async');
      });
    });

    /**
     * @tc.name   testStreamReadableEmitReadableShortStream002
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_09300
     * @tc.desc   Call of events after data push in Readable Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableEmitReadableShortStream002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readableStream = new TestReadable();
      let count = 0;
      readableStream.on('readable', () => {
        let chunk: Any;
        while ((chunk = readableStream.read()) !== null) {
          count++;
          expect((chunk as Object).toString()).assertEqual('content');
        }
      });
      readableStream.on('end', () => {
        expect(count).assertEqual(1);
      });
      readableStream.push('content');
      readableStream.push(null);
    });

    /**
     * @tc.name   testStreamReadableEnded002
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_09500
     * @tc.desc   Readable readableEnded.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableEnded002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readableStream = new MyReadableEnded002();
      readableStream.on('end', () => {
        expect(readableStream.readableEnded).assertEqual(true);
      });
      readableStream.on('data', () => {
        expect(readableStream.readableEnded).assertEqual(false);
      });
    });

    /**
     * @tc.name   testStreamReadableEnded003
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_09600
     * @tc.desc   Readable readableEnded.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableEnded003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new stream.Readable();
      readable.on('readable', () => {
        readable.read();
      });
      expect(readable.readable).assertEqual(true);
      readable.on('error', mustNotCall());
      readable.on('end', mustCall());
      readable.push('a');
      readable.push(null);
      readable.push(null);
    });

    /**
     * @tc.name   testStreamReadableHwm0Async001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_09700
     * @tc.desc   Triggered in the end event of a readable stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableHwm0Async001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let dataTimes = 0;
      let readable = new MyReadableHwm0Async001();
      readable.on('end', () => {
        expect(dataTimes).assertEqual(5);
      });
      readable.on('data', () => {
        dataTimes++;
      });
    });

    /**
     * @tc.name   testStreamReadablePauseAndResume001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_09900
     * @tc.desc   Pause and Resume in Readable Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadablePauseAndResume001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new MyReadableProperties005();
      readable.setEncoding('utf8');
      readable.on('readable', (): void => {});
      readable.off('readable');
      readable.pause();
      setTimeout(() => {
        expect(readable.isPaused()).assertTrue();
      }, 0);
    });

    /**
     * @tc.name   testStreamReadableReadable001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_10000
     * @tc.desc   Readable property in Readable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableReadable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let mustNotCallFn = mustNotCall();
      let readable = new MyReadableProperties005();
      expect(readable.readable).assertEqual(true);
      readable.on('end', mustNotCallFn);
      readable.resume();
      readable.push(null);
      expect(readable.readable).assertEqual(true);
      readable.off('end');
      readable.on('end', mustCall(() => {
        expect(readable.readable).assertEqual(false);
      }));
    });

    /**
     * @tc.name   testStreamReadableSetEncoding001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_10100
     * @tc.desc   Set encoding for Readable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableSetEncoding001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new stream.Readable();
      readable.setEncoding();
      expect(readable.readableEncoding).assertEqual('utf-8');
    });

    /**
     * @tc.name   testStreamReadableWithUnimplementedDoRead001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_10200
     * @tc.desc   Readable does not implement DoRead.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableWithUnimplementedDoRead001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new stream.Readable();
      readable.on('error', mustCall((error: Error) => {
        expect(error.name).assertEqual('BusinessError');
        expect(error.message).assertEqual('The doRead() method is not implemented.');
      }));
      readable.on('close', mustCall());
      readable.read();
    });

    /**
     * @tc.name   testStreamTransformCallbackTwice001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_10300
     * @tc.desc   Call Callback twice in Transform.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamTransformCallbackTwice001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let transform = new MyTransformCallbackTwice001();
      transform.on('error', mustCall((error: Error) => {
        expect(error.name).assertEqual('BusinessError');
        expect(error.message).assertEqual('Callback called multiple times.');
      }));
      transform.write('test');
    });

    /**
     * @tc.name   testStreamTransformConstructor001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_10400
     * @tc.desc   Transform constructor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamTransformConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let transform = new stream.Transform();
      let err: Error = new Error();
      try {
        transform.end('test');
      } catch (e) {
        e = e as Error;
        err = e;
      }
      expect((err as BusinessError).message).assertEqual('The doTransform() method is not implemented.');
    });

    /**
     * @tc.name   testStreamTransform001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_10600
     * @tc.desc   Event triggering of Transform stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamTransform001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let transform = new MyTransform001();
      let transformedData = '';
      transform.on('data', (chunk: Object) => {
        transformedData += chunk.toString();
      });
      transform.on('end', () => {
        expect(transformedData).assertEqual('TEST DATA');
      });
      transform.write('Test data');
      transform.end();
    });

    /**
     * @tc.name   testStreamTransform002
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_10700
     * @tc.desc   Event triggering of Transform stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamTransform002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let transform = new MyTransform002();
      let endCalled = false;
      transform.on('end', () => {
        endCalled = true;
      });
      transform.write('A');
      transform.end();
      expect(endCalled).assertEqual(false);
    });

    /**
     * @tc.name   testStreamTransform003
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_10800
     * @tc.desc   The basic methods of transform.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamTransform003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myTransform = new MyTransform003();
      myTransform.on('data', (): void => {
      });
      expect(doInitializeCalled_003).assertEqual(true);
    });

    /**
     * @tc.name   testStreamTransform004
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_10900
     * @tc.desc   The basic methods of transform.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamTransform004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let transformStream = new stream.Transform();
      let result = transformStream.setDefaultEncoding('utf8');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testStreamTransform005
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_11000
     * @tc.desc   The basic methods of transform.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamTransform005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let transformStream = new MyTransform005();
      transformStream.on("data", mustCall((chunk: Object) => {
        expect(chunk.toString()).assertEqual('x');
      }));
    });

    /**
     * @tc.name   testStreamTransform006
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_11100
     * @tc.desc   The basic methods of transform.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamTransform006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      let transformStream = new stream.Transform();
      let dataCalled = false;
      transformStream.on('data', () => {
        dataCalled = true;
      });
      transformStream.pause();
      transformStream.push('test');
      expect(transformStream.readable).assertEqual(true);
      expect(transformStream.writable).assertEqual(true);
      expect(transformStream.isPaused()).assertEqual(true);
      setTimeout(() => {
        expect(dataCalled).assertEqual(false);
        done();
      }, 10);
    });

    /**
     * @tc.name   testStreamTransform007
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_11200
     * @tc.desc   The basic methods of transform.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamTransform007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      let transformStream = new stream.Transform();
      let dataCalled = false;
      transformStream.on('data', () => {
        dataCalled = true;
      });
      transformStream.pause();
      transformStream.resume();
      transformStream.push('test');
      expect(transformStream.readable).assertEqual(true);
      expect(transformStream.writable).assertEqual(true);
      setTimeout(() => {
        expect(dataCalled).assertEqual(true);
        done();
      }, 10);
    });

    /**
     * @tc.name   testStreamTransform008
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_11300
     * @tc.desc   The basic methods of transform.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamTransform008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let transformStream = new stream.Transform();
      let result = transformStream.setEncoding('utf8');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testStreamTransform009
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_11400
     * @tc.desc   The basic methods of transform.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamTransform009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let transformStream = new stream.Transform();
      expect(transformStream.isPaused()).assertEqual(false);
      transformStream.pause();
      expect(transformStream.isPaused()).assertEqual(true);
    });

    /**
     * @tc.name   testStreamTransform012
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_11700
     * @tc.desc   The basic methods of transform.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamTransform012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let transform = new MyTransform012();
      transform.on('data', () => {
      });
      setTimeout(() => {
        expect(doReadCalled_012).assertEqual(true);
      }, 0);
    });

    /**
     * @tc.name   testStreamTransformProperties001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_11800
     * @tc.desc   Duplex Properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamTransformProperties001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let transform = new stream.Transform();
      expect(transform.writableHighWatermark).assertEqual(16 * 1024);
    });

    /**
     * @tc.name   testStreamTransformProperties002
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_11900
     * @tc.desc   Duplex Properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamTransformProperties002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let transform = new stream.Transform();
      expect(transform.readableHighWatermark).assertEqual(16 * 1024);
    });

    /**
     * @tc.name   testStreamTransformEvent001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_12000
     * @tc.desc   Event triggering of Transform stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamTransformEvent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let transform = new MyTransformEvent001();
      let transformedData = '';
      transform.on('data', (chunk: Object) => {
        transformedData += chunk.toString();
      });
      transform.on('end', () => {
        expect(transformedData).assertEqual('TEST DATA');
      });
      transform.write('Test data');
      transform.end();
    });

    /**
     * @tc.name   testStreamTransformEvent002
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_12100
     * @tc.desc   Event triggering of Transform stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamTransformEvent002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let transformStream = new MyTransformEvent002();
      transformStream.cork();
      transformStream.write('data1', 'utf8');
      transformStream.uncork();
      let res = transformStream.end();
      transformStream.on('finish', mustCall());
      expect(res instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.name   testStreamTransformEvent003
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_12200
     * @tc.desc   Event triggering of Transform stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamTransformEvent003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let transformStream = new MyTransformEvent003();
      transformStream.on('error', mustCallNull());
      let res: boolean = transformStream.write('test');
      expect(res).assertTrue();
    });

    /**
     * @tc.name   testStreamTransformEvent004
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_12300
     * @tc.desc   Event triggering of Transform stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamTransformEvent004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let transformStream = new stream.Transform();
      let testListenerCalled = false;
      let testListener = () => {
        testListenerCalled = true;
      };
      transformStream.setEncoding('utf8');
      transformStream.on('readable', testListener);
      transformStream.off('readable');
      transformStream.push('test');
      expect(testListenerCalled).assertEqual(false);
    });

    /**
     * @tc.name   testStreamTransformEvent005
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_12400
     * @tc.desc   Event triggering of Transform stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamTransformEvent005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      let transformStream = new stream.Transform();
      let testListener1Called = false;
      let testListener2Called = false;
      let testListener1 = () => {
        testListener1Called = true;
      };
      let testListener2 = () => {
        testListener2Called = true;
      };
      transformStream.setEncoding('utf8');
      transformStream.on('readable', testListener1);
      transformStream.on('readable', testListener2);
      transformStream.off('readable');
      transformStream.push('test');
      setTimeout(() => {
        expect(testListener1Called).assertEqual(false);
        expect(testListener2Called).assertEqual(false);
        done();
      }, 0);
    });

    /**
     * @tc.name   testStreamPipe003
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_12700
     * @tc.desc   Verify the use of pipe.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamPipe003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new MyReadablePipe003();
      let writable = new MyWritablePipe003();
      writable.on('finish',()=>{});
      let res = readable.pipe(writable);
      expect(res instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.name   testStreamDuplexProperties002
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_12900
     * @tc.desc   Duplex Properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamDuplexProperties002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let duplex = new stream.Duplex();
      expect(duplex.writableHighWatermark).assertEqual(16 * 1024);
    });

    /**
     * @tc.name   testStreamDuplexProperties003
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_13000
     * @tc.desc   Duplex Properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamDuplexProperties003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let duplex = new stream.Duplex();
      expect(duplex.readableHighWatermark).assertEqual(16 * 1024);
    });

    /**
     * @tc.name   testStreamReadableread001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_13100
     * @tc.desc   Reads a buffer of a specified size from the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const stringdecoder = new StringDecoderReadable();
      let ss = stringdecoder.setEncoding("utf-8");
      expect(ss).assertEqual(true);
    });

    /**
     * @tc.name   testStreamReadableread002
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_13200
     * @tc.desc   Reads a buffer of a specified size from the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableread002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const stringdecoder = new StringDecoderReadable();
      let ss = stringdecoder.setEncoding("utf8");
      expect(ss).assertEqual(true);
    });

    /**
     * @tc.name   testStreamReadableread003
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_13300
     * @tc.desc   Reads a buffer of a specified size from the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableread003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let input = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
      const stringdecoder = new StringDecoderReadable();
      stringdecoder.push(input);
      stringdecoder.setEncoding("utf-8");
      let res = stringdecoder.read(2);
      expect((res as Object).toString()).assertEqual('你好');
    });

    /**
     * @tc.name   testStreamReadableread005
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_13500
     * @tc.desc   Reads a buffer of a specified size from the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableread005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let enc : stream.ReadableOptions = {
        encoding : "utf-8"
      };
      let input = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
      const stringdecoder = new StringDecoderReadable(enc);
      stringdecoder.push(input);
      stringdecoder.push(null);
      let res = stringdecoder.read(input.length.toInt());
      expect((res as Object).toString()).assertEqual('你好');
    });

    /**
     * @tc.name   testStreamReadableread006
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_13600
     * @tc.desc   Reads a buffer of a specified size from the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableread006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let enc : stream.ReadableOptions = {
        encoding : "windows-1250"
      };
      let input = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
      const stringdecoder = new StringDecoderReadable(enc);
      let ss = stringdecoder.setEncoding();
      stringdecoder.push(input);
      let res = stringdecoder.read();
      expect((res as Object).toString()).assertEqual('你好');
    });

    /**
     * @tc.name   testStreamReadableread007
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_13700
     * @tc.desc   Reads a buffer of a specified size from the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableread007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let enc : stream.ReadableOptions = {
        encoding : "windows-1250"
      };
      const stringdecoder = new StringDecoderReadable(enc);
      let res = stringdecoder.readableEncoding;
      expect(res).assertEqual('windows-1250');
    });

    /**
     * @tc.name   testStreamReadableread009
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_13900
     * @tc.desc   Reads a buffer of a specified size from the buffer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamReadableread009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let input = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
      const stringdecoder = new StringDecoderReadable();
      stringdecoder.push(input);
      let res = stringdecoder.read();
      expect((res as Object).toString()).assertEqual('你好');
    });

    /**
     * @tc.name   testStreamPipe009
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_23100
     * @tc.desc   Readable pipe should emit pipe/unpipe events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamPipe009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let num = 0
      let src = new MyReadablePipe009();
      let dest = new MyWriteablePipe009();
      dest.on('pipe', ()=>{
        num++;
      });
      dest.on('unpipe', ()=>{
        num--;
      });

      src.pipe(dest);
      src.unpipe(dest);

      Promise.resolve().then(()=>{
        expect(num).assertEqual(0);
        done();
      })
    });

    /**
     * @tc.name   testStreamPipe015
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_23700
     * @tc.desc   Readable pipe should ignore data after unpiping.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamPipe015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let src = new Pipe015MyReadable();
      let dest = new Pipe015MyWriteable();
      src.pipe(dest);
      src.unpipe(dest);

      Promise.resolve().then(()=>{
        expect(callCount_Pipe015).assertEqual(0);
        done();
      })
    });

    /**
     * @tc.name   testStreamPipe018
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_23500
     * @tc.desc   Readable pipe should ignore data after unpiping.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamPipe018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let src = new Pipe018MyReadable();
      let dest = new Pipe018MyWriteable();
      src.pipe(dest);
      src.unpipe(dest);

      Promise.resolve().then(()=>{
        expect(callCount_Pipe018).assertEqual(0);
        done();
      })
    });

    /**
     * @tc.name   testStreamDuplexDoWritev001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_14200
     * @tc.desc   Duplex method doWritev.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamDuplexDoWritev001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let duplex = new DuplexDoWritev001();
      duplex.write('Hello ');
      duplex.write('World', 'utf8', mustCall(() => {
        expect(duplex.data).assertEqual('Hello World');
      }));
    });

    /**
     * @tc.name   testStreamEncoding001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_14500
     * @tc.desc   Write method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let writable = new Encoding001();
      let result = writable.write('测试', 'gb18030');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testStreamEncoding002
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_14600
     * @tc.desc   Write method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let writable = new Encoding002();
      let result = writable.write('你好', 'gbk');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testStreamEncoding003
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_14700
     * @tc.desc   Write method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let writable = new Encoding003();
      let result = writable.write('你好', 'gb2312');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testStreamEncoding004
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_14800
     * @tc.desc   End method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let writable = new Encoding004();
      let res = writable.end('测试', 'gb18030', mustCall());
      expect(res instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.name   testStreamEncoding005
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_14900
     * @tc.desc   End method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let writable = new Encoding005();
      let res = writable.end('你好', 'gbk', mustCall());
      expect(res instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.name   testStreamEncoding006
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_15000
     * @tc.desc   End method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let writable = new Encoding006();
      let res = writable.end('你好', 'gb2312', mustCall());
      expect(res instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.name   testStreamEncoding007
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_15100
     * @tc.desc   SetDefaultEncoding method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let writable = new Encoding007();
      writable.setDefaultEncoding('gb18030');
      let res = writable.write('你好');
      expect(res).assertTrue();
    });

    /**
     * @tc.name   testStreamEncoding008
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_15200
     * @tc.desc   SetDefaultEncoding method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let writable = new Encoding008();
      writable.setDefaultEncoding('gbk');
      let res = writable.write('你好');
      expect(res).assertTrue();
    });

    /**
     * @tc.name   testStreamEncoding009
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_15300
     * @tc.desc   SetDefaultEncoding method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let writable = new Encoding009();
      writable.setDefaultEncoding('gb2312');
      let res = writable.write('你好');
      expect(res).assertTrue();
    });

    /**
     * @tc.name   testStreamEncoding010
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_15400
     * @tc.desc   SetEncoding method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new stream.Readable();
      let result = readable.setEncoding('gb18030');
      expect(readable.readableEncoding).assertEqual('gb18030');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testStreamEncoding011
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_15500
     * @tc.desc   SetEncoding method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new stream.Readable();
      let result = readable.setEncoding('gbk');
      expect(readable.readableEncoding).assertEqual('gbk');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testStreamEncoding012
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_15600
     * @tc.desc   SetEncoding method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new stream.Readable();
      let result = readable.setEncoding('gb2312');
      expect(readable.readableEncoding).assertEqual('gb2312');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testStreamEncoding016
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_16000
     * @tc.desc   Write method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let duplex = new Encoding016();
      let res = duplex.write('你好', 'gb18030');
      expect(res).assertTrue();
    });

    /**
     * @tc.name   testStreamEncoding017
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_16100
     * @tc.desc   Write method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let duplex = new Encoding017();
      let res: boolean = duplex.write('你好', 'gbk');
      expect(res).assertTrue();
    });

    /**
     * @tc.name   testStreamEncoding018
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_16200
     * @tc.desc   Write method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let duplex = new Encoding018();
      let res = duplex.write('你好', 'gb2312');
      expect(res).assertTrue();
    });

    /**
     * @tc.name   testStreamEncoding019
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_16300
     * @tc.desc   End method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let duplex = new Encoding019();
      let res = duplex.end('测试', 'gb18030', mustCall());
      expect(res instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.name   testStreamEncoding020
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_16400
     * @tc.desc   End method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let duplex = new Encoding020();
      let res = duplex.end('测试', 'gbk', mustCall());
      expect(res instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.name   testStreamEncoding021
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_16500
     * @tc.desc   End method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let duplex = new Encoding021();
      let res = duplex.end('测试', 'gb2312', mustCallNull());
      expect(res instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.name   testStreamEncoding022
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_16600
     * @tc.desc   SetDefaultEncoding method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let duplex = new Encoding022();
      let result = duplex.setDefaultEncoding('gb18030');
      duplex.write('你好');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testStreamEncoding023
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_16700
     * @tc.desc   SetDefaultEncoding method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let duplex = new Encoding023();
      let result = duplex.setDefaultEncoding('gbk');
      duplex.write('你好');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testStreamEncoding024
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_16800
     * @tc.desc   SetDefaultEncoding method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let duplex = new Encoding024();
      let result = duplex.setDefaultEncoding('gb2312');
      duplex.write('你好');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testStreamEncoding025
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_16900
     * @tc.desc   DoTransform method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let transform = new Encoding025();
      let res = transform.write('你好123', 'gb18030');
      transform.end();
      expect(res).assertTrue();
    });

    /**
     * @tc.name   testStreamEncoding026
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_17000
     * @tc.desc   DoTransform method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let transform = new Encoding026();
      let res = transform.write('你好123', 'gbk');
      transform.end();
      expect(res).assertTrue();
    });

    /**
     * @tc.name   testStreamEncoding027
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_17100
     * @tc.desc   DoTransform method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let transform = new Encoding027();
      let res = transform.write('你好123', 'gb2312');
      transform.end();
      expect(res).assertTrue();
    });

    /**
     * @tc.name   testStreamEncoding028
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_17200
     * @tc.desc   DoTransform method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new Encoding028_34()
      readable.push('test');
      let encoding = readable.setEncoding('gb2312');
      expect(readable.readableEncoding).assertEqual('gb2312');
    });

    /**
     * @tc.name   testStreamEncoding029
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_17300
     * @tc.desc   DoTransform method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new Encoding028_34()
      readable.push('test');
      let encoding = readable.setEncoding('gbk');
      expect(readable.readableEncoding).assertEqual('gbk');
    });

    /**
     * @tc.name   testStreamEncoding030
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_17400
     * @tc.desc   DoTransform method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readable = new Encoding028_34()
      readable.push('test');
      let encoding = readable.setEncoding('gb18030');
      expect(readable.readableEncoding).assertEqual('gb18030');
    });

    /**
     * @tc.name   testStreamWritableUintArr001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_18400
     * @tc.desc   The state of the writable attribute of a writable stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStreamWritableUintArr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let myWritableStream = new WritableUintArr001();
      expect(myWritableStream.writable).assertEqual(true);
      let input = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
      myWritableStream.on('error', mustCallNull());
      myWritableStream.write(input);
      expect(myWritableStream.writable).assertEqual(false);
    });

    /**
     * @tc.name   testStreamWritableUintArr003
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_18600
     * @tc.desc   Write data failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStreamWritableUintArr003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let callbackCalled = false;
      let input = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
      let myWritable = new WritableUintArr003();
      myWritable.on('error', mustCallOnError((error: Error) => {
        expect(error.message).assertEqual('new error');
      }));
      myWritable.write(input);
    });

    /**
     * @tc.name   testStreamWritableUintArrCbTwice002
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_18900
     * @tc.desc   Multiple callbacks.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStreamWritableUintArrCbTwice002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let myWritableStream = new WritableUintArrCbTwice002();
      let input = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
      myWritableStream.on('error', mustCall((error: Error) => {
        expect(error.message).assertEqual('Callback called multiple times.');
        expect(error.name).assertEqual('BusinessError');
      }));
      myWritableStream.write(input);
    });

    /**
     * @tc.name   testStreamWritableUintArrCbTwice003
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_19000
     * @tc.desc   Multiple callbacks.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStreamWritableUintArrCbTwice003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let myWritableStream = new WritableUintArrCbTwice003();
      let input = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
      myWritableStream.on('error', mustCall((error: Error) => {
        expect(error.message).assertEqual('Callback called multiple times.');
        expect(error.name).assertEqual('BusinessError');
      }));
      myWritableStream.write(input);
    });

    /**
     * @tc.name   testStreamWritableUintArrConstructorSetMethods001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_19600
     * @tc.desc   Writable constructor Set Methods.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStreamWritableUintArrConstructorSetMethods001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let input = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
      let myWritableStream1 = new WritableUintArrConstructorSetMethods001();
      myWritableStream1.write(input);
      myWritableStream1.cork();
      myWritableStream1.write(input);
      myWritableStream1.write(input);
      let res = myWritableStream1.end();
      expect(res instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.name   testStreamWritableUintArrProperties001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_19800
     * @tc.desc   Writable Properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableUintArrProperties001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myWritableStream = new WritableUintArrProperties001();
      let input = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
      myWritableStream.write(input);
      expect(myWritableStream.writableLength).assertEqual(6);
    });

    /**
     * @tc.name   testStreamWritableUintArrProperties002
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_19900
     * @tc.desc   Writable Properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableUintArrProperties002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let customWritable = new CustomWritable();
      let input = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
      customWritable.write(input);
      expect(customWritable.writableLength).assertEqual(6);
    });

    /**
     * @tc.name   testStreamWritableUintArrProperties003
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_20000
     * @tc.desc   Writable Properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableUintArrProperties003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let customWritable = new CustomWritable();
      let input = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
      let input2 = new Uint8Array([0xE5, 0x92, 0x8d, 0xE8, 0xA7, 0x81]);
      customWritable.write(input);
      customWritable.write(input2);
      expect(customWritable.writableLength).assertEqual(12);
    });

    /**
     * @tc.name   testStreamWritableUintArrProperties004
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_20100
     * @tc.desc   Writable Properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableUintArrProperties004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let customWritable = new CustomWritable();
      let input = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
      customWritable.write(input);
      expect(customWritable.writableLength).assertEqual(6);
      customWritable.end();
      await customWritable.waitForFinish();
      expect(customWritable.writableLength).assertEqual(0);
    });

    /**
     * @tc.name   testStreamWritableUintArrProperties005
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_20200
     * @tc.desc   Writable Properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableUintArrProperties005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let writableStream = new CustomWritable();
      let input = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
      let input2 = new Uint8Array([0xE5, 0x86, 0x8D, 0xE8, 0xA7, 0x81]);
      expect(writableStream.writableCorked).assertEqual(0);
      writableStream.cork();
      expect(writableStream.writableCorked).assertEqual(1);
      writableStream.write(input);
      writableStream.write(input2);
      writableStream.uncork();
      expect(writableStream.writableCorked).assertEqual(0);
    });

    /**
     * @tc.name   testStreamWritableUintArrCork001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_20300
     * @tc.desc   Calling the core and uncork methods in Writable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableUintArrCork001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {

      T_Cork0010203 = new Uint8Array(0);
      let input = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
      let input2 = new Uint8Array([0xE5, 0x86, 0x8D, 0xE8, 0xA7, 0x81]);
      let output = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD, 0xE5, 0x86, 0x8D, 0xE8, 0xA7, 0x81]);
      const decoder = new util.TextDecoder();
      let myWritableStream = new WritableUintArrCork0010203();
      myWritableStream.cork();
      myWritableStream.write(input);
      myWritableStream.write(input2);
      myWritableStream.uncork();
      const strT = decoder.decodeToString(T_Cork0010203);
      const strO = decoder.decodeToString(output);
      expect(strT).assertEqual(strO);
    });

    /**
     * @tc.name   testStreamWritableUintArrCork002
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_20400
     * @tc.desc   Calling the core and uncork methods in Writable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableUintArrCork002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      T_Cork0010203 = new Uint8Array(0);
      let input1 = new Uint8Array([0xE5, 0x86, 0x8D, 0xE8, 0xA7, 0x81]);
      let input2 = new Uint8Array([0xE5, 0xB0, 0x8F, 0xE7, 0x81, 0xB0]);
      let input3 = new Uint8Array([0xE6, 0x98, 0x8E, 0xE5, 0xA4, 0xA9, 0xE8, 0xA7, 0x81]);
      let output = new Uint8Array([0xE5, 0x86, 0x8D, 0xE8, 0xA7, 0x81,
        0xE5, 0xB0, 0x8F, 0xE7, 0x81, 0xB0,
        0xE6, 0x98, 0x8E, 0xE5, 0xA4, 0xA9, 0xE8, 0xA7, 0x81]);
      const decoder = new util.TextDecoder();
      let myWritableStream = new WritableUintArrCork0010203();
      myWritableStream.cork();
      myWritableStream.write(input1);
      myWritableStream.cork();
      myWritableStream.write(input2);
      myWritableStream.cork();
      myWritableStream.write(input3);
      myWritableStream.uncork();
      myWritableStream.uncork();
      myWritableStream.uncork();
      const strT = decoder.decodeToString(T_Cork0010203);
      const strO = decoder.decodeToString(output);
      expect(strT).assertEqual(strO);
    });

    /**
     * @tc.name   testStreamWritableUintArrCork003
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_20500
     * @tc.desc   Calling the core and uncork methods in Writable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableUintArrCork003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      T_Cork0010203 = new Uint8Array(0);
      let input1 = new Uint8Array([0xE5, 0x86, 0x8D, 0xE8, 0xA7, 0x81]);
      let input2 = new Uint8Array([0xE5, 0xB0, 0x8F, 0xE7, 0x81, 0xB0]);
      let input3 = new Uint8Array([0xE6, 0x98, 0x8E, 0xE5, 0xA4, 0xA9, 0xE8, 0xA7, 0x81]);
      let myWritableStream = new WritableUintArrCork0010203();
      myWritableStream.cork();
      myWritableStream.write(input1);
      myWritableStream.cork();
      myWritableStream.write(input2);
      myWritableStream.cork();
      myWritableStream.write(input3);
      myWritableStream.uncork();
      expect(T_Cork0010203.length).assertEqual(0);
    });

    /**
     * @tc.name   testStreamWritableUintArrDrain001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_20600
     * @tc.desc   Trigger of drain event in Writable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableUintArrDrain001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let writableStream = new WritableUintArrDrain001();
      let drainCalled = false;
      let input = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
      writableStream.on('drain', () => {
        drainCalled = true;
      });
      expect(drainCalled).assertEqual(false);
      writableStream.write(input);
      writableStream.end();
    });

    /**
     * @tc.name   testStreamWritableWritevUintArr001
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_20700
     * @tc.desc   Trigger doWritev event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamWritableWritevUintArr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myWritable = new WritableWritevUintArr001();
      doWriteVCalled_WritevUintArr001 = false;
      let input = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
      myWritable.write(input, 'utf8', mustCallNull());
      expect(doWriteVCalled_WritevUintArr001).assertEqual(true);
    });

    /**
     * @tc.name   testStreamEncoding040
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_21100
     * @tc.desc   Write method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myWritable = new Encoding04041();
      let result = myWritable.write('你好', 'GBK');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testStreamEncoding041
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_21200
     * @tc.desc   End method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myWritable = new Encoding04041();
      let res = myWritable.end('你好', 'GBK', mustCallNull());
      expect(res instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.name   testStreamEncoding042
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_21300
     * @tc.desc   SetDefaultEncoding method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myWritable = new Encoding042();
      myWritable.setDefaultEncoding('GBK');
      let res = myWritable.write('你好');
      expect(res).assertTrue();
    });

    /**
     * @tc.name   testStreamEncoding043
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_21400
     * @tc.desc   Write method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myWritable = new Encoding04344();
      let result = myWritable.write('你好', 'GB2312');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testStreamEncoding044
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_21500
     * @tc.desc   End method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myWritable = new Encoding04344();
      let res = myWritable.end('你好', 'GB2312', mustCall());
      expect(res instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.name   testStreamEncoding045
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_21600
     * @tc.desc   SetDefaultEncoding method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myWritable = new Encoding045();
      myWritable.setDefaultEncoding('GB2312');
      let res = myWritable.write('你好');
      expect(res).assertTrue();
    });

    /**
     * @tc.name   testStreamEncoding046
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_21700
     * @tc.desc   Write method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myWritable = new Encoding04647();
      let result = myWritable.write('你好', 'GB18030');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testStreamEncoding047
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_21800
     * @tc.desc   End method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myWritable = new Encoding04647();
      let res = myWritable.end('你好', 'GB18030', mustCall());
      expect(res instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.name   testStreamEncoding048
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_21900
     * @tc.desc   SetDefaultEncoding method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myWritable = new Encoding048();
      myWritable.setDefaultEncoding('GB18030');
      let res = myWritable.write('你好');
      expect(res).assertTrue();
    });

    /**
     * @tc.name   testStreamEncoding049
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_22000
     * @tc.desc   Write method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myDuplex = new Encoding049();
      let res =myDuplex.write('你好', 'GBK');
      expect(res).assertTrue();
    });

    /**
     * @tc.name   testStreamEncoding050
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_22100
     * @tc.desc   End method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myDuplex = new Encoding050();
      let res =myDuplex.end('测试', 'GBK', mustCall());
      expect(res instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.name   testStreamEncoding051
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_22200
     * @tc.desc   SetDefaultEncoding method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myDuplex = new Encoding051();
      let result = myDuplex.setDefaultEncoding('GBK');
      myDuplex.write('你好');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testStreamEncoding052
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_22300
     * @tc.desc   Write method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myDuplex = new Encoding052();
      let res =myDuplex.write('你好', 'GB2312');
      expect(res).assertTrue();
    });

    /**
     * @tc.name   testStreamEncoding053
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_22400
     * @tc.desc   End method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myDuplex = new Encoding053();
      let res = myDuplex.end('测试', 'GB2312', mustCall());
      expect(res instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.name   testStreamEncoding054
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_22500
     * @tc.desc   SetDefaultEncoding method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myDuplex = new Encoding054();
      let result = myDuplex.setDefaultEncoding('GB2312');
      myDuplex.write('你好');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testStreamEncoding055
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_22600
     * @tc.desc   Write method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myDuplex = new Encoding055();
      let res = myDuplex.write('你好', 'GB18030');
      expect(res).assertTrue();
    });

    /**
     * @tc.name   testStreamEncoding056
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_22700
     * @tc.desc   End method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myDuplex = new Encoding056();
      let res =myDuplex.end('测试', 'GB18030', mustCall());
      expect(res instanceof stream.Writable).assertTrue();
    });

    /**
     * @tc.name   testStreamEncoding057
     * @tc.number SUB_IBRARY_ETSUTILS_STREAM_22800
     * @tc.desc   SetDefaultEncoding method encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStreamEncoding057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myDuplex = new Encoding057();
      let result = myDuplex.setDefaultEncoding('GB18030');
      myDuplex.write('你好');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    WriteProperty
     * @tc.number  SUB_IBRARY_ETSUTILS_STREAM_23900
     * @tc.desc    SetDefaultEncoding method encoding.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('WriteProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let writableStream = new WriteProperty();
      expect(writableStream.writableObjectMode).assertEqual(false);
      expect(writableStream.writableHighWatermark).assertEqual(16384);
      expect(writableStream.writable).assertEqual(true);
      expect(writableStream.writableLength).assertEqual(0);
      expect(writableStream.writableCorked).assertEqual(0);
      expect(writableStream.writableEnded).assertEqual(false);
      expect(writableStream.writableFinished).assertEqual(false);
    });

    /**
     * @tc.name    ReadableProperty
     * @tc.number  SUB_IBRARY_ETSUTILS_STREAM_24000
     * @tc.desc    SetDefaultEncoding method encoding.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('ReadableProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let readableStream = new ReadableProperty();
      expect(readableStream.readableObjectMode).assertEqual(false);
      expect(readableStream.readableHighWatermark).assertEqual(16384);
      expect(readableStream.readable).assertEqual(true);
      expect(readableStream.readableFlowing).assertEqual(null);
      expect(readableStream.readableLength).assertEqual(0);
      expect(readableStream.readableEncoding).assertEqual(null);
      expect(readableStream.readableEnded).assertEqual(false);
    });

    /**
     * @tc.name    DuplexProperty
     * @tc.number  SUB_IBRARY_ETSUTILS_STREAM_24100
     * @tc.desc    SetDefaultEncoding method encoding.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('DuplexProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let duplexStream = new DuplexProperty();
      expect(duplexStream.writableObjectMode).assertEqual(false);
      expect(duplexStream.writableHighWatermark).assertEqual(16384);
      expect(duplexStream.writable).assertEqual(true);
      expect(duplexStream.writableLength).assertEqual(0);
      expect(duplexStream.writableCorked).assertEqual(0);
      expect(duplexStream.writableEnded).assertEqual(false);
      expect(duplexStream.writableFinished).assertEqual(false);
    });
  })}

class StringDecoderReadable extends stream.Readable {
  constructor() {
    super();
  }
  constructor(opt: stream.ReadableOptions) {
    super(opt);
  }
  doRead(size: int) {
  }
}

class TestWritable extends stream.Writable {
  private fn: (chunk: string | Uint8Array, type: string, enc: string) => void;
  constructor(fn: (chunk: string | Uint8Array, type: string, enc: string) => void) {
    super();
    this.fn = fn;
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    this.fn(chunk, typeof chunk, encoding);
    callback.unsafeCall();
  }
}

class CustomWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    setTimeout(() => {
      callback.unsafeCall();
    }, 0);
  }

  async waitForFinish(): Promise<void> {
    return new Promise<void>((resolve) => {
      this.on('finish', (): void => {
        resolve(undefined);
      });
    });
  }
  async waitForDrain(): Promise<void> {
    return new Promise<void>((resolve) => {
      this.on('drain', (): void => {
        resolve(undefined);
      });
    });
  }
}

class ErrorEventWritable extends stream.Writable {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    if (chunk.toString() === 'C') {
      callback.unsafeCall(new Error('error'));
    } else {
      callback.unsafeCall();
    }
  }
}

class TestReadable extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: int) {
  }
}

const mustChecks: Function[] = [];

export function mustNotCall() {
  return mustCall(() => {
  }, 0);
}

function mustCall(fn?: Function, times: number = 1) {
  if (!fn) {
    fn = () => {}
  }
  if (typeof fn !== "function") {
    throw new Error("fn Parameter error")
  }
  if (typeof times !== "number") {
    throw new Error("times Parameter error")
  }
  let callCount = 0;
  let wrappedFn: Function = (...args: Any[]) => {
    callCount ++;
    return fn!.unsafeCall(...[...args]);
  }
  mustChecks.push((): void => {
    if (callCount !== times) {
      throw new Error(`Function was expected to be called ${ times } times, but was called ${ callCount } times.`);
    }
  });
  return wrappedFn;
}

function mustCallDoWrite(fn: Function, times: number = 1) {
  if (!fn) {
    fn = () => {}
  }
  if (typeof fn !== "function") {
    throw new Error("fn Parameter error")
  }
  if (typeof times !== "number") {
    throw new Error("times Parameter error")
  }
  let callCount = 0;
  let wrappedFn = (chunk: string | Uint8Array, encoding: string, callback: Function): void => {
    callCount++;
    fn.unsafeCall(chunk, encoding, callback);
  }
  mustChecks.push((): void => {
    if (callCount !== times) {
      throw new Error(`Function was expected to be called ${ times } times, but was called ${ callCount } times.`);
    }
  });
  return wrappedFn;
}

function mustCallDoTransform(fn: Function, times: number = 1) {
  if (!fn) {
    fn = () => {}
  }
  if (typeof fn !== "function") {
    throw new Error("fn Parameter error")
  }
  if (typeof times !== "number") {
    throw new Error("times Parameter error")
  }
  let callCount = 0;
  let wrappedFn = (chunk: string, encoding: string, callback: Function): void => {
    callCount++;
    fn.unsafeCall(chunk, encoding, callback);
  }
  mustChecks.push((): void => {
    if (callCount !== times) {
      throw new Error(`Function was expected to be called ${ times } times, but was called ${ callCount } times.`);
    }
  });
  return wrappedFn;
}

function mustCallDoWritev(fn: Function, times: number = 1) {
  if (!fn) {
    fn = () => {}
  }
  if (typeof fn !== "function") {
    throw new Error("fn Parameter error")
  }
  if (typeof times !== "number") {
    throw new Error("times Parameter error")
  }
  let callCount = 0;
  let wrappedFn = (chunks: string[] | Uint8Array[], cb: Function): void => {
    callCount++;
    fn.unsafeCall(chunks, cb);
  }
  mustChecks.push((): void => {
    if (callCount !== times) {
      throw new Error(`Function was expected to be called ${ times } times, but was called ${ callCount } times.`);
    }
  });
  return wrappedFn;
}

function mustCallOnError(fn: Function, times: number = 1) {
  if (!fn) {
    fn = () => {}
  }
  if (typeof fn !== "function") {
    throw new Error("fn Parameter error")
  }
  if (typeof times !== "number") {
    throw new Error("times Parameter error")
  }
  let callCount = 0;
  let wrappedFn: Function = (error: Object) => {
    callCount++;
    return fn.unsafeCall(error);
  }
  mustChecks.push((): void => {
    if (callCount !== times) {
      throw new Error(`Function was expected to be called ${ times } times, but was called ${ callCount } times.`);
    }
  });
  return wrappedFn;
}

function mustCallNoArgs(fn: Function, times: number = 1) {
  if (typeof fn !== "function") {
    throw new Error("fn Parameter error")
  }
  if (typeof times !== "number") {
    throw new Error("times Parameter error")
  }
  let callCount = 0;
  let wrappedFn: Function = (): void => {
    callCount++;
    fn.unsafeCall();
  }
  mustChecks.push((): void => {
    if (callCount !== times) {
      throw new Error(`Function was expected to be called ${ times } times, but was called ${ callCount } times.`);
    }
  });
  return wrappedFn;
}

function mustCallNull() {
  let times: number = 1
  let callCount = 0;
  let wrappedFn: Function = (): void => {
    callCount++;
  }
  mustChecks.push((): void => {
    if (callCount !== times) {
      throw new Error(`Function was expected to be called ${ times } times, but was called ${ callCount } times.`);
    }
  });
  return wrappedFn;
}

function mustCallOneObjectArgs(fn: Function, times: number = 1) {
  if (!fn) {
    fn = () => {}
  }
  if (typeof fn !== "function") {
    throw new Error("fn Parameter error")
  }
  if (typeof times !== "number") {
    throw new Error("times Parameter error")
  }
  let callCount = 0;
  let wrappedFn: Function = (obj: Object) => {
    callCount++;
    return fn.unsafeCall(obj);
  }
  mustChecks.push((): void => {
    if (callCount !== times) {
      throw new Error(`Function was expected to be called ${ times } times, but was called ${ callCount } times.`);
    }
  });
  return wrappedFn;
}

function mustCallSizeArgs(fn: Function, times: number = 1) {
  if (!fn) {
    fn = () => {}
  }
  if (typeof fn !== "function") {
    throw new Error("fn Parameter error")
  }
  if (typeof times !== "number") {
    throw new Error("times Parameter error")
  }
  let callCount = 0;
  let wrappedFn = (size: int): void => {
    callCount++;
    fn.unsafeCall(size);
  }
  mustChecks.push((): void => {
    if (callCount !== times) {
      throw new Error(`Function was expected to be called ${ times } times, but was called ${ callCount } times.`);
    }
  });
  return wrappedFn;
}

function mustCallCheckAll(sleep:Double = 20) {
  return new Promise<void>((resolve,reject)=>{
    setTimeout(() => {
      try {
        mustChecks.forEach(check => {
          check.unsafeCall();
        });
        mustChecks.length = 0;
        resolve(undefined);
      } catch (e) {
        e = e as Error;
        hilog.info(0x0000, 'testTags', '%{public}s', `error :${e}`);
        reject(e)
      }
    }, 20)
  })
}
