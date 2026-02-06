
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';

export default function ArrayBufferTest() {
  describe('ArrayBufferTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
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
     * @tc.name   testCollectionsArrayBuffer0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_0100
     * @tc.desc   Testing Collections of ArrayBuffer, constructor -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0001";
      try {
          let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(-1);
          console.info("byteLength: " + arrayBuffer.byteLength);
          expect().assertFail();
      } catch (err) {
       console.error(`${TAG} failed, error: ${err.message}`);
       expect(`${err.message}`).assertEqual('integerIndex < 0 or integerIndex > SAFE_NUMBER');
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_0200
     * @tc.desc   Testing Collections of ArrayBuffer, constructor 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0002";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(0);
        console.info("byteLength: " + arrayBuffer.byteLength);
        expect(arrayBuffer.byteLength).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
      /**
       * @tc.name   testCollectionsArrayBuffer0003
       * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_0300
       * @tc.desc   Testing Collections of ArrayBuffer, constructor 1.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testCollectionsArrayBuffer0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0003";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(1);
        console.info("byteLength: " + arrayBuffer.byteLength);
        expect(arrayBuffer.byteLength).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_0400
     * @tc.desc   Testing Collections of ArrayBuffer, slice(0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0004";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(0);
        console.info("slicedBuffer Length: " + slicedBuffer.byteLength);
        expect(slicedBuffer.byteLength).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_0500
     * @tc.desc   Testing Collections of ArrayBuffer, slice(-1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0005";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(-1);
        console.info("slicedBuffer Length: " + slicedBuffer.byteLength);
        expect(slicedBuffer.byteLength).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_0600
     * @tc.desc   Testing Collections of ArrayBuffer, slice(2).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0006";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(2);
        console.info("slicedBuffer Length: " + slicedBuffer.byteLength);
        expect(slicedBuffer.byteLength).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_0700
     * @tc.desc   Testing Collections of ArrayBuffer, slice(10).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0007";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(10);
        console.info("slicedBuffer Length: " + slicedBuffer.byteLength);
        expect(slicedBuffer.byteLength).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_0800
     * @tc.desc   Testing Collections of ArrayBuffer, slice(2,4).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0008";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(2,4);
        console.info("slicedBuffer Length: " + slicedBuffer.byteLength);
        expect(slicedBuffer.byteLength).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_0900
     * @tc.desc   Testing Collections of ArrayBuffer, slice(2,2).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0009";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(2,2);
        console.info("slicedBuffer Length: " + slicedBuffer.byteLength);
        expect(slicedBuffer.byteLength).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
    /**
     * @tc.name   testCollectionsArrayBuffer0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COLLECTIONS_ARRAYBUFFER_1000
     * @tc.desc   Testing Collections of ArrayBuffer, slice(2,0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCollectionsArrayBuffer0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const TAG = "testCollectionsArrayBuffer0010";
      try {
        let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(5);
        let slicedBuffer: collections.ArrayBuffer = arrayBuffer.slice(2,0);
        console.info("slicedBuffer Length: " + slicedBuffer.byteLength);
        expect(slicedBuffer.byteLength).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done()
    });
  })
}