import { afterEach, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import Utils from './Util.test';

export default function promiseTest() {

  describe('PromiseTest', (): void => {
    afterEach(() => {
      await Utils.msSleep(20);
    })
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISE_00100
     * @tc.name testPromise0001
     * @tc.desc Test the function by promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPromise0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag = true;
        let array: Array<string> = await dealPromise(flag);
        expect(array[0]).assertEqual('resolve result : success');
        expect(array[1]).assertEqual('resolve');
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISE_00200
     * @tc.name testPromise0002
     * @tc.desc Test the function by promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPromise0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag = false;
        let array: Array<string> = await dealPromise(flag);
        expect(array[0]).assertEqual('reject result : success');
        expect(array[1]).assertEqual('reject');
        expect(array[2]).assertEqual('reject');
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISE_00300
     * @tc.name testPromise0003
     * @tc.desc Test the function by promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPromise0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag = false;
        let array: Array<string> = new Array<string>();
        try {
          const result = await new Promise<string>((resolve, reject): void => {
            if (flag) {
              resolve("success");
              array.push("resolve result : success")
            } else {
              reject(new Error("reject"))
              array.push("reject result : success")
            }
          });
          array.push(result);
        } catch (error) {
          array.push("reject");
        }
        expect(array[0]).assertEqual('reject result : success');
        expect(array[1]).assertEqual('reject')
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISE_00400
     * @tc.name testPromise0004
     * @tc.desc Test the function by promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPromise0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag = true;
        let array: Array<string> = new Array<string>();
        try {
          const result = await new Promise<string>((resolve, reject) => {
            if (flag) {
              resolve("resolve");
              array.push("resolve result : success");
            } else {
              reject(new Error("reject"));
              array.push("reject result : success");
            }
          });
          array.push(result);
        } catch (error) {
          array.push("reject");
        }
        expect(array[0]).assertEqual('resolve result : success');
        expect(array[1]).assertEqual('resolve')
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISE_00500
     * @tc.name testPromise0005
     * @tc.desc Test the function by promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPromise0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag = true;
        let array: Array<string> = new Array<string>();
        try {
          const result = await new Promise<string>((resolve, reject) => {
            if (flag) {
              resolve("resolve");
              array.push("resolve result : success");
            } else {
              reject(new Error("reject"));
              array.push("reject result : success");
            }
          });
          array.push(result);
          array.push('then2');
          array.push('then3');
          array.push('then4');
          array.push('then5');
          array.push('then6');
          array.push('then7');
        } catch (error) {
          array.push("reject");
        } finally {
          array.push('finally1');
        }
        expect(array[0]).assertEqual('resolve result : success');
        expect(array[1]).assertEqual('resolve')
        expect(array[2]).assertEqual('then2');
        expect(array[3]).assertEqual('then3');
        expect(array[4]).assertEqual('then4');
        expect(array[5]).assertEqual('then5');
        expect(array[6]).assertEqual('then6');
        expect(array[7]).assertEqual('then7');
        expect(array[8]).assertEqual('finally1');
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISE_00700
     * @tc.name testPromise0007
     * @tc.desc Test the function by promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPromise0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag = true;
        let array: Array<string> = new Array<string>();
        try {
          const result = await new Promise<string>((resolve, reject) => {
            if (flag) {
              resolve("resolve");
              array.push("resolve result : success");
            } else {
              reject(new Error("reject"));
              array.push("reject result : success");
            }
          });
          array.push(result);
          array.push('then2');
          await new Promise<string>((resolve, reject) => {
            array.push('then3');
            reject(new Error());
          });
          array.push('then4');
          array.push('then5');
          array.push('then6');
          array.push('then7');
        } catch (e) {
          array.push("reject");
        } finally {
          array.push('finally1');
        }
        ;
        expect(array[0]).assertEqual('resolve result : success');
        expect(array[1]).assertEqual('resolve')
        expect(array[2]).assertEqual('then2');
        expect(array[3]).assertEqual('then3');
        expect(array[4]).assertEqual('reject');
        expect(array[5]).assertEqual('finally1');
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_PROMISE_00800
     * @tc.name testPromise0008
     * @tc.desc Test the function by promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testPromise0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag = true;
        let array: Array<string> = new Array<string>();
        try {
          const result = await new Promise<string>((resolve, reject) => {
            if (flag) {
              resolve("resolve");
              array.push("resolve result : success");
            } else {
              reject(new Error("reject"));
              array.push("reject result : success");
            }
          });
          array.push(result);
          array.push('then2');
          array.push('then3');
          throw new Error('Error');
          array.push('then4');
          array.push('then5');
          array.push('then6');
          array.push('then7');
        } catch (e) {
          if (e instanceof Error) {
            array.push(e.message);
          }
        } finally {
          array.push('finally1');
        }
        ;
        expect(array[0]).assertEqual('resolve result : success');
        expect(array[1]).assertEqual('resolve')
        expect(array[2]).assertEqual('then2');
        expect(array[3]).assertEqual('then3');
        expect(array[4]).assertEqual('Error');
        expect(array[5]).assertEqual('finally1');
        done();
      })
  })
}

async function async1(array: Array<string>) {
  await async2(array);
  array.push("async1")
}

async function async2(array: Array<string>) {
  array.push('async2')
}

async function dealPromise(flag: boolean): Promise<Array<string>> {
  let array: Array<string> = new Array<string>();
  const p: Promise<string> = new Promise<string>((resolve, reject) => {
    if (flag) {
      resolve("resolve");
      array.push("resolve result : success")
    } else {
      reject(new Error("reject"))
      array.push("reject result : success")
    }
  });
  p.then((res: string) => {
    array.push(res);
  })

  p.catch((e: Error) => {
    array.push('reject');
    array.push(e.message);
  })
  return array;
}