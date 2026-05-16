/*
 * Copyright (c)  2026 Huawei Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { afterEach, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { stream } from '@kit.ArkTS';

let writeSuccess = false;

class Resettable {
  constructor() {
    writeSuccess = false;
  }
}

function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve()
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

class TestWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    writeSuccess = true;
    console.log(`result: Writable chunk is ` + chunk);
    callback();
  }
}

class TestReadable extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: number) {
  }
}

class TestDuplex extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number) {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    writeSuccess = true;
    console.info("duplexStream chunk is", chunk);
    callback();
  }
}

export default function Stream2Test() {
  describe('Stream2Test', () => {
    beforeEach(() => {
      new Resettable();
    })
    afterEach(async () => {
      await sleep(20);
    })

    /**
     * @tc.name   testWritableWrite0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_21500
     * @tc.desc   Test Writable write method with empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWritableWrite0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testWritableWrite0030';
      try {
        let writableStream = new TestWritable();
        writableStream.write('', 'utf8');
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401)
      }
    })

    /**
     * @tc.name   testSetDefaultEncoding0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_21600
     * @tc.desc   Test setDefaultEncoding with no parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetDefaultEncoding0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetDefaultEncoding0006";
      let writableStream = new TestWritable();
      let result = writableStream.setDefaultEncoding();
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testSetDefaultEncoding0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_21700
     * @tc.desc   Test setDefaultEncoding with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetDefaultEncoding0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetDefaultEncoding0007";
      let writableStream = new TestWritable();
      let result = writableStream.setDefaultEncoding(null);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testSetDefaultEncoding0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_21800
     * @tc.desc   Test setDefaultEncoding with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetDefaultEncoding0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetDefaultEncoding0008";
      let writableStream = new TestWritable();
      let result = writableStream.setDefaultEncoding(undefined);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   testOn0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_21900
     * @tc.desc   Test on method with empty string event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOn0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testOn0005';
      let writableStream = new TestWritable();
      writableStream.on('', () => {
        TAG = "10";
      });
      expect(TAG).assertEqual("testOn0005");
    })

    /**
     * @tc.name   testOn0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_22000
     * @tc.desc   Test on method with null event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOn0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testOn0006';
      let writableStream = new TestWritable();
      writableStream.on(null, () => {
        TAG = "10";
      });
      expect(TAG).assertEqual("testOn0006");
    })

    /**
     * @tc.name   testOn0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_22100
     * @tc.desc   Test on method with undefined event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOn0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testOn0007';
      let writableStream = new TestWritable();
      writableStream.on(undefined, () => {
        TAG = "10";
      });
      expect(TAG).assertEqual("testOn0007");

    })

    /**
     * @tc.name   testOff0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_22200
     * @tc.desc   Test off method with empty string event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOff0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testOff0001';
      let writableStream = new TestWritable();
      try {
        writableStream.off('', () => {
          TAG = "10";
        });
      } catch (err) {
        expect(err.code).assertEqual(401)
      }
    })

    /**
     * @tc.name   testOff0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_22300
     * @tc.desc   Test off method with null event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOff0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testOff0002';
      let writableStream = new TestWritable();
      try {
        writableStream.off(null, () => {
          TAG = "10";
        });
      } catch (err) {
        expect(err.code).assertEqual(401)
      }
    })

    /**
     * @tc.name   testOff0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_22400
     * @tc.desc   Test off method with undefined event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOff0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testOff0003';
      let writableStream = new TestWritable();
      try {
        writableStream.off(undefined, () => {
          TAG = "10";
        });
      } catch (err) {
        expect(err.code).assertEqual(401)
      }
    })

    /**
     * @tc.name   testWritableDoInitialize0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_22500
     * @tc.desc   Test doInitialize with null callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWritableDoInitialize0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testWritableDoInitialize0002';

      class MyWritable extends stream.Writable {
        doInitialize(callback: Function) {
          super.doInitialize(callback);
          doInitializeSuccess = true;
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          super.doWrite(chunk, encoding, callback);
        }
      }

      let doInitializeSuccess = false;
      new MyWritable();
      expect(doInitializeSuccess).assertEqual(true);

    })

    /**
     * @tc.name   testWritableDoInitialize0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_22600
     * @tc.desc   Test doInitialize with undefined callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWritableDoInitialize0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testWritableDoInitialize0003';

      class MyWritable extends stream.Writable {
        doInitialize(callback: Function) {
          super.doInitialize(callback);
          doInitializeSuccess = true;
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          super.doWrite(chunk, encoding, callback);
        }
      }

      let doInitializeSuccess = false;
      new MyWritable();
      expect(doInitializeSuccess).assertEqual(true);

    })

    /**
     * @tc.name   testDoWrite0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_22700
     * @tc.desc   Test doWrite with null chunk.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDoWrite0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDoWrite0002';

      class TestWritableNullChunk extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          writeSuccess = true;
          callback();
        }
      }

      let writableStream = new TestWritableNullChunk();
      try {
        () => writableStream.write(null, 'utf8', () => {
        })
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testDoWrite0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_22800
     * @tc.desc   Test doWrite with undefined chunk.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDoWrite0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDoWrite0003';

      class TestWritableUndefinedChunk extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          writeSuccess = true;
          callback();
        }
      }

      let writableStream = new TestWritableUndefinedChunk();
      try {
        () => writableStream.write(undefined, 'utf8', () => {
        })
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testDoWrite0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_22900
     * @tc.desc   Test doWrite with empty string chunk.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDoWrite0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDoWrite0004';

      class TestWritableEmptyChunk extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          writeSuccess = true;
          callback();
        }
      }

      try {
        let writableStream = new TestWritableEmptyChunk();
        writableStream.write('', 'utf8', () => {
        });
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testDoWrite0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_23000
     * @tc.desc   Test doWrite with null encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDoWrite0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDoWrite0005';

      class TestWritableNullEncoding extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          writeSuccess = true;
          callback();
        }
      }

      let writableStream = new TestWritableNullEncoding();
      try {
        () => writableStream.write('test', null, () => {
        })
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testDoWrite0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_23100
     * @tc.desc   Test doWrite with undefined encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDoWrite0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDoWrite0006';

      class TestWritableUndefinedEncoding extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          writeSuccess = true;
          callback();
        }
      }

      let writableStream = new TestWritableUndefinedEncoding();
      writableStream.write('test', undefined, () => {
      });
      expect(writeSuccess).assertEqual(true);

    })

    /**
     * @tc.name   testDoWrite0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_23200
     * @tc.desc   Test doWrite with empty string encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDoWrite0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDoWrite0007';

      class TestWritableEmptyEncoding extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          writeSuccess = true;
          callback();
        }
      }

      let writableStream = new TestWritableEmptyEncoding();
      writableStream.write('test', '', () => {
      });
      expect(writeSuccess).assertEqual(true);

    })

    /**
     * @tc.name   testDoWrite0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_23300
     * @tc.desc   Test doWrite with null callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDoWrite0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDoWrite0008';

      class TestWritableNullCallback extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          writeSuccess = true;
          if (callback) {
            callback();
          }
        }
      }

      let writableStream = new TestWritableNullCallback();
      writableStream.write('test', 'utf8', null);
      expect(writeSuccess).assertEqual(true);

    })

    /**
     * @tc.name   testDoWrite0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_23400
     * @tc.desc   Test doWrite with undefined callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDoWrite0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDoWrite0009';

      class TestWritableUndefinedCallback extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          writeSuccess = true;
          if (callback) {
            callback();
          }
        }
      }

      let writableStream = new TestWritableUndefinedCallback();
      writableStream.write('test', 'utf8', undefined);
      expect(writeSuccess).assertEqual(true);

    })

    /**
     * @tc.name   testDoWritev0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_23500
     * @tc.desc   Test doWritev with null chunks.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDoWritev0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDoWritev0002';

      class TestWritableNullChunks extends stream.Writable {
        constructor() {
          super();
        }

        doWritev(chunks: string[] | Uint8Array[], callback: Function) {
          writeSuccess = true;
          callback();
        }
      }

      let writableStream = new TestWritableNullChunks();
      try {
        () => writableStream.write(null, "utf8", () => {
        })
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testDoWritev0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_23600
     * @tc.desc   Test doWritev with undefined chunks.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDoWritev0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDoWritev0003';

      class TestWritableUndefinedChunks extends stream.Writable {
        constructor() {
          super();
        }

        doWritev(chunks: string[] | Uint8Array[], callback: Function) {
          writeSuccess = true;
          callback();
        }
      }

      let writableStream = new TestWritableUndefinedChunks();
      try {
        () => writableStream.write(undefined, 'utf8', () => {
        })
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testWritableObjectMode0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_23700
     * @tc.desc   Test writableObjectMode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWritableObjectMode0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testWritableObjectMode0001';

      let writableStream = new stream.Writable();
      expect(writableStream.writableObjectMode).assertEqual(false);

    })

    /**
     * @tc.name   testWritableHighWatermark0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_23800
     * @tc.desc   Test writableHighWatermark property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWritableHighWatermark0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testWritableHighWatermark0001';

      let writableStream = new stream.Writable();
      expect(writableStream.writableHighWatermark).assertEqual(16384);

    })

    /**
     * @tc.name   testWritableState0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_23900
     * @tc.desc   Test writable property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWritableState0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testWritableState0001';

      let writableStream = new TestWritable();
      expect(writableStream.writable).assertEqual(true);

    })

    /**
     * @tc.name   testWritableLength0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_24000
     * @tc.desc   Test writableLength property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWritableLength0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testWritableLength0001';

      let writableStream = new TestWritable();
      expect(writableStream.writableLength).assertEqual(0);

    })

    /**
     * @tc.name   testWritableCorked0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_24100
     * @tc.desc   Test writableCorked property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWritableCorked0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testWritableCorked0001';

      let writableStream = new TestWritable();
      expect(writableStream.writableCorked).assertEqual(0);

    })

    /**
     * @tc.name   testWritableEnded0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_24200
     * @tc.desc   Test writableEnded property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWritableEnded0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testWritableEnded0001';

      let writableStream = new TestWritable();
      expect(writableStream.writableEnded).assertEqual(false);

    })

    /**
     * @tc.name   testWritableFinished0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_24300
     * @tc.desc   Test writableFinished property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWritableFinished0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testWritableFinished0001';

      let writableStream = new TestWritable();
      expect(writableStream.writableFinished).assertEqual(false);

    })

    /**
     * @tc.name   testSetEncoding0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_24400
     * @tc.desc   Test setEncoding with no parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetEncoding0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSetEncoding0001';

      let readableStream = new TestReadable();
      let result = readableStream.setEncoding();
      expect(result).assertEqual(false);

    })

    /**
     * @tc.name   testSetEncoding0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_24500
     * @tc.desc   Test setEncoding with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetEncoding0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSetEncoding0002';

      let readableStream = new TestReadable();
      let result = readableStream.setEncoding(null);
      expect(result).assertEqual(false);

    })

    /**
     * @tc.name   testSetEncoding0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_24600
     * @tc.desc   Test setEncoding with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetEncoding0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSetEncoding0003';

      let readableStream = new TestReadable();
      let result = readableStream.setEncoding(undefined);
      expect(result).assertEqual(false);

    })

    /**
     * @tc.name   testSetEncoding0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_24700
     * @tc.desc   Test setEncoding with empty string parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetEncoding0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSetEncoding0004';

      let readableStream = new TestReadable();
      let result = readableStream.setEncoding('');
      expect(result).assertEqual(false);

    })

    /**
     * @tc.name   testPipe0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_24800
     * @tc.desc   Test pipe with null destination.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPipe0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPipe0001';

      class TestReadablePipe extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {
          this.push('test');
          this.push(null);
        }
      }

      let readable = new TestReadablePipe();
      try {
        () => readable.pipe(null);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testPipe0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_24900
     * @tc.desc   Test pipe with undefined destination.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPipe0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class TestReadablePipe extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {
          this.push('test');
          this.push(null);
        }
      }

      let readable = new TestReadablePipe();
      try {
        () => readable.pipe(undefined);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testPipe0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_25000
     * @tc.desc   Test pipe with null options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPipe0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPipe0003';

      class TestReadablePipe extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {
          this.push('test');
          this.push(null);
        }
      }

      class TestWritablePipe extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let readable = new TestReadablePipe();
      let writable = new TestWritablePipe();
      let result = readable.pipe(writable, null);
      expect(result instanceof stream.Writable).assertEqual(true);
    })

    /**
     * @tc.name   testPipe0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_25100
     * @tc.desc   Test pipe with undefined options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPipe0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPipe0004';

      class TestReadablePipe extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {
          this.push('test');
          this.push(null);
        }
      }

      class TestWritablePipe extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let readable = new TestReadablePipe();
      let writable = new TestWritablePipe();
      let result = readable.pipe(writable, undefined);
      expect(result instanceof stream.Writable).assertEqual(true);

    })

    /**
     * @tc.name   testUnpipe0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_25200
     * @tc.desc   Test unpipe with null destination.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnpipe0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testUnpipe0001';

      class TestReadableUnpipe extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {
          this.push('test');
          this.push(null);
        }
      }

      class TestWritableUnpipe extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let readable = new TestReadableUnpipe();
      let writable = new TestWritableUnpipe();
      readable.pipe(writable);
      let result = readable.unpipe(null);
      expect(result instanceof stream.Readable).assertEqual(true);

    })

    /**
     * @tc.name   testUnpipe0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_25300
     * @tc.desc   Test unpipe with undefined destination.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnpipe0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testUnpipe0002';

      class TestReadableUnpipe extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {
          this.push('test');
          this.push(null);
        }
      }

      class TestWritableUnpipe extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let readable = new TestReadableUnpipe();
      let writable = new TestWritableUnpipe();
      readable.pipe(writable);
      let result = readable.unpipe(undefined);
      expect(result instanceof stream.Readable).assertEqual(true);

    })

    /**
     * @tc.name   testReadableDoInitialize0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_25400
     * @tc.desc   Test doInitialize with null callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReadableDoInitialize0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadableDoInitialize0001';

      class MyReadable extends stream.Readable {
        doInitialize(callback: Function) {
          super.doInitialize(callback);
          doInitializeSuccess = true;
        }

        doRead(size: number) {
        }
      }

      let doInitializeSuccess = false;
      let readableStream = new MyReadable();
      readableStream.on('data', () => {
      });
      expect(doInitializeSuccess).assertEqual(true);

    })

    /**
     * @tc.name   testReadableDoInitialize0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_25500
     * @tc.desc   Test doInitialize with undefined callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReadableDoInitialize0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadableDoInitialize0002';

      class MyReadable extends stream.Readable {
        doInitialize(callback: Function) {
          super.doInitialize(callback);
          doInitializeSuccess = true;
        }

        doRead(size: number) {
        }
      }

      let doInitializeSuccess = false;
      let readableStream = new MyReadable();
      readableStream.on('data', () => {
      });
      expect(doInitializeSuccess).assertEqual(true);

    })

    /**
     * @tc.name   testDoRead0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_25600
     * @tc.desc   Test doRead with null size.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDoRead0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testDoRead0001';

      class TestReadableNullSize extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {
          this.push('test');
          this.push(null);
        }
      }

      let readableStream = new TestReadableNullSize();
      readableStream.on('data', () => {
        TAG = "10";
      });
      expect(TAG).assertEqual("testDoRead0001")
    })

    /**
     * @tc.name   testDoRead0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_25700
     * @tc.desc   Test doRead with undefined size.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDoRead0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let TAG = 'testDoRead0002';

      class TestReadableUndefinedSize extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {
          this.push('test');
          this.push(null);
        }
      }

      let readableStream = new TestReadableUndefinedSize();

      readableStream.on('data', () => {
        TAG = "10";
      });
      expect(TAG).assertEqual("testDoRead0002");
    })

    /**
     * @tc.name   testDuplexDoWrite0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_25800
     * @tc.desc   Test Duplex doWrite with null chunk.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDuplexDoWrite0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplexDoWrite0001';

      class TestDuplexNullChunk extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          writeSuccess = true;
          callback();
        }
      }

      let duplexStream = new TestDuplexNullChunk();
      try {
        () => duplexStream.write(null, 'utf8', () => {
        });
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testDuplexDoWrite0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_25900
     * @tc.desc   Test Duplex doWrite with undefined chunk.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDuplexDoWrite0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplexDoWrite0002';

      class TestDuplexUndefinedChunk extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          writeSuccess = true;
          callback();
        }
      }

      let duplexStream = new TestDuplexUndefinedChunk();
      try {
        () => duplexStream.write(undefined, 'utf8', () => {
        })
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testDuplexDoWrite0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_26000
     * @tc.desc   Test Duplex doWrite with empty string chunk.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDuplexDoWrite0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplexDoWrite0003';

      class TestDuplexEmptyChunk extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          writeSuccess = true;
          callback();
        }
      }

      let duplexStream = new TestDuplexEmptyChunk();
      try {
        duplexStream.write('', 'utf8', () => {
        });
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testDuplexDoWrite0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_26100
     * @tc.desc   Test Duplex doWrite with null encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDuplexDoWrite0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplexDoWrite0004';

      class TestDuplexNullEncoding extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          writeSuccess = true;
          callback();
        }
      }

      let duplexStream = new TestDuplexNullEncoding();
      try {
        () => duplexStream.write('test', null, () => {
        })
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testDuplexDoWrite0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_26200
     * @tc.desc   Test Duplex doWrite with undefined encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDuplexDoWrite0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplexDoWrite0005';

      class TestDuplexUndefinedEncoding extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          writeSuccess = true;
          callback();
        }
      }

      let duplexStream = new TestDuplexUndefinedEncoding();
      duplexStream.write('test', undefined, () => {
      });
      expect(writeSuccess).assertEqual(true);

    })

    /**
     * @tc.name   testDuplexDoWrite0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_26300
     * @tc.desc   Test Duplex doWrite with empty string encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDuplexDoWrite0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplexDoWrite0006';

      class TestDuplexEmptyEncoding extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          writeSuccess = true;
          callback();
        }
      }

      let duplexStream = new TestDuplexEmptyEncoding();
      duplexStream.write('test', '', () => {
      });
      expect(writeSuccess).assertEqual(true);

    })

    /**
     * @tc.name   testDuplexDoWritev0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_26400
     * @tc.desc   Test Duplex doWritev with null chunks.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDuplexDoWritev0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplexDoWritev0002';

      class TestDuplexNullChunks extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWritev(chunks: string[] | Uint8Array[], callback: Function) {
          writeSuccess = true;
          callback();
        }
      }

      let duplexStream = new TestDuplexNullChunks();
      try {
        () => duplexStream.write(null, 'utf8', () => {
        })
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testDuplexDoWritev0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_26500
     * @tc.desc   Test Duplex doWritev with undefined chunks.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDuplexDoWritev0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class TestDuplexUndefinedChunks extends stream.Duplex {
        constructor() {
          super();
        }

        doRead(size: number) {
        }

        doWritev(chunks: string[] | Uint8Array[], callback: Function) {
          writeSuccess = true;
          callback();
        }
      }

      let duplexStream = new TestDuplexUndefinedChunks();
      try {
        () => duplexStream.write(undefined, 'utf8', () => {
        })
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testDoTransform0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_26600
     * @tc.desc   Test doTransform with null chunk.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDoTransform0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDoTransform0001';

      class TestTransformNullChunk extends stream.Transform {
        constructor() {
          super();
        }

        doTransform(chunk: string, encoding: string, callback: Function) {
          if (callback) {
            callback();
          }
        }

        doFlush(callback: Function) {
          callback();
        }
      }

      let transformStream = new TestTransformNullChunk();
      try {
        () => transformStream.write(null, 'utf8');
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testDoTransform0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_26700
     * @tc.desc   Test doTransform with undefined chunk.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDoTransform0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDoTransform0002';

      class TestTransformUndefinedChunk extends stream.Transform {
        constructor() {
          super();
        }

        doTransform(chunk: string, encoding: string, callback: Function) {
          if (callback) {
            callback();
          }
        }

        doFlush(callback: Function) {
          callback();
        }
      }

      let transformStream = new TestTransformUndefinedChunk();
      try {
        () => transformStream.write(undefined, 'utf8');
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testDoTransform0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_26800
     * @tc.desc   Test doTransform with empty string chunk.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDoTransform0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDoTransform0003';

      class TestTransformEmptyChunk extends stream.Transform {
        constructor() {
          super();
        }

        doTransform(chunk: string, encoding: string, callback: Function) {
          if (callback) {
            callback();
          }
        }

        doFlush(callback: Function) {
          callback();
        }
      }

      let transformStream = new TestTransformEmptyChunk();

      try {
        transformStream.write('', 'utf8');
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testDoTransform0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_26900
     * @tc.desc   Test doTransform with null encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDoTransform0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDoTransform0004';

      class TestTransformNullEncoding extends stream.Transform {
        constructor() {
          super();
        }

        doTransform(chunk: string, encoding: string, callback: Function) {
          if (callback) {
            callback();
          }
        }

        doFlush(callback: Function) {
          callback();
        }
      }

      let transformStream = new TestTransformNullEncoding();
      try {
        () => transformStream.write('test', null, () => {
        });
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testDoTransform0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_27000
     * @tc.desc   Test doTransform with undefined encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDoTransform0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDoTransform0005';

      class TestTransformUndefinedEncoding extends stream.Transform {
        constructor() {
          super();
        }

        doTransform(chunk: string, encoding: string, callback: Function) {
          if (callback) {
            callback();
          }
        }

        doFlush(callback: Function) {
          callback();
        }
      }

      let transformStream = new TestTransformUndefinedEncoding();
      transformStream.write('test', undefined, () => {
      });
      expect(writeSuccess).assertEqual(false);

    })

    /**
     * @tc.name   testDoTransform0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_27100
     * @tc.desc   Test doTransform with empty string encoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDoTransform0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDoTransform0006';

      class TestTransformEmptyEncoding extends stream.Transform {
        constructor() {
          super();
        }

        doTransform(chunk: string, encoding: string, callback: Function) {
          if (callback) {
            callback();
          }
        }

        doFlush(callback: Function) {
          callback();
        }
      }

      let transformStream = new TestTransformEmptyEncoding();
      transformStream.write('test', '', () => {
      });
      expect(writeSuccess).assertEqual(false);

    })

    /**
     * @tc.name   testDoTransform0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_27200
     * @tc.desc   Test doTransform with null callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDoTransform0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDoTransform0007';

      class TestTransformNullCallback extends stream.Transform {
        constructor() {
          super();
        }

        doTransform(chunk: string, encoding: string, callback: Function) {
          writeSuccess = true;
          if (callback) {
            callback();
          }
        }

        doFlush(callback: Function) {
          callback();
        }
      }

      let transformStream = new TestTransformNullCallback();
      transformStream.write('test', 'utf8', null);
      expect(writeSuccess).assertEqual(true);

    })

    /**
     * @tc.name   testDoTransform0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_27300
     * @tc.desc   Test doTransform with undefined callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDoTransform0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDoTransform0008';

      class TestTransformUndefinedCallback extends stream.Transform {
        constructor() {
          super();
        }

        doTransform(chunk: string, encoding: string, callback: Function) {
          writeSuccess = true;
          if (callback) {
            callback();
          }
        }

        doFlush(callback: Function) {
          callback();
        }
      }

      let transformStream = new TestTransformUndefinedCallback();
      transformStream.write('test', 'utf8', undefined);
      expect(writeSuccess).assertEqual(true);

    })

    /**
     * @tc.name   testDoFlush0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_27400
     * @tc.desc   Test doFlush with null callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDoFlush0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDoFlush0001';

      class TestTransformNullCallback extends stream.Transform {
        constructor() {
          super();
        }

        doTransform(chunk: string, encoding: string, callback: Function) {
          if (callback) {
            callback();
          }
        }

        doFlush(callback: Function) {
          doFlushSuccess = true;
          if (callback) {
            callback();
          }
        }
      }

      let doFlushSuccess = false;
      let transformStream = new TestTransformNullCallback();
      transformStream.write('test', 'utf8', () => {
      });
      transformStream.end();
      expect(doFlushSuccess).assertEqual(true);

    })

    /**
     * @tc.name   testDoFlush0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_27500
     * @tc.desc   Test doFlush with undefined callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDoFlush0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDoFlush0002';

      class TestTransformUndefinedCallback extends stream.Transform {
        constructor() {
          super();
        }

        doTransform(chunk: string, encoding: string, callback: Function) {
          if (callback) {
            callback();
          }
        }

        doFlush(callback: Function) {
          doFlushSuccess = true;
          if (callback) {
            callback();
          }
        }
      }

      let doFlushSuccess = false;
      let transformStream = new TestTransformUndefinedCallback();
      transformStream.write('test', 'utf8', () => {
      });
      transformStream.end();
      expect(doFlushSuccess).assertEqual(true);

    })

    /**
     * @tc.name   testWritableProperty0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_27600
     * @tc.desc   Test Writable writableObjectMode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWritableProperty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testWritableProperty0001';

      let writableStream = new TestWritable();
      expect(writableStream.writableObjectMode).assertEqual(false);
      expect(writableStream.writableHighWatermark).assertEqual(16384);
      expect(writableStream.writable).assertEqual(true);
      expect(writableStream.writableLength).assertEqual(0);
      expect(writableStream.writableCorked).assertEqual(0);
      expect(writableStream.writableEnded).assertEqual(false);
      expect(writableStream.writableFinished).assertEqual(false);

    })

    /**
     * @tc.name   testDuplexProperty0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_27700
     * @tc.desc   Test Duplex writableObjectMode property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDuplexProperty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplexProperty0001';

      let duplexStream = new TestDuplex();
      expect(duplexStream.writableObjectMode).assertEqual(false);
      expect(duplexStream.writableHighWatermark).assertEqual(16384);
      expect(duplexStream.writable).assertEqual(true);
      expect(duplexStream.writableLength).assertEqual(0);
      expect(duplexStream.writableCorked).assertEqual(0);
      expect(duplexStream.writableEnded).assertEqual(false);
      expect(duplexStream.writableFinished).assertEqual(false);

    })

    /**
     * @tc.name   testTransformProperty0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_27800
     * @tc.desc   Test Transform inherits Duplex properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTransformProperty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testTransformProperty0001';

      class TestTransform extends stream.Transform {
        constructor() {
          super();
        }

        doTransform(chunk: string, encoding: string, callback: Function) {
          if (callback) {
            callback();
          }
        }

        doFlush(callback: Function) {
          if (callback) {
            callback();
          }
        }
      }

      let transformStream = new TestTransform();
      expect(transformStream.writableObjectMode).assertEqual(false);
      expect(transformStream.writableHighWatermark).assertEqual(16384);
      expect(transformStream.writable).assertEqual(true);
      expect(transformStream.writableLength).assertEqual(0);
      expect(transformStream.writableCorked).assertEqual(0);
      expect(transformStream.writableEnded).assertEqual(false);
      expect(transformStream.writableFinished).assertEqual(false);

    })

    /**
     * @tc.name   testResume0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_27900
     * @tc.desc   Test resume method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testResume0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testResume0001';

      class TestReadableResume extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {
          this.push('test');
          this.push(null);
        }
      }

      let readableStream = new TestReadableResume();
      let result = readableStream.resume();
      expect(result instanceof stream.Readable).assertEqual(true);
      expect(readableStream.isPaused()).assertEqual(false);

    })

    /**
     * @tc.name   testPause0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_28000
     * @tc.desc   Test pause method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPause0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPause0001';

      let readableStream = new TestReadable();
      let result = readableStream.pause();
      expect(result instanceof stream.Readable).assertEqual(true);
      expect(readableStream.isPaused()).assertEqual(true);

    })

    /**
     * @tc.name   testPipe0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_28100
     * @tc.desc   Test pipe basic functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPipe0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPipe0005';

      class TestReadablePipe extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {
          this.push('test');
          this.push(null);
        }
      }

      class TestWritablePipe extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          pipeWriteSuccess = true;
          callback();
        }
      }

      let pipeWriteSuccess = false;
      let readable = new TestReadablePipe();
      let writable = new TestWritablePipe();
      readable.pipe(writable);
      expect(pipeWriteSuccess).assertEqual(false);
    })

    /**
     * @tc.name   testUnpipe0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STREAM_28200
     * @tc.desc   Test unpipe basic functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnpipe0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testUnpipe0003';

      class TestReadableUnpipe extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {
          this.push('test');
          this.push(null);
        }
      }

      class TestWritableUnpipe extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }

      let unpipeTestSuccess = false;
      let readable = new TestReadableUnpipe();
      let writable = new TestWritableUnpipe();
      readable.pipe(writable);
      readable.unpipe();
      readable.on('data', () => {
        unpipeTestSuccess = true;
      });
      expect(unpipeTestSuccess).assertFalse();
    })
  })
}
