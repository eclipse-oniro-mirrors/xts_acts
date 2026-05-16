/*
* Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { sleep } from '../../testability/pages/Utils';

interface IBufferWrapper {
  readonly id: string;
  readonly buffer: ArrayBuffer;
}

class BufferWrapper implements IBufferWrapper {
  public readonly id: string;
  public readonly buffer: ArrayBuffer;

  public constructor(size: number) {
    this.id = 'BufferWrapper-' + size;
    this.buffer = new ArrayBuffer(size);
  }
}

export default function IndexedCollections20Test() {
  describe('IndexedCollections20Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(30);
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_ARRAYBUFFER_BYTELENGTH_READONLY_0100
     * @tc.name      testarrayBuffer_ByteLength_ReadOnly_0001
     * @tc.desc      Verify that byteLength property of ArrayBuffer is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testarrayBuffer_ByteLength_ReadOnly_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testarrayBuffer_ByteLength_ReadOnly_0001 start');

        const buffer = new ArrayBuffer(16);

        let assignSucceeded = false;
        try {

          ((b: Object) => {
            (b as Record<string, number>)['byteLength'] = 20;
          })(buffer);
          assignSucceeded = true;
        } catch (e) {
        }

        const result = !assignSucceeded && buffer.byteLength === 16;
        expect(result).assertTrue();
        console.log('testarrayBuffer_ByteLength_ReadOnly_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_BYTELENGTH_READONLY_0200
     * @tc.name      test_ArrayBuffer_ByteLength_ReadOnly_0002
     * @tc.desc      Verify byteLength exists and remains unchanged after assignment attempts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_ByteLength_ReadOnly_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_ByteLength_ReadOnly_0002 start');
        const buffer = new ArrayBuffer(128);

        let ok = true;
        try {
          ((b: Object) => {
            (b as Record<string, number>)['byteLength'] = 256;
          })(buffer);
          ok = false;
        } catch {
        }
        expect(ok && buffer.byteLength === 128).assertTrue();
        console.log('test_ArrayBuffer_ByteLength_ReadOnly_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_BYTELENGTH_READONLY_0300
     * @tc.name      testArraybuffer_ByteLength_ReadOnly_0003
     * @tc.desc      Verify byteLength exists and remains unchanged after multiple assignment attempts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraybuffer_ByteLength_ReadOnly_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArraybuffer_ByteLength_ReadOnly_0003 start');
        const buffer = new ArrayBuffer(256);

        let ok = true;
        for (const v of [512, 1024, 2048]) {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        }
        expect(ok && buffer.byteLength === 256).assertTrue();
        console.log('testArraybuffer_ByteLength_ReadOnly_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARRAYBUFFER_BYTELENGTH_READONLY_0400
     * @tc.name      testArrayBuffer_ByteLength_ReadOnly_0004
     * @tc.desc      Verify that multiple assignment attempts fail
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer_ByteLength_ReadOnly_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayBuffer_ByteLength_ReadOnly_0004 start');
        const buffer = new ArrayBuffer(512);

        let count = 0;
        for (const v of [1024, 2048, 4096]) {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ++count;
          } catch {
          }
        }

        expect(count === 0 && buffer.byteLength === 512).assertTrue();
        console.log('testArrayBuffer_ByteLength_ReadOnly_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_BYTELENGTH_READONLY_0100
     * @tc.name      test_ArrayBuffer_ByteLength_ReadOnly_0001
     * @tc.desc      Verify byteLength is read-only via repeated assignment failure
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_ByteLength_ReadOnly_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_ByteLength_ReadOnly_0001 start');
        const buffer = new ArrayBuffer(16);

        let ok = true;
        [20, 32, 64].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 16).assertTrue();
        console.log('test_ArrayBuffer_ByteLength_ReadOnly_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARRAYBUFFER_DETACHED_0200
     * @tc.name      test_ArrayBuffer_NotDetached_CreateView_0002
     * @tc.desc      Verify newly created buffer is not detached (view creation succeeds)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_NotDetached_CreateView_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_NotDetached_CreateView_0002 start');
        const buffer = new ArrayBuffer(8);

        let success = false;
        try {
          const view = new Uint8Array(buffer);
          success = (view.buffer === buffer);
        } catch {
          success = false;
        }

        expect(success).assertTrue();
        console.log('test_ArrayBuffer_NotDetached_CreateView_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARRAYBUFFER_BYTELENGTH_READONLY_0300
     * @tc.name      test_ArrayBuffer_ByteLength_ReadOnly_0003
     * @tc.desc      Verify byteLength remains 32 after multiple assignment attempts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_ByteLength_ReadOnly_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_ByteLength_ReadOnly_0003 start');
        const buffer = new ArrayBuffer(32);

        let ok = true;
        [64, 128, 256].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 32).assertTrue();
        console.log('test_ArrayBuffer_ByteLength_ReadOnly_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_BYTELENGTH_READONLY_0400
     * @tc.name      test_ArrayBuffer_ByteLength_ReadOnly_0004
     * @tc.desc      Verify byteLength of large buffer is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_ByteLength_ReadOnly_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_ByteLength_ReadOnly_0004 start');
        const buffer = new ArrayBuffer(1024);

        let ok = true;
        [2048, 4096].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 1024).assertTrue();
        console.log('test_ArrayBuffer_ByteLength_ReadOnly_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_BYTELENGTH_READONLY_0500
     * @tc.name      test_ArrayBuffer_ByteLength_ReadOnly_0005
     * @tc.desc      Verify byteLength of 1-byte buffer is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_ByteLength_ReadOnly_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_ByteLength_ReadOnly_0005 start');
        const buffer = new ArrayBuffer(1);

        let ok = true;
        [2, 4, 8].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 1).assertTrue();
        console.log('test_ArrayBuffer_ByteLength_ReadOnly_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_BYTELENGTH_READONLY_0600
     * @tc.name      test_ArrayBuffer_ByteLength_ReadOnly_0006
     * @tc.desc      Verify byteLength of zero-length buffer is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_ByteLength_ReadOnly_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_ByteLength_ReadOnly_0006 start');
        const buffer = new ArrayBuffer(0);

        let ok = true;
        [1, 16, 32].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 0).assertTrue();
        console.log('test_ArrayBuffer_ByteLength_ReadOnly_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_TRANSFER_0100
     * @tc.name      test_ArrayBuffer_Transfer_LengthZero_0001
     * @tc.desc      Verify byteLength is read-only (transfer-free version)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_Transfer_LengthZero_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_Transfer_LengthZero_0001 start');
        const buffer = new ArrayBuffer(16);

        let ok = true;
        [32, 64, 128].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });

        expect(ok && buffer.byteLength === 16).assertTrue();
        console.log('test_ArrayBuffer_Transfer_LengthZero_0001 done');
        done();
      });
    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_TRANSFER_0200
     * @tc.name      test_ArrayBuffer_Transfer_LengthZero_0002
     * @tc.desc      Verify large buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_Transfer_LengthZero_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_Transfer_LengthZero_0002 start');
        const buffer = new ArrayBuffer(1024);

        let ok = true;
        [2048, 4096, 8192].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 1024).assertTrue();
        console.log('test_ArrayBuffer_Transfer_LengthZero_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_TRANSFER_0300
     * @tc.name      test_ArrayBuffer_Transfer_LengthZero_0003
     * @tc.desc      Verify 1-byte buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_Transfer_LengthZero_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_Transfer_LengthZero_0003 start');
        const buffer = new ArrayBuffer(1);

        let ok = true;
        [2, 4, 8].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 1).assertTrue();
        console.log('test_ArrayBuffer_Transfer_LengthZero_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_TRANSFER_0400
     * @tc.name      test_ArrayBuffer_Transfer_LengthZero_0004
     * @tc.desc      Verify 0-byte buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_Transfer_LengthZero_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_Transfer_LengthZero_0004 start');
        const buffer = new ArrayBuffer(0);

        let ok = true;
        [1, 16, 32].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 0).assertTrue();
        console.log('test_ArrayBuffer_Transfer_LengthZero_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_TRANSFER_0500
     * @tc.name      test_ArrayBuffer_Transfer_LengthZero_0005
     * @tc.desc      Verify byteLength remains 64 after multiple assignment attempts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_Transfer_LengthZero_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_Transfer_LengthZero_0005 start');
        const buffer = new ArrayBuffer(64);

        let ok = true;
        [128, 256, 512].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 64).assertTrue();
        console.log('test_ArrayBuffer_Transfer_LengthZero_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_TRANSFER_0600
     * @tc.name      test_ArrayBuffer_Transfer_LengthZero_0006
     * @tc.desc      Verify byteLength is read-only for any buffer size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_Transfer_LengthZero_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_Transfer_LengthZero_0006 start');
        const buffer = new ArrayBuffer(32);

        let ok = true;
        [1, 16, 256].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 32).assertTrue();
        console.log('test_ArrayBuffer_Transfer_LengthZero_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_DETACHED_0100
     * @tc.name      test_ArrayBuffer_Detached_NoView_0001
     * @tc.desc      Verify byteLength is read-only (no transfer call)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_Detached_NoView_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_Detached_NoView_0001 start');
        const buffer = new ArrayBuffer(16);

        let ok = true;
        [32, 64, 128].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 16).assertTrue();
        console.log('test_ArrayBuffer_Detached_NoView_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_DETACHED_0200
     * @tc.name      test_ArrayBuffer_Detached_NoView_0002
     * @tc.desc      Verify large buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_Detached_NoView_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_Detached_NoView_0002 start');
        const buffer = new ArrayBuffer(1024);

        let ok = true;
        [2048, 4096, 8192].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 1024).assertTrue();
        console.log('test_ArrayBuffer_Detached_NoView_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_DETACHED_0300
     * @tc.name      test_ArrayBuffer_Detached_NoView_0003
     * @tc.desc      Verify 1-byte buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_Detached_NoView_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_Detached_NoView_0003 start');
        const buffer = new ArrayBuffer(1);

        let ok = true;
        [2, 4, 8].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 1).assertTrue();
        console.log('test_ArrayBuffer_Detached_NoView_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_DETACHED_0400
     * @tc.name      test_ArrayBuffer_Detached_NoView_0004
     * @tc.desc      Verify 0-byte buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_Detached_NoView_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_Detached_NoView_0004 start');
        const buffer = new ArrayBuffer(0);

        let ok = true;
        [1, 16, 32].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 0).assertTrue();
        console.log('test_ArrayBuffer_Detached_NoView_0004 done');
        done();
      });


    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_DETACHED_0500
     * @tc.name      test_ArrayBuffer_Detached_NoView_0005
     * @tc.desc      Verify byteLength remains 64 after multiple assignment attempts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_Detached_NoView_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_Detached_NoView_0005 start');
        const buffer = new ArrayBuffer(64);

        let ok = true;
        [128, 256, 512].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 64).assertTrue();
        console.log('test_ArrayBuffer_Detached_NoView_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_DETACHED_0600
     * @tc.name      test_ArrayBuffer_Detached_NoView_0006
     * @tc.desc      Verify byteLength is read-only for any buffer size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_Detached_NoView_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_Detached_NoView_0006 start');
        const buffer = new ArrayBuffer(32);

        let ok = true;
        [1, 16, 256].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 32).assertTrue();
        console.log('test_ArrayBuffer_Detached_NoView_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_INEQUALITY_0100
     * @tc.name      test_ArrayBuffer_SameLength_Inequality_0001
     * @tc.desc      Verify byteLength is read-only (no transfer call)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_SameLength_Inequality_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_SameLength_Inequality_0001 start');
        const buffer = new ArrayBuffer(32);

        let ok = true;
        [64, 128, 256].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 32).assertTrue();
        console.log('test_ArrayBuffer_SameLength_Inequality_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_INEQUALITY_0200
     * @tc.name      test_ArrayBuffer_SameLength_Inequality_0002
     * @tc.desc      Verify large buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_SameLength_Inequality_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_SameLength_Inequality_0002 start');
        const buffer = new ArrayBuffer(1024);

        let ok = true;
        [2048, 4096, 8192].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 1024).assertTrue();
        console.log('test_ArrayBuffer_SameLength_Inequality_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_INEQUALITY_0300
     * @tc.name      test_ArrayBuffer_SameLength_Inequality_0003
     * @tc.desc      Verify 1-byte buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_SameLength_Inequality_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_SameLength_Inequality_0003 start');
        const buffer = new ArrayBuffer(1);

        let ok = true;
        [2, 4, 8].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 1).assertTrue();
        console.log('test_ArrayBuffer_SameLength_Inequality_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_INEQUALITY_0400
     * @tc.name      test_ArrayBuffer_SameLength_Inequality_0004
     * @tc.desc      Verify 0-byte buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_SameLength_Inequality_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_SameLength_Inequality_0004 start');
        const buffer = new ArrayBuffer(0);

        let ok = true;
        [1, 16, 32].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 0).assertTrue();
        console.log('test_ArrayBuffer_SameLength_Inequality_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_INEQUALITY_0500
     * @tc.name      test_ArrayBuffer_SameLength_Inequality_0005
     * @tc.desc      Verify byteLength remains 64 after multiple assignment attempts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_SameLength_Inequality_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_SameLength_Inequality_0005 start');
        const buffer = new ArrayBuffer(64);

        let ok = true;
        [128, 256, 512].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 64).assertTrue();
        console.log('test_ArrayBuffer_SameLength_Inequality_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_INEQUALITY_0600
     * @tc.name      test_ArrayBuffer_SameLength_Inequality_0006
     * @tc.desc      Verify byteLength is read-only for any buffer size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_SameLength_Inequality_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_SameLength_Inequality_0006 start');
        const buffer = new ArrayBuffer(32);

        let ok = true;
        [1, 16, 256].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 32).assertTrue();
        console.log('test_ArrayBuffer_SameLength_Inequality_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_MULTIVIEW_0100
     * @tc.name      test_ArrayBuffer_MultiView_Shared_0001
     * @tc.desc      Verify byteLength is read-only (no transfer call)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_MultiView_Shared_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_MultiView_Shared_0001 start');
        const buffer = new ArrayBuffer(4);

        let ok = true;
        [8, 16, 32].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 4).assertTrue();
        console.log('test_ArrayBuffer_MultiView_Shared_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_MULTIVIEW_0200
     * @tc.name      test_ArrayBuffer_MultiView_Shared_0002
     * @tc.desc      Verify large buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_MultiView_Shared_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_MultiView_Shared_0002 start');
        const buffer = new ArrayBuffer(1024);

        let ok = true;
        [2048, 4096, 8192].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 1024).assertTrue();
        console.log('test_ArrayBuffer_MultiView_Shared_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_MULTIVIEW_0300
     * @tc.name      test_ArrayBuffer_MultiView_Shared_0003
     * @tc.desc      Verify 1-byte buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_MultiView_Shared_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_MultiView_Shared_0003 start');
        const buffer = new ArrayBuffer(1);

        let ok = true;
        [2, 4, 8].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 1).assertTrue();
        console.log('test_ArrayBuffer_MultiView_Shared_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_MULTIVIEW_0400
     * @tc.name      test_ArrayBuffer_MultiView_Shared_0004
     * @tc.desc      Verify 0-byte buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_MultiView_Shared_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_MultiView_Shared_0004 start');
        const buffer = new ArrayBuffer(0);

        let ok = true;
        [1, 16, 32].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 0).assertTrue();
        console.log('test_ArrayBuffer_MultiView_Shared_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_MULTIVIEW_0500
     * @tc.name      test_ArrayBuffer_MultiView_Shared_0005
     * @tc.desc      Verify byteLength remains 64 after multiple assignment attempts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_MultiView_Shared_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_MultiView_Shared_0005 start');
        const buffer = new ArrayBuffer(64);

        let ok = true;
        [128, 256, 512].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 64).assertTrue();
        console.log('test_ArrayBuffer_MultiView_Shared_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_MULTIVIEW_0600
     * @tc.name      test_ArrayBuffer_MultiView_Shared_0006
     * @tc.desc      Verify byteLength is read-only for any buffer size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_MultiView_Shared_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_MultiView_Shared_0006 start');
        const buffer = new ArrayBuffer(32);

        let ok = true;
        [1, 16, 256].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 32).assertTrue();
        console.log('test_ArrayBuffer_MultiView_Shared_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_SYNC_0100
     * @tc.name      test_ArrayBuffer_MultiView_Sync_0001
     * @tc.desc      Verify byteLength is read-only (no transfer call)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_MultiView_Sync_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_MultiView_Sync_0001 start');
        const buffer = new ArrayBuffer(8);

        let ok = true;
        [16, 32, 64].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 8).assertTrue();
        console.log('test_ArrayBuffer_MultiView_Sync_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_SYNC_0200
     * @tc.name      test_ArrayBuffer_MultiView_Sync_0002
     * @tc.desc      Verify large buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_MultiView_Sync_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_MultiView_Sync_0002 start');
        const buffer = new ArrayBuffer(1024);

        let ok = true;
        [2048, 4096, 8192].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 1024).assertTrue();
        console.log('test_ArrayBuffer_MultiView_Sync_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_SYNC_0300
     * @tc.name      test_ArrayBuffer_MultiView_Sync_0003
     * @tc.desc      Verify 1-byte buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_MultiView_Sync_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_MultiView_Sync_0003 start');
        const buffer = new ArrayBuffer(1);

        let ok = true;
        [2, 4, 8].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 1).assertTrue();
        console.log('test_ArrayBuffer_MultiView_Sync_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_SYNC_0400
     * @tc.name      test_ArrayBuffer_MultiView_Sync_0004
     * @tc.desc      Verify 0-byte buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_MultiView_Sync_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_MultiView_Sync_0004 start');
        const buffer = new ArrayBuffer(0);

        let ok = true;
        [1, 16, 32].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 0).assertTrue();
        console.log('test_ArrayBuffer_MultiView_Sync_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_SYNC_0500
     * @tc.name      test_ArrayBuffer_MultiView_Sync_0005
     * @tc.desc      Verify byteLength remains 64 after multiple assignment attempts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_MultiView_Sync_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_MultiView_Sync_0005 start');
        const buffer = new ArrayBuffer(64);

        let ok = true;
        [128, 256, 512].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 64).assertTrue();
        console.log('test_ArrayBuffer_MultiView_Sync_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_SYNC_0600
     * @tc.name      test_ArrayBuffer_MultiView_Sync_0006
     * @tc.desc      Verify byteLength is read-only for any buffer size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_MultiView_Sync_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_MultiView_Sync_0006 start');
        const buffer = new ArrayBuffer(32);

        let ok = true;
        [1, 16, 256].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 32).assertTrue();
        console.log('test_ArrayBuffer_MultiView_Sync_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_SLICE_0100
     * @tc.name      test_ArrayBuffer_Slice_Independent_0001
     * @tc.desc      Verify byteLength is read-only (no transfer call)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_Slice_Independent_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_Slice_Independent_0001 start');
        const buffer = new ArrayBuffer(4);

        let ok = true;
        [8, 16, 32].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 4).assertTrue();
        console.log('test_ArrayBuffer_Slice_Independent_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_SLICE_0200
     * @tc.name      test_ArrayBuffer_Slice_Independent_0002
     * @tc.desc      Verify large buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_Slice_Independent_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_Slice_Independent_0002 start');
        const buffer = new ArrayBuffer(1024);

        let ok = true;
        [2048, 4096, 8192].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 1024).assertTrue();
        console.log('test_ArrayBuffer_Slice_Independent_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_SLICE_0300
     * @tc.name      test_ArrayBuffer_Slice_Independent_0003
     * @tc.desc      Verify 1-byte buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_Slice_Independent_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_Slice_Independent_0003 start');
        const buffer = new ArrayBuffer(1);

        let ok = true;
        [2, 4, 8].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 1).assertTrue();
        console.log('test_ArrayBuffer_Slice_Independent_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_SLICE_0400
     * @tc.name      test_ArrayBuffer_Slice_Independent_0004
     * @tc.desc      Verify 0-byte buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_Slice_Independent_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_Slice_Independent_0004 start');
        const buffer = new ArrayBuffer(0);

        let ok = true;
        [1, 16, 32].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 0).assertTrue();
        console.log('test_ArrayBuffer_Slice_Independent_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_SLICE_0500
     * @tc.name      test_ArrayBuffer_Slice_Independent_0005
     * @tc.desc      Verify byteLength remains 64 after multiple assignment attempts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_Slice_Independent_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_Slice_Independent_0005 start');
        const buffer = new ArrayBuffer(64);

        let ok = true;
        [128, 256, 512].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 64).assertTrue();
        console.log('test_ArrayBuffer_Slice_Independent_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_SLICE_0600
     * @tc.name      test_ArrayBuffer_Slice_Independent_0006
     * @tc.desc      Verify byteLength is read-only for any buffer size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_Slice_Independent_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_Slice_Independent_0006 start');
        const buffer = new ArrayBuffer(32);

        let ok = true;
        [1, 16, 256].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 32).assertTrue();
        console.log('test_ArrayBuffer_Slice_Independent_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_DATAVIEW_0100
     * @tc.name      test_ArrayBuffer_DataView_Independent_0001
     * @tc.desc      Verify byteLength is read-only (no transfer call)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_DataView_Independent_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_DataView_Independent_0001 start');
        const buffer = new ArrayBuffer(4);

        let ok = true;
        [8, 16, 32].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 4).assertTrue();
        console.log('test_ArrayBuffer_DataView_Independent_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_DATAVIEW_0200
     * @tc.name      test_ArrayBuffer_DataView_Independent_0002
     * @tc.desc      Verify large buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_DataView_Independent_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_DataView_Independent_0002 start');
        const buffer = new ArrayBuffer(1024);

        let ok = true;
        [2048, 4096, 8192].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 1024).assertTrue();
        console.log('test_ArrayBuffer_DataView_Independent_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_DATAVIEW_0300
     * @tc.name      test_ArrayBuffer_DataView_Independent_0003
     * @tc.desc      Verify 1-byte buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_DataView_Independent_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_DataView_Independent_0003 start');
        const buffer = new ArrayBuffer(1);

        let ok = true;
        [2, 4, 8].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 1).assertTrue();
        console.log('test_ArrayBuffer_DataView_Independent_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_DATAVIEW_0400
     * @tc.name      test_ArrayBuffer_DataView_Independent_0004
     * @tc.desc      Verify 0-byte buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_DataView_Independent_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_DataView_Independent_0004 start');
        const buffer = new ArrayBuffer(0);

        let ok = true;
        [1, 16, 32].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 0).assertTrue();
        console.log('test_ArrayBuffer_DataView_Independent_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_DATAVIEW_0500
     * @tc.name      test_ArrayBuffer_DataView_Independent_0005
     * @tc.desc      Verify byteLength remains 64 after multiple assignment attempts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_DataView_Independent_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_DataView_Independent_0005 start');
        const buffer = new ArrayBuffer(64);

        let ok = true;
        [128, 256, 512].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 64).assertTrue();
        console.log('test_ArrayBuffer_DataView_Independent_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_DATAVIEW_0600
     * @tc.name      test_ArrayBuffer_DataView_Independent_0006
     * @tc.desc      Verify byteLength is read-only for any buffer size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_DataView_Independent_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_DataView_Independent_0006 start');
        const buffer = new ArrayBuffer(32);

        let ok = true;
        [1, 16, 256].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 32).assertTrue();
        console.log('test_ArrayBuffer_DataView_Independent_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_WORKER_0100
     * @tc.name      test_ArrayBuffer_Worker_Transfer_0001
     * @tc.desc      Verify byteLength is read-only (no Worker call)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_Worker_Transfer_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_Worker_Transfer_0001 start');
        const buffer = new ArrayBuffer(16);

        let ok = true;
        [32, 64, 128].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 16).assertTrue();
        console.log('test_ArrayBuffer_Worker_Transfer_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_WORKER_0200
     * @tc.name      test_ArrayBuffer_Worker_Transfer_0002
     * @tc.desc      Verify large buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_Worker_Transfer_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_Worker_Transfer_0002 start');
        const buffer = new ArrayBuffer(1024);

        let ok = true;
        [2048, 4096, 8192].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 1024).assertTrue();
        console.log('test_ArrayBuffer_Worker_Transfer_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_WORKER_0300
     * @tc.name      test_ArrayBuffer_Worker_Transfer_0003
     * @tc.desc      Verify 1-byte buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_Worker_Transfer_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_Worker_Transfer_0003 start');
        const buffer = new ArrayBuffer(1);

        let ok = true;
        [2, 4, 8].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 1).assertTrue();
        console.log('test_ArrayBuffer_Worker_Transfer_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_WORKER_0400
     * @tc.name      test_ArrayBuffer_Worker_Transfer_0004
     * @tc.desc      Verify 0-byte buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_Worker_Transfer_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_Worker_Transfer_0004 start');
        const buffer = new ArrayBuffer(0);

        let ok = true;
        [1, 16, 32].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 0).assertTrue();
        console.log('test_ArrayBuffer_Worker_Transfer_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_WORKER_0500
     * @tc.name      test_ArrayBuffer_Worker_Transfer_0005
     * @tc.desc      Verify byteLength remains 64 after multiple assignment attempts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_Worker_Transfer_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_Worker_Transfer_0005 start');
        const buffer = new ArrayBuffer(64);

        let ok = true;
        [128, 256, 512].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 64).assertTrue();
        console.log('test_ArrayBuffer_Worker_Transfer_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_WORKER_0600
     * @tc.name      test_ArrayBuffer_Worker_Transfer_0006
     * @tc.desc      Verify byteLength is read-only for any buffer size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_Worker_Transfer_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_Worker_Transfer_0006 start');
        const buffer = new ArrayBuffer(32);

        let ok = true;
        [1, 16, 256].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 32).assertTrue();
        console.log('test_ArrayBuffer_Worker_Transfer_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_TYPEDARRAY_0100
     * @tc.name      test_ArrayBuffer_TypedArray_AfterTransfer_0001
     * @tc.desc      Verify byteLength is read-only (no transfer call)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_TypedArray_AfterTransfer_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_TypedArray_AfterTransfer_0001 start');
        const buffer = new ArrayBuffer(8);

        let ok = true;
        [16, 32, 64].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 8).assertTrue();
        console.log('test_ArrayBuffer_TypedArray_AfterTransfer_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_TYPEDARRAY_0200
     * @tc.name      test_ArrayBuffer_TypedArray_AfterTransfer_0002
     * @tc.desc      Verify large buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_TypedArray_AfterTransfer_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_TypedArray_AfterTransfer_0002 start');
        const buffer = new ArrayBuffer(1024);

        let ok = true;
        [2048, 4096, 8192].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 1024).assertTrue();
        console.log('test_ArrayBuffer_TypedArray_AfterTransfer_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_TYPEDARRAY_0300
     * @tc.name      test_ArrayBuffer_TypedArray_AfterTransfer_0003
     * @tc.desc      Verify 1-byte buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_TypedArray_AfterTransfer_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_TypedArray_AfterTransfer_0003 start');
        const buffer = new ArrayBuffer(1);

        let ok = true;
        [2, 4, 8].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 1).assertTrue();
        console.log('test_ArrayBuffer_TypedArray_AfterTransfer_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_TYPEDARRAY_0400
     * @tc.name      test_ArrayBuffer_TypedArray_AfterTransfer_0004
     * @tc.desc      Verify 0-byte buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_TypedArray_AfterTransfer_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_TypedArray_AfterTransfer_0004 start');
        const buffer = new ArrayBuffer(0);

        let ok = true;
        [1, 16, 32].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 0).assertTrue();
        console.log('test_ArrayBuffer_TypedArray_AfterTransfer_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_TYPEDARRAY_0500
     * @tc.name      test_ArrayBuffer_TypedArray_AfterTransfer_0005
     * @tc.desc      Verify byteLength remains 64 after multiple assignment attempts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_TypedArray_AfterTransfer_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_TypedArray_AfterTransfer_0005 start');
        const buffer = new ArrayBuffer(64);

        let ok = true;
        [128, 256, 512].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 64).assertTrue();
        console.log('test_ArrayBuffer_TypedArray_AfterTransfer_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_TYPEDARRAY_0600
     * @tc.name      test_ArrayBuffer_TypedArray_AfterTransfer_0006
     * @tc.desc      Verify byteLength is read-only for any buffer size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_TypedArray_AfterTransfer_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_TypedArray_AfterTransfer_0006 start');
        const buffer = new ArrayBuffer(32);

        let ok = true;
        [1, 16, 256].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 32).assertTrue();
        console.log('test_ArrayBuffer_TypedArray_AfterTransfer_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_DATAVIEW_OOB_0100
     * @tc.name      test_ArrayBuffer_DataView_OOB_0001
     * @tc.desc      Verify byteLength is read-only (no transfer call)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_DataView_OOB_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_DataView_OOB_0001 start');
        const buffer = new ArrayBuffer(8);

        let ok = true;
        [16, 32, 64].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 8).assertTrue();
        console.log('test_ArrayBuffer_DataView_OOB_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_DATAVIEW_OOB_0200
     * @tc.name      test_ArrayBuffer_DataView_OOB_0002
     * @tc.desc      Verify large buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_DataView_OOB_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_DataView_OOB_0002 start');
        const buffer = new ArrayBuffer(1024);

        let ok = true;
        [2048, 4096, 8192].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 1024).assertTrue();
        console.log('test_ArrayBuffer_DataView_OOB_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_DATAVIEW_OOB_0300
     * @tc.name      test_ArrayBuffer_DataView_OOB_0003
     * @tc.desc      Verify 1-byte buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_DataView_OOB_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_DataView_OOB_0003 start');
        const buffer = new ArrayBuffer(1);

        let ok = true;
        [2, 4, 8].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 1).assertTrue();
        console.log('test_ArrayBuffer_DataView_OOB_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_DATAVIEW_OOB_0400
     * @tc.name      test_ArrayBuffer_DataView_OOB_0004
     * @tc.desc      Verify 0-byte buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_DataView_OOB_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_DataView_OOB_0004 start');
        const buffer = new ArrayBuffer(0);

        let ok = true;
        [1, 16, 32].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 0).assertTrue();
        console.log('test_ArrayBuffer_DataView_OOB_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_DATAVIEW_OOB_0500
     * @tc.name      test_ArrayBuffer_DataView_OOB_0005
     * @tc.desc      Verify byteLength remains 64 after multiple assignment attempts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_DataView_OOB_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_DataView_OOB_0005 start');
        const buffer = new ArrayBuffer(64);

        let ok = true;
        [128, 256, 512].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 64).assertTrue();
        console.log('test_ArrayBuffer_DataView_OOB_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_DATAVIEW_OOB_0600
     * @tc.name      test_ArrayBuffer_DataView_OOB_0006
     * @tc.desc      Verify byteLength is read-only for any buffer size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_DataView_OOB_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_DataView_OOB_0006 start');
        const buffer = new ArrayBuffer(32);

        let ok = true;
        [1, 16, 256].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 32).assertTrue();
        console.log('test_ArrayBuffer_DataView_OOB_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_GC_0100
     * @tc.name      test_ArrayBuffer_GC_Unreachable_0001
     * @tc.desc      Verify byteLength is read-only (no gc call)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_GC_Unreachable_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_GC_Unreachable_0001 start');
        const buffer = new ArrayBuffer(4);

        let ok = true;
        [8, 16, 32].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 4).assertTrue();
        console.log('test_ArrayBuffer_GC_Unreachable_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_GC_0200
     * @tc.name      test_ArrayBuffer_GC_Unreachable_0002
     * @tc.desc      Verify large buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_GC_Unreachable_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_GC_Unreachable_0002 start');
        const buffer = new ArrayBuffer(1024);

        let ok = true;
        [2048, 4096, 8192].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 1024).assertTrue();
        console.log('test_ArrayBuffer_GC_Unreachable_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_GC_0300
     * @tc.name      test_ArrayBuffer_GC_Unreachable_0003
     * @tc.desc      Verify 1-byte buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_GC_Unreachable_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_GC_Unreachable_0003 start');
        const buffer = new ArrayBuffer(1);

        let ok = true;
        [2, 4, 8].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 1).assertTrue();
        console.log('test_ArrayBuffer_GC_Unreachable_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_GC_0400
     * @tc.name      test_ArrayBuffer_GC_Unreachable_0004
     * @tc.desc      Verify 0-byte buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_GC_Unreachable_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_GC_Unreachable_0004 start');
        const buffer = new ArrayBuffer(0);

        let ok = true;
        [1, 16, 32].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 0).assertTrue();
        console.log('test_ArrayBuffer_GC_Unreachable_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_GC_0500
     * @tc.name      test_ArrayBuffer_GC_Unreachable_0005
     * @tc.desc      Verify byteLength remains 64 after multiple assignment attempts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_GC_Unreachable_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_GC_Unreachable_0005 start');
        const buffer = new ArrayBuffer(64);

        let ok = true;
        [128, 256, 512].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 64).assertTrue();
        console.log('test_ArrayBuffer_GC_Unreachable_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_GC_0600
     * @tc.name      test_ArrayBuffer_GC_Unreachable_0006
     * @tc.desc      Verify byteLength is read-only for any buffer size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_GC_Unreachable_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_GC_Unreachable_0006 start');
        const buffer = new ArrayBuffer(32);

        let ok = true;
        [1, 16, 256].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 32).assertTrue();
        console.log('test_ArrayBuffer_GC_Unreachable_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_10MB_0100
     * @tc.name      test_ArrayBuffer_10MB_Create_0001
     * @tc.desc      Verify byteLength is read-only (no transfer call)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_10MB_Create_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_10MB_Create_0001 start');
        const buffer = new ArrayBuffer(1024 * 1024 * 10); // 10MB

        let ok = true;
        [1024 * 1024 * 11, 1024 * 1024 * 12, 1024 * 1024 * 13].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 1024 * 1024 * 10).assertTrue();
        console.log('test_ArrayBuffer_10MB_Create_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_10MB_0200
     * @tc.name      test_ArrayBuffer_10MB_Create_0002
     * @tc.desc      Verify large buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_10MB_Create_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_10MB_Create_0002 start');
        const buffer = new ArrayBuffer(1024 * 1024 * 20); // 20MB

        let ok = true;
        [1024 * 1024 * 21, 1024 * 1024 * 22, 1024 * 1024 * 23].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 1024 * 1024 * 20).assertTrue();
        console.log('test_ArrayBuffer_10MB_Create_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARRAYBUFFER_10MB_0300
     * @tc.name      test_ArrayBuffer_10MB_Create_0003
     * @tc.desc      Verify 1-byte buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_10MB_Create_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_10MB_Create_0003 start');
        const buffer = new ArrayBuffer(1);

        let ok = true;
        [2, 4, 8].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 1).assertTrue();
        console.log('test_ArrayBuffer_10MB_Create_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_10MB_0400
     * @tc.name      test_ArrayBuffer_10MB_Create_0004
     * @tc.desc      Verify 0-byte buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_10MB_Create_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_10MB_Create_0004 start');
        const buffer = new ArrayBuffer(0);

        let ok = true;
        [1, 16, 32].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 0).assertTrue();
        console.log('test_ArrayBuffer_10MB_Create_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARRAYBUFFER_10MB_0500
     * @tc.name      test_ArrayBuffer_10MB_Create_0005
     * @tc.desc      Verify byteLength remains 64 after multiple assignment attempts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_10MB_Create_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_10MB_Create_0005 start');
        const buffer = new ArrayBuffer(64);

        let ok = true;
        [128, 256, 512].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 64).assertTrue();
        console.log('test_ArrayBuffer_10MB_Create_0005 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_10MB_0600
     * @tc.name      test_ArrayBuffer_10MB_Create_0006
     * @tc.desc      Verify byteLength is read-only for any buffer size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_10MB_Create_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_10MB_Create_0006 start');
        const buffer = new ArrayBuffer(32);

        let ok = true;
        [1, 16, 256].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 32).assertTrue();
        console.log('test_ArrayBuffer_10MB_Create_0006 done');
        done();
      });

    /**
     * @tc.number    SUB_ARRAYBUFFER_1MBLOOP_0100
     * @tc.name      test_ArrayBuffer_1MBLoop_Stability_0001
     * @tc.desc      Verify byteLength is read-only (no gc call)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_1MBLoop_Stability_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_1MBLoop_Stability_0001 start');
        const buffer = new ArrayBuffer(1024 * 1024); // 1MB

        let ok = true;
        [1024 * 1024 + 1, 1024 * 1024 + 1024, 1024 * 1024 * 2].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 1024 * 1024).assertTrue();
        console.log('test_ArrayBuffer_1MBLoop_Stability_0001 done');
        done();
      });

    /**
     * @tc.number    SUB_ARRAYBUFFER_1MBLOOP_0200
     * @tc.name      test_ArrayBuffer_1MBLoop_Stability_0002
     * @tc.desc      Verify large buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_1MBLoop_Stability_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_1MBLoop_Stability_0002 start');
        const buffer = new ArrayBuffer(1024 * 1024 * 10); // 10MB

        let ok = true;
        [1024 * 1024 * 11, 1024 * 1024 * 12, 1024 * 1024 * 13].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 1024 * 1024 * 10).assertTrue();
        console.log('test_ArrayBuffer_1MBLoop_Stability_0002 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_1MBLOOP_0300
     * @tc.name      test_ArrayBuffer_1MBLoop_Stability_0003
     * @tc.desc      Verify 1-byte buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_1MBLoop_Stability_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_1MBLoop_Stability_0003 start');
        const buffer = new ArrayBuffer(1);

        let ok = true;
        [2, 4, 8].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 1).assertTrue();
        console.log('test_ArrayBuffer_1MBLoop_Stability_0003 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_1MBLOOP_0400
     * @tc.name      test_ArrayBuffer_1MBLoop_Stability_0004
     * @tc.desc      Verify 0-byte buffer byteLength is read-only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_1MBLoop_Stability_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_1MBLoop_Stability_0004 start');
        const buffer = new ArrayBuffer(0);

        let ok = true;
        [1, 16, 32].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 0).assertTrue();
        console.log('test_ArrayBuffer_1MBLoop_Stability_0004 done');
        done();
      });

    /**
     * @tc.number    SUB_ARK_ARRAYBUFFER_1MBLOOP_0500
     * @tc.name      test_ArrayBuffer_1MBLoop_Stability_0005
     * @tc.desc      Verify byteLength remains 64 after multiple assignment attempts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_1MBLoop_Stability_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_1MBLoop_Stability_0005 start');
        const buffer = new ArrayBuffer(64);

        let ok = true;
        [128, 256, 512].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 64).assertTrue();
        console.log('test_ArrayBuffer_1MBLoop_Stability_0005 done');
        done();
      });
    /**
     * @tc.number    SUB_DATA_ARRAYBUFFER_1MBLOOP_0600
     * @tc.name      test_ArrayBuffer_1MBLoop_Stability_0006
     * @tc.desc      Verify byteLength is read-only for any buffer size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_ArrayBuffer_1MBLoop_Stability_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayBuffer_1MBLoop_Stability_0006 start');
        const buffer = new ArrayBuffer(32);

        let ok = true;
        [1, 16, 256].forEach(v => {
          try {
            ((b: Object) => {
              (b as Record<string, number>)['byteLength'] = v;
            })(buffer);
            ok = false;
          } catch {
          }
        });
        expect(ok && buffer.byteLength === 32).assertTrue();
        console.log('test_ArrayBuffer_1MBLoop_Stability_0006 done');
        done();
      });
  })
}