/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import stream from '@ohos.util.stream';
import { afterEach, describe, expect, it } from '@ohos/hypium';
import { common } from './common';
import emitter from '@ohos.events.emitter';

export default function StreamTest() {
  describe('ActStreamTest', function () {
    afterEach(async () => {
      await common.mustCallCheckAll().catch(e => expect(e.message).assertNull());
    })

    // Check the StreamWritable.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_00100
     * @tc.name: testStreamWritable001
     * @tc.desc: Create a writable stream.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritable001', 0, () => {
      let writableStream = new stream.Writable();
      expect(writableStream.writable).assertEqual(true);
      writableStream.end();
      expect(writableStream.writable).assertEqual(false);
    });

    // Check the StreamWritable.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_00200
     * @tc.name: testStreamWritable002
     * @tc.desc: The state when closing the flow.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritable002', 0, function () {
      let writableStream = new stream.Writable();
      expect(writableStream.writable).assertEqual(true);
      writableStream.end();
      expect(writableStream.writable).assertEqual(false);
      expect(writableStream.writableEnded).assertEqual(true);
    })

    // Check the StreamWritable.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_00300
     * @tc.name: testStreamWritable003
     * @tc.desc: The state of the writable attribute of a writable stream.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritable003', 0, () => {
      let writableStream = new stream.Writable();
      writableStream.doWrite = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        callback(new Error());
        expect(writableStream.writable).assertEqual(false);
      };
      expect(writableStream.writable).assertEqual(true);
      writableStream.write('test');
      expect(writableStream.writable).assertEqual(false);
      writableStream.on('error', common.mustCall());
    });

    // Check the StreamWritable.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_00400
     * @tc.name: testStreamWritable004
     * @tc.desc: Write data to stream.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritable004', 0, () => {
      let writableStream = new stream.Writable();
      writableStream.doWrite = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        expect(chunk.toString()).assertEqual('write content');
        callback(null);
      };
      writableStream.write('write content', 'utf8', (error: Error) => {
        expect(error).assertEqual(null);
      });
    });

    // Check the StreamWritable.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_00500
     * @tc.name: testStreamWritable005
     * @tc.desc: DoWrite not called.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritable005', 0, () => {
      let writableStream = new stream.Writable();
      writableStream.doWrite = common.mustNotCall();
      expect(writableStream.writable).assertEqual(true);
      writableStream.end();
      expect(writableStream.writable).assertEqual(false);
    });

    // Check the StreamWritableCbError.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_00600
     * @tc.name: testStreamWritableCbError001
     * @tc.desc: Write data failed.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableCbError001', 0, () => {
      let callbackCalled = false;
      let writable = new stream.Writable();
      writable.doWrite = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        callback(new Error());
      };
      writable.on('error', common.mustCall(() => {
        expect(callbackCalled).assertEqual(true);
      }));
      writable.write('hello', 'utf8', common.mustCall(() => {
        callbackCalled = true;
      }));
    });

    // Check the StreamWritableCbError.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_00700
     * @tc.name: testStreamWritableCbError002
     * @tc.desc: Write data failed.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableCbError002', 0, () => {
      let writableStream = new stream.Writable();
      writableStream.doWrite = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        callback(new Error());
      };
      writableStream.on('error', () => {
      })
      let number = 0;
      while (writableStream.write('t')) {
        number++;
      }
      expect(number).assertEqual(0);
    });

    // Check the StreamWritableCbTwice.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_00800
     * @tc.name: testStreamWritableCbTwice001
     * @tc.desc: Multiple callbacks.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableCbTwice001', 0, async () => {
      let writableStream = new stream.Writable();
      writableStream.doWrite = common.mustCall((chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        callback();
        callback();
      });
      writableStream.write('test');
      writableStream.on('error', common.mustCall((error: emitter.EventData) => {
        expect(error.data.message).assertEqual('Callback called multiple times');
        expect(error.data.name).assertEqual('BusinessError');
      }));
      await common.mustCallCheckAll().catch(e => expect(e.message).assertNull());
    });

    // Check the StreamWritableCbTwice.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_00900
     * @tc.name: testStreamWritableCbTwice002
     * @tc.desc: Multiple callbacks.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableCbTwice002', 0, () => {
      let writableStream = new stream.Writable();
      writableStream.doWrite = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        callback();
        setTimeout(() => {
          callback();
        }, 0);
      };
      writableStream.write('test');
      writableStream.on('error', common.mustCall((error: emitter.EventData) => {
        expect(error.data.message).assertEqual('Callback called multiple times');
        expect(error.data.name).assertEqual('BusinessError');
      }));
    });

    // Check the StreamWritableCbTwice.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_01000
     * @tc.name: testStreamWritableCbTwice003
     * @tc.desc: Multiple callbacks.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableCbTwice003', 0, () => {
      let writableStream = new stream.Writable();
      writableStream.doWrite = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        setTimeout(() => {
          callback();
        }, 0);
        setTimeout(() => {
          callback();
        }, 0);
      };
      writableStream.write('test');
      writableStream.on('error', common.mustCall((error: emitter.EventData) => {
        expect(error.data.message).assertEqual('Callback called multiple times');
        expect(error.data.name).assertEqual('BusinessError');
      }));
    });

    // Check the StreamWritableWriteError.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_01100
     * @tc.name: testStreamWritableWriteError001
     * @tc.desc: Write data error.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableWriteError001', 0, () => {
      let writableStream = new stream.Writable();
      let ticked = false;
      writableStream.doWrite = (chunk, encoding, callback) => {
      }
      writableStream.end();
      writableStream.write('test', 'utf8', common.mustCall((error: Error) => {
        expect(ticked).assertEqual(true);
        expect(error.message).assertEqual('write after end');
      }));
      ticked = true;
      writableStream.on('error', common.mustCall((error: emitter.EventData) => {
        expect(error.data.message).assertEqual('write after end');
      }));
    });

    // Check the StreamWritableWriteError.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_01200
     * @tc.name: testStreamWritableWriteError002
     * @tc.desc: Write data error.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableWriteError002', 0, () => {
      let writableStream = new stream.Writable();
      const test: Function = () => {
        writableStream.write(...[]);
      }
      expect(test).assertThrowError("Parameter error. The type of undefined must be string or UintArray");
    });

    // Check the StreamWritableWriteError.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_01300
     * @tc.name: testStreamWritableWriteError003
     * @tc.desc: Write data error.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableWriteError003', 0, () => {
      const test: Function = () => {
        let writableStream = new stream.Writable();
        writableStream.doWrite = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
          callback();
        };
        writableStream.write(...['my', 'test']);
      }
      expect(test).assertThrowError('Unknown encoding: test');
    });

    // Check the StreamWritableWritevFinish.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_01400
     * @tc.name: testStreamWritableWritevFinish001
     * @tc.desc: Finish event for different writev scenarios of writable streams.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableWritevFinish001', 0, (done) => {
      let writableStream = new stream.Writable();
      writableStream.doWrite = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        callback(new Error('write test error'));
      };
      writableStream.on('finish', common.mustNotCall());
      writableStream.on('prefinish', common.mustNotCall());
      writableStream.on('error', common.mustCall((error: emitter.EventData) => {
        expect(error.data.message).assertEqual('write test error');
      }));
      writableStream.end('my test');
      done()
    });

    // Check the StreamWritableWritevFinish.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_01500
     * @tc.name: testStreamWritableWritevFinish002
     * @tc.desc: Finish event for different writev scenarios of writable streams.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableWritevFinish002', 0, () => {
      let writable = new stream.Writable();
      writable.doWrite = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        setTimeout(() => {
          callback(new Error('write error'));
        });
      };
      writable.on('finish', common.mustNotCall());
      writable.on('prefinish', common.mustNotCall());
      writable.on('error', common.mustCall((error: emitter.EventData) => {
        expect(error.data.message).assertEqual('write error');
      }));
      writable.end('my test');
    });

    // Check the StreamWritableWritevFinish.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_01600
     * @tc.name: testStreamWritableWritevFinish003
     * @tc.desc: Finish event for different writev scenarios of writable streams.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableWritevFinish003', 0, () => {
      let writable = new stream.Writable();
      writable.doWrite = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        callback(new Error('write error'));
      };
      writable.doWritev = (chunk: string[] | Uint8Array[], callback: (error?: (Error | null)) => void) => {
        callback(new Error('writev error'));
      };
      writable.on('finish', common.mustNotCall());
      writable.on('prefinish', common.mustNotCall());
      writable.on('error', common.mustCall((error: emitter.EventData) => {
        expect(error.data.message).assertEqual('writev error');
      }));
      writable.cork();
      writable.write('test');
      setTimeout(function () {
        writable.end('test');
      }, 10);
    });

    // Check the StreamWritableWritevFinish.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_01700
     * @tc.name: testStreamWritableWritevFinish004
     * @tc.desc: Finish event for different writev scenarios of writable streams.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableWritevFinish004', 0, () => {
      let writable = new stream.Writable();
      writable.doWrite = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        setTimeout(() => {
          callback(new Error('write error'));
        }, 0)
      };
      writable.doWritev = (chunk: string[] | Uint8Array[], callback: (error?: (Error | null)) => void) => {
        setTimeout(() => {
          callback(new Error('writev error'));
        }, 0)
      };
      writable.on('finish', common.mustNotCall());
      writable.on('prefinish', common.mustNotCall());
      writable.on('error', common.mustCall((error: emitter.EventData) => {
        expect(error.data.message).assertEqual('writev error');
      }));
      writable.cork();
      writable.write('test');
      setTimeout(() => {
        writable.end('test');
      }, 0)
    });

    // Check the StreamWritableWritevFinish.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_01800
     * @tc.name: testStreamWritableWritevFinish005
     * @tc.desc: Finish event for different writev scenarios of writable streams.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableWritevFinish005', 0, async (done) => {
      let readableStream = new stream.Readable();
      readableStream.push('ok');
      readableStream.push(null);
      readableStream.doRead = () => {
      };
      let errorCalled = false;
      let writableStream = new stream.Writable();
      writableStream.on('finish', common.mustNotCall());
      writableStream.doWritev = (chunk: string[] | Uint8Array[], callback: Function) => {
        callback(new Error());
      };
      writableStream.on('error', common.mustCall(() => {
        errorCalled = true;
      }));
      readableStream.pipe(writableStream);
      setTimeout(() => {
        expect(errorCalled).assertEqual(true);
        done();
      }, 10);
    });

    // Check the StreamWritableWritevFinish.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_01900
     * @tc.name: testStreamWritableWritevFinish006
     * @tc.desc: Finish event for different writev scenarios of writable streams.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableWritevFinish006', 0, () => {
      let writableStream = new stream.Writable();
      writableStream.doWrite = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        setTimeout(callback);
      };
      writableStream.on('error', common.mustCall((error: emitter.EventData) => {
        expect(error.data.message).assertEqual('write after end');
      }));
      writableStream.on('finish', () => {
        writableStream.write("test");
      });
      writableStream.end();
    });

    // Check the StreamWritableConstructorSetMethods.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_02000
     * @tc.name: testStreamWritableConstructorSetMethods001
     * @tc.desc: Writable constructor Set Methods.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableConstructorSetMethods001', 0, () => {
      let writableStream = new stream.Writable();
      const test: Function = () => {
        writableStream.end('test');
      }
      expect(test).assertThrowError('The doWrite() method is not implemented');
    });

    // Check the StreamWritableConstructorSetMethods.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_02100
     * @tc.name: testStreamWritableConstructorSetMethods002
     * @tc.desc: Writable constructor Set Methods.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableConstructorSetMethods002', 0, () => {
      let _writev = (chunk, callback) => {
        expect(chunk.length).assertEqual(2);
        callback();
      };
      let _write = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        callback();
      };
      let writableStream1 = new stream.Writable();
      writableStream1.doWrite = _write;
      writableStream1.doWritev = _writev;
      expect(writableStream1.doWrite).assertEqual(_write);
      expect(writableStream1.doWritev).assertEqual(_writev);
      writableStream1.write('test');
      writableStream1.cork();
      writableStream1.write('test');
      writableStream1.write('test');
      writableStream1.end();
    });

    // Check the StreamWritableEndCbError.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_02200
     * @tc.name: testStreamWritableEndCbError001
     * @tc.desc: Writable end event error.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableEndCbError001', 0, () => {
      let writable = new stream.Writable();
      const _error = new Error('new error');
      writable.doWrite = (chunk, encoding, callback) => {
        setTimeout(() => {
          callback(_error);
        }, 0);
      };
      writable.on('error', common.mustCall((error: emitter.EventData) => {
        expect(error.data.message).assertEqual('new error');
      }));
      writable.write('test');
      writable.end(undefined, undefined, common.mustCall((error: Error) => {
        expect(error).assertEqual(_error);
      }));
      writable.end(undefined, undefined, common.mustCall((error: Error) => {
        expect(error).assertEqual(_error);
      }));
    });

    // Check the StreamWritableEndedState.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_02300
     * @tc.name: testStreamWritableEndedState001
     * @tc.desc: The status of writableEnded.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableEndedState001', 0, () => {
      let writableStream = new stream.Writable();
      let endCalled = false;
      writableStream.doWrite = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        expect(writableStream.writableEnded).assertEqual(false);
        callback();
      }
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

    // Check the StreamWritableFinished.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_02400
     * @tc.name: testStreamWritableFinished001
     * @tc.desc: The status of the writableFinished attribute.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableFinished001', 0, () => {
      expect(stream.Writable.prototype.hasOwnProperty('writableFinished')).assertEqual(true);
    });

    // Check the StreamWritableFinished.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_02500
     * @tc.name: testStreamWritableFinished002
     * @tc.desc: The status of the writableFinished attribute.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableFinished002', 0, () => {
      let writable = new stream.Writable();
      writable.doWrite = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        expect(writable.writableFinished).assertEqual(false);
        callback();
      };
      writable.on('finish', common.mustCall(() => {
        expect(writable.writableFinished).assertEqual(true);
      }));
      writable.end('testing finished state', undefined, common.mustCall(() => {
        expect(writable.writableFinished).assertEqual(true);
      }));
    });

    // Check the StreamWritableFinished.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_02600
     * @tc.name: testStreamWritableFinished003
     * @tc.desc: The status of the writableFinished attribute.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableFinished003', 0, () => {
      let writableStream = new stream.Writable();
      let finishCalled = false;
      writableStream.doWrite = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        callback();
      }
      writableStream.end();
      writableStream.on('finish', () => {
        finishCalled = true;
      });
      writableStream.on('finish', () => {
        expect(finishCalled).assertEqual(true);
      });
    });

    // Check the StreamWritableFinished.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_02700
     * @tc.name: testStreamWritableFinished004
     * @tc.desc: The status of the writableFinished attribute.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableFinished004', 0, () => {
      let writableStream = new stream.Writable();
      writableStream.doWrite = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        callback();
      }
      let sync = true;
      writableStream.on('prefinish', () => {
        expect(sync).assertEqual(true);
      });
      writableStream.end();
      sync = false;
    });

    // Check the StreamWritableFinished.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_02800
     * @tc.name: testStreamWritableFinished005
     * @tc.desc: The status of the writableFinished attribute.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableFinished005', 0, () => {
      let writableStream = new stream.Writable();
      writableStream.doWrite = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        callback();
      }
      writableStream.on('finish', () => {
        sync = false;
      });
      let sync = true;
      writableStream.on('prefinish', () => {
        expect(sync).assertEqual(true);
      });
      writableStream.end();
      sync = false;
    });

    // Check the StreamWritableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_02900
     * @tc.name: testStreamWritableProperties001
     * @tc.desc: Writable Properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableProperties001', 0, () => {
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

    // Check the StreamWritableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_03000
     * @tc.name: testStreamWritableProperties002
     * @tc.desc: Writable Properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableProperties002', 0, () => {
      let writableStream = new stream.Writable();
      expect(writableStream.writableObjectMode).assertEqual(false);
    });

    // Check the StreamWritableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_03100
     * @tc.name: testStreamWritableProperties003
     * @tc.desc: Writable Properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableProperties003', 0, () => {
      let writableStream = new stream.Writable();
      expect(writableStream.writableHighWatermark).assertEqual(16 * 1024);
    });

    // Check the StreamWritableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_03200
     * @tc.name: testStreamWritableProperties004
     * @tc.desc: Writable Properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableProperties004', 0, () => {
      let writableStream = new stream.Writable();
      writableStream.on('finish', () => {
        expect(writableStream.writable).assertEqual(false);
      });
      writableStream.end();
    });

    // Check the StreamWritableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_03300
     * @tc.name: testStreamWritableProperties005
     * @tc.desc: Writable Properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableProperties005', 0, () => {
      let writableStream = new stream.Writable();
      writableStream.doWrite = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        setTimeout(() => {
          callback();
        });
      };
      writableStream.write('hello');
      expect(writableStream.writableLength).assertEqual(5);
    });

    // Check the StreamWritableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_03400
     * @tc.name: testStreamWritableProperties006
     * @tc.desc: Writable Properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableProperties006', 0, () => {
      let writableStream = new stream.Writable();
      expect(writableStream.writableLength).assertEqual(0);
    });

    // Check the StreamWritableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_03500
     * @tc.name: testStreamWritableProperties007
     * @tc.desc: Writable Properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableProperties007', 0, () => {
      let customWritable = new CustomWritable();
      customWritable.write('hello');
      expect(customWritable.writableLength).assertEqual(5);
    });

    // Check the StreamWritableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_03600
     * @tc.name: testStreamWritableProperties008
     * @tc.desc: Writable Properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableProperties008', 0, () => {
      let customWritable = new CustomWritable();
      customWritable.write('hello');
      customWritable.write('world');
      expect(customWritable.writableLength).assertEqual(10);
    });

    // Check the StreamWritableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_03700
     * @tc.name: testStreamWritableProperties009
     * @tc.desc: Writable Properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableProperties009', 0, async () => {
      let customWritable = new CustomWritable();
      customWritable.write('hello');
      expect(customWritable.writableLength).assertEqual(5);
      customWritable.end();
      await customWritable.waitForFinish();
      expect(customWritable.writableLength).assertEqual(0);
    });

    // Check the StreamWritableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_03800
     * @tc.name: testStreamWritableProperties010
     * @tc.desc: Writable Properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableProperties010', 0, () => {
      const largeData = Array.from({
        length: Math.floor(16384 / 2)
      }, () => 'ab').join('');
      let writableStream = new stream.Writable();
      writableStream.doWrite = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        setTimeout(() => {
          callback();
        }, 10);
      };
      let writeResult = writableStream.write(largeData);
      expect(writeResult).assertEqual(false);
    });

    // Check the StreamWritableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_03900
     * @tc.name: testStreamWritableProperties011
     * @tc.desc: Writable Properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableProperties011', 0, async () => {
      const largeData = Array.from({
        length: Math.floor(16384 / 2)
      }, () => 'ab').join('');
      let writableStream = new CustomWritable();
      writableStream.write(largeData);
      writableStream.write(largeData, 'utf8', common.mustCall(() => {
      }));
      await new Promise((resolve) => {
        writableStream.on('drain', resolve);
      });
      expect(writableStream.writable).assertEqual(true);
    });

    // Check the StreamWritableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_04000
     * @tc.name: testStreamWritableProperties012
     * @tc.desc: Writable Properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableProperties012', 0, async () => {
      const largeData = Array.from({
        length: Math.floor(16384 / 2)
      }, () => 'ab').join('');
      let writableStream = new CustomWritable();
      writableStream.write(largeData);
      writableStream.on('drain', common.mustCall(() => {
      }));
      await writableStream.waitForDrain();
      expect(writableStream.writableEnded).assertEqual(false);
    });

    // Check the StreamWritableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_04100
     * @tc.name: testStreamWritableProperties013
     * @tc.desc: Writable Properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableProperties013', 0, () => {
      const largeData = Array.from({
        length: Math.floor(16384 / 2)
      }, () => 'ab').join('');
      let writableStream = new CustomWritable();
      writableStream.write(largeData);
      expect(writableStream.writable).assertEqual(true);
      writableStream.end();
      expect(writableStream.writable).assertEqual(false);
    });

    // Check the StreamWritableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_04200
     * @tc.name: testStreamWritableProperties014
     * @tc.desc: Writable Properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableProperties014', 0, () => {
      let writableStream = new CustomWritable();
      expect(writableStream.writableCorked).assertEqual(0);
      writableStream.cork();
      expect(writableStream.writableCorked).assertEqual(1);
      writableStream.write('Hello ');
      writableStream.write('World!');
      writableStream.uncork();
      expect(writableStream.writableCorked).assertEqual(0);
    });

    // Check the StreamWritableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_04300
     * @tc.name: testStreamWritableProperties015
     * @tc.desc: Writable Properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableProperties015', 0, () => {
      let errorEvent = new ErrorEventWritable();
      let chunks = 'C';
      errorEvent.write(chunks);
      errorEvent.on('error', (error: emitter.EventData) => {
        expect(error.data.message).assertEqual('error');
      });
    });

    // Check the StreamWritableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_04400
     * @tc.name: testStreamWritableProperties016
     * @tc.desc: Writable Properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableProperties016', 0, () => {
      let writableStream = new ErrorEventWritable();
      let chunks = 'C';
      writableStream.write(chunks);
      writableStream.on('error', (error: emitter.EventData) => {
        expect(error.data.message).assertEqual('error');
      });
      writableStream.end();
    });

    // Check the StreamWritableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_04500
     * @tc.name: testStreamWritableProperties017
     * @tc.desc: Writable Properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableProperties017', 0, () => {
      let writableStream = new stream.Writable();
      writableStream.on('close', common.mustCall(() => {
        expect(writableStream.writableFinished).assertEqual(true);
      }));
      writableStream.end();
    });

    // Check the StreamWritableCork.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_04600
     * @tc.name: testStreamWritableCork001
     * @tc.desc: Calling the core and uncork methods in Writable.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableCork001', 0, () => {
      let dataWritten = '';
      let writableStream = new stream.Writable();
      writableStream.doWrite = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        dataWritten += chunk;
        callback();
      }
      writableStream.cork();
      writableStream.write('a');
      writableStream.write('b');
      writableStream.uncork();
      expect(dataWritten).assertEqual('ab');
    });

    // Check the StreamWritableCork.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_04700
     * @tc.name: testStreamWritableCork002
     * @tc.desc: Calling the core and uncork methods in Writable.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableCork002', 0, () => {
      let dataWritten = '';
      let writableStream = new stream.Writable();
      writableStream.doWrite = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        dataWritten += chunk;
        callback();
      }
      writableStream.cork();
      writableStream.write('a');
      writableStream.cork();
      writableStream.write('b');
      writableStream.cork();
      writableStream.write('c');
      writableStream.uncork();
      writableStream.uncork();
      writableStream.uncork();
      expect(dataWritten).assertEqual('abc');
    });

    // Check the StreamWritableCork.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_04800
     * @tc.name: testStreamWritableCork003
     * @tc.desc: Calling the core and uncork methods in Writable.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableCork003', 0, () => {
      let dataWritten = '';
      let writableStream = new stream.Writable();
      writableStream.doWrite = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        dataWritten += chunk;
        callback();
      }
      writableStream.cork();
      writableStream.write('a');
      writableStream.cork();
      writableStream.write('b');
      writableStream.cork();
      writableStream.write('c');
      writableStream.uncork();
      expect(dataWritten).assertEqual('');
    });

    // Check the StreamWritableOff.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_04900
     * @tc.name: testStreamWritableOff001
     * @tc.desc: Remove listeners from Writable.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableOff001', 0, () => {
      let writableStream = new stream.Writable();
      writableStream.doWrite = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        callback();
      }
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

    // Check the StreamWritableOff.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_05000
     * @tc.name: testStreamWritableOff002
     * @tc.desc: Remove listeners from Writable.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableOff002', 0, () => {
      let writableStream = new stream.Writable();
      writableStream.doWrite = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        callback();
      }
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

    // Check the StreamWritableChangeDefaultEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_05100
     * @tc.name: testStreamWritableChangeDefaultEncoding001
     * @tc.desc: Default encoding in Writable.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableChangeDefaultEncoding001', 0, () => {
      let testWritable = new TestWritable((chunk, type, enc) => {
        expect(enc).assertEqual('utf8');
      });
      testWritable.write('test');
      testWritable.end();
    });

    // Check the StreamWritableChangeDefaultEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_05200
     * @tc.name: testStreamWritableChangeDefaultEncoding002
     * @tc.desc: Default encoding in Writable.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableChangeDefaultEncoding002', 0, () => {
      let testWritable = new TestWritable((chunk, type, enc) => {
        expect(enc).assertEqual('ascii');
        expect(type).assertEqual('string');
      });
      testWritable.setDefaultEncoding('ascii');
      testWritable.write('car');
      testWritable.end();
    });

    // Check the StreamWritableChangeDefaultEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_05300
     * @tc.name: testStreamWritableChangeDefaultEncoding003
     * @tc.desc: Default encoding in Writable.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableChangeDefaultEncoding003', 0, () => {
      const test: Function = () => {
        let testWritable = new TestWritable(
          (type, enc) => {
          });
        testWritable.setDefaultEncoding("abc");
        testWritable.write('bar');
        testWritable.end();
      }
      expect(test).assertThrowError('Unknown encoding: abc');
    });

    // Check the StreamWritableInvalidChunk.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_05400
     * @tc.name: testStreamWritableInvalidChunk001
     * @tc.desc: Write invalid chunk in Writable.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableInvalidChunk001', 0, () => {
      testWriteType(true, 'Parameter error. The type of true must be string or UintArray');
      testWriteType(undefined, 'Parameter error. The type of undefined must be string or UintArray');
      testWriteType(null, "Parameter error. The type of null must be string or UintArray");
    });

    function testWriteType(val, code) {
      const writable = new stream.Writable();
      writable.doWrite = () => {
      }
      writable.on('error', common.mustNotCall());
      if (code) {
        const test: Function = () => {
          writable.write(val)
        }
        expect(test).assertThrowError(code);
      } else {
        writable.write(val);
      }
    }

    // Check the StreamWritableInvalidDrain.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_05500
     * @tc.name: testStreamWritableDrain001
     * @tc.desc: Trigger of drain event in Writable.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableDrain001', 0, () => {
      let writableStream = new stream.Writable();
      let drainCalled = false;
      writableStream.doWrite = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        setTimeout(() => {
          callback();
        }, 0);
      }
      writableStream.on('drain', () => {
        drainCalled = true;
      });
      expect(drainCalled).assertEqual(false);
      writableStream.write('test');
      writableStream.end();
    });

    // Check the StreamWritableWritev.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_05600
     * @tc.name: testStreamWritableWritev001
     * @tc.desc: Trigger doWritev event.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamWritableWritev001', 0, () => {
      let writable = new stream.Writable();
      let doWriteVCalled = false;
      writable.doWritev = common.mustCall(function (chunks, cb) {
        doWriteVCalled = true;
        cb();
      })
      writable.write('test', 'utf8', common.mustCall());
      expect(doWriteVCalled).assertEqual(true);
    });

    // Check the StreamDuplexEnd.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_05700
     * @tc.name: testStreamDuplexEnd001
     * @tc.desc: Duplex stream end read.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamDuplexEnd001', 0, () => {
      let duplex = new stream.Duplex();
      let finishCalled = false;
      duplex.doRead = () => {
      };
      duplex.on('finish', () => {
        finishCalled = true;
      });
      duplex.resume();
      duplex.push(null);
      expect(finishCalled).assertEqual(false);
    });

    // Check the StreamDuplexWritableFinished.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_05800
     * @tc.name: testStreamDuplexWritableFinished001
     * @tc.desc: writableFinished property for Duplex stream.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamDuplexWritableFinished001', 0, () => {
      expect(stream.Duplex.prototype.hasOwnProperty('writableFinished')).assertEqual(true);
    });

    // Check the StreamDuplexWritableFinished.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_05900
     * @tc.name: testStreamDuplexWritableFinished002
     * @tc.desc: writableFinished property for Duplex stream.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamDuplexWritableFinished002', 0, () => {
      let duplex = new stream.Duplex();
      duplex.doWrite = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        expect(duplex.writableFinished).assertEqual(false);
        callback();
      };
      duplex.on('finish', common.mustCall(() => {
        expect(duplex.writableFinished).assertEqual(true);
      }));
      duplex.end('testing finished state', 'utf8', common.mustCall(() => {
        expect(duplex.writableFinished).assertEqual(true);
      }));
    });

    // Check the StreamDuplex.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_06000
     * @tc.name: testStreamDuplex001
     * @tc.desc: The basic functions of Duplex stream.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamDuplex001', 0, () => {
      let duplex = new stream.Duplex();
      expect(duplex instanceof stream.Duplex).assertEqual(true);
      let written: string | Uint8Array;
      let read: Object;
      duplex.doWrite = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        written = chunk;
        callback();
      };
      duplex.doRead = () => {
      };
      duplex.on('data', (obj) => {
        read = obj.data;
      });
      duplex.push('read');
      duplex.end('written');
      setTimeout(() => {
        expect(read).assertEqual('read');
        expect(written).assertEqual('written');
      }, 0);
    });

    // Check the StreamDuplex.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_06100
     * @tc.name: testStreamDuplex002
     * @tc.desc: The basic functions of Duplex stream.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamDuplex002', 0, () => {
      let duplex = new stream.Duplex();
      duplex.doWrite = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        callback();
      };
      duplex.write('duplex test', 'utf8', common.mustCall((err: Error) => {
        expect(err).assertEqual(null);
      }));
      duplex.doRead = common.mustCall((size) => {
        expect(size).assertEqual(16384);
        duplex.push('duplex test');
        duplex.push(null);
      });
      duplex.on('data', common.mustCall((chunk) => {
        expect(chunk.data).assertEqual('duplex test');
      }));
    });

    // Check the StreamDuplex.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_06200
     * @tc.name: testStreamDuplex003
     * @tc.desc: The basic functions of Duplex stream.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamDuplex003', 0, () => {
      let duplex = new stream.Duplex();
      duplex.doWrite = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        callback(new Error('Write error'));
      };
      duplex.on('error', common.mustCall((err: emitter.EventData) => {
        expect(err.data.message).assertEqual('Write error');
        expect(duplex.writable).assertEqual(false);
      }));
      duplex.write('test');
    });

    // Check the StreamDuplex.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_06300
     * @tc.name: testStreamDuplex004
     * @tc.desc: The basic functions of Duplex stream.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamDuplex004', 0, () => {
      let duplex = new stream.Duplex();
      duplex.doRead = () => {
        duplex.push('Sync data');
        duplex.push(null);
      };
      duplex.doWrite = (chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        setTimeout(() => {
          callback();
        }, 20);
      };
      duplex.on('data', (chunk) => {
        expect(chunk.data).assertEqual('Sync data');
      });
      duplex.write('Test data');
    });

    // Check the StreamDuplexProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_06400
     * @tc.name: testStreamDuplexProperties001
     * @tc.desc: Duplex Properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamDuplexProperties001', 0, () => {
      let duplex = new stream.Duplex();
      expect(duplex.writableObjectMode).assertEqual(false);
    });

    // Check the StreamReadableResumePause.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_06500
     * @tc.name: testStreamReadableResumePause001
     * @tc.desc: The resume and pause methods for Readable.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableResumePause001', 0, async () => {
      let readable = new TestReadable();
      let dataEmittedAfterResume = false;
      let dataCalled = false;
      readable.on('data', common.mustCall(() => {
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
      await new Promise(resolve => setTimeout(resolve, 80));
      expect(dataCalled).assertEqual(true);
    });

    // Check the StreamReadableResumePause.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_06600
     * @tc.name: testStreamReadableResumePause002
     * @tc.desc: The resume and pause methods for Readable.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableResumePause002', 0, () => {
      let readable = new TestReadable();
      readable.push('test');
      readable.pause();
      let dataChunk = readable.read();
      expect(dataChunk).assertEqual('test');
    });

    // Check the StreamReadableResumePause.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_06700
     * @tc.name: testStreamReadableResumePause003
     * @tc.desc: The resume and pause methods for Readable.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableResumePause003', 0, () => {
      let readable = new TestReadable();
      readable.pause();
      readable.on('readable', common.mustCall());
      setTimeout(() => {
        readable.resume();
        readable.push('test');
      }, 10);
      expect(readable.readable).assertEqual(true);
    });

    // Check the StreamReadableResumePause.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_06800
     * @tc.name: testStreamReadableResumePause004
     * @tc.desc: The resume and pause methods for Readable.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableResumePause004', 0, () => {
      let readable = new TestReadable();
      expect(readable.isPaused()).assertEqual(false);
    });

    // Check the StreamReadableResumePause.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_06900
     * @tc.name: testStreamReadableResumePause005
     * @tc.desc: The resume and pause methods for Readable.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableResumePause005', 0, () => {
      let readable = new TestReadable();
      readable.pause();
      expect(readable.isPaused()).assertEqual(true);
    });

    // Check the StreamReadableResumePause.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_07000
     * @tc.name: testStreamReadableResumePause006
     * @tc.desc: The resume and pause methods for Readable.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableResumePause006', 0, () => {
      let readable = new TestReadable();
      readable.pause();
      readable.resume();
      expect(readable.isPaused()).assertEqual(false);
    });

    // Check the StreamReadableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_07100
     * @tc.name: testStreamReadableProperties001
     * @tc.desc: Readable properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableProperties001', 0, () => {
      let readable = new stream.Readable();
      expect(readable.readableObjectMode).assertEqual(false);
    });

    // Check the StreamReadableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_07200
     * @tc.name: testStreamReadableProperties002
     * @tc.desc: Readable properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableProperties002', 0, () => {
      let readable = new stream.Readable();
      expect(readable.readable).assertEqual(true);
    });

    // Check the StreamReadableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_07300
     * @tc.name: testStreamReadableProperties003
     * @tc.desc: Readable properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableProperties003', 0, () => {
      let readable = new stream.Readable();
      readable.doRead = () => {
        throw new Error('Simulated error');
      };
      readable.push('test');
      expect(readable.readable).assertEqual(true);
      readable.on('error', common.mustCall(() => {
        expect(readable.readable).assertEqual(false);
      }));
    });

    // Check the StreamReadableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_07400
     * @tc.name: testStreamReadableProperties004
     * @tc.desc: Readable properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableProperties004', 0, () => {
      let readable = new stream.Readable();
      expect(readable.readableHighWatermark).assertEqual(16 * 1024);
    });

    // Check the StreamReadableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_07500
     * @tc.name: testStreamReadableProperties005
     * @tc.desc: Readable properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableProperties005', 0, () => {
      let readable = new stream.Readable();
      readable.doRead = () => {
      };
      readable.on('data', () => {
      });
      expect(readable.readableFlowing).assertEqual(true);
    });

    // Check the StreamReadableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_07600
     * @tc.name: testStreamReadableProperties006
     * @tc.desc: Readable properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableProperties006', 0, () => {
      let readable = new stream.Readable();
      readable.doRead = () => {
      };
      readable.resume();
      expect(readable.readableFlowing).assertEqual(true);
    });

    // Check the StreamReadableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_07700
     * @tc.name: testStreamReadableProperties007
     * @tc.desc: Readable properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableProperties007', 0, () => {
      let readable = new stream.Readable();
      expect(readable.readableLength).assertEqual(0);
    });

    // Check the StreamReadableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_07800
     * @tc.name: testStreamReadableProperties008
     * @tc.desc: Readable properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableProperties008', 0, () => {
      let readable = new stream.Readable();
      let testData = 'Hello world';
      readable.doRead = () => {
      };
      readable.push(testData);
      expect(readable.readableLength).assertEqual(testData.length);
    });

    // Check the StreamReadableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_07900
     * @tc.name: testStreamReadableProperties009
     * @tc.desc: Readable properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableProperties009', 0, () => {
      let readable = new stream.Readable();
      let testData = 'Hello world!';
      readable.doRead = () => {
      };
      readable.push(testData);
      let chunk = readable.read(testData.length / 2);
      expect(chunk.length).assertEqual(testData.length / 2);
      expect(readable.readableLength).assertEqual(testData.length / 2);
      let remainingChunk = readable.read(testData.length / 2);
      expect(remainingChunk.length).assertEqual(testData.length / 2);
      expect(readable.readableLength).assertEqual(0);
    });

    // Check the StreamReadableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_08000
     * @tc.name: testStreamReadableProperties010
     * @tc.desc: Readable properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableProperties010', 0, () => {
      let readable = new stream.Readable();
      readable.doRead = () => {
      };
      readable.push('Some data');
      readable.push(null);
      readable.on('data', () => {
      });
      readable.on('end', () => {
        expect(readable.readableLength).assertEqual(0);
      });
    });

    // Check the StreamReadableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_08100
     * @tc.name: testStreamReadableProperties011
     * @tc.desc: Readable properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableProperties011', 0, () => {
      let readable = new stream.Readable();
      let testData1 = 'First part';
      let testData2 = 'Second part';
      readable.doRead = () => {
      };
      readable.push(testData1);
      expect(readable.readableLength).assertEqual(testData1.length);
      readable.push(testData2);
      expect(readable.readableLength).assertEqual(testData1.length + testData2.length);
    });

    // Check the StreamReadableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_08200
     * @tc.name: testStreamReadableProperties012
     * @tc.desc: Readable properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableProperties012', 0, () => {
      let readable = new stream.Readable();
      readable.doRead = () => {
      };
      readable.push('test data');
      readable.read();
      expect(readable.readableEnded).assertEqual(false);
      readable.read();
      expect(readable.readableEnded).assertEqual(false);
    });

    // Check the StreamReadableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_08300
     * @tc.name: testStreamReadableProperties013
     * @tc.desc: Readable properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableProperties013', 0, () => {
      let readable = new stream.Readable();
      expect(readable.readable).assertEqual(true);
    });

    // Check the StreamReadableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_08400
     * @tc.name: testStreamReadableProperties014
     * @tc.desc: Readable properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableProperties014', 0, () => {
      let readable = new stream.Readable();
      readable.doRead = () => {
      };
      readable.push('test data');
      expect(readable.readableFlowing).assertEqual(true);
    });

    // Check the StreamReadableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_08500
     * @tc.name: testStreamReadableProperties015
     * @tc.desc: Readable properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableProperties015', 0, () => {
      let readable = new stream.Readable();
      readable.doRead = () => {
      };
      expect(readable.readableEnded).assertEqual(false);
    });

    // Check the StreamReadableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_08600
     * @tc.name: testStreamReadableProperties016
     * @tc.desc: Readable properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableProperties016', 0, () => {
      let readable = new stream.Readable();
      readable.doRead = () => {
      };
      readable.push('Some data');
      readable.push(null);
      readable.on('finished', common.mustCall(() => {
        expect(readable.readableEnded).assertEqual(true);
      }, 0));
    });

    // Check the StreamReadableProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_08700
     * @tc.name: testStreamReadableProperties017
     * @tc.desc: Readable properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableProperties017', 0, () => {
      let readable = new stream.Readable();
      readable.doRead = () => {
      };
      readable.pause();
      expect(readable.readable).assertEqual(true);
      readable.resume();
      expect(readable.readable).assertEqual(true);
    });

    // Check the StreamReadableConstructorSetMethods.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_08800
     * @tc.name: testStreamReadableConstructorSetMethods001
     * @tc.desc: Readable stream set methods.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableConstructorSetMethods001', 0, () => {
      let doReadCalled = true;
      let doRead = function doRead() {
        readableStream.push(null);
        doReadCalled = true;
      };
      let readableStream = new stream.Readable();
      readableStream.doRead = doRead;
      readableStream.resume();
      expect(doReadCalled).assertEqual(true);
    });

    // Check the StreamReadableData.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_08900
     * @tc.name: testStreamReadableData001
     * @tc.desc: Data events in a Readable stream.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableData001', 0, () => {
      let readable = new stream.Readable();
      readable.doRead = () => {
      };

      function read() {
      }

      readable.setEncoding('utf8');
      readable.on('readable', read);
      readable.off('readable');
      setTimeout(() => {
        readable.on('data', common.mustCall());
        readable.push('hello');
        expect(readable.readable).assertEqual(true);
      }, 0)
    });

    // Check the StreamReadableData.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_09000
     * @tc.name: testStreamReadableData002
     * @tc.desc: Data events in a Readable stream.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableData002', 0, () => {
      let readableStream = new stream.Readable();
      let dataSource = ["x"];
      readableStream.doRead = (size) => {
        let data = dataSource.shift();
        readableStream.push(data);
      }
      readableStream.on('data', (chunk) => {
        expect(chunk.data).assertEqual('x');
      });
    });

    // Check the StreamReadableDefaultEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_09100
     * @tc.name: testStreamReadableDefaultEncoding001
     * @tc.desc: Default encoding in Readable streams.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableDefaultEncoding001', 0, () => {
      const test: Function = () => {
        let readableStream = new stream.Readable();
        readableStream.setEncoding('my invalid encoding')
      }
      expect(test).assertThrowError('Parameter error. The type of my invalid encoding must be string.');
    });

    // Check the StreamReadableEmitReadableShortStream.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_09200
     * @tc.name: testStreamReadableEmitReadableShortStream001
     * @tc.desc: Call of events after data push in Readable Stream.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableEmitReadableShortStream001', 0, () => {
      let readableStream = new TestReadable();
      readableStream.on('readable', () => {
        while (true) {
          let chunk = readableStream.read();
          if (!chunk) {
            break;
          }
          expect(chunk.toString()).assertEqual('content');
        }
      });
      readableStream.push('content');
      readableStream.push(null);
    });

    // Check the StreamReadableEmitReadableShortStream.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_09300
     * @tc.name: testStreamReadableEmitReadableShortStream002
     * @tc.desc: Call of events after data push in Readable Stream.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableEmitReadableShortStream002', 0, () => {
      let readableStream = new TestReadable();
      let count = 0;
      readableStream.on('readable', () => {
        let chunk;
        while ((chunk = readableStream.read()) !== null) {
          count++;
          expect(chunk.toString()).assertEqual('content');
        }
      });
      readableStream.on('end', () => {
        expect(count).assertEqual(1);
      });
      readableStream.push('content');
      readableStream.push(null);
    });

    // Check the StreamReadableEnded.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_09400
     * @tc.name: testStreamReadableEnded001
     * @tc.desc: Readable readableEnded.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableEnded001', 0, () => {
      expect(stream.Readable.prototype.hasOwnProperty('readableEnded')).assertTrue();
    });

    // Check the StreamReadableEnded.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_09500
     * @tc.name: testStreamReadableEnded002
     * @tc.desc: Readable readableEnded.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableEnded002', 0, () => {
      let readableStream = new TestReadable();
      readableStream.doRead = () => {
        expect(readableStream.readableEnded).assertEqual(false);
        readableStream.push('asd');
        expect(readableStream.readableEnded).assertEqual(false);
        readableStream.push(null);
        expect(readableStream.readableEnded).assertEqual(false);
      };
      readableStream.on('end', () => {
        expect(readableStream.readableEnded).assertEqual(true);
      });
      readableStream.on('data', () => {
        expect(readableStream.readableEnded).assertEqual(false);
      });
    });

    // Check the StreamReadableEnded.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_09600
     * @tc.name: testStreamReadableEnded003
     * @tc.desc: Readable readableEnded.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableEnded003', 0, () => {
      let readable = new stream.Readable();
      readable.on('readable', () => {
        readable.read();
      });
      expect(readable.readable).assertEqual(true);
      readable.on('error', common.mustNotCall());
      readable.on('end', common.mustCall());
      readable.push('a');
      readable.push(null);
      readable.push(null);
    });

    // Check the StreamReadableHwm0Async.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_09700
     * @tc.name: testStreamReadableHwm0Async001
     * @tc.desc: Triggered in the end event of a readable stream.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableHwm0Async001', 0, () => {
      let count = 5;
      let dataTimes = 0;
      let readable = new stream.Readable();
      readable.doRead = () => {
        setTimeout(() => {
          if (count--) {
            readable.push('a');
          } else {
            readable.push(null);
          }
        }, 0);
      };
      readable.on('end', () => {
        expect(dataTimes).assertEqual(5);
      });
      readable.on('data', () => {
        dataTimes++;
      });
    });

    // Check the StreamReadableInvalidChunk.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_09800
     * @tc.name: testStreamReadableInvalidChunk001
     * @tc.desc: Write invalid chunk in Readable.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableInvalidChunk001', 0, () => {
      testPushInvalidArg([]);
      testPushInvalidArg({});
      testPushInvalidArg(0);
    });

    function testPushInvalidArg(val) {
      let readable = new stream.Readable();
      readable.doRead = () => {
      };
      readable.on('error', common.mustCall((error: emitter.EventData) => {
        expect(error.data.name).assertEqual('BusinessError');
      }));
      readable.push(val);
    }

    // Check the StreamReadablePauseAndResume.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_09900
     * @tc.name: testStreamReadablePauseAndResume001
     * @tc.desc: Pause and Resume in Readable Stream.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadablePauseAndResume001', 0, () => {
      let readable = new stream.Readable();
      readable.doRead = () => {
      };

      function read() {
      }

      readable.setEncoding('utf8');
      readable.on('readable', read);
      readable.off('readable');
      readable.pause();
      setTimeout(() => {
        expect(readable.isPaused()).assertTrue();
      }, 0);
    });

    // Check the StreamReadableReadable.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_10000
     * @tc.name: testStreamReadableReadable001
     * @tc.desc: Readable property in Readable.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableReadable001', 0, () => {
      let mustNotCall = common.mustNotCall();
      let readable = new stream.Readable();
      readable.doRead = () => {
      };
      expect(readable.readable).assertEqual(true);
      readable.on('end', mustNotCall);
      readable.resume();
      readable.push(null);
      expect(readable.readable).assertEqual(true);
      readable.off('end');
      readable.on('end', common.mustCall(() => {
        expect(readable.readable).assertEqual(false);
      }));
    });

    // Check the StreamReadableSetEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_10100
     * @tc.name: testStreamReadableSetEncoding001
     * @tc.desc: Set encoding for Readable.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableSetEncoding001', 0, () => {
      let readable = new stream.Readable();
      readable.setEncoding(null);
      expect(readable.readableEncoding).assertEqual('utf-8');
    });

    // Check the StreamReadableWithUnimplementedDoRead.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_10200
     * @tc.name: testStreamReadableWithUnimplementedDoRead001
     * @tc.desc: Readable does not implement DoRead.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableWithUnimplementedDoRead001', 0, () => {
      let readable = new stream.Readable();
      readable.read();
      readable.on('error', common.mustCall((error: emitter.EventData) => {
        expect(error.data.name).assertEqual('BusinessError');
        expect(error.data.message).assertEqual('The doRead() method is not implemented');
      }));
      readable.on('close', common.mustCall());
    });

    // Check the StreamTransformCallbackTwice.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_10300
     * @tc.name: testStreamTransformCallbackTwice001
     * @tc.desc: Call Callback twice in Transform.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamTransformCallbackTwice001', 0, () => {
      let transform = new stream.Transform();
      transform.doTransform = (chunk: string, encoding: string, callback: Function) => {
        callback();
        callback();
      };
      transform.on('error', common.mustCall((error: emitter.EventData) => {
        expect(error.data.name).assertEqual('BusinessError');
        expect(error.data.message).assertEqual('Callback called multiple times');
      }));
      transform.write('test');
    });

    // Check the StreamTransformConstructor.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_10400
     * @tc.name: testStreamTransformConstructor001
     * @tc.desc: Transform constructor.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamTransformConstructor001', 0, () => {
      let transform = new stream.Transform();
      const test: Function = () => {
        transform.end('test');
      }
      expect(test).assertThrowError('The doTransform() method is not implemented');
    });

    // Check the StreamTransformFlushData.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_10500
     * @tc.name: testStreamTransformFlushData001
     * @tc.desc: Transform uses the doFlush method to push data.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamTransformFlushData001', 0, () => {
      let transform = new stream.Transform();
      let expected = 'test';

      function _transform(chunk: string, encoding: string, next: Function) {
        next();
      }

      function _flush(next: Function) {
        next(null, expected);
      }

      transform.doTransform = _transform;
      transform.doFlush = _flush;
      transform.end('my test');
      transform.on('data', (data) => {
        expect(data.data).assertEqual(expected);
      });
    });

    // Check the StreamTransform.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_10600
     * @tc.name: testStreamTransform001
     * @tc.desc: Event triggering of Transform stream.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamTransform001', 0, () => {
      let transform = new stream.Transform();
      transform.doTransform = (chunk: string, encoding: string, callback: Function) => {
        let transformedChunk = chunk.toString().toUpperCase();
        transform.push(transformedChunk);
        callback();
      };
      let transformedData = '';
      transform.on('data', (chunk) => {
        transformedData += chunk.data;
      });
      transform.on('end', () => {
        expect(transformedData).assertEqual('TEST DATA');
      });
      transform.write('Test data');
      transform.end();
    });

    // Check the StreamTransform.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_10700
     * @tc.name: testStreamTransform002
     * @tc.desc: Event triggering of Transform stream.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamTransform002', 0, () => {
      let transform = new stream.Transform();
      let endCalled = false;
      transform.doTransform = (chunk: string, encoding: string, callback: Function) => {
        transform.push(chunk + ' ');
        callback();
      };
      transform.on('end', () => {
        endCalled = true;
      });
      transform.write('A');
      transform.end();
      expect(endCalled).assertEqual(false);
    });

    // Check the StreamTransform.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_10800
     * @tc.name: testStreamTransform003
     * @tc.desc: The basic methods of transform.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamTransform003', 0, () => {
      class MyTransform extends stream.Transform {
        doInitialize(callback: Function) {
          super.doInitialize(callback);
          doInitializeCalled = true;
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          super.doWrite(chunk, encoding, callback);
        }
      }

      let doInitializeCalled = false;
      let myTransform = new MyTransform();
      myTransform.on('data', () => {
      });
      expect(doInitializeCalled).assertEqual(true);
    });

    // Check the StreamTransform.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_10900
     * @tc.name: testStreamTransform004
     * @tc.desc: The basic methods of transform.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamTransform004', 0, () => {
      let transformStream = new stream.Transform();
      let result = transformStream.setDefaultEncoding('utf8');
      expect(result).assertEqual(true);
    });

    // Check the StreamTransform.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_11000
     * @tc.name: testStreamTransform005
     * @tc.desc: The basic methods of transform.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamTransform005', 0, () => {
      let transformStream = new stream.Transform();
      let dataSource = ["x"];
      transformStream.doRead = (size) => {
        let data = dataSource.shift();
        transformStream.push(data);
      }
      transformStream.on("data", common.mustCall((chunk) => {
        expect(chunk.data).assertEqual('x');
      }));
    });

    // Check the StreamTransform.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_11100
     * @tc.name: testStreamTransform006
     * @tc.desc: The basic methods of transform.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamTransform006', 0, (done) => {
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

    // Check the StreamTransform.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_11200
     * @tc.name: testStreamTransform007
     * @tc.desc: The basic methods of transform.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamTransform007', 0, (done) => {
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

    // Check the StreamTransform.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_11300
     * @tc.name: testStreamTransform008
     * @tc.desc: The basic methods of transform.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamTransform008', 0, () => {
      let transformStream = new stream.Transform();
      let result = transformStream.setEncoding('utf8');
      expect(result).assertEqual(true);
    });

    // Check the StreamTransform.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_11400
     * @tc.name: testStreamTransform009
     * @tc.desc: The basic methods of transform.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamTransform009', 0, () => {
      let transformStream = new stream.Transform();
      expect(transformStream.isPaused()).assertEqual(false);
      transformStream.pause();
      expect(transformStream.isPaused()).assertEqual(true);
    });

    // Check the StreamTransform.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_11500
     * @tc.name: testStreamTransform010
     * @tc.desc: The basic methods of transform.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamTransform010', 0, () => {
      class MyRead extends stream.Readable {
        doRead(size: number) {
          this.push("hello");
          this.push(null);
        }
      }

      class MyTransform extends stream.Transform {
        doTransform(chunk: any, encoding: any, callback: any) {
          this.push(chunk.toUpperCase());
          callback();
        }
      }

      let read = new MyRead();
      let tr = new MyTransform();
      read.pipe(tr);
      tr.on('data', common.mustCall((event) => {
        expect(event.data).assertEqual('HELLO');
      }));
    });

    // Check the StreamTransform.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_11600
     * @tc.name: testStreamTransform011
     * @tc.desc: The basic methods of transform.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamTransform011', 0, () => {
      class MyRead extends stream.Readable {
        doRead(size: number) {
          this.push("hello");
          this.push(null);
        }
      }

      class MyTransform extends stream.Transform {
        doTransform(chunk: any, encoding: any, callback: any) {
          this.push(chunk.toUpperCase());
          callback();
        }
      }

      let dataCalled = false;
      let read = new MyRead();
      let tr = new MyTransform();
      read.pipe(tr);
      read.unpipe(tr);
      tr.on('data', (event) => {
        dataCalled = true;
      });
      setTimeout(() => {
        expect(dataCalled).assertEqual(false);
      }, 0);
    });

    // Check the StreamTransform.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_11700
     * @tc.name: testStreamTransform012
     * @tc.desc: The basic methods of transform.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamTransform012', 0, () => {
      class TestTransform extends stream.Transform {
        constructor() {
          super();
        }

        doTransform(chunk, encoding, callback) {
          callback();
        }
      }

      let doReadCalled = false;
      let transform = new TestTransform();
      transform.on('data', () => {
      });
      transform.doRead = common.mustCall(() => {
        doReadCalled = true;
      });
      setTimeout(() => {
        expect(doReadCalled).assertEqual(true);
      }, 0);
    });

    // Check the StreamTransformProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_11800
     * @tc.name: testStreamTransformProperties001
     * @tc.desc: Duplex Properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamTransformProperties001', 0, () => {
      let transform = new stream.Transform();
      expect(transform.writableHighWatermark).assertEqual(16 * 1024);
    });

    // Check the StreamTransformProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_11900
     * @tc.name: testStreamTransformProperties002
     * @tc.desc: Duplex Properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamTransformProperties002', 0, () => {
      let transform = new stream.Transform();
      expect(transform.readableHighWatermark).assertEqual(16 * 1024);
    });

    // Check the StreamTransformEvent.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_12000
     * @tc.name: testStreamTransformEvent001
     * @tc.desc: Event triggering of Transform stream.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamTransformEvent001', 0, () => {
      let transform = new stream.Transform();
      transform.doTransform = (chunk: string, encoding: string, callback: Function) => {
        let transformedChunk = chunk.toString().toUpperCase();
        transform.push(transformedChunk);
        callback();
      };
      let transformedData = '';
      transform.on('data', (chunk) => {
        transformedData += chunk.data;
      });
      transform.on('end', () => {
        expect(transformedData).assertEqual('TEST DATA');
      });
      transform.write('Test data');
      transform.end();
    });

    // Check the StreamTransformEvent.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_12100
     * @tc.name: testStreamTransformEvent002
     * @tc.desc: Event triggering of Transform stream.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamTransformEvent002', 0, () => {
      let transformStream = new stream.Transform();
      transformStream.doTransform = common.mustCall((chunk: string, encoding: string, callback: Function) => {
        expect(chunk).assertEqual('data1');
        callback();
      })
      transformStream.cork();
      transformStream.write('data1', 'utf8');
      transformStream.uncork();
      transformStream.end();
      transformStream.on('finish', common.mustCall());
    });

    // Check the StreamTransformEvent.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_12200
     * @tc.name: testStreamTransformEvent003
     * @tc.desc: Event triggering of Transform stream.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamTransformEvent003', 0, () => {
      let transformStream = new stream.Transform();
      transformStream.doTransform = common.mustCall((chunk: string, encoding: string, callback: Function) => {
        expect(chunk).assertEqual('test');
        callback(new Error('Write error'));
      });
      transformStream.on('error', common.mustCall());
      transformStream.write('test');
    });

    // Check the StreamTransformEvent.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_12300
     * @tc.name: testStreamTransformEvent004
     * @tc.desc: Event triggering of Transform stream.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamTransformEvent004', 0, () => {
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

    // Check the StreamTransformEvent.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_12400
     * @tc.name: testStreamTransformEvent005
     * @tc.desc: Event triggering of Transform stream.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamTransformEvent005', 0, (done) => {
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

    // Check the pipe.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_12500
     * @tc.name: testStreamPipe001
     * @tc.desc: Verify the use of pipe.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamPipe001', 0, () => {
      class MyRead extends stream.Readable {
        doRead(size: number) {
          this.push("hello");
          this.push(null);
        }
      }

      class MyTransform extends stream.Transform {
        doTransform(chunk: any, encoding: any, callback: any) {
          this.push(chunk.toUpperCase());
          callback();
        }
      }

      let read = new MyRead();
      let tr = new MyTransform();
      read.pipe(tr);
      tr.on('data', common.mustCall((event: emitter.EventData) => {
        expect(event.data).assertEqual("HELLO")
      }));
      tr.on('error', common.mustNotCall());
    });

    // Check the pipe.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_12600
     * @tc.name: testStreamPipe002
     * @tc.desc: Verify the use of pipe.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamPipe002', 0, () => {
      class MyRead extends stream.Readable {
        doRead(size: number) {
          this.push("hello");
          this.push(null);
        }
      }

      class MyTransform extends stream.Transform {
        doTransform(chunk: any, encoding: any, callback: any) {
          this.push(chunk.toUpperCase());
          callback();
        }
      }

      let read = new MyRead();
      let tr = new MyTransform();
      read.pipe(tr);
      read.unpipe(tr);
      tr.on('data', (data) => {
        expect(data).assertFail();
      });
      tr.on('error', common.mustNotCall());
    });

    // Check the pipe.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_12700
     * @tc.name: testStreamPipe003
     * @tc.desc: Verify the use of pipe.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamPipe003', 0, () => {
      let readable = new TestReadable();
      readable.doRead = () => {
        readable.push('test data');
        readable.push(null);
      };
      let writable = new CustomWritable();
      writable.doWrite = common.mustCall((chunk, encoding, callback) => {
        expect(chunk).assertEqual('test data');
        callback();
      });
      readable.pipe(writable);
      writable.on('finish', common.mustCall());
    });

    // Check the pipe.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_12800
     * @tc.name: testStreamPipe004
     * @tc.desc: Verify the use of pipe.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamPipe004', 0, () => {
      let readable = new TestReadable();
      readable.doRead = () => {
        readable.push('Some data');
      };
      let writable = new CustomWritable();
      readable.pipe(writable);
      writable.doWrite = common.mustCall((chunk: string | Uint8Array, encoding: string, callback: (error?: (Error | null)) => void) => {
        expect(chunk).assertEqual('Some data');
      });
    });

    // Check the StreamDuplexProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_12900
     * @tc.name: testStreamDuplexProperties002
     * @tc.desc: Duplex Properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamDuplexProperties002', 0, () => {
      let duplex = new stream.Duplex();
      expect(duplex.writableHighWatermark).assertEqual(16 * 1024);
    });

    // Check the StreamDuplexProperties.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_13000
     * @tc.name: testStreamDuplexProperties003
     * @tc.desc: Duplex Properties.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamDuplexProperties003', 0, () => {
      let duplex = new stream.Duplex();
      expect(duplex.readableHighWatermark).assertEqual(16 * 1024);
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_13100
     * @tc.name: testStreamReadableread001
     * @tc.desc: Reads a buffer of a specified size from the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableread001', 0, () => {
      const stringdecoder = new StringDecoderReadable();
      let ss = stringdecoder.setEncoding("utf-8");
      expect(ss).assertEqual(true);
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_13200
     * @tc.name: testStreamReadableread002
     * @tc.desc: Reads a buffer of a specified size from the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableread002', 0, () => {
      const stringdecoder = new StringDecoderReadable();
      let ss = stringdecoder.setEncoding("utf8");
      expect(ss).assertEqual(true);
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_13300
     * @tc.name: testStreamReadableread003
     * @tc.desc: Reads a buffer of a specified size from the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableread003', 0, () => {
      let input = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
      const stringdecoder = new StringDecoderReadable();
      stringdecoder.push(input);
      let res = stringdecoder.read(2);
      let ss = stringdecoder.setEncoding("windows-1250")
      res = stringdecoder.read(4);
      expect(ss).assertEqual(false);
      expect(res).assertEqual('你好');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_13400
     * @tc.name: testStreamReadableread004
     * @tc.desc: Reads a buffer of a specified size from the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableread004', 0, () => {
      let input = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
      const stringdecoder = new StringDecoderReadable();
      stringdecoder.push(input);
      let res = stringdecoder.read(2);
      res = stringdecoder.read(4);
      expect(res).assertEqual('你好');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_13500
     * @tc.name: testStreamReadableread005
     * @tc.desc: Reads a buffer of a specified size from the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableread005', 0, () => {
      let enc : stream.ReadableOptions = {
        encoding : "utf-8"
      };
      let input = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
      const stringdecoder = new StringDecoderReadable(enc);
      stringdecoder.push(input);
      let res = stringdecoder.read(input.length);
      expect(res).assertEqual('你好');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_13600
     * @tc.name: testStreamReadableread006
     * @tc.desc: Reads a buffer of a specified size from the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableread006', 0, () => {
      let enc : stream.ReadableOptions = {
        encoding : "windows-1250"
      };
      let input = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
      const stringdecoder = new StringDecoderReadable(enc);
      let ss = stringdecoder.setEncoding();
      stringdecoder.push(input);
      let res = stringdecoder.read();
      expect(res).assertEqual('你好');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_13700
     * @tc.name: testStreamReadableread007
     * @tc.desc: Reads a buffer of a specified size from the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableread007', 0, () => {
      let enc : stream.ReadableOptions = {
        encoding : "windows-1250"
      };
      const stringdecoder = new StringDecoderReadable(enc);
      let res = stringdecoder.readableEncoding;
      expect(res).assertEqual('windows-1250');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_13800
     * @tc.name: testStreamReadableread008
     * @tc.desc: Reads a buffer of a specified size from the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableread008', 0, () => {
      const stringdecoder = new StringDecoderReadable();
      let res = stringdecoder.readableEncoding;
      expect(res).assertEqual('utf-8');
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_13900
     * @tc.name: testStreamReadableread009
     * @tc.desc: Reads a buffer of a specified size from the buffer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamReadableread009', 0, () => {
      let input = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
      const stringdecoder = new StringDecoderReadable();
      stringdecoder.push(input);
      let res = stringdecoder.read();
      expect(res).assertEqual('你好');
    });

    // Check the StreamReadablePipe.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_14000
     * @tc.name: testStreamPipe005
     * @tc.desc: Readable pipe.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamPipe005', 0, (done) => {
      let sumData = 0;
      const readable = new stream.Readable();
      readable.doRead = (size)=>{
        const onceData = 8*1024;
        if ((sumData + onceData) <41000) {
            sumData += onceData;
            readable.push('a'.repeat(onceData));
        } else if (sumData === 41000) {
            readable.push(null);
        } else {
           readable.push('a'.repeat(41000-sumData));
           sumData += (41000-sumData);
        }
      };
      const writable = new stream.Writable();
      let sum = 0;
      let callCount = 0;
      writable.doWrite = common.mustCall((chunk, encoding, callback)=>{
        sum += chunk.length;
        callCount++;
        if (callCount === 6) {
            expect(sum).assertEqual(41000);
            done();
        }
        setTimeout(()=>{
          callback()
        },100)
      },6);
      readable.pipe(writable);
    });

    // Check the StreamReadablePipe.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_14100
     * @tc.name: testStreamPipe006
     * @tc.desc: Readable pipe.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamPipe006', 0, async (done) => {
      let a = 0;
      const readable = new stream.Readable();
      readable.doRead = async (size) => {
        const s = 16 * 1024;
        const totality = 400000;
        if ((a + s) < totality) {
          a += s;
          readable.push('a'.repeat(s));
        } else if (a === totality) {
          readable.push(null);
        } else {
          readable.push('a'.repeat(totality - a));
          a += (totality - a);
        }
      };

      let sum = 0;

      class TransformStream extends stream.Transform {
        doWrite(chunk: any, encoding: any, callback: any) {
          sum += chunk.length;
          Promise.resolve().then((): void => {
            callback();
          });
          callback();
        }

        doTransform(chunk: any, encoding: any, callback: any) {
          expect(chunk.length).assertLarger(0);
          callback();
        }
      }

      const transformStream = new TransformStream();
      readable.pipe(transformStream);
      setTimeout(() => {
        expect(sum).assertEqual(400000);
        done();
      }, 0)
    });

    // Check the StreamDuplexDoWritev.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_14200
     * @tc.name: testStreamDuplexDoWritev001
     * @tc.desc: Duplex method doWritev.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamDuplexDoWritev001', 0, () => {
      class CustomDuplex extends stream.Duplex {
        data: string;

        constructor() {
          super();
          this.data = '';
        }

        doWritev(chunks: string[] | Uint8Array[], callback: Function) {
          for (const chunk of chunks) {
            this.data += chunk
          }
          callback();
        }
      }

      let duplex = new CustomDuplex();
      duplex.write('Hello ');
      duplex.write('World', 'utf8', common.mustCall(() => {
        expect(duplex.data).assertEqual('Hello World');
      }));
    });

    // Check the StreamDuplexDoWritev.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_14300
     * @tc.name: testStreamDuplexDoWritev002
     * @tc.desc: Duplex method doWritev.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamDuplexDoWritev002', 0, () => {
      class CustomDuplex extends stream.Duplex {
        constructor() {
          super();
        }

        doWritev(chunks: string[] | Uint8Array[], callback: Function) {
          callback(new Error('dowritev error'));
        }
      }

      let duplex = new CustomDuplex();
      duplex.write('Hello ');
      duplex.on('error', common.mustCall((err: emitter.EventData) => {
        expect(err.data.message).assertEqual('dowritev error');
      }));
    });

    // Check the StreamDuplexDoWritev.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_14400
     * @tc.name: testStreamDuplexDoWritev003
     * @tc.desc: Duplex method doWritev.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamDuplexDoWritev003', 0, () => {
      let duplex = new stream.Duplex();
      duplex.doWritev = common.mustCall(function (chunks: string[] | Uint8Array[], callback: Function) {
        callback();
        callback();
      })
      duplex.write('test', 'utf8', common.mustCall());
      duplex.on('error', common.mustCall((error: emitter.EventData) => {
        expect(error.data.name).assertEqual('BusinessError');
        expect(error.data.message).assertEqual('Callback called multiple times');
      }));
    });

    // Check the StreamEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_14500
     * @tc.name: testStreamEncoding001
     * @tc.desc: Write method encoding.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamEncoding001', 0, () => {
      let writable = new stream.Writable();
      writable.doWrite = common.mustCall((chunk: string | Uint8Array, encoding: string, callback: Function) => {
        expect(chunk).assertEqual('测试');
        expect(encoding).assertEqual('gb18030');
        callback();
      });
      let result = writable.write('测试', 'gb18030');
      expect(result).assertEqual(true);
    });

    // Check the StreamEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_14600
     * @tc.name: testStreamEncoding002
     * @tc.desc: Write method encoding.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamEncoding002', 0, () => {
      let writable = new stream.Writable();
      writable.doWrite = common.mustCall((chunk: string | Uint8Array, encoding: string, callback: Function) => {
        expect(chunk).assertEqual('你好');
        expect(encoding).assertEqual('gbk');
        callback();
      });
      let result = writable.write('你好', 'gbk');
      expect(result).assertEqual(true);
    });

    // Check the StreamEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_14700
     * @tc.name: testStreamEncoding003
     * @tc.desc: Write method encoding.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamEncoding003', 0, () => {
      let writable = new stream.Writable();
      writable.doWrite = common.mustCall((chunk: string | Uint8Array, encoding: string, callback: Function) => {
        expect(chunk).assertEqual('你好');
        expect(encoding).assertEqual('gb2312');
        callback();
      });
      let result = writable.write('你好', 'gb2312');
      expect(result).assertEqual(true);
    });

    // Check the StreamEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_14800
     * @tc.name: testStreamEncoding004
     * @tc.desc: End method encoding.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamEncoding004', 0, () => {
      let writable = new stream.Writable();
      writable.doWrite = common.mustCall((chunk: string | Uint8Array, encoding: string, callback: Function) => {
        expect(chunk).assertEqual('测试');
        expect(encoding).assertEqual('gb18030');
        callback();
      });
      writable.end('测试', 'gb18030', common.mustCall());
    });

    // Check the StreamEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_14900
     * @tc.name: testStreamEncoding005
     * @tc.desc: End method encoding.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamEncoding005', 0, () => {
      let writable = new stream.Writable();
      writable.doWrite = common.mustCall((chunk: string | Uint8Array, encoding: string, callback: Function) => {
        expect(chunk).assertEqual('你好');
        expect(encoding).assertEqual('gbk');
        callback();
      });
      writable.end('你好', 'gbk', common.mustCall());
    });

    // Check the StreamEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_15000
     * @tc.name: testStreamEncoding006
     * @tc.desc: End method encoding.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamEncoding006', 0, () => {
      let writable = new stream.Writable();
      writable.doWrite = common.mustCall((chunk: string | Uint8Array, encoding: string, callback: Function) => {
        expect(chunk).assertEqual('你好');
        expect(encoding).assertEqual('gb2312');
        callback();
      });
      writable.end('你好', 'gb2312', common.mustCall());
    });

    // Check the StreamEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_15100
     * @tc.name: testStreamEncoding007
     * @tc.desc: SetDefaultEncoding method encoding.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamEncoding007', 0, () => {
      let writable = new stream.Writable();
      writable.setDefaultEncoding('gb18030');
      writable.doWrite = common.mustCall((chunk: string | Uint8Array, encoding: string, callback: Function) => {
        expect(chunk).assertEqual('你好');
        expect(encoding).assertEqual('gb18030');
        callback();
      });
      writable.write('你好');
    });

    // Check the StreamEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_15200
     * @tc.name: testStreamEncoding008
     * @tc.desc: SetDefaultEncoding method encoding.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamEncoding008', 0, () => {
      let writable = new stream.Writable();
      writable.setDefaultEncoding('gbk');
      writable.doWrite = common.mustCall((chunk: string | Uint8Array, encoding: string, callback: Function) => {
        expect(chunk).assertEqual('你好');
        expect(encoding).assertEqual('gbk');
        callback();
      });
      writable.write('你好');
    });

    // Check the StreamEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_15300
     * @tc.name: testStreamEncoding009
     * @tc.desc: SetDefaultEncoding method encoding.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamEncoding009', 0, () => {
      let writable = new stream.Writable();
      writable.setDefaultEncoding('gb2312');
      writable.doWrite = common.mustCall((chunk: string | Uint8Array, encoding: string, callback: Function) => {
        expect(chunk).assertEqual('你好');
        expect(encoding).assertEqual('gb2312');
        callback();
      });
      writable.write('你好');
    });

    // Check the StreamEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_15400
     * @tc.name: testStreamEncoding010
     * @tc.desc: SetEncoding method encoding.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamEncoding010', 0, () => {
      let readable = new stream.Readable();
      let result = readable.setEncoding('gb18030');
      expect(readable.readableEncoding).assertEqual('gb18030');
      expect(result).assertEqual(true);
    });

    // Check the StreamEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_15500
     * @tc.name: testStreamEncoding011
     * @tc.desc: SetEncoding method encoding.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamEncoding011', 0, () => {
      let readable = new stream.Readable();
      let result = readable.setEncoding('gbk');
      expect(readable.readableEncoding).assertEqual('gbk');
      expect(result).assertEqual(true);
    });

    // Check the StreamEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_15600
     * @tc.name: testStreamEncoding012
     * @tc.desc: SetEncoding method encoding.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamEncoding012', 0, () => {
      let readable = new stream.Readable();
      let result = readable.setEncoding('gb2312');
      expect(readable.readableEncoding).assertEqual('gb2312');
      expect(result).assertEqual(true);
    });

    // Check the StreamEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_15700
     * @tc.name: testStreamEncoding013
     * @tc.desc: Push method encoding.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamEncoding013', 0, () => {
      let readable = new stream.Readable();
      readable.push('你好', 'gb18030');
      expect(readable.readableEncoding).assertEqual('gb18030');
    });

    // Check the StreamEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_15800
     * @tc.name: testStreamEncoding014
     * @tc.desc: Push method encoding.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamEncoding014', 0, () => {
      let readable = new stream.Readable();
      readable.push('你好', 'gbk');
      expect(readable.readableEncoding).assertEqual('gbk');
    });

    // Check the StreamEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_15900
     * @tc.name: testStreamEncoding015
     * @tc.desc: Push method encoding.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamEncoding015', 0, () => {
      let readable = new stream.Readable();
      readable.push('你好', 'gb2312');
      expect(readable.readableEncoding).assertEqual('gb2312');
    });

    // Check the StreamEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_16000
     * @tc.name: testStreamEncoding016
     * @tc.desc: Write method encoding.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamEncoding016', 0, () => {
      let duplex = new stream.Duplex();
      duplex.doWrite = common.mustCall((chunk: string | Uint8Array, encoding: string, callback: Function) => {
        expect(chunk).assertEqual('你好');
        expect(encoding).assertEqual('gb18030');
        callback();
      });
      duplex.write('你好', 'gb18030');
    });

    // Check the StreamEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_16100
     * @tc.name: testStreamEncoding017
     * @tc.desc: Write method encoding.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamEncoding017', 0, () => {
      let duplex = new stream.Duplex();
      duplex.doWrite = common.mustCall((chunk: string | Uint8Array, encoding: string, callback: Function) => {
        expect(chunk).assertEqual('你好');
        expect(encoding).assertEqual('gbk');
        callback();
      });
      duplex.write('你好', 'gbk');
    });

    // Check the StreamEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_16200
     * @tc.name: testStreamEncoding018
     * @tc.desc: Write method encoding.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamEncoding018', 0, () => {
      let duplex = new stream.Duplex();
      duplex.doWrite = common.mustCall((chunk: string | Uint8Array, encoding: string, callback: Function) => {
        expect(chunk).assertEqual('你好');
        expect(encoding).assertEqual('gb2312');
        callback();
      });
      duplex.write('你好', 'gb2312');
    });

    // Check the StreamEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_16300
     * @tc.name: testStreamEncoding019
     * @tc.desc: End method encoding.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamEncoding019', 0, () => {
      let duplex = new stream.Duplex();
      duplex.doWrite = common.mustCall((chunk: string | Uint8Array, encoding: string, callback: Function) => {
        expect(chunk).assertEqual('测试');
        expect(encoding).assertEqual('gb18030');
        callback();
      });
      duplex.end('测试', 'gb18030', common.mustCall());
    });

    // Check the StreamEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_16400
     * @tc.name: testStreamEncoding020
     * @tc.desc: End method encoding.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamEncoding020', 0, () => {
      let duplex = new stream.Duplex();
      duplex.doWrite = common.mustCall((chunk: string | Uint8Array, encoding: string, callback: Function) => {
        expect(chunk).assertEqual('测试');
        expect(encoding).assertEqual('gbk');
        callback();
      });
      duplex.end('测试', 'gbk', common.mustCall());
    });

    // Check the StreamEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_16500
     * @tc.name: testStreamEncoding021
     * @tc.desc: End method encoding.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamEncoding021', 0, () => {
      let duplex = new stream.Duplex();
      duplex.doWrite = common.mustCall((chunk: string | Uint8Array, encoding: string, callback: Function) => {
        expect(chunk).assertEqual('测试');
        expect(encoding).assertEqual('gb2312');
        callback();
      });
      duplex.end('测试', 'gb2312', common.mustCall());
    });

    // Check the StreamEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_16600
     * @tc.name: testStreamEncoding022
     * @tc.desc: SetDefaultEncoding method encoding.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamEncoding022', 0, () => {
      let duplex = new stream.Duplex();
      let result = duplex.setDefaultEncoding('gb18030');
      duplex.doWrite = common.mustCall((chunk: string | Uint8Array, encoding: string, callback: Function) => {
        expect(encoding).assertEqual('gb18030');
        callback();
      });
      duplex.write('你好');
      expect(result).assertEqual(true);
    });

    // Check the StreamEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_16700
     * @tc.name: testStreamEncoding023
     * @tc.desc: SetDefaultEncoding method encoding.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamEncoding023', 0, () => {
      let duplex = new stream.Duplex();
      let result = duplex.setDefaultEncoding('gbk');
      duplex.doWrite = common.mustCall((chunk: string | Uint8Array, encoding: string, callback: Function) => {
        expect(encoding).assertEqual('gbk');
        callback();
      });
      duplex.write('你好');
      expect(result).assertEqual(true);
    });

    // Check the StreamEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_16800
     * @tc.name: testStreamEncoding024
     * @tc.desc: SetDefaultEncoding method encoding.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamEncoding024', 0, () => {
      let duplex = new stream.Duplex();
      let result = duplex.setDefaultEncoding('gb2312');
      duplex.doWrite = common.mustCall((chunk: string | Uint8Array, encoding: string, callback: Function) => {
        expect(encoding).assertEqual('gb2312');
        callback();
      });
      duplex.write('你好');
      expect(result).assertEqual(true);
    });

    // Check the StreamEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_16900
     * @tc.name: testStreamEncoding025
     * @tc.desc: DoTransform method encoding.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamEncoding025', 0, () => {
      let transform = new stream.Transform();
      transform.doTransform = common.mustCall((chunk: string, encoding: string, callback: Function) => {
        expect(encoding).assertEqual('gb18030');
        expect(chunk).assertEqual('你好123');
        callback();
      });
      transform.write('你好123', 'gb18030');
      transform.end();
    });

    // Check the StreamEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_17000
     * @tc.name: testStreamEncoding026
     * @tc.desc: DoTransform method encoding.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamEncoding026', 0, () => {
      let transform = new stream.Transform();
      transform.doTransform = common.mustCall((chunk: string, encoding: string, callback: Function) => {
        expect(encoding).assertEqual('gbk');
        expect(chunk).assertEqual('你好123');
        callback();
      });
      transform.write('你好123', 'gbk');
      transform.end();
    });

    // Check the StreamEncoding.
    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_STREAM_17100
     * @tc.name: testStreamEncoding027
     * @tc.desc: DoTransform method encoding.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testStreamEncoding027', 0, () => {
      let transform = new stream.Transform();
      transform.doTransform = common.mustCall((chunk: string, encoding: string, callback: Function) => {
        expect(encoding).assertEqual('gb2312');
        expect(chunk).assertEqual('你好123');
        callback();
      });
      transform.write('你好123', 'gb2312');
      transform.end();
    });
  })
}

class StringDecoderReadable extends stream.Readable {
  constructor(opt?: stream.ReadableOptions) {
    super(opt);
  }
  doRead(size: number) {
  }
}

class TestWritable extends stream.Writable {
  private fn: (isBuffer: boolean, type: string, enc: string) => void;

  constructor(fn: (isBuffer: boolean, type: string, enc: string) => void) {
    super();
    this.fn = fn;
  }

  doWrite(chunk, encoding, callback) {
    this.fn(chunk, typeof chunk, encoding);
    callback();
  }
}

class CustomWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void): void {
    setTimeout(() => {
      callback();
    }, 0);
  }

  async waitForFinish(): Promise<void> {
    return new Promise((resolve) => {
      this.on('finish', () => {
        resolve();
      });
    });
  }

  async waitForDrain(): Promise<void> {
    return new Promise((resolve) => {
      this.on('drain', () => {
        resolve();
      });
    });
  }
}

class ErrorEventWritable extends stream.Writable {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error | null) => void): void {
    if (chunk.toString() === 'C') {
      callback(new Error('error'));
    } else {
      callback();
    }
  }
}

class TestReadable extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: number) {
  }
}