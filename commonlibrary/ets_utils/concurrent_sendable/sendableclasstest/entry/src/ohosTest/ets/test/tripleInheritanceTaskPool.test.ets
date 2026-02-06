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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { taskpool } from '@kit.ArkTS';
import {
  FourthLevelSendableClassOver,
  InheritedSendableClass,
  SendableConstEnum,
  SendableFiveAttributeInheritClassLevelThree,
  SendableFourAttributeClass,
  sleep,
  topLevelInstance
} from './tripleInheritanceTaskPool';

@Concurrent
export function testSendableTripleInheritanceTaskPool0001(): boolean {
  const instance = new SendableFiveAttributeInheritClassLevelThree();
  let res1 = instance instanceof SendableFiveAttributeInheritClassLevelThree;
  const newNumber = 100;
  instance.setMyNumber(newNumber);
  let res2 = instance.myNumber === newNumber + 10;
  return res1 && res2;
}

@Concurrent
export function testSendableTripleInheritanceTaskPool0002(): boolean {
  const instance = new SendableFiveAttributeInheritClassLevelThree();
  let res1 = instance instanceof SendableFiveAttributeInheritClassLevelThree;
  instance.setMyTopLevelClassInstance(topLevelInstance);
  let res2 = instance.myTopLevelClassInstance === topLevelInstance;
  return res1 && res2;
}

@Concurrent
export function testSendableTripleInheritanceTaskPool0003(): boolean {
  const instance = new SendableFiveAttributeInheritClassLevelThree();
  let res1 = instance instanceof SendableFiveAttributeInheritClassLevelThree;
  instance.setMyEnum(SendableConstEnum.OPTION_2);
  let res2 = instance.myEnum === SendableConstEnum.OPTION_2;
  return res1 && res2;
}

@Concurrent
export function testSendableTripleInheritanceTaskPool0004(): boolean {
  const instance = new SendableFiveAttributeInheritClassLevelThree();
  let res1 = instance instanceof SendableFiveAttributeInheritClassLevelThree;
  instance.setMyArray([1, 2, 3]);
  let res2 = instance.myArray.toString() === '1,2,3';
  return res1 && res2;
}

@Concurrent
export function testSendableTripleInheritanceTaskPool0005(): boolean {
  const instance = new SendableFiveAttributeInheritClassLevelThree();
  let res1 = instance instanceof SendableFiveAttributeInheritClassLevelThree;
  const lockName = 'testLock';
  instance.setMyAsyncLock(lockName);
  let res2 = instance.myAsyncLock.name === lockName;
  return res1 && res2;
}

@Concurrent
export function testSendableFourAttributeClass0001(): boolean {
  const instance = new SendableFourAttributeClass();
  let res1 = instance instanceof SendableFourAttributeClass;
  const newNumber = 88;
  instance.setMyNumber(newNumber);
  let res2 = instance.getMyNumber() === newNumber;
  return res1 && res2;
}

@Concurrent
export function testSendableFourAttributeClass0002(): boolean {
  const instance = new SendableFourAttributeClass();
  let res1 = instance instanceof SendableFourAttributeClass;
  instance.setMyEnum(SendableConstEnum.OPTION_2);
  let res2 = instance.getMyEnum() === SendableConstEnum.OPTION_2;
  return res1 && res2;
}

@Concurrent
export function testSendableFourAttributeClass0003(): boolean {
  const instance = new SendableFourAttributeClass();
  let res1 = instance instanceof SendableFourAttributeClass;
  instance.setMyArray([4, 5, 6]);
  let res2 = instance.getMyArray().toString() === '4,5,6';
  return res1 && res2;
}

@Concurrent
export function testSendableFourAttributeClass0004(): boolean {
  const instance = new SendableFourAttributeClass();
  let res1 = instance instanceof SendableFourAttributeClass;
  const lockName = 'newLock';
  instance.setMyAsyncLock(lockName);
  let res2 = instance.getMyAsyncLock().name === lockName;
  return res1 && res2;
}

@Concurrent
export function testSendableFourAttributeClass0005(): boolean {
  const instance = new SendableFourAttributeClass();
  let res1 = instance instanceof SendableFourAttributeClass;
  const inheritedInstance = new InheritedSendableClass();
  inheritedInstance.setInheritedProperty('customValue');
  instance.setMyInheritedClass(inheritedInstance);
  let res2 = instance.getMyInheritedClass().getInheritedProperty() === 'customValue';
  return res1 && res2;
}

@Concurrent
export function testFourthLevelSendableClassOver0001(): boolean {
  const instance = new FourthLevelSendableClassOver('piter', 18);
  let res1 = instance instanceof FourthLevelSendableClassOver;
  const expectedString = 'Person[name=piter, age=18]';
  let res2 = instance.toString() === expectedString;
  return res1 && res2;
}

@Concurrent
export function testFourthLevelSendableClassOver0002(): boolean {
  const instance = new FourthLevelSendableClassOver('piter', 18);
  let res1 = instance instanceof FourthLevelSendableClassOver;
  const myNumber = 42;
  instance.setMyNumber(myNumber);
  let res2 = instance.myNumber === myNumber + 10;
  return res1 && res2;
}

@Concurrent
export function testFourthLevelSendableClassOver0003(): boolean {
  const instance = new FourthLevelSendableClassOver('piter', 18);
  let res1 = instance instanceof FourthLevelSendableClassOver;
  instance.setMyEnum();
  let res2 = instance.myEnum === SendableConstEnum.OPTION_2;
  return res1 && res2;
}

@Concurrent
export function testFourthLevelSendableClassOver0004(): boolean {
  const instance = new FourthLevelSendableClassOver('piter', 18);
  let res1 = instance instanceof FourthLevelSendableClassOver;
  instance.setMyArray([10, 20, 30]);
  let res2 = instance.myArray.toString() === '10,20,30';
  return res1 && res2;
}

@Concurrent
export function testFourthLevelSendableClassOver0005(): boolean {
  const instance = new FourthLevelSendableClassOver('piter', 18);
  let res1 = instance instanceof FourthLevelSendableClassOver;
  const lockName = 'fourthLevelLock';
  instance.setMyAsyncLock(lockName);
  let res2 = instance.myAsyncLock.name === lockName;
  return res1 && res2;
}

@Concurrent
export function testFourthLevelSendableClassOver0006(): boolean {
  const instance = new FourthLevelSendableClassOver('piter', 18);
  let res1 = instance instanceof FourthLevelSendableClassOver;
  const inheritedInstance = new InheritedSendableClass();
  inheritedInstance.setInheritedProperty('customValue');
  instance.setMyInheritedClass(inheritedInstance);
  let res2 = instance.getMyInheritedClass().getInheritedProperty() === 'customValue';
  return res1 && res2;
}

export default function tripleInheritanceTaskPoolTest() {
  describe('ActsTripleInheritanceTaskPoolTest', () => {
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_TRIPLE_INHERIT_TASK_POOL_0100
     * @tc.name       : testSendableTripleInheritanceTaskPool0001
     * @tc.desc       : Test SendableTripleInheritanceTaskPool number is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableTripleInheritanceTaskPool0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testSendableTripleInheritanceTaskPool0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSendableTripleInheritanceTaskPool0001).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_TRIPLE_INHERIT_TASK_POOL_0200
     * @tc.name       : testSendableTripleInheritanceTaskPool0002
     * @tc.desc       : Test SendableTripleInheritanceTaskPool topLevelClassInstance is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableTripleInheritanceTaskPool0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testSendableTripleInheritanceTaskPool0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSendableTripleInheritanceTaskPool0002).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_TRIPLE_INHERIT_TASK_POOL_0300
     * @tc.name       : testSendableTripleInheritanceTaskPool0003
     * @tc.desc       : Test SendableTripleInheritanceTaskPool SendableConstEnum is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableTripleInheritanceTaskPool0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testSendableTripleInheritanceTaskPool0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSendableTripleInheritanceTaskPool0003).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_TRIPLE_INHERIT_TASK_POOL_0400
     * @tc.name       : testSendableTripleInheritanceTaskPool0004
     * @tc.desc       : Test SendableTripleInheritanceTaskPool array is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableTripleInheritanceTaskPool0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testSendableTripleInheritanceTaskPool0004';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSendableTripleInheritanceTaskPool0004).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_TRIPLE_INHERIT_TASK_POOL_0500
     * @tc.name       : testSendableTripleInheritanceTaskPool0005
     * @tc.desc       : Test SendableTripleInheritanceTaskPool asyncLock is assigned directly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSendableTripleInheritanceTaskPool0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testSendableTripleInheritanceTaskPool0005';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSendableTripleInheritanceTaskPool0005).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FOUR_ATTRIBUTE_TASK_POOL_0100
     * @tc.name      : testSendableFourAttributeClass0001
     * @tc.desc      : Test SendableFourAttributeClass myNumber is assigned directly and correctly.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testSendableFourAttributeClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testSendableFourAttributeClass0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSendableFourAttributeClass0001).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FOUR_ATTRIBUTE_TASK_POOL_0200
     * @tc.name      : testSendableFourAttributeClass0002
     * @tc.desc      : Test SendableFourAttributeClass myEnum is assigned directly and correctly.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testSendableFourAttributeClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testSendableFourAttributeClass0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSendableFourAttributeClass0002).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FOUR_ATTRIBUTE_TASK_POOL_0300
     * @tc.name      : testSendableFourAttributeClass0003
     * @tc.desc      : Test SendableFourAttributeClass myArray is assigned directly and correctly.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testSendableFourAttributeClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testSendableFourAttributeClass0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSendableFourAttributeClass0003).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FOUR_ATTRIBUTE_TASK_POOL_0400
     * @tc.name      : testSendableFourAttributeClass0004
     * @tc.desc      : Test SendableFourAttributeClass myAsyncLock is assigned directly and correctly.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testSendableFourAttributeClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testSendableFourAttributeClass0004';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSendableFourAttributeClass0004).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_SENDABLE_FOUR_ATTRIBUTE_TASK_POOL_0500
     * @tc.name      : testSendableFourAttributeClass0005
     * @tc.desc      : Test SendableFourAttributeClass myInheritedClass is assigned directly and correctly.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testSendableFourAttributeClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testSendableFourAttributeClass0005';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testSendableFourAttributeClass0005).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FOURTH_LEVEL_SENDABLE_CLASS_OVER_0100
     * @tc.name       : testFourthLevelSendableClassOver0001
     * @tc.desc       : Test the effectiveness of the toString method of FourthLevelSendableClassOver.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFourthLevelSendableClassOver0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testFourthLevelSendableClassOver0001';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testFourthLevelSendableClassOver0001).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FOURTH_LEVEL_SENDABLE_CLASS_OVER_0200
     * @tc.name       : testFourthLevelSendableClassOver0002
     * @tc.desc       : Test the setting and logic of myNumber of FourthLevelSendableClassOver.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFourthLevelSendableClassOver0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testFourthLevelSendableClassOver0002';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testFourthLevelSendableClassOver0002).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FOURTH_LEVEL_SENDABLE_CLASS_OVER_0300
     * @tc.name       : testFourthLevelSendableClassOver0003
     * @tc.desc       : Test the setting of the myEnum property of FourthLevelSendableClassOver.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFourthLevelSendableClassOver0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testFourthLevelSendableClassOver0003';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testFourthLevelSendableClassOver0003).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FOURTH_LEVEL_SENDABLE_CLASS_OVER_0400
     * @tc.name       : testFourthLevelSendableClassOver0004
     * @tc.desc       : Test the myArray property setting function of FourthLevelSendableClassOver.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFourthLevelSendableClassOver0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testFourthLevelSendableClassOver0004';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testFourthLevelSendableClassOver0004).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FOURTH_LEVEL_SENDABLE_CLASS_OVER_0500
     * @tc.name       : testFourthLevelSendableClassOver0005
     * @tc.desc       : Test the setting of the myAsyncLock property of FourthLevelSendableClassOver.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFourthLevelSendableClassOver0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testFourthLevelSendableClassOver0005';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testFourthLevelSendableClassOver0005).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_FOURTH_LEVEL_SENDABLE_CLASS_OVER_0600
     * @tc.name       : testFourthLevelSendableClassOver0006
     * @tc.desc       : Test FourthLevelSendableClassOver myInheritedClass is assigned directly and correctly.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testFourthLevelSendableClassOver0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testFourthLevelSendableClassOver0006';
      console.info(`${caseName} test start`);
      let num = 0;
      try {
        for (let i = 0; i < 10; i++) {
          taskpool.execute(testFourthLevelSendableClassOver0006).then((value) => {
            num++;
            expect(value).assertEqual(true);
          });
        }
        while (num < 10) {
          await sleep(100);
        }
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
  })
}