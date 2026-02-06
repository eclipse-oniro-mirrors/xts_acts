import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { sleep } from './utils';

interface InfoResult {
  value: number;
  doubled: number;
}

interface ProcessedData {
  status: string;
  data: number[];
}

interface ComplexResult {
  processed: boolean;
  value: number;
}

interface GenericResult<T> {
  data: T;
  type: string;
}

interface UserInfo {
  name: string;
  age: number;
}

interface UserProfile {
  name: string;
}

interface UserData {
  id: number;
  profile: UserProfile;
}

interface NestedUser {
  user: UserData;
}

interface FilterResult {
  value: number;
  keep: boolean;
}

interface ComplexUserProfile extends HasIdAndName {
  email: string;
  age?: number;
}

interface ProductInfo {
  id: number;
  name: string;
  price: number;
  category: string;
  tags: string[];
}

interface HasId {
  id: number;
}

interface HasName {
  name: string;
}

interface HasIdAndName extends HasId, HasName {
}

interface ProcessContext {
  prefix: string;
  suffix: string;
}

interface ItemWithId {
  id: number;
  data: string;
}

interface ItemWithName {
  name: string;
  value: number;
}

interface ItemWithBoth extends HasIdAndName {
  extra: boolean;
}

interface ConditionalResult {
  type: string;
  value: string;
  length: number;
}

interface UserSettings {
  theme: string;
  notifications: boolean;
}

interface UserProfileNested {
  name: string;
  settings: UserSettings;
}

interface UserMetadata {
  createdAt: string;
  lastLogin: string;
}

interface UserDataNested {
  profile: UserProfileNested;
  metadata: UserMetadata;
}

interface NestedReturnData {
  user: UserDataNested;
  permissions: string[];
}

interface MetaInfo {
  timestamp: number;
  version: string;
}

interface GenericReturnWrapper<T> {
  data: T;
  meta: MetaInfo;
}

interface SummaryInfo {
  total: number;
  average: number;
  max: number;
  min: number;
}

interface ArrayReturnResult {
  items: number[];
  summary: SummaryInfo;
}

interface TypedArrayResult<T> {
  elements: T[];
  count: number;
  type: string;
}

interface NullableResult<T> {
  value: T | null;
  hasValue: boolean;
}

interface UndefinedResult<T> {
  value: T | undefined;
  isPresent: boolean;
}

interface EmptyDataResult {
  items: string[];
  metadata: Record<string, string>;
  isEmpty: boolean;
}

interface Level3Data {
  data: string[];
  count: number;
}

interface Level2Data {
  level3: Level3Data;
  metadata: string;
}

interface Level1Data {
  level2: Level2Data;
  summary: string;
}

interface NestedDataStructure {
  level1: Level1Data;
  status: string;
}

interface UserGroups {
  active: UserInfo[];
  inactive: UserInfo[];
}

interface SettingsData {
  global: Record<string, boolean>;
  user: Record<string, string>;
}

interface StatisticsData {
  totalUsers: number;
  activeCount: number;
  lastUpdate: string;
}

interface ComplexNestedStructure {
  users: UserGroups;
  settings: SettingsData;
  statistics: StatisticsData;
}

async function helperGenericReturn<T>(value: T): Promise<T> {
  return await Promise.resolve(value);
}

async function helperGenericTransform<T, U>(value: T, transformer: (input: T) => U): Promise<U> {
  const transformed = transformer(value);
  return await Promise.resolve(transformed);
}

async function helperGenericArrayProcess<T>(items: T[]): Promise<T[]> {
  const promises = items.map(async (item: T): Promise<T> => {
    return await Promise.resolve(item);
  });
  const processed = await Promise.all(promises);
  return processed;
}

async function helperGenericOptional<T>(value: T | null): Promise<T | null> {
  if (value === null) {
    return null;
  }
  return await Promise.resolve(value);
}

async function helperGenericConstrained<T extends string | number>(value: T): Promise<T> {
  return await Promise.resolve(value);
}

async function helperGenericMultiple<T, U, V>(
  first: T,
  second: U,
  combiner: (a: T, b: U) => V
): Promise<V> {
  const result = combiner(first, second);
  return await Promise.resolve(result);
}

export default function asyncFirTest(): void {
  describe('asyncFirTest', () => {
    afterEach(async () => {
      await sleep(10)
    })

    /**
     * @tc.name   asyncFirTest0001
     * @tc.number ASYNC_FIR_TEST_0001
     * @tc.desc   Must explicitly declare async to use await
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFirTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const validAsyncFunction = async (): Promise<number> => {
        return await Promise.resolve(42);
      };

      const validAsyncArrow = async (): Promise<string> => {
        return await Promise.resolve('test');
      };

      const result1 = await validAsyncFunction();
      const result2 = await validAsyncArrow();

      expect(result1).assertEqual(42);
      expect(result2).assertEqual('test');
    });

    /**
     * @tc.name   asyncFirTest0002
     * @tc.number ASYNC_FIR_TEST_0002
     * @tc.desc   Regular arrow function async syntax validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFirTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const basicAsyncArrow = async (): Promise<string> => {
        return await Promise.resolve('basic');
      };

      const paramAsyncArrow = async (value: number): Promise<number> => {
        return await Promise.resolve(value * 2);
      };

      const typedAsyncArrow = async (str: string): Promise<string> => {
        return await Promise.resolve(str.toUpperCase());
      };

      const result1 = await basicAsyncArrow();
      const result2 = await paramAsyncArrow(5);
      const result3 = await typedAsyncArrow('hello');

      expect(result1).assertEqual('basic');
      expect(result2).assertEqual(10);
      expect(result3).assertEqual('HELLO');
    });

    /**
     * @tc.name   asyncFirTest0003
     * @tc.number ASYNC_FIR_TEST_0003
     * @tc.desc   Immediately invoked async arrow function syntax validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result1 = await (async (): Promise<string> => {
        return await Promise.resolve('iife1');
      })();

      const result2 = await (async (num: number): Promise<number> => {
        return await Promise.resolve(num + 10);
      })(5);

      const result3 = await (async (data: string[]): Promise<number> => {
        const promises = data.map(async (item: string): Promise<number> => {
          return await Promise.resolve(item.length);
        });
        const processed = await Promise.all(promises);
        return processed.reduce((sum: number, len: number) => sum + len, 0);
      })(['hello', 'world']);

      expect(result1).assertEqual('iife1');
      expect(result2).assertEqual(15);
      expect(result3).assertEqual(10);
    });

    /**
     * @tc.name   asyncFirTest0004
     * @tc.number ASYNC_FIR_TEST_0004
     * @tc.desc   Class instance method async syntax validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class AsyncMethodClass {
        private value: number = 10;

        async getValue(): Promise<number> {
          return await Promise.resolve(this.value);
        }

        async addValue(num: number): Promise<number> {
          const current = await this.getValue();
          return await Promise.resolve(current + num);
        }

        async getInfo(): Promise<InfoResult> {
          const val = await this.getValue();
          const result: InfoResult = {
            value: val,
            doubled: val * 2
          };
          return await Promise.resolve(result);
        }

        async processValue(multiplier: number): Promise<number> {
          const added = await this.addValue(5);
          return await Promise.resolve(added * multiplier);
        }
      }

      const instance = new AsyncMethodClass();

      const result1 = await instance.getValue();
      const result2 = await instance.addValue(20);
      const result3 = await instance.getInfo();
      const result4 = await instance.processValue(3);

      expect(result1).assertEqual(10);
      expect(result2).assertEqual(30);
      expect(result3.value).assertEqual(10);
      expect(result3.doubled).assertEqual(20);
      expect(result4).assertEqual(45);
    });

    /**
     * @tc.name   asyncFirTest0005
     * @tc.number ASYNC_FIR_TEST_0005
     * @tc.desc   Class static method async syntax validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class AsyncStaticClass {
        private static readonly defaultValue: number = 100;

        static async getDefault(): Promise<number> {
          return await Promise.resolve(AsyncStaticClass.defaultValue);
        }

        static async calculate(a: number, b: number): Promise<number> {
          const base = await AsyncStaticClass.getDefault();
          return await Promise.resolve(base + a + b);
        }

        static async wrapValue<T>(value: T): Promise<GenericResult<T>> {
          const result: GenericResult<T> = {
            data: value,
            type: typeof value
          };
          return await Promise.resolve(result);
        }

        static async processArray(numbers: number[]): Promise<number[]> {
          const promises = numbers.map(async (num: number): Promise<number> => {
            return await Promise.resolve(num * 2);
          });
          const results = await Promise.all(promises);
          return results;
        }
      }

      const result1 = await AsyncStaticClass.getDefault();
      const result2 = await AsyncStaticClass.calculate(10, 20);
      const result3 = await AsyncStaticClass.wrapValue<string>('test');
      const result4 = await AsyncStaticClass.processArray([1, 2, 3]);

      expect(result1).assertEqual(100);
      expect(result2).assertEqual(130);
      expect(result3.data).assertEqual('test');
      expect(typeof result3.type).assertEqual('string');
      expect(result4).assertDeepEquals([2, 4, 6]);
    });

    /**
     * @tc.name   asyncFirTest0006
     * @tc.number ASYNC_FIR_TEST_0006
     * @tc.desc   Class private and protected async method syntax validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class BaseAsyncClass {
        protected value: number = 50;

        protected async getProtectedValue(): Promise<number> {
          return await Promise.resolve(this.value);
        }

        protected async processProtected(multiplier: number): Promise<number> {
          const val = await this.getProtectedValue();
          return await Promise.resolve(val * multiplier);
        }

        async getProcessedValue(multiplier: number): Promise<number> {
          return await this.processProtected(multiplier);
        }
      }

      class DerivedAsyncClass extends BaseAsyncClass {
        private secretValue: number = 25;

        private async getSecretValue(): Promise<number> {
          return await Promise.resolve(this.secretValue);
        }

        private async combineValues(): Promise<number> {
          const protectedVal = await this.getProtectedValue();
          const secretVal = await this.getSecretValue();
          return await Promise.resolve(protectedVal + secretVal);
        }

        async getCombinedResult(): Promise<number> {
          return await this.combineValues();
        }

        protected async processProtected(multiplier: number): Promise<number> {
          const combined = await this.combineValues();
          return await Promise.resolve(combined * multiplier);
        }
      }

      const base = new BaseAsyncClass();
      const derived = new DerivedAsyncClass();

      const result1 = await base.getProcessedValue(2);
      const result2 = await derived.getCombinedResult();
      const result3 = await derived.getProcessedValue(3);

      expect(result1).assertEqual(100);
      expect(result2).assertEqual(75);
      expect(result3).assertEqual(225);
    });

    /**
     * @tc.name   asyncFirTest0007
     * @tc.number ASYNC_FIR_TEST_0007
     * @tc.desc   Generic async function basic syntax validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const stringResult = await helperGenericReturn<string>('test');
      const numberResult = await helperGenericReturn<number>(42);
      const booleanResult = await helperGenericReturn<boolean>(true);

      expect(stringResult).assertEqual('test');
      expect(typeof stringResult).assertEqual('string');
      expect(numberResult).assertEqual(42);
      expect(typeof numberResult).assertEqual('number');
      expect(booleanResult).assertEqual(true);
      expect(typeof booleanResult).assertEqual('boolean');

      const transformResult1 = await helperGenericTransform<string, number>('hello', (str: string): number => str.length);
      const transformResult2 = await helperGenericTransform<number, string>(123, (num: number): string => num.toString());

      expect(transformResult1).assertEqual(5);
      expect(typeof transformResult1).assertEqual('number');
      expect(transformResult2).assertEqual('123');
      expect(typeof transformResult2).assertEqual('string');
    });

    /**
     * @tc.name   asyncFirTest0008
     * @tc.number ASYNC_FIR_TEST_0008
     * @tc.desc   Generic async function array and optional parameter validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const arrayResult1 = await helperGenericArrayProcess<number>([1, 2, 3]);
      const arrayResult2 = await helperGenericArrayProcess<string>(['a', 'b', 'c']);

      expect(arrayResult1).assertDeepEquals([1, 2, 3]);
      expect(arrayResult2).assertDeepEquals(['a', 'b', 'c']);

      const optionalResult1 = await helperGenericOptional<string>('value');
      const optionalResult2 = await helperGenericOptional<string>(null);

      expect(optionalResult1).assertEqual('value');
      expect(optionalResult2).assertEqual(null);

      const constrainedResult1 = await helperGenericConstrained<string>('constrained');
      const constrainedResult2 = await helperGenericConstrained<number>(100);

      expect(constrainedResult1).assertEqual('constrained');
      expect(constrainedResult2).assertEqual(100);
    });

    /**
     * @tc.name   asyncFirTest0009
     * @tc.number ASYNC_FIR_TEST_0009
     * @tc.desc   Generic async class methods and multiple parameters validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      class GenericProcessor<T> {
        async process(input: T): Promise<T> {
          return await Promise.resolve(input);
        }

        async processArray(inputs: T[]): Promise<T[]> {
          const promises = inputs.map(async (input: T): Promise<T> => {
            return await this.process(input);
          });
          return await Promise.all(promises);
        }
      }

      const multipleResult = await helperGenericMultiple<string, number, string>(
        'Count: ',
        5,
        (str: string, num: number): string => str + num.toString()
      );

      expect(multipleResult).assertEqual('Count: 5');

      const stringProcessor = new GenericProcessor<string>();
      const numberProcessor = new GenericProcessor<number>();

      const classResult1 = await stringProcessor.process('class_test');
      const classResult2 = await numberProcessor.processArray([10, 20, 30]);

      expect(classResult1).assertEqual('class_test');
      expect(classResult2).assertDeepEquals([10, 20, 30]);
    });
    /**
     * @tc.name   asyncFirTest0010
     * @tc.number ASYNC_FIR_TEST_0010
     * @tc.desc   Async function returns primitive values wrapped as Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFirTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const returnNumber = async (): Promise<number> => {
        return 42;
      };

      const returnString = async (): Promise<string> => {
        return 'hello';
      };

      const returnBoolean = async (): Promise<boolean> => {
        return true;
      };

      const returnBigInt = async (): Promise<bigint> => {
        return 100n;
      };

      const returnNull = async (): Promise<null> => {
        return null;
      };

      const returnUndefined = async (): Promise<undefined> => {
        return undefined;
      };

      const result1 = returnNumber();
      const result2 = returnString();
      const result3 = returnBoolean();
      const result4 = returnBigInt();
      const result5 = returnNull();
      const result6 = returnUndefined();

      expect(result1 instanceof Promise).assertEqual(true);
      expect(result2 instanceof Promise).assertEqual(true);
      expect(result3 instanceof Promise).assertEqual(true);
      expect(result4 instanceof Promise).assertEqual(true);
      expect(result5 instanceof Promise).assertEqual(true);
      expect(result6 instanceof Promise).assertEqual(true);

      expect(await result1).assertEqual(42);
      expect(await result2).assertEqual('hello');
      expect(await result3).assertEqual(true);
      expect(await result4).assertEqual(100n);
      expect(await result5).assertEqual(null);
      expect(await result6).assertEqual(undefined);
    });

    /**
     * @tc.name   asyncFirTest0011
     * @tc.number ASYNC_FIR_TEST_0011
     * @tc.desc   Async function returns objects and arrays wrapped as Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFirTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const returnObject = async (): Promise<UserInfo> => {
        const obj: UserInfo = { name: 'John', age: 30 };
        return obj;
      };

      const returnArray = async (): Promise<number[]> => {
        return [1, 2, 3, 4, 5];
      };

      const returnNestedObject = async (): Promise<NestedUser> => {
        const profile: UserProfile = { name: 'Alice' };
        const userData: UserData = {
          id: 1,
          profile: profile
        };
        const nested: NestedUser = {
          user: userData
        };
        return nested;
      };

      const returnMap = async (): Promise<Map<string, number>> => {
        const map = new Map<string, number>();
        map.set('a', 1);
        map.set('b', 2);
        return map;
      };

      const returnSet = async (): Promise<Set<string>> => {
        const set = new Set<string>();
        set.add('x');
        set.add('y');
        return set;
      };

      const returnDate = async (): Promise<Date> => {
        return new Date('2024-01-01');
      };

      const result1 = returnObject();
      const result2 = returnArray();
      const result3 = returnNestedObject();
      const result4 = returnMap();
      const result5 = returnSet();
      const result6 = returnDate();

      expect(result1 instanceof Promise).assertEqual(true);
      expect(result2 instanceof Promise).assertEqual(true);
      expect(result3 instanceof Promise).assertEqual(true);
      expect(result4 instanceof Promise).assertEqual(true);
      expect(result5 instanceof Promise).assertEqual(true);
      expect(result6 instanceof Promise).assertEqual(true);

      const obj = await result1;
      expect(obj.name).assertEqual('John');
      expect(obj.age).assertEqual(30);

      const arr = await result2;
      expect(arr).assertDeepEquals([1, 2, 3, 4, 5]);

      const nested = await result3;
      expect(nested.user.profile.name).assertEqual('Alice');

      const map = await result4;
      expect(map.get('a')).assertEqual(1);
      expect(map.get('b')).assertEqual(2);

      const set = await result5;
      expect(set.has('x')).assertEqual(true);
      expect(set.has('y')).assertEqual(true);

      const date = await result6;
      expect(date instanceof Date).assertEqual(true);
    });

    /**
     * @tc.name   asyncFirTest0012
     * @tc.number ASYNC_FIR_TEST_0012
     * @tc.desc   Async function with no return statement returns Promise<undefined>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFirTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const noReturn = async (): Promise<void> => {
        const temp = 42;
        const result = temp * 2;
      };

      const emptyReturn = async (): Promise<void> => {
        const value = 'test';
        return;
      };

      const conditionalReturn = async (shouldReturn: boolean): Promise<string | void> => {
        if (shouldReturn) {
          return 'returned';
        }
      };

      const asyncOperationsNoReturn = async (): Promise<void> => {
        await Promise.resolve(10);
        await Promise.resolve('test');
      };

      const result1 = noReturn();
      const result2 = emptyReturn();
      const result3 = conditionalReturn(false);
      const result4 = asyncOperationsNoReturn();

      expect(result1 instanceof Promise).assertEqual(true);
      expect(result2 instanceof Promise).assertEqual(true);
      expect(result3 instanceof Promise).assertEqual(true);
      expect(result4 instanceof Promise).assertEqual(true);

      expect(await result1).assertEqual(undefined);
      expect(await result2).assertEqual(undefined);
      expect(await result3).assertEqual(undefined);
      expect(await result4).assertEqual(undefined);

      const result5 = await conditionalReturn(true);
      expect(result5).assertEqual('returned');
    });

    /**
     * @tc.name   asyncFirTest0013
     * @tc.number ASYNC_FIR_TEST_0013
     * @tc.desc   Async function returns resolved Promise compatibility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const returnResolvedPromise = async (): Promise<number> => {
        return Promise.resolve(100);
      };

      const returnChainedPromise = async (): Promise<string> => {
        return Promise.resolve('initial')
          .then((val: string) => val + '_processed')
          .then((val: string) => val + '_final');
      };

      const returnResolvedObject = async (): Promise<ProcessedData> => {
        const data: ProcessedData = {
          status: 'success',
          data: [1, 2, 3]
        };
        return Promise.resolve(data);
      };

      const returnNestedResolved = async (): Promise<number> => {
        const innerPromise = Promise.resolve(50);
        return innerPromise;
      };

      const awaitAndReturnResolved = async (): Promise<boolean> => {
        const resolved = await Promise.resolve(true);
        return Promise.resolve(resolved);
      };

      const result1 = returnResolvedPromise();
      const result2 = returnChainedPromise();
      const result3 = returnResolvedObject();
      const result4 = returnNestedResolved();
      const result5 = awaitAndReturnResolved();

      expect(result1 instanceof Promise).assertEqual(true);
      expect(result2 instanceof Promise).assertEqual(true);
      expect(result3 instanceof Promise).assertEqual(true);
      expect(result4 instanceof Promise).assertEqual(true);
      expect(result5 instanceof Promise).assertEqual(true);

      expect(await result1).assertEqual(100);
      expect(await result2).assertEqual('initial_processed_final');

      const obj = await result3;
      expect(obj.status).assertEqual('success');
      expect(obj.data).assertDeepEquals([1, 2, 3]);

      expect(await result4).assertEqual(50);
      expect(await result5).assertEqual(true);
    });

    /**
     * @tc.name   asyncFirTest0014
     * @tc.number ASYNC_FIR_TEST_0014
     * @tc.desc   Async function returns basic pending Promise compatibility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const returnPendingPromise = async (): Promise<string> => {
        return new Promise<string>((resolve: (value: string) => void) => {
          setTimeout(() => resolve('delayed_result'), 10);
        });
      };

      const returnAsyncOperation = async (): Promise<number> => {
        return new Promise<number>((resolve: (value: number) => void) => {
          setTimeout(() => {
            const calculation = 5 * 8 + 2;
            resolve(calculation);
          }, 5);
        });
      };

      const result1 = returnPendingPromise();
      const result2 = returnAsyncOperation();

      expect(result1 instanceof Promise).assertEqual(true);
      expect(result2 instanceof Promise).assertEqual(true);

      expect(await result1).assertEqual('delayed_result');
      expect(await result2).assertEqual(42);
    });

    /**
     * @tc.name   asyncFirTest0015
     * @tc.number ASYNC_FIR_TEST_0015
     * @tc.desc   Async function returns pending Promise with rejection handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const returnPendingWithPossibleReject = async (shouldReject: boolean): Promise<string> => {
        return new Promise<string>((resolve: (value: string) => void, reject: (reason: Error) => void) => {
          setTimeout(() => {
            if (shouldReject) {
              reject(new Error('Intentional rejection'));
            } else {
              resolve('success_result');
            }
          }, 8);
        });
      };

      const result3 = returnPendingWithPossibleReject(false);
      expect(result3 instanceof Promise).assertEqual(true);
      expect(await result3).assertEqual('success_result');

      let rejectionCaught = false;
      try {
        await returnPendingWithPossibleReject(true);
      } catch (error) {
        rejectionCaught = true;
        expect((error as Error).message).assertEqual('Intentional rejection');
      }
      expect(rejectionCaught).assertEqual(true);
    });

    /**
     * @tc.name   asyncFirTest0016
     * @tc.number ASYNC_FIR_TEST_0016
     * @tc.desc   Async function returns chained and complex pending Promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const returnChainedPending = async (): Promise<number> => {
        const firstPromise = new Promise<number>((resolve: (value: number) => void) => {
          setTimeout(() => resolve(10), 5);
        });

        return firstPromise.then((val: number) => {
          return new Promise<number>((resolve: (value: number) => void) => {
            setTimeout(() => resolve(val * 3), 5);
          });
        });
      };

      const returnComplexPending = async (): Promise<ComplexResult> => {
        return new Promise<ComplexResult>((resolve: (value: ComplexResult) => void) => {
          setTimeout(() => {
            const result: ComplexResult = {
              processed: true,
              value: Math.floor(Math.random() * 100) + 1
            };
            resolve(result);
          }, 12);
        });
      };

      const result4 = returnChainedPending();
      const result5 = returnComplexPending();

      expect(result4 instanceof Promise).assertEqual(true);
      expect(result5 instanceof Promise).assertEqual(true);

      expect(await result4).assertEqual(30);

      const complexResult = await result5;
      expect(complexResult.processed).assertEqual(true);
      expect(typeof complexResult.value).assertEqual('number');
      expect(complexResult.value).assertLarger(0);
      expect(complexResult.value).assertLessOrEqual(100);
    });

    /**
     * @tc.name   asyncFirTest0017
     * @tc.number ASYNC_FIR_TEST_0017
     * @tc.desc   Generic async function basic return type validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const stringResult = await helperGenericReturn<string>('test');
      const numberResult = await helperGenericReturn<number>(42);
      const booleanResult = await helperGenericReturn<boolean>(true);

      expect(stringResult).assertEqual('test');
      expect(typeof stringResult).assertEqual('string');
      expect(numberResult).assertEqual(42);
      expect(typeof numberResult).assertEqual('number');
      expect(booleanResult).assertEqual(true);
      expect(typeof booleanResult).assertEqual('boolean');

      const transformResult1 = await helperGenericTransform<string, number>('hello', (str: string): number => str.length);
      const transformResult2 = await helperGenericTransform<number, string>(123, (num: number): string => num.toString());

      expect(transformResult1).assertEqual(5);
      expect(typeof transformResult1).assertEqual('number');
      expect(transformResult2).assertEqual('123');
      expect(typeof transformResult2).assertEqual('string');
    });

    /**
     * @tc.name   asyncFirTest0018
     * @tc.number ASYNC_FIR_TEST_0018
     * @tc.desc   Generic async function array and optional return validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const arrayResult1 = await helperGenericArrayProcess<number>([1, 2, 3]);
      const arrayResult2 = await helperGenericArrayProcess<string>(['a', 'b', 'c']);

      expect(arrayResult1).assertDeepEquals([1, 2, 3]);
      expect(arrayResult2).assertDeepEquals(['a', 'b', 'c']);

      const optionalResult1 = await helperGenericOptional<string>('value');
      const optionalResult2 = await helperGenericOptional<string>(null);

      expect(optionalResult1).assertEqual('value');
      expect(optionalResult2).assertEqual(null);

      const constrainedResult1 = await helperGenericConstrained<string>('constrained');
      const constrainedResult2 = await helperGenericConstrained<number>(100);

      expect(constrainedResult1).assertEqual('constrained');
      expect(constrainedResult2).assertEqual(100);
    });

    /**
     * @tc.name   asyncFirTest0019
     * @tc.number ASYNC_FIR_TEST_0019
     * @tc.desc   Generic async class methods and multiple parameter return validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      class GenericProcessor<T> {
        async process(input: T): Promise<T> {
          return await Promise.resolve(input);
        }

        async processArray(inputs: T[]): Promise<T[]> {
          const promises = inputs.map(async (input: T): Promise<T> => {
            return await this.process(input);
          });
          return await Promise.all(promises);
        }
      }

      const multipleResult = await helperGenericMultiple<string, number, string>(
        'Count: ',
        5,
        (str: string, num: number): string => str + num.toString()
      );

      expect(multipleResult).assertEqual('Count: 5');

      const stringProcessor = new GenericProcessor<string>();
      const numberProcessor = new GenericProcessor<number>();

      const classResult1 = await stringProcessor.process('class_test');
      const classResult2 = await numberProcessor.processArray([10, 20, 30]);

      expect(classResult1).assertEqual('class_test');
      expect(classResult2).assertDeepEquals([10, 20, 30]);
    });

    /**
     * @tc.name   asyncFirTest0020
     * @tc.number ASYNC_FIR_TEST_0020
     * @tc.desc   await only works inside async functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFirTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const validAsyncFunction = async (): Promise<string> => {
        const result = await Promise.resolve('valid_await');
        return result;
      };

      const validAsyncArrow = async (): Promise<number> => {
        return await Promise.resolve(42);
      };

      class AsyncClass {
        async validMethod(): Promise<boolean> {
          return await Promise.resolve(true);
        }

        static async validStaticMethod(): Promise<string> {
          return await Promise.resolve('static_result');
        }
      }

      const result1 = await validAsyncFunction();
      const result2 = await validAsyncArrow();

      const instance = new AsyncClass();
      const result3 = await instance.validMethod();
      const result4 = await AsyncClass.validStaticMethod();

      expect(result1).assertEqual('valid_await');
      expect(result2).assertEqual(42);
      expect(result3).assertEqual(true);
      expect(result4).assertEqual('static_result');
    });

    /**
     * @tc.name   asyncFirTest0021
     * @tc.number ASYNC_FIR_TEST_0021
     * @tc.desc   Nested async functions with multi-level await usage validity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const level1Async = async (value: number): Promise<number> => {
        const level2Async = async (innerValue: number): Promise<number> => {
          const level3Async = async (deepValue: number): Promise<number> => {
            const step1 = await Promise.resolve(deepValue * 2);
            const step2 = await Promise.resolve(step1 + 10);
            const step3 = await Promise.resolve(step2 * 3);
            return step3;
          };

          const deepResult = await level3Async(innerValue);
          const level2Result = await Promise.resolve(deepResult + 5);
          return level2Result;
        };

        const nestedResult = await level2Async(value);
        const finalResult = await Promise.resolve(nestedResult + 1);
        return finalResult;
      };

      const result = await level1Async(3);
      expect(result).assertEqual(54);

      const conditionalNested = async (usePathA: boolean): Promise<string> => {
        const pathA = async (): Promise<string> => {
          const step1 = await Promise.resolve('A1');
          const step2 = await Promise.resolve(step1 + '_A2');
          return step2;
        };

        const pathB = async (): Promise<string> => {
          const step1 = await Promise.resolve('B1');
          const step2 = await Promise.resolve(step1 + '_B2');
          return step2;
        };

        if (usePathA) {
          return await pathA();
        } else {
          return await pathB();
        }
      };

      const resultA = await conditionalNested(true);
      const resultB = await conditionalNested(false);

      expect(resultA).assertEqual('A1_A2');
      expect(resultB).assertEqual('B1_B2');
    });

    /**
     * @tc.name   asyncFirTest0022
     * @tc.number ASYNC_FIR_TEST_0022
     * @tc.desc   Array map and filter with async/await syntax validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const testData = [1, 2, 3, 4, 5];

      const mapWithAsync = async (numbers: number[]): Promise<number[]> => {
        const promises = numbers.map(async (num: number): Promise<number> => {
          return await Promise.resolve(num * 2);
        });
        return await Promise.all(promises);
      };

      const filterWithAsync = async (numbers: number[]): Promise<number[]> => {
        const filterPromises = numbers.map(async (num: number): Promise<FilterResult> => {
          const shouldKeep = await Promise.resolve(num % 2 === 0);
          const result: FilterResult = { value: num, keep: shouldKeep };
          return result;
        });

        const filterResults = await Promise.all(filterPromises);
        return filterResults.filter((result: FilterResult) => result.keep).map((result: FilterResult) => result.value);
      };

      const mapResult = await mapWithAsync(testData);
      expect(mapResult).assertDeepEquals([2, 4, 6, 8, 10]);

      const filterResult = await filterWithAsync(testData);
      expect(filterResult).assertDeepEquals([2, 4]);
    });

    /**
     * @tc.name   asyncFirTest0023
     * @tc.number ASYNC_FIR_TEST_0023
     * @tc.desc   Array reduce and forEach with async/await syntax validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const testData = [1, 2, 3, 4, 5];

      const reduceWithAsync = async (numbers: number[]): Promise<number> => {
        let accumulator = 0;
        for (const num of numbers) {
          const processedValue = await Promise.resolve(num * 3);
          accumulator += processedValue;
        }
        return accumulator;
      };

      const forEachWithAsync = async (numbers: number[]): Promise<number[]> => {
        const results: number[] = [];
        const promises = numbers.map(async (num: number): Promise<void> => {
          const processed = await Promise.resolve(num + 10);
          results.push(processed);
        });
        await Promise.all(promises);
        return results.sort((a, b) => a - b);
      };

      const reduceResult = await reduceWithAsync(testData);
      expect(reduceResult).assertEqual(45);

      const forEachResult = await forEachWithAsync(testData);
      expect(forEachResult).assertDeepEquals([11, 12, 13, 14, 15]);
    });

    /**
     * @tc.name   asyncFirTest0024
     * @tc.number ASYNC_FIR_TEST_0024
     * @tc.desc   Nested array processing with async/await syntax validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const nestedArrayAsync = async (matrix: number[][]): Promise<number[]> => {
        const flattenPromises = matrix.map(async (row: number[]): Promise<number[]> => {
          return await Promise.all(row.map(async (cell: number): Promise<number> => {
            return await Promise.resolve(cell * cell);
          }));
        });

        const processedMatrix = await Promise.all(flattenPromises);
        return processedMatrix.flat();
      };

      const matrix = [[1, 2], [3, 4], [5, 6]];
      const flatResult = await nestedArrayAsync(matrix);
      expect(flatResult).assertDeepEquals([1, 4, 9, 16, 25, 36]);
    });

    /**
     * @tc.name   asyncFirTest0025
     * @tc.number ASYNC_FIR_TEST_0025
     * @tc.desc   Complex async class with nested methods validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      class AsyncDataProcessor {
        private data: number[] = [];
        async loadData(source: number[]): Promise<void> {
          const validatedData = await this.validateData(source);
          this.data = validatedData;
        }

        private async validateData(input: number[]): Promise<number[]> {
          const step1 = await this.filterValidNumbers(input);
          const step2 = await this.normalizeNumbers(step1);
          return step2;
        }

        private async filterValidNumbers(numbers: number[]): Promise<number[]> {
          const filterPromises = numbers.map(async (num: number): Promise<number | null> => {
            const isValid = await Promise.resolve(num > 0 && num < 1000);
            return isValid ? num : null;
          });

          const results = await Promise.all(filterPromises);
          const validNumbers: number[] = [];
          for (const num of results) {
            if (num !== null) {
              validNumbers.push(num);
            }
          }
          return validNumbers;
        }

        private async normalizeNumbers(numbers: number[]): Promise<number[]> {
          return await Promise.all(numbers.map(async (num: number): Promise<number> => {
            return await Promise.resolve(Math.round(num));
          }));
        }

        async processData(): Promise<ProcessedData> {
          if (this.data.length === 0) {
            throw new Error('No data loaded');
          }

          const sum = await this.calculateSum();
          const average = await this.calculateAverage();
          const processed = await this.transformData();

          const result: ProcessedData = {
            status: 'success',
            data: processed
          };
          return result;
        }

        private async calculateSum(): Promise<number> {
          return await Promise.resolve(this.data.reduce((sum, num) => sum + num, 0));
        }

        private async calculateAverage(): Promise<number> {
          const sum = await this.calculateSum();
          return await Promise.resolve(sum / this.data.length);
        }

        private async transformData(): Promise<number[]> {
          return await Promise.all(this.data.map(async (num: number): Promise<number> => {
            const multiplied = await Promise.resolve(num * 2);
            const adjusted = await Promise.resolve(multiplied + 1);
            return adjusted;
          }));
        }
      }

      const processor = new AsyncDataProcessor();
      const sourceData = [1.5, 2.7, 3.2, 4.8, 5.1];
      await processor.loadData(sourceData);
      const result = await processor.processData();
      expect(result.status).assertEqual('success');
      expect(result.data).assertDeepEquals([5, 7, 7, 11, 11]);

      const emptyProcessor = new AsyncDataProcessor();
      let errorCaught = false;
      try {
        await emptyProcessor.processData();
      } catch (error) {
        errorCaught = true;
        expect((error as Error).message).assertEqual('No data loaded');
      }
      expect(errorCaught).assertEqual(true);
    });

    /**
     * @tc.name   asyncFirTest0026
     * @tc.number ASYNC_FIR_TEST_0026
     * @tc.desc   Await with different Promise states and timing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const awaitImmediate = async (): Promise<string> => {
        const result = await Promise.resolve('immediate');
        return result;
      };

      const awaitDelayed = async (): Promise<string> => {
        const result = await new Promise<string>((resolve) => {
          setTimeout(() => resolve('delayed'), 50);
        });
        return result;
      };

      const awaitChained = async (): Promise<number> => {
        const result = await Promise.resolve(10)
          .then((val: number) => val * 2)
          .then((val: number) => val + 5)
          .then((val: number) => val * 3);
        return result;
      };

      const multipleAwaits = async (): Promise<string[]> => {
        const results: string[] = [];

        const first = await Promise.resolve('first');
        results.push(first);

        const second = await new Promise<string>((resolve) => {
          setTimeout(() => resolve('second'), 30);
        });
        results.push(second);

        const third = await Promise.resolve('third');
        results.push(third);

        return results;
      };

      const parallelAwaits = async (): Promise<string[]> => {
        const promises = [
          Promise.resolve('parallel1'),
          new Promise<string>((resolve) => setTimeout(() => resolve('parallel2'), 20)),
          Promise.resolve('parallel3')
        ];

        return await Promise.all(promises);
      };

      const immediateResult = await awaitImmediate();
      expect(immediateResult).assertEqual('immediate');

      const delayedResult = await awaitDelayed();
      expect(delayedResult).assertEqual('delayed');

      const chainedResult = await awaitChained();
      expect(chainedResult).assertEqual(75);

      const sequentialResults = await multipleAwaits();
      expect(sequentialResults).assertDeepEquals(['first', 'second', 'third']);

      const parallelResults = await parallelAwaits();
      expect(parallelResults).assertDeepEquals(['parallel1', 'parallel2', 'parallel3']);
    });

    /**
     * @tc.name   asyncFirTest0027
     * @tc.number ASYNC_FIR_TEST_0027
     * @tc.desc   Await with non-Promise values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const awaitNonPromise = async (): Promise<number> => {
        const result = await 42;
        return result;
      };

      const awaitString = async (): Promise<string> => {
        const result = await 'hello';
        return result;
      };

      const awaitObject = async (): Promise<UserInfo> => {
        const obj: UserInfo = { name: 'test', age: 25 };
        const result = await obj;
        return result;
      };

      const awaitNull = async (): Promise<null> => {
        const result = await null;
        return result;
      };

      const awaitUndefined = async (): Promise<undefined> => {
        const result = await undefined;
        return result;
      };

      const mixedAwaits = async (): Promise<string[]> => {
        const results: string[] = [];

        const nonPromise = await 'direct';
        results.push(nonPromise);

        const promise = await Promise.resolve('promise');
        results.push(promise);

        const transformed = await Promise.resolve('base').then((val: string) => val + '_transformed');
        results.push(transformed);

        return results;
      };

      const nonPromiseResult = await awaitNonPromise();
      expect(nonPromiseResult).assertEqual(42);

      const stringResult = await awaitString();
      expect(stringResult).assertEqual('hello');

      const objectResult = await awaitObject();
      expect(objectResult.name).assertEqual('test');
      expect(objectResult.age).assertEqual(25);

      const nullResult = await awaitNull();
      expect(nullResult).assertEqual(null);

      const undefinedResult = await awaitUndefined();
      expect(undefinedResult).assertEqual(undefined);

      const mixedResults = await mixedAwaits();
      expect(mixedResults).assertDeepEquals(['direct', 'promise', 'base_transformed']);
    });

    /**
     * @tc.name   asyncFirTest0028
     * @tc.number ASYNC_FIR_TEST_0028
     * @tc.desc   Basic type parameters consistency with TS annotations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFirTest0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const processString = async (input: string): Promise<string> => {
        return await Promise.resolve(input.toUpperCase());
      };

      const processNumber = async (input: number): Promise<number> => {
        return await Promise.resolve(input * 2);
      };

      const processBoolean = async (input: boolean): Promise<string> => {
        return await Promise.resolve(input ? 'true' : 'false');
      };

      const processBigInt = async (input: bigint): Promise<bigint> => {
        return await Promise.resolve(input + 1n);
      };

      const processMultiple = async (str: string, num: number, bool: boolean): Promise<string> => {
        const result = `${str}_${num}_${bool}`;
        return await Promise.resolve(result);
      };

      const stringResult = await processString('hello');
      expect(stringResult).assertEqual('HELLO');
      expect(typeof stringResult).assertEqual('string');

      const numberResult = await processNumber(21);
      expect(numberResult).assertEqual(42);
      expect(typeof numberResult).assertEqual('number');

      const booleanResult = await processBoolean(true);
      expect(booleanResult).assertEqual('true');
      expect(typeof booleanResult).assertEqual('string');

      const bigintResult = await processBigInt(99n);
      expect(bigintResult).assertEqual(100n);
      expect(typeof bigintResult).assertEqual('bigint');

      const multipleResult = await processMultiple('test', 123, false);
      expect(multipleResult).assertEqual('test_123_false');
    });

    /**
     * @tc.name   asyncFirTest0029
     * @tc.number ASYNC_FIR_TEST_0029
     * @tc.desc   Boundary value validation for basic type parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const handleEmptyString = async (input: string): Promise<number> => {
        return await Promise.resolve(input.length);
      };

      const handleZero = async (input: number): Promise<boolean> => {
        return await Promise.resolve(input === 0);
      };

      const handleNaN = async (input: number): Promise<boolean> => {
        return await Promise.resolve(Number.isNaN(input));
      };

      const handleNull = async (input: string | null): Promise<string> => {
        return await Promise.resolve(input === null ? 'null_received' : input);
      };

      const handleUndefined = async (input: number | undefined): Promise<string> => {
        return await Promise.resolve(input === undefined ? 'undefined_received' : input.toString());
      };

      const handleExtremeNumbers = async (input: number): Promise<string> => {
        if (input === Number.MAX_SAFE_INTEGER) {
          return await Promise.resolve('max_safe_integer');
        } else if (input === Number.MIN_SAFE_INTEGER) {
          return await Promise.resolve('min_safe_integer');
        } else if (input === Infinity) {
          return await Promise.resolve('positive_infinity');
        } else if (input === -Infinity) {
          return await Promise.resolve('negative_infinity');
        }
        return await Promise.resolve('normal_number');
      };

      const emptyStringResult = await handleEmptyString('');
      expect(emptyStringResult).assertEqual(0);

      const zeroResult = await handleZero(0);
      expect(zeroResult).assertEqual(true);

      const nanResult = await handleNaN(NaN);
      expect(nanResult).assertEqual(true);

      const nullResult = await handleNull(null);
      expect(nullResult).assertEqual('null_received');

      const undefinedResult = await handleUndefined(undefined);
      expect(undefinedResult).assertEqual('undefined_received');

      const maxIntResult = await handleExtremeNumbers(Number.MAX_SAFE_INTEGER);
      expect(maxIntResult).assertEqual('max_safe_integer');

      const minIntResult = await handleExtremeNumbers(Number.MIN_SAFE_INTEGER);
      expect(minIntResult).assertEqual('min_safe_integer');

      const infinityResult = await handleExtremeNumbers(Infinity);
      expect(infinityResult).assertEqual('positive_infinity');

      const negInfinityResult = await handleExtremeNumbers(-Infinity);
      expect(negInfinityResult).assertEqual('negative_infinity');
    });

    /**
     * @tc.name   asyncFirTest0030
     * @tc.number ASYNC_FIR_TEST_0030
     * @tc.desc   Optional parameters default behavior validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const processOptionalString = async (required: string, optional?: string): Promise<string> => {
        const optionalValue = optional || 'default_string';
        return await Promise.resolve(`${required}_${optionalValue}`);
      };

      const processOptionalNumber = async (base: number, multiplier?: number): Promise<number> => {
        const mult = multiplier || 1;
        return await Promise.resolve(base * mult);
      };

      const processOptionalBoolean = async (value: string, uppercase?: boolean): Promise<string> => {
        const shouldUppercase = uppercase || false;
        return await Promise.resolve(shouldUppercase ? value.toUpperCase() : value.toLowerCase());
      };

      const processMultipleOptional = async (
        required: string,
        opt1?: number,
        opt2?: boolean,
        opt3?: string
      ): Promise<string> => {
        const num = opt1 || 0;
        const bool = opt2 || false;
        const str = opt3 || 'default';
        return await Promise.resolve(`${required}_${num}_${bool}_${str}`);
      };

      const result1 = await processOptionalString('test');
      expect(result1).assertEqual('test_default_string');

      const result2 = await processOptionalNumber(5);
      expect(result2).assertEqual(5);

      const result3 = await processOptionalBoolean('Hello');
      expect(result3).assertEqual('hello');

      const result4 = await processOptionalString('test', 'provided');
      expect(result4).assertEqual('test_provided');

      const result5 = await processOptionalNumber(5, 3);
      expect(result5).assertEqual(15);

      const result6 = await processOptionalBoolean('Hello', true);
      expect(result6).assertEqual('HELLO');

      const result7 = await processMultipleOptional('base');
      expect(result7).assertEqual('base_0_false_default');

      const result8 = await processMultipleOptional('base', 10, true, 'custom');
      expect(result8).assertEqual('base_10_true_custom');

      const result9 = await processMultipleOptional('base', 5);
      expect(result9).assertEqual('base_5_false_default');
    });

    /**
     * @tc.name   asyncFirTest0031
     * @tc.number ASYNC_FIR_TEST_0031
     * @tc.desc   Default parameters validation for basic types, objects and arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      interface DefaultConfig {
        timeout: number;
        retries: number;
      }

      const processWithDefaults = async (
        name: string,
        count: number = 10,
        enabled: boolean = true,
        factor: number = 1.5
      ): Promise<string> => {
        return await Promise.resolve(`${name}_${count}_${enabled}_${factor}`);
      };

      const processWithDefaultObject = async (
        id: string,
        config: DefaultConfig = { timeout: 5000, retries: 3 }
      ): Promise<string> => {
        return await Promise.resolve(`${id}_${config.timeout}_${config.retries}`);
      };

      const processWithDefaultArray = async (
        prefix: string,
        items: string[] = ['default1', 'default2']
      ): Promise<string> => {
        return await Promise.resolve(`${prefix}_${items.join('_')}`);
      };

      const processWithMixedDefaults = async (
        base: string,
        num: number = 100,
        arr: number[] = [1, 2, 3],
        obj: DefaultConfig = { timeout: 1000, retries: 1 }
      ): Promise<string> => {
        const arrSum = arr.reduce((sum: number, val: number) => sum + val, 0);
        return await Promise.resolve(`${base}_${num}_${arrSum}_${obj.timeout}_${obj.retries}`);
      };

      const result1 = await processWithDefaults('test');
      expect(result1).assertEqual('test_10_true_1.5');

      const result2 = await processWithDefaults('test', 20);
      expect(result2).assertEqual('test_20_true_1.5');

      const result3 = await processWithDefaults('test', 20, false);
      expect(result3).assertEqual('test_20_false_1.5');

      const result4 = await processWithDefaults('test', 20, false, 2.0);
      expect(result4).assertEqual('test_20_false_2');

      const result5 = await processWithDefaultObject('obj1');
      expect(result5).assertEqual('obj1_5000_3');

      const customConfig: DefaultConfig = { timeout: 2000, retries: 5 };
      const result6 = await processWithDefaultObject('obj2', customConfig);
      expect(result6).assertEqual('obj2_2000_5');

      const result7 = await processWithDefaultArray('arr');
      expect(result7).assertEqual('arr_default1_default2');

      const result8 = await processWithDefaultArray('arr', ['custom1', 'custom2', 'custom3']);
      expect(result8).assertEqual('arr_custom1_custom2_custom3');

      const result9 = await processWithMixedDefaults('mixed');
      expect(result9).assertEqual('mixed_100_6_1000_1');

      const result10 = await processWithMixedDefaults('mixed', 200, [5, 10]);
      expect(result10).assertEqual('mixed_200_15_1000_1');
    });

    /**
     * @tc.name   asyncFirTest0032
     * @tc.number ASYNC_FIR_TEST_0032
     * @tc.desc   Multi-layer async parameter pass-through validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const level3Process = async (value: string, multiplier: number): Promise<string> => {
        return await Promise.resolve(value.repeat(multiplier));
      };

      const level2Process = async (input: string, factor: number, suffix: string): Promise<string> => {
        const processed = await level3Process(input, factor);
        return await Promise.resolve(processed + suffix);
      };

      const level1Process = async (
        base: string,
        count: number,
        append: string,
        transform: boolean
      ): Promise<string> => {
        const intermediate = await level2Process(base, count, append);
        return await Promise.resolve(transform ? intermediate.toUpperCase() : intermediate);
      };

      const result1 = await level1Process('test', 2, '_end', false);
      expect(result1).assertEqual('testtest_end');

      const result2 = await level1Process('hello', 3, '_done', true);
      expect(result2).assertEqual('HELLOHELLOHELLO_DONE');
    });

    /**
     * @tc.name   asyncFirTest0033
     * @tc.number ASYNC_FIR_TEST_0033
     * @tc.desc   Complex object parameter pass-through validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      interface ProcessConfig {
        prefix: string;
        multiplier: number;
        uppercase: boolean;
      }

      const processWithConfig = async (
        data: string[],
        config: ProcessConfig
      ): Promise<string[]> => {
        const processItem = async (item: string): Promise<string> => {
          const prefixed = await Promise.resolve(config.prefix + item);
          const repeated = await Promise.resolve(prefixed.repeat(config.multiplier));
          return config.uppercase ? repeated.toUpperCase() : repeated;
        };

        const promises = data.map(async (item: string): Promise<string> => {
          return await processItem(item);
        });

        return await Promise.all(promises);
      };

      const config: ProcessConfig = {
        prefix: 'pre_',
        multiplier: 2,
        uppercase: true
      };
      const result3 = await processWithConfig(['a', 'b'], config);
      expect(result3).assertDeepEquals(['PRE_APRE_A', 'PRE_BPRE_B']);
    });

    /**
     * @tc.name   asyncFirTest0034
     * @tc.number ASYNC_FIR_TEST_0034
     * @tc.desc   Parameter validation and immutability validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const validateAndProcess = async (
        input: number,
        validator: (val: number) => boolean,
        processor: (val: number) => Promise<number>
      ): Promise<number | null> => {
        if (!validator(input)) {
          return null;
        }
        return await processor(input);
      };

      const isPositive = (val: number): boolean => val > 0;
      const doubleValue = async (val: number): Promise<number> => {
        return await Promise.resolve(val * 2);
      };

      const result4 = await validateAndProcess(5, isPositive, doubleValue);
      expect(result4).assertEqual(10);

      const result5 = await validateAndProcess(-3, isPositive, doubleValue);
      expect(result5).assertEqual(null);

      const originalArray = [1, 2, 3];
      const processArrayImmutable = async (arr: number[]): Promise<number[]> => {
        const processed = await Promise.resolve(arr.map((val: number) => val * 2));
        return processed;
      };

      const result6 = await processArrayImmutable(originalArray);
      expect(result6).assertDeepEquals([2, 4, 6]);
      expect(originalArray).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   asyncFirTest0035
     * @tc.number ASYNC_FIR_TEST_0035
     * @tc.desc   Basic static type parameters validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const processIntegerLike = async (value: number): Promise<number> => {
        const intValue = Math.floor(value);
        return await Promise.resolve(intValue + 1);
      };

      const processFloatLike = async (value: number): Promise<number> => {
        const floatValue = Math.round(value * 100) / 100;
        return await Promise.resolve(floatValue * 2);
      };

      const processDoubleLike = async (value: number): Promise<number> => {
        return await Promise.resolve(value * Math.PI);
      };

      const intResult = await processIntegerLike(3.7);
      expect(intResult).assertEqual(4);

      const floatResult = await processFloatLike(3.456);
      expect(floatResult).assertEqual(6.92);

      const doubleResult = await processDoubleLike(2.0);
      expect(Math.abs(doubleResult - (2.0 * Math.PI))).assertLess(0.0001);
    });

    /**
     * @tc.name   asyncFirTest0036
     * @tc.number ASYNC_FIR_TEST_0036
     * @tc.desc   Character and byte type parameters validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const processCharLike = async (char: string): Promise<number> => {
        if (char.length !== 1) {
          throw new Error('Expected single character');
        }
        return await Promise.resolve(char.charCodeAt(0));
      };

      const processByteLike = async (value: number): Promise<boolean> => {
        const isValidByte = value >= 0 && value <= 255 && Number.isInteger(value);
        return await Promise.resolve(isValidByte);
      };

      const charResult = await processCharLike('A');
      expect(charResult).assertEqual(65);

      const byteResult1 = await processByteLike(128);
      expect(byteResult1).assertEqual(true);

      const byteResult2 = await processByteLike(256);
      expect(byteResult2).assertEqual(false);

      const byteResult3 = await processByteLike(-1);
      expect(byteResult3).assertEqual(false);

      let errorCaught = false;
      try {
        await processCharLike('AB');
      } catch (error) {
        errorCaught = true;
        expect((error as Error).message).assertEqual('Expected single character');
      }
      expect(errorCaught).assertEqual(true);
    });

    /**
     * @tc.name   asyncFirTest0037
     * @tc.number ASYNC_FIR_TEST_0037
     * @tc.desc   Long type and mixed parameters validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const processIntegerLike = async (value: number): Promise<number> => {
        const intValue = Math.floor(value);
        return await Promise.resolve(intValue + 1);
      };

      const processFloatLike = async (value: number): Promise<number> => {
        const floatValue = Math.round(value * 100) / 100;
        return await Promise.resolve(floatValue * 2);
      };

      const processCharLike = async (char: string): Promise<number> => {
        if (char.length !== 1) {
          throw new Error('Expected single character');
        }
        return await Promise.resolve(char.charCodeAt(0));
      };

      const processLongLike = async (value: bigint): Promise<bigint> => {
        return await Promise.resolve(value * 2n + 1n);
      };

      const processMixedTypes = async (
        intLike: number,
        floatLike: number,
        charLike: string,
        longLike: bigint
      ): Promise<string> => {
        const intResult = await processIntegerLike(intLike);
        const floatResult = await processFloatLike(floatLike);
        const charResult = await processCharLike(charLike);
        const longResult = await processLongLike(longLike);

        return await Promise.resolve(
          `int:${intResult}_float:${floatResult}_char:${charResult}_long:${longResult}`
        );
      };

      const longResult = await processLongLike(1000000000000n);
      expect(longResult).assertEqual(2000000000001n);

      const mixedResult = await processMixedTypes(5.8, 2.345, 'B', 500n);
      expect(mixedResult).assertEqual('int:6_float:4.7_char:66_long:1001');
    });

    /**
     * @tc.name   asyncFirTest0038
     * @tc.number ASYNC_FIR_TEST_0038
     * @tc.desc   Object parameter basic validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const processUserProfile = async (profile: ComplexUserProfile): Promise<string> => {
        const ageStr = profile.age !== undefined ? profile.age.toString() : 'unknown';
        return await Promise.resolve(`${profile.name}_${profile.email}_${ageStr}`);
      };

      const completeProfile: ComplexUserProfile = {
        id: 1,
        name: 'John Doe',
        email: 'john@example.com',
        age: 30
      };

      const result1 = await processUserProfile(completeProfile);
      expect(result1).assertEqual('John Doe_john@example.com_30');

      const partialProfile: ComplexUserProfile = {
        id: 2,
        name: 'Jane Smith',
        email: 'jane@example.com'
      };

      const result2 = await processUserProfile(partialProfile);
      expect(result2).assertEqual('Jane Smith_jane@example.com_unknown');
    });

    /**
     * @tc.name   asyncFirTest0039
     * @tc.number ASYNC_FIR_TEST_0039
     * @tc.desc   Complex object with nested properties validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const processProductInfo = async (product: ProductInfo): Promise<string> => {
        const tagsStr = product.tags.join(',');
        return await Promise.resolve(`${product.name}_${product.category}_${tagsStr}_${product.price}`);
      };

      const product: ProductInfo = {
        id: 100,
        name: 'Laptop',
        price: 999.99,
        category: 'Electronics',
        tags: ['computer', 'portable', 'work']
      };

      const result3 = await processProductInfo(product);
      expect(result3).assertEqual('Laptop_Electronics_computer,portable,work_999.99');
    });

    /**
     * @tc.name   asyncFirTest0040
     * @tc.number ASYNC_FIR_TEST_0040
     * @tc.desc   Object parameter validation and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      interface ValidationResult {
        isValid: boolean;
        errors: string[];
      }
      const validateUserProfile = async (profile: ComplexUserProfile): Promise<ValidationResult> => {
        const errors: string[] = [];

        if (!profile.name || profile.name.length === 0) {
          errors.push('Name is required');
        }
        if (!profile.email || !profile.email.includes('@')) {
          errors.push('Valid email is required');
        }
        if (profile.age !== undefined && profile.age < 0) {
          errors.push('Age must be non-negative');
        }

        const result: ValidationResult = {
          isValid: errors.length === 0,
          errors: errors
        };
        return await Promise.resolve(result);
      };

      const validProfile: ComplexUserProfile = {
        id: 3,
        name: 'Valid User',
        email: 'valid@test.com',
        age: 25
      };

      const validation1 = await validateUserProfile(validProfile);
      expect(validation1.isValid).assertEqual(true);
      expect(validation1.errors.length).assertEqual(0);

      const invalidProfile: ComplexUserProfile = {
        id: 4,
        name: '',
        email: 'invalid-email',
        age: -5
      };

      const validation2 = await validateUserProfile(invalidProfile);
      expect(validation2.isValid).assertEqual(false);
      expect(validation2.errors.length).assertEqual(3);
    });

    /**
     * @tc.name   asyncFirTest0041
     * @tc.number ASYNC_FIR_TEST_0041
     * @tc.desc   Basic array parameter validation - number arrays and empty array handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const processNumberArray = async (numbers: number[]): Promise<number> => {
        if (numbers.length === 0) {
          return await Promise.resolve(0);
        }
        const sum = numbers.reduce((acc: number, num: number) => acc + num, 0);
        return await Promise.resolve(sum / numbers.length);
      };

      const numbers = [1, 2, 3, 4, 5];
      const average = await processNumberArray(numbers);
      expect(average).assertEqual(3);

      const emptyArray: number[] = [];
      const emptyResult = await processNumberArray(emptyArray);
      expect(emptyResult).assertEqual(0);

      const largeArray: number[] = Array.from({ length: 1000 }, (_: undefined, i: number): number => i + 1);
      const largeAverage = await processNumberArray(largeArray);
      expect(largeAverage).assertEqual(500.5);
    });

    /**
     * @tc.name   asyncFirTest0042
     * @tc.number ASYNC_FIR_TEST_0042
     * @tc.desc   Complex object array parameter validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const processUserArray = async (users: ComplexUserProfile[]): Promise<string[]> => {
        const promises = users.map(async (user: ComplexUserProfile): Promise<string> => {
          return await Promise.resolve(`${user.name}:${user.id}`);
        });
        return await Promise.all(promises);
      };

      const users: ComplexUserProfile[] = [
        { id: 1, name: 'User1', email: 'user1@test.com' },
        { id: 2, name: 'User2', email: 'user2@test.com', age: 25 },
        { id: 3, name: 'User3', email: 'user3@test.com', age: 30 }
      ];

      const userResults = await processUserArray(users);
      expect(userResults).assertDeepEquals(['User1:1', 'User2:2', 'User3:3']);
    });

    /**
     * @tc.name   asyncFirTest0043
     * @tc.number ASYNC_FIR_TEST_0043
     * @tc.desc   Nested array and array length validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const processNestedArrays = async (matrix: number[][]): Promise<number[]> => {
        const promises = matrix.map(async (row: number[]): Promise<number> => {
          const sum = row.reduce((acc: number, val: number) => acc + val, 0);
          return await Promise.resolve(sum);
        });
        return await Promise.all(promises);
      };

      const validateArrayLength = async <T>(arr: T[], minLength: number, maxLength: number): Promise<boolean> => {
        const isValid = arr.length >= minLength && arr.length <= maxLength;
        return await Promise.resolve(isValid);
      };

      const matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
      const rowSums = await processNestedArrays(matrix);
      expect(rowSums).assertDeepEquals([6, 15, 24]);

      const shortArray = [1, 2];
      const mediumArray = [1, 2, 3, 4, 5];
      const longArray: number[] = Array.from({ length: 15 }, (_: undefined, i: number): number => i);

      const shortValid = await validateArrayLength<number>(shortArray, 1, 10);
      expect(shortValid).assertEqual(true);

      const mediumValid = await validateArrayLength<number>(mediumArray, 1, 10);
      expect(mediumValid).assertEqual(true);

      const longValid = await validateArrayLength<number>(longArray, 1, 10);
      expect(longValid).assertEqual(false);
    });

    /**
     * @tc.name   asyncFirTest0044
     * @tc.number ASYNC_FIR_TEST_0044
     * @tc.desc   Basic callback parameter validation - sync and async callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const processWithSyncCallback = async <T, R>(
        data: T[],
        processor: (item: T) => R
      ): Promise<R[]> => {
        const results: R[] = [];
        for (const item of data) {
          const processed = processor(item);
          results.push(processed);
        }
        return await Promise.resolve(results);
      };

      const processWithAsyncCallback = async <T, R>(
        data: T[],
        processor: (item: T) => Promise<R>
      ): Promise<R[]> => {
        const promises = data.map(async (item: T): Promise<R> => {
          return await processor(item);
        });
        return await Promise.all(promises);
      };

      const numbers = [1, 2, 3, 4, 5];
      const doubleCallback = (num: number): number => num * 2;
      const doubled = await processWithSyncCallback<number, number>(numbers, doubleCallback);
      expect(doubled).assertDeepEquals([2, 4, 6, 8, 10]);

      const strings = ['hello', 'world', 'test'];
      const upperCallback = (str: string): string => str.toUpperCase();
      const uppercased = await processWithSyncCallback<string, string>(strings, upperCallback);
      expect(uppercased).assertDeepEquals(['HELLO', 'WORLD', 'TEST']);

      const asyncDoubleCallback = async (num: number): Promise<number> => {
        return await Promise.resolve(num * 3);
      };
      const tripled = await processWithAsyncCallback<number, number>(numbers, asyncDoubleCallback);
      expect(tripled).assertDeepEquals([3, 6, 9, 12, 15]);

      const asyncUpperCallback = async (str: string): Promise<string> => {
        return await Promise.resolve(str.toLowerCase());
      };
      const lowercased = await processWithAsyncCallback<string, string>(strings, asyncUpperCallback);
      expect(lowercased).assertDeepEquals(['hello', 'world', 'test']);
    });

    /**
     * @tc.name   asyncFirTest0045
     * @tc.number ASYNC_FIR_TEST_0045
     * @tc.desc   Callback with validation parameter validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const processWithValidation = async <T>(
        data: T[],
        validator: (item: T) => boolean,
        processor: (item: T) => Promise<T>
      ): Promise<T[]> => {
        const validItems = data.filter(validator);
        const promises = validItems.map(async (item: T): Promise<T> => {
          return await processor(item);
        });
        return await Promise.all(promises);
      };

      const numbers = [1, 2, 3, 4, 5];
      const isEven = (num: number): boolean => num % 2 === 0;
      const asyncSquare = async (num: number): Promise<number> => {
        return await Promise.resolve(num * num);
      };
      const evenSquares = await processWithValidation<number>(numbers, isEven, asyncSquare);
      expect(evenSquares).assertDeepEquals([4, 16]);
    });

    /**
     * @tc.name   asyncFirTest0046
     * @tc.number ASYNC_FIR_TEST_0046
     * @tc.desc   Complex callback with multiple parameters and context validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const processWithComplexCallback = async <T, U, R>(
        data: T[],
        context: U,
        processor: (item: T, ctx: U, index: number) => Promise<R>
      ): Promise<R[]> => {
        const promises = data.map(async (item: T, index: number): Promise<R> => {
          return await processor(item, context, index);
        });
        return await Promise.all(promises);
      };

      const words = ['cat', 'dog', 'bird'];
      const context: ProcessContext = { prefix: 'animal_', suffix: '_pet' };
      const complexProcessor = async (
        word: string,
        ctx: ProcessContext,
        index: number
      ): Promise<string> => {
        const result = `${ctx.prefix}${word}${ctx.suffix}_${index}`;
        return await Promise.resolve(result);
      };

      const processed = await processWithComplexCallback<string, ProcessContext, string>(words, context, complexProcessor);
      expect(processed).assertDeepEquals([
        'animal_cat_pet_0',
        'animal_dog_pet_1',
        'animal_bird_pet_2'
      ]);
    });

    /**
     * @tc.name   asyncFirTest0047
     * @tc.number ASYNC_FIR_TEST_0047
     * @tc.desc   Basic generic parameter constraints validation - single interface constraints
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const processWithId = async <T extends HasId>(item: T): Promise<string> => {
        return await Promise.resolve(`Item_${item.id}`);
      };

      const processWithName = async <T extends HasName>(item: T): Promise<string> => {
        return await Promise.resolve(`Name_${item.name}`);
      };

      const itemWithId: ItemWithId = { id: 100, data: 'test' };
      const result1 = await processWithId<ItemWithId>(itemWithId);
      expect(result1).assertEqual('Item_100');

      const itemWithName: ItemWithName = { name: 'TestItem', value: 42 };
      const result2 = await processWithName<ItemWithName>(itemWithName);
      expect(result2).assertEqual('Name_TestItem');
    });

    /**
     * @tc.name   asyncFirTest0048
     * @tc.number ASYNC_FIR_TEST_0048
     * @tc.desc   Combined interface constraints and array processing validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const processWithIdAndName = async <T extends HasIdAndName>(item: T): Promise<string> => {
        return await Promise.resolve(`${item.name}_ID_${item.id}`);
      };

      const processArrayWithConstraint = async <T extends HasId>(items: T[]): Promise<number[]> => {
        const promises = items.map(async (item: T): Promise<number> => {
          return await Promise.resolve(item.id * 2);
        });
        return await Promise.all(promises);
      };

      const itemWithBoth: ItemWithBoth = { id: 200, name: 'ComplexItem', extra: true };
      const result3 = await processWithIdAndName<ItemWithBoth>(itemWithBoth);
      expect(result3).assertEqual('ComplexItem_ID_200');

      interface TypedItem {
        id: number;
        type: string;
      }
      const itemsWithId: TypedItem[] = [
        { id: 1, type: 'A' },
        { id: 2, type: 'B' },
        { id: 3, type: 'C' }
      ];
      const doubledIds = await processArrayWithConstraint<TypedItem>(itemsWithId);
      expect(doubledIds).assertDeepEquals([2, 4, 6]);
    });

    /**
     * @tc.name   asyncFirTest0049
     * @tc.number ASYNC_FIR_TEST_0049
     * @tc.desc   Conditional processing and complex user profile constraints validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const processConditionally = async <T extends HasId>(
        item: T,
        condition: (obj: T) => boolean
      ): Promise<T | null> => {
        if (condition(item)) {
          return await Promise.resolve(item);
        }
        return await Promise.resolve(null);
      };

      const highIdCondition = <T extends HasId>(obj: T): boolean => obj.id > 150;

      interface StatusItem {
        id: number;
        status: string;
      }
      const highIdItem: StatusItem = { id: 200, status: 'active' };
      const lowIdItem: StatusItem = { id: 50, status: 'inactive' };

      const conditionalResult1 = await processConditionally<StatusItem>(highIdItem, highIdCondition);
      expect(conditionalResult1).assertDeepEquals({ id: 200, status: 'active' });

      const conditionalResult2 = await processConditionally<StatusItem>(lowIdItem, highIdCondition);
      expect(conditionalResult2).assertEqual(null);

      const userProfile: ComplexUserProfile = {
        id: 300,
        name: 'Generic User',
        email: 'generic@test.com',
        age: 28
      };

      const processWithId = async <T extends HasId>(item: T): Promise<string> => {
        return await Promise.resolve(`Item_${item.id}`);
      };

      const processWithName = async <T extends HasName>(item: T): Promise<string> => {
        return await Promise.resolve(`Name_${item.name}`);
      };

      const processWithIdAndName = async <T extends HasIdAndName>(item: T): Promise<string> => {
        return await Promise.resolve(`${item.name}_ID_${item.id}`);
      };

      const userResult1 = await processWithId<ComplexUserProfile>(userProfile);
      expect(userResult1).assertEqual('Item_300');

      const userResult2 = await processWithName<ComplexUserProfile>(userProfile);
      expect(userResult2).assertEqual('Name_Generic User');

      const userResult3 = await processWithIdAndName<ComplexUserProfile>(userProfile);
      expect(userResult3).assertEqual('Generic User_ID_300');
    });

    /**
     * @tc.name   asyncFirTest0050
     * @tc.number ASYNC_FIR_TEST_0050
     * @tc.desc   Basic union type parameter validation - string or number types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      type StringOrNumber = string | number;
      const processStringOrNumber = async (input: StringOrNumber): Promise<string> => {
        if (typeof input === 'string') {
          return await Promise.resolve(`String: ${input}`);
        } else {
          return await Promise.resolve(`Number: ${input}`);
        }
      };

      type ProcessingMode = 'sync' | 'async' | 'batch';
      const processWithMode = async (data: string, mode: ProcessingMode): Promise<string> => {
        switch (mode) {
          case 'sync':
            return await Promise.resolve(`Sync: ${data}`);
          case 'async':
            return await Promise.resolve(`Async: ${data}`);
          case 'batch':
            return await Promise.resolve(`Batch: ${data}`);
          default:
            return await Promise.resolve(`Unknown: ${data}`);
        }
      };

      const stringResult = await processStringOrNumber('hello');
      expect(stringResult).assertEqual('String: hello');

      const numberResult = await processStringOrNumber(42);
      expect(numberResult).assertEqual('Number: 42');

      const syncResult = await processWithMode('data', 'sync');
      expect(syncResult).assertEqual('Sync: data');

      const asyncResult = await processWithMode('data', 'async');
      expect(asyncResult).assertEqual('Async: data');

      const batchResult = await processWithMode('data', 'batch');
      expect(batchResult).assertEqual('Batch: data');
    });

    /**
     * @tc.name   asyncFirTest0051
     * @tc.number ASYNC_FIR_TEST_0051
     * @tc.desc   Inheritance type and union array parameter validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      interface UserWithProfile extends UserInfo {
        id: number;
        email: string;
      }
      const processUserWithProfile = async (user: UserWithProfile): Promise<string> => {
        const ageStr = user.age !== undefined ? user.age.toString() : 'unknown';
        return await Promise.resolve(`${user.name}_${user.email}_${ageStr}_${user.id}`);
      };

      const processUnionArray = async (items: (string | number)[]): Promise<string[]> => {
        const promises = items.map(async (item: string | number): Promise<string> => {
          if (typeof item === 'string') {
            return await Promise.resolve(`STR_${item}`);
          } else {
            return await Promise.resolve(`NUM_${item}`);
          }
        });
        return await Promise.all(promises);
      };

      const userWithProfile: UserWithProfile = {
        name: 'John Inheritance',
        age: 35,
        id: 400,
        email: 'john.inheritance@test.com'
      };

      const inheritanceResult = await processUserWithProfile(userWithProfile);
      expect(inheritanceResult).assertEqual('John Inheritance_john.inheritance@test.com_35_400');

      const mixedArray: (string | number)[] = ['hello', 123, 'world', 456];
      const unionArrayResult = await processUnionArray(mixedArray);
      expect(unionArrayResult).assertDeepEquals(['STR_hello', 'NUM_123', 'STR_world', 'NUM_456']);
    });

    /**
     * @tc.name   asyncFirTest0052
     * @tc.number ASYNC_FIR_TEST_0052
     * @tc.desc   Complex conditional union type parameter validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const processConditionalUnion = async (
        input: string | number | boolean
      ): Promise<ConditionalResult> => {
        let type: string;
        let value: string;
        let length: number;

        if (typeof input === 'string') {
          type = 'string';
          value = input;
          length = input.length;
        } else if (typeof input === 'number') {
          type = 'number';
          value = input.toString();
          length = value.length;
        } else {
          type = 'boolean';
          value = input.toString();
          length = value.length;
        }

        const result: ConditionalResult = { type, value, length };
        return await Promise.resolve(result);
      };

      const stringCondResult = await processConditionalUnion('test');
      expect(stringCondResult.type).assertEqual('string');
      expect(stringCondResult.value).assertEqual('test');
      expect(stringCondResult.length).assertEqual(4);

      const numberCondResult = await processConditionalUnion(12345);
      expect(numberCondResult.type).assertEqual('number');
      expect(numberCondResult.value).assertEqual('12345');
      expect(numberCondResult.length).assertEqual(5);

      const booleanCondResult = await processConditionalUnion(true);
      expect(booleanCondResult.type).assertEqual('boolean');
      expect(booleanCondResult.value).assertEqual('true');
      expect(booleanCondResult.length).assertEqual(4);
    });

    /**
     * @tc.name   asyncFirTest0053
     * @tc.number ASYNC_FIR_TEST_0053
     * @tc.desc   Return value type strictly consistent with annotations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const returnString = async (): Promise<string> => {
        return await Promise.resolve('typed_string');
      };

      const returnNumber = async (): Promise<number> => {
        return await Promise.resolve(42);
      };

      const returnBoolean = async (): Promise<boolean> => {
        return await Promise.resolve(true);
      };

      const returnUserProfile = async (): Promise<ComplexUserProfile> => {
        const profile: ComplexUserProfile = {
          id: 1,
          name: 'Test User',
          email: 'test@example.com',
          age: 25
        };
        return await Promise.resolve(profile);
      };

      const returnNumberArray = async (): Promise<number[]> => {
        const numbers: number[] = [1, 2, 3, 4, 5];
        return await Promise.resolve(numbers);
      };

      const stringResult = await returnString();
      expect(typeof stringResult).assertEqual('string');
      expect(stringResult).assertEqual('typed_string');

      const numberResult = await returnNumber();
      expect(typeof numberResult).assertEqual('number');
      expect(numberResult).assertEqual(42);

      const booleanResult = await returnBoolean();
      expect(typeof booleanResult).assertEqual('boolean');
      expect(booleanResult).assertEqual(true);

      const profileResult = await returnUserProfile();
      expect(typeof profileResult).assertEqual('object');
      expect(profileResult.id).assertEqual(1);
      expect(profileResult.name).assertEqual('Test User');
      expect(profileResult.email).assertEqual('test@example.com');
      expect(profileResult.age).assertEqual(25);

      const arrayResult = await returnNumberArray();
      expect(Array.isArray(arrayResult)).assertEqual(true);
      expect(arrayResult.length).assertEqual(5);
      expect(arrayResult).assertDeepEquals([1, 2, 3, 4, 5]);
    });

    /**
     * @tc.name   asyncFirTest0054
     * @tc.number ASYNC_FIR_TEST_0054
     * @tc.desc   Generic async function return value conforms to generic definition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const genericReturn = async <T>(value: T): Promise<T> => {
        return await Promise.resolve(value);
      };

      const genericWrapperReturn = async <T>(data: T): Promise<GenericReturnWrapper<T>> => {
        const metaInfo: MetaInfo = {
          timestamp: Date.now(),
          version: '1.0.0'
        };
        const wrapper: GenericReturnWrapper<T> = {
          data: data,
          meta: metaInfo
        };
        return await Promise.resolve(wrapper);
      };

      const genericArrayReturn = async <T>(items: T[]): Promise<TypedArrayResult<T>> => {
        const result: TypedArrayResult<T> = {
          elements: items,
          count: items.length,
          type: typeof items[0]
        };
        return await Promise.resolve(result);
      };

      const stringGeneric = await genericReturn<string>('generic_string');
      expect(typeof stringGeneric).assertEqual('string');
      expect(stringGeneric).assertEqual('generic_string');

      const numberGeneric = await genericReturn<number>(100);
      expect(typeof numberGeneric).assertEqual('number');
      expect(numberGeneric).assertEqual(100);

      const wrappedString = await genericWrapperReturn<string>('wrapped_data');
      expect(typeof wrappedString.data).assertEqual('string');
      expect(wrappedString.data).assertEqual('wrapped_data');
      expect(typeof wrappedString.meta.timestamp).assertEqual('number');
      expect(wrappedString.meta.version).assertEqual('1.0.0');

      const wrappedObject = await genericWrapperReturn<ComplexUserProfile>({
        id: 2,
        name: 'Generic User',
        email: 'generic@test.com'
      });
      expect(typeof wrappedObject.data).assertEqual('object');
      expect(wrappedObject.data.name).assertEqual('Generic User');

      const stringArrayResult = await genericArrayReturn<string>(['a', 'b', 'c']);
      expect(stringArrayResult.elements).assertDeepEquals(['a', 'b', 'c']);
      expect(stringArrayResult.count).assertEqual(3);
      expect(stringArrayResult.type).assertEqual('string');

      const numberArrayResult = await genericArrayReturn<number>([10, 20, 30]);
      expect(numberArrayResult.elements).assertDeepEquals([10, 20, 30]);
      expect(numberArrayResult.count).assertEqual(3);
      expect(numberArrayResult.type).assertEqual('number');
    });

    /**
     * @tc.name   asyncFirTest0055
     * @tc.number ASYNC_FIR_TEST_0055
     * @tc.desc   Complex object return - nested properties existence and type validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const returnNestedData = async (): Promise<NestedReturnData> => {
        const userSettings: UserSettings = {
          theme: 'dark',
          notifications: true
        };

        const userProfile: UserProfileNested = {
          name: 'Nested User',
          settings: userSettings
        };

        const userMetadata: UserMetadata = {
          createdAt: '2024-01-01T00:00:00Z',
          lastLogin: '2024-01-29T10:30:00Z'
        };

        const userData: UserDataNested = { profile: userProfile, metadata: userMetadata };

        const data: NestedReturnData = { user: userData, permissions: ['read', 'write', 'admin'] };
        return await Promise.resolve(data);
      };

      const buildNestedObject = async (userId: number): Promise<NestedReturnData> => {
        const userName = await Promise.resolve(`User_${userId}`);
        const userTheme = await Promise.resolve('light');
        const userPermissions = await Promise.resolve(['read', 'write']);

        const settings: UserSettings = {
          theme: userTheme,
          notifications: false
        };

        const profile: UserProfileNested = {
          name: userName,
          settings: settings
        };

        const metadata: UserMetadata = {
          createdAt: await Promise.resolve('2024-01-15T08:00:00Z'),
          lastLogin: await Promise.resolve('2024-01-29T14:20:00Z')
        };

        const user: UserDataNested = {
          profile: profile,
          metadata: metadata
        };

        const result: NestedReturnData = {
          user: user,
          permissions: userPermissions
        };
        return result;
      };

      const nestedResult = await returnNestedData();

      expect(typeof nestedResult).assertEqual('object');
      expect(typeof nestedResult.user).assertEqual('object');
      expect(Array.isArray(nestedResult.permissions)).assertEqual(true);

      expect(typeof nestedResult.user.profile).assertEqual('object');
      expect(nestedResult.user.profile.name).assertEqual('Nested User');
      expect(typeof nestedResult.user.profile.settings).assertEqual('object');
      expect(nestedResult.user.profile.settings.theme).assertEqual('dark');
      expect(nestedResult.user.profile.settings.notifications).assertEqual(true);

      expect(typeof nestedResult.user.metadata).assertEqual('object');
      expect(nestedResult.user.metadata.createdAt).assertEqual('2024-01-01T00:00:00Z');
      expect(nestedResult.user.metadata.lastLogin).assertEqual('2024-01-29T10:30:00Z');

      expect(nestedResult.permissions.length).assertEqual(3);
      expect(nestedResult.permissions).assertDeepEquals(['read', 'write', 'admin']);

      const builtResult = await buildNestedObject(123);
      expect(builtResult.user.profile.name).assertEqual('User_123');
      expect(builtResult.user.profile.settings.theme).assertEqual('light');
      expect(builtResult.user.profile.settings.notifications).assertEqual(false);
      expect(builtResult.permissions).assertDeepEquals(['read', 'write']);
    });

    /**
     * @tc.name   asyncFirTest0056
     * @tc.number ASYNC_FIR_TEST_0056
     * @tc.desc   Array return - element types and order consistency validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const returnTypedArray = async (): Promise<number[]> => {
        const numbers: number[] = [10, 20, 30, 40, 50];
        return await Promise.resolve(numbers);
      };

      const returnOrderedArray = async (input: string[]): Promise<string[]> => {
        const processed = await Promise.all(
          input.map(async (item: string, index: number): Promise<string> => {
            return await Promise.resolve(`${index}_${item}`);
          })
        );
        return processed;
      };

      const returnObjectArray = async (): Promise<ComplexUserProfile[]> => {
        const users: ComplexUserProfile[] = [
          { id: 1, name: 'User1', email: 'user1@test.com', age: 25 },
          { id: 2, name: 'User2', email: 'user2@test.com', age: 30 },
          { id: 3, name: 'User3', email: 'user3@test.com' }
        ];
        return await Promise.resolve(users);
      };

      const returnArrayWithSummary = async (numbers: number[]): Promise<ArrayReturnResult> => {
        const total = numbers.reduce((sum: number, num: number) => sum + num, 0);
        const average = total / numbers.length;
        const max = Math.max(...numbers);
        const min = Math.min(...numbers);

        const result: ArrayReturnResult = {
          items: numbers,
          summary: {
            total: total,
            average: average,
            max: max,
            min: min
          }
        };
        return await Promise.resolve(result);
      };

      const typedArray = await returnTypedArray();
      expect(Array.isArray(typedArray)).assertEqual(true);
      expect(typedArray.length).assertEqual(5);
      typedArray.forEach((item: number, index: number) => {
        expect(typeof item).assertEqual('number');
        expect(item).assertEqual((index + 1) * 10);
      });

      const inputOrder = ['apple', 'banana', 'cherry'];
      const orderedResult = await returnOrderedArray(inputOrder);
      expect(orderedResult.length).assertEqual(3);
      expect(orderedResult[0]).assertEqual('0_apple');
      expect(orderedResult[1]).assertEqual('1_banana');
      expect(orderedResult[2]).assertEqual('2_cherry');

      const objectArray = await returnObjectArray();
      expect(Array.isArray(objectArray)).assertEqual(true);
      expect(objectArray.length).assertEqual(3);
      expect(objectArray[0].id).assertEqual(1);
      expect(objectArray[0].name).assertEqual('User1');
      expect(objectArray[2].age).assertEqual(undefined);

      const testNumbers = [5, 10, 15, 20, 25];
      const summaryResult = await returnArrayWithSummary(testNumbers);
      expect(summaryResult.items).assertDeepEquals(testNumbers);
      expect(summaryResult.summary.total).assertEqual(75);
      expect(summaryResult.summary.average).assertEqual(15);
      expect(summaryResult.summary.max).assertEqual(25);
      expect(summaryResult.summary.min).assertEqual(5);
    });

    /**
     * @tc.name   asyncFirTest0057
     * @tc.number ASYNC_FIR_TEST_0057
     * @tc.desc   Promise nested return auto-unwrapping validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const returnPromiseValue = async (): Promise<string> => {
        return Promise.resolve('unwrapped_value');
      };
      const returnNestedPromise = async (): Promise<number> => {
        const innerPromise = Promise.resolve(42);
        return await innerPromise;
      };

      const returnChainedPromise = async (): Promise<string> => {
        return Promise.resolve('base')
          .then((val: string) => `${val}_step1`)
          .then((val: string) => `${val}_step2`);
      };

      const returnPromiseAllResult = async (): Promise<number[]> => {
        const promises = [
          Promise.resolve(10),
          Promise.resolve(20),
          Promise.resolve(30)
        ];
        return Promise.all(promises);
      };

      const returnComplexPromiseObject = async (): Promise<GenericReturnWrapper<string>> => {
        const dataPromise = Promise.resolve('complex_data');
        const timestampPromise = Promise.resolve(Date.now());

        const data = await dataPromise;
        const timestamp = await timestampPromise;

        const result: GenericReturnWrapper<string> = {
          data: data,
          meta: {
            timestamp: timestamp,
            version: '2.0.0'
          }
        };

        return Promise.resolve(result);
      };

      const unwrappedValue = await returnPromiseValue();
      expect(typeof unwrappedValue).assertEqual('string');
      expect(unwrappedValue).assertEqual('unwrapped_value');

      const nestedValue = await returnNestedPromise();
      expect(typeof nestedValue).assertEqual('number');
      expect(nestedValue).assertEqual(42);

      const chainedValue = await returnChainedPromise();
      expect(typeof chainedValue).assertEqual('string');
      expect(chainedValue).assertEqual('base_step1_step2');

      const allResult = await returnPromiseAllResult();
      expect(Array.isArray(allResult)).assertEqual(true);
      expect(allResult).assertDeepEquals([10, 20, 30]);

      const complexResult = await returnComplexPromiseObject();
      expect(typeof complexResult).assertEqual('object');
      expect(complexResult.data).assertEqual('complex_data');
      expect(typeof complexResult.meta.timestamp).assertEqual('number');
      expect(complexResult.meta.version).assertEqual('2.0.0');

      const directPromise = returnPromiseValue();
      expect(directPromise instanceof Promise).assertEqual(true);

      const resolvedDirect = await directPromise;
      expect(typeof resolvedDirect).assertEqual('string');
      expect(resolvedDirect).assertEqual('unwrapped_value');
    });

    /**
     * @tc.name   asyncFirTest0058
     * @tc.number ASYNC_FIR_TEST_0058
     * @tc.desc   Return null type adaptation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const returnNullValue = async (): Promise<string | null> => {
        return await Promise.resolve(null);
      };

      const returnNullableString = async (condition: boolean): Promise<string | null> => {
        if (condition) {
          return await Promise.resolve('valid_string');
        }
        return await Promise.resolve(null);
      };

      const nullResult = await returnNullValue();
      expect(nullResult).assertEqual(null);

      const validStringResult = await returnNullableString(true);
      expect(validStringResult).assertEqual('valid_string');

      const nullStringResult = await returnNullableString(false);
      expect(nullStringResult).assertEqual(null);
    });

    /**
     * @tc.name   asyncFirTest0059
     * @tc.number ASYNC_FIR_TEST_0059
     * @tc.desc   Return undefined type adaptation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const returnUndefinedValue = async (): Promise<number | undefined> => {
        return await Promise.resolve(undefined);
      };

      const returnOptionalNumber = async (hasValue: boolean): Promise<number | undefined> => {
        if (hasValue) {
          return await Promise.resolve(42);
        }
        return await Promise.resolve(undefined);
      };

      const undefinedResult = await returnUndefinedValue();
      expect(undefinedResult).assertEqual(undefined);

      const validNumberResult = await returnOptionalNumber(true);
      expect(validNumberResult).assertEqual(42);

      const undefinedNumberResult = await returnOptionalNumber(false);
      expect(undefinedNumberResult).assertEqual(undefined);
    });

    /**
     * @tc.name   asyncFirTest0060
     * @tc.number ASYNC_FIR_TEST_0060
     * @tc.desc   Nullable result wrapper validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const returnNullableResult = async <T>(value: T | null): Promise<NullableResult<T>> => {
        const result: NullableResult<T> = {
          value: value,
          hasValue: value !== null
        };
        return await Promise.resolve(result);
      };

      const nullableWrapper = await returnNullableResult<string>('test_value');
      expect(nullableWrapper.value).assertEqual('test_value');
      expect(nullableWrapper.hasValue).assertEqual(true);

      const nullWrapper = await returnNullableResult<string>(null);
      expect(nullWrapper.value).assertEqual(null);
      expect(nullWrapper.hasValue).assertEqual(false);
    });

    /**
     * @tc.name   asyncFirTest0061
     * @tc.number ASYNC_FIR_TEST_0061
     * @tc.desc   Return null/undefined with object types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const returnNullableUser = async (exists: boolean): Promise<ComplexUserProfile | null> => {
        if (exists) {
          const user: ComplexUserProfile = {
            id: 1,
            name: 'Test User',
            email: 'test@example.com',
            age: 30
          };
          return await Promise.resolve(user);
        }
        return await Promise.resolve(null);
      };

      const existingUser = await returnNullableUser(true);
      expect(existingUser).not().assertNull();
      expect(existingUser!.name).assertEqual('Test User');
      expect(existingUser!.email).assertEqual('test@example.com');

      const nullUser = await returnNullableUser(false);
      expect(nullUser).assertEqual(null);
    });

    /**
     * @tc.name   asyncFirTest0062
     * @tc.number ASYNC_FIR_TEST_0062
     * @tc.desc   Return undefined with array types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const returnOptionalArray = async (hasData: boolean): Promise<string[] | undefined> => {
        if (hasData) {
          return await Promise.resolve(['item1', 'item2', 'item3']);
        }
        return await Promise.resolve(undefined);
      };

      const validArray = await returnOptionalArray(true);
      expect(validArray!.length).assertEqual(3);
      expect(validArray![0]).assertEqual('item1');
      expect(validArray![1]).assertEqual('item2');
      expect(validArray![2]).assertEqual('item3');

      const undefinedArray = await returnOptionalArray(false);
      expect(undefinedArray).assertEqual(undefined);
    });

    /**
     * @tc.name   asyncFirTest0063
     * @tc.number ASYNC_FIR_TEST_0063
     * @tc.desc   Undefined result wrapper and mixed scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const returnUndefinedResult = async <T>(value: T | undefined): Promise<UndefinedResult<T>> => {
        const result: UndefinedResult<T> = {
          value: value,
          isPresent: value !== undefined
        };
        return await Promise.resolve(result);
      };

      const returnMixedOptional = async (mode: string): Promise<number | null | undefined> => {
        switch (mode) {
          case 'value':
            return await Promise.resolve(100);
          case 'null':
            return await Promise.resolve(null);
          case 'undefined':
            return await Promise.resolve(undefined);
          default:
            return await Promise.resolve(undefined);
        }
      };

      const undefinedWrapper = await returnUndefinedResult<number>(42);
      expect(undefinedWrapper.value).assertEqual(42);
      expect(undefinedWrapper.isPresent).assertEqual(true);

      const undefinedValueWrapper = await returnUndefinedResult<number>(undefined);
      expect(undefinedValueWrapper.value).assertEqual(undefined);
      expect(undefinedValueWrapper.isPresent).assertEqual(false);

      const valueResult = await returnMixedOptional('value');
      expect(valueResult).assertEqual(100);

      const nullResult = await returnMixedOptional('null');
      expect(nullResult).assertEqual(null);

      const undefinedResult = await returnMixedOptional('undefined');
      expect(undefinedResult).assertEqual(undefined);
    });

    /**
     * @tc.name   asyncFirTest0064
     * @tc.number ASYNC_FIR_TEST_0064
     * @tc.desc   Empty array basic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const returnEmptyArray = async (): Promise<string[]> => {
        const emptyArray: string[] = [];
        return await Promise.resolve(emptyArray);
      };

      const returnConditionalArray = async (hasItems: boolean): Promise<number[]> => {
        if (hasItems) {
          return await Promise.resolve([1, 2, 3, 4, 5]);
        }
        return await Promise.resolve([]);
      };

      const emptyArray = await returnEmptyArray();
      expect(Array.isArray(emptyArray)).assertEqual(true);
      expect(emptyArray.length).assertEqual(0);

      const filledArray = await returnConditionalArray(true);
      expect(filledArray.length).assertEqual(5);
      expect(filledArray).assertDeepEquals([1, 2, 3, 4, 5]);

      const emptyConditionalArray = await returnConditionalArray(false);
      expect(emptyConditionalArray.length).assertEqual(0);
    });

    /**
     * @tc.name   asyncFirTest0065
     * @tc.number ASYNC_FIR_TEST_0065
     * @tc.desc   Empty array processing and metadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const processEmptyArray = async (input: string[]): Promise<string[]> => {
        if (input.length === 0) {
          return await Promise.resolve([]);
        }
        const processed = await Promise.all(
          input.map(async (item: string): Promise<string> => {
            return await Promise.resolve(item.toUpperCase());
          })
        );
        return processed;
      };

      const returnEmptyWithMetadata = async (): Promise<EmptyDataResult> => {
        const emptyMetadata: Record<string, string> = {};
        const result: EmptyDataResult = {
          items: [],
          metadata: emptyMetadata,
          isEmpty: true
        };
        return await Promise.resolve(result);
      };

      const processedEmpty = await processEmptyArray([]);
      expect(processedEmpty.length).assertEqual(0);

      const processedFilled = await processEmptyArray(['hello', 'world']);
      expect(processedFilled.length).assertEqual(2);
      expect(processedFilled).assertDeepEquals(['HELLO', 'WORLD']);

      const emptyMetadata = await returnEmptyWithMetadata();
      expect(emptyMetadata.items.length).assertEqual(0);
      expect(Object.keys(emptyMetadata.metadata).length).assertEqual(0);
      expect(emptyMetadata.isEmpty).assertEqual(true);
    });

    /**
     * @tc.name   asyncFirTest0066
     * @tc.number ASYNC_FIR_TEST_0066
     * @tc.desc   Array filtering to empty results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const filterToEmpty = async (numbers: number[]): Promise<number[]> => {
        const filtered = await Promise.all(
          numbers.map(async (num: number): Promise<number | null> => {
            if (num > 1000) {
              return await Promise.resolve(num);
            }
            return await Promise.resolve(null);
          })
        );
        return filtered.filter((item: number | null): boolean => item !== null) as number[];
      };

      const filteredResult = await filterToEmpty([1, 5, 10, 50, 100]);
      expect(filteredResult.length).assertEqual(0);

      const filteredWithResults = await filterToEmpty([1, 5, 1500, 2000]);
      expect(filteredWithResults.length).assertEqual(2);
      expect(filteredWithResults).assertDeepEquals([1500, 2000]);
    });

    /**
     * @tc.name   asyncFirTest0067
     * @tc.number ASYNC_FIR_TEST_0067
     * @tc.desc   Empty object basic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const returnEmptyObject = async (): Promise<Record<string, string>> => {
        const emptyObj: Record<string, string> = {};
        return await Promise.resolve(emptyObj);
      };

      const returnConditionalObject = async (hasData: boolean): Promise<Record<string, number>> => {
        if (hasData) {
          const dataObj: Record<string, number> = {};
          dataObj.a = 1;
          dataObj.b = 2;
          dataObj.c = 3;
          return await Promise.resolve(dataObj);
        }
        const emptyObj: Record<string, number> = {};
        return await Promise.resolve(emptyObj);
      };

      const emptyObj = await returnEmptyObject();
      expect(typeof emptyObj).assertEqual('object');
      expect(Object.keys(emptyObj).length).assertEqual(0);

      const filledObj = await returnConditionalObject(true);
      expect(Object.keys(filledObj).length).assertEqual(3);
      expect(filledObj.a).assertEqual(1);
      expect(filledObj.b).assertEqual(2);
      expect(filledObj.c).assertEqual(3);

      const emptyConditionalObj = await returnConditionalObject(false);
      expect(Object.keys(emptyConditionalObj).length).assertEqual(0);
    });

    /**
     * @tc.name   asyncFirTest0068
     * @tc.number ASYNC_FIR_TEST_0068
     * @tc.desc   Empty object processing and structured data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const processEmptyObject = async (input: Record<string, string>): Promise<Record<string, string>> => {
        const keys = Object.keys(input);
        if (keys.length === 0) {
          const emptyResult: Record<string, string> = {};
          return await Promise.resolve(emptyResult);
        }

        const processed: Record<string, string> = {};
        for (const key of keys) {
          processed[key] = await Promise.resolve(input[key].toUpperCase());
        }
        return processed;
      };

      const returnEmptyStructured = async (): Promise<EmptyDataResult> => {
        const emptyMetadata: Record<string, string> = {};
        const result: EmptyDataResult = {
          items: [],
          metadata: emptyMetadata,
          isEmpty: true
        };
        return await Promise.resolve(result);
      };

      const emptyInput: Record<string, string> = {};
      const processedEmpty = await processEmptyObject(emptyInput);
      expect(Object.keys(processedEmpty).length).assertEqual(0);

      const filledInput: Record<string, string> = {};
      filledInput.hello = 'world';
      filledInput.test = 'case';
      const processedFilled = await processEmptyObject(filledInput);
      expect(Object.keys(processedFilled).length).assertEqual(2);
      expect(processedFilled.hello).assertEqual('WORLD');
      expect(processedFilled.test).assertEqual('CASE');

      const emptyStructured = await returnEmptyStructured();
      expect(emptyStructured.items.length).assertEqual(0);
      expect(Object.keys(emptyStructured.metadata).length).assertEqual(0);
      expect(emptyStructured.isEmpty).assertEqual(true);
    });

    /**
     * @tc.name   asyncFirTest0069
     * @tc.number ASYNC_FIR_TEST_0069
     * @tc.desc   Object filtering to empty results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const filterObjectToEmpty = async (input: Record<string, number>): Promise<Record<string, number>> => {
        const filtered: Record<string, number> = {};
        const keys = Object.keys(input);

        for (const key of keys) {
          const value = input[key];
          if (value > 1000) {
            filtered[key] = await Promise.resolve(value);
          }
        }
        return filtered;
      };

      const testInput1: Record<string, number> = {};
      testInput1.a = 1;
      testInput1.b = 5;
      testInput1.c = 10;
      const filteredEmpty = await filterObjectToEmpty(testInput1);
      expect(Object.keys(filteredEmpty).length).assertEqual(0);

      const testInput2: Record<string, number> = {};
      testInput2.a = 1;
      testInput2.b = 1500;
      testInput2.c = 2000;
      const filteredWithResults = await filterObjectToEmpty(testInput2);
      expect(Object.keys(filteredWithResults).length).assertEqual(2);
      expect(filteredWithResults.b).assertEqual(1500);
      expect(filteredWithResults.c).assertEqual(2000);
    });

    /**
     * @tc.name   asyncFirTest0070
     * @tc.number ASYNC_FIR_TEST_0070
     * @tc.desc   Basic nested structure return validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const returnNestedStructure = async (): Promise<NestedDataStructure> => {
        const level3Data: Level3Data = {
          data: ['item1', 'item2', 'item3'],
          count: 3
        };

        const level2Data: Level2Data = {
          level3: level3Data,
          metadata: 'level2_meta'
        };

        const level1Data: Level1Data = {
          level2: level2Data,
          summary: 'level1_summary'
        };

        const structure: NestedDataStructure = {
          level1: level1Data,
          status: 'complete'
        };
        return await Promise.resolve(structure);
      };

      const basicNested = await returnNestedStructure();
      expect(typeof basicNested).assertEqual('object');
      expect(typeof basicNested.level1).assertEqual('object');
      expect(typeof basicNested.level1.level2).assertEqual('object');
      expect(typeof basicNested.level1.level2.level3).assertEqual('object');

      expect(Array.isArray(basicNested.level1.level2.level3.data)).assertEqual(true);
      expect(basicNested.level1.level2.level3.data.length).assertEqual(3);
      expect(basicNested.level1.level2.level3.count).assertEqual(3);
      expect(basicNested.level1.level2.metadata).assertEqual('level2_meta');
      expect(basicNested.level1.summary).assertEqual('level1_summary');
      expect(basicNested.status).assertEqual('complete');
    });

    /**
     * @tc.name   asyncFirTest0071
     * @tc.number ASYNC_FIR_TEST_0071
     * @tc.desc   Async constructed nested structure validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buildNestedStructure = async (itemCount: number): Promise<NestedDataStructure> => {
        const items: string[] = [];
        for (let i = 0; i < itemCount; i++) {
          const item = await Promise.resolve(`async_item_${i + 1}`);
          items.push(item);
        }

        const metadata = await Promise.resolve(`metadata_for_${itemCount}_items`);
        const summary = await Promise.resolve(`summary_${itemCount}_total`);
        const status = await Promise.resolve('async_built');

        const level3Data: Level3Data = {
          data: items,
          count: itemCount
        };

        const level2Data: Level2Data = {
          level3: level3Data,
          metadata: metadata
        };

        const level1Data: Level1Data = {
          level2: level2Data,
          summary: summary
        };

        const structure: NestedDataStructure = {
          level1: level1Data,
          status: status
        };
        return structure;
      };

      const builtNested = await buildNestedStructure(5);
      expect(builtNested.level1.level2.level3.data.length).assertEqual(5);
      expect(builtNested.level1.level2.level3.count).assertEqual(5);
      expect(builtNested.level1.level2.level3.data[0]).assertEqual('async_item_1');
      expect(builtNested.level1.level2.level3.data[4]).assertEqual('async_item_5');
      expect(builtNested.level1.level2.metadata).assertEqual('metadata_for_5_items');
      expect(builtNested.level1.summary).assertEqual('summary_5_total');
      expect(builtNested.status).assertEqual('async_built');
    });

    /**
     * @tc.name   asyncFirTest0072
     * @tc.number ASYNC_FIR_TEST_0072
     * @tc.desc   Partial nested structure validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const returnPartialStructure = async (includeData: boolean): Promise<NestedDataStructure> => {
        const level3Data: Level3Data = {
          data: includeData ? ['partial_item'] : [],
          count: includeData ? 1 : 0
        };

        const level2Data: Level2Data = {
          level3: level3Data,
          metadata: includeData ? 'has_data' : 'no_data'
        };

        const level1Data: Level1Data = {
          level2: level2Data,
          summary: includeData ? 'partial_summary' : 'empty_summary'
        };

        const structure: NestedDataStructure = {
          level1: level1Data,
          status: includeData ? 'partial' : 'empty'
        };
        return await Promise.resolve(structure);
      };

      const partialWithData = await returnPartialStructure(true);
      expect(partialWithData.level1.level2.level3.data.length).assertEqual(1);
      expect(partialWithData.level1.level2.level3.count).assertEqual(1);
      expect(partialWithData.status).assertEqual('partial');

      const partialEmpty = await returnPartialStructure(false);
      expect(partialEmpty.level1.level2.level3.data.length).assertEqual(0);
      expect(partialEmpty.level1.level2.level3.count).assertEqual(0);
      expect(partialEmpty.status).assertEqual('empty');
    });

    /**
     * @tc.name   asyncFirTest0073
     * @tc.number ASYNC_FIR_TEST_0073
     * @tc.desc   Complex nested structure basic return validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const returnComplexStructure = async (): Promise<ComplexNestedStructure> => {
        const activeUser1: UserInfo = {} as UserInfo;
        activeUser1.name = 'Active User 1';
        activeUser1.age = 25;

        const activeUser2: UserInfo = {} as UserInfo;
        activeUser2.name = 'Active User 2';
        activeUser2.age = 30;
        const activeUsers: UserInfo[] = [activeUser1, activeUser2];

        const inactiveUser1: UserInfo = {} as UserInfo;
        inactiveUser1.name = 'Inactive User 1';
        inactiveUser1.age = 35;
        const inactiveUsers: UserInfo[] = [inactiveUser1];

        const userGroups: UserGroups = {
          active: activeUsers,
          inactive: inactiveUsers
        };

        const globalSettingsObj: Record<string, boolean> = {};
        globalSettingsObj.enableNotifications = true;
        globalSettingsObj.darkMode = false;
        const globalSettings: Record<string, boolean> = globalSettingsObj;

        const userSettingsObj: Record<string, string> = {};
        userSettingsObj.theme = 'light';
        userSettingsObj.language = 'en';
        const userSettings: Record<string, string> = userSettingsObj;
        const settingsData: SettingsData = {
          global: globalSettings,
          user: userSettings
        };

        const statisticsData: StatisticsData = {
          totalUsers: 3,
          activeCount: 2,
          lastUpdate: '2024-01-29T10:00:00Z'
        };

        const structure: ComplexNestedStructure = {
          users: userGroups,
          settings: settingsData,
          statistics: statisticsData
        };
        return await Promise.resolve(structure);
      };

      const complexStructure = await returnComplexStructure();
      expect(typeof complexStructure).assertEqual('object');
      expect(typeof complexStructure.users).assertEqual('object');
      expect(Array.isArray(complexStructure.users.active)).assertEqual(true);
      expect(Array.isArray(complexStructure.users.inactive)).assertEqual(true);

      expect(complexStructure.users.active.length).assertEqual(2);
      expect(complexStructure.users.inactive.length).assertEqual(1);
      expect(complexStructure.users.active[0].name).assertEqual('Active User 1');
      expect(complexStructure.users.active[0].age).assertEqual(25);
    });

    /**
     * @tc.name   asyncFirTest0074
     * @tc.number ASYNC_FIR_TEST_0074
     * @tc.desc   Complex nested structure settings and statistics validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const returnComplexStructure = async (): Promise<ComplexNestedStructure> => {
        const activeUser1: UserInfo = {} as UserInfo;
        activeUser1.name = 'Active User 1';
        activeUser1.age = 25;

        const activeUser2: UserInfo = {} as UserInfo;
        activeUser2.name = 'Active User 2';
        activeUser2.age = 30;
        const activeUsers: UserInfo[] = [activeUser1, activeUser2];

        const inactiveUser1: UserInfo = {} as UserInfo;
        inactiveUser1.name = 'Inactive User 1';
        inactiveUser1.age = 35;
        const inactiveUsers: UserInfo[] = [inactiveUser1];

        const userGroups: UserGroups = {
          active: activeUsers,
          inactive: inactiveUsers
        };

        const globalSettingsObj: Record<string, boolean> = {};
        globalSettingsObj.enableNotifications = true;
        globalSettingsObj.darkMode = false;
        const globalSettings: Record<string, boolean> = globalSettingsObj;

        const userSettingsObj: Record<string, string> = {};
        userSettingsObj.theme = 'light';
        userSettingsObj.language = 'en';
        const userSettings: Record<string, string> = userSettingsObj;
        const settingsData: SettingsData = {
          global: globalSettings,
          user: userSettings
        };

        const statisticsData: StatisticsData = {
          totalUsers: 3,
          activeCount: 2,
          lastUpdate: '2024-01-29T10:00:00Z'
        };

        const structure: ComplexNestedStructure = {
          users: userGroups,
          settings: settingsData,
          statistics: statisticsData
        };
        return await Promise.resolve(structure);
      };

      const complexStructure = await returnComplexStructure();

      expect(typeof complexStructure.settings).assertEqual('object');
      expect(typeof complexStructure.settings.global).assertEqual('object');
      expect(typeof complexStructure.settings.user).assertEqual('object');
      expect(complexStructure.settings.global.enableNotifications).assertEqual(true);
      expect(complexStructure.settings.user.theme).assertEqual('light');

      expect(typeof complexStructure.statistics).assertEqual('object');
      expect(complexStructure.statistics.totalUsers).assertEqual(3);
      expect(complexStructure.statistics.activeCount).assertEqual(2);
    });

    /**
     * @tc.name   asyncFirTest0075
     * @tc.number ASYNC_FIR_TEST_0075
     * @tc.desc   Complex nested structure async construction validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const buildComplexStructure = async (userCount: number): Promise<ComplexNestedStructure> => {
        const activeUsers: UserInfo[] = [];
        const inactiveUsers: UserInfo[] = [];

        for (let i = 0; i < userCount; i++) {
          const userName = await Promise.resolve(`User_${i + 1}`);
          const userAge = await Promise.resolve(20 + i);
          const user: UserInfo = {} as UserInfo;
          user.name = userName;
          user.age = userAge;

          if (i % 2 === 0) {
            activeUsers.push(user);
          } else {
            inactiveUsers.push(user);
          }
        }

        const globalSettingsObj: Record<string, boolean> = {};
        globalSettingsObj.enableNotifications = userCount > 5;
        globalSettingsObj.darkMode = userCount > 10;
        const globalSettings = await Promise.resolve(globalSettingsObj);

        const userSettingsObj: Record<string, string> = {};
        userSettingsObj.theme = userCount > 3 ? 'dark' : 'light';
        userSettingsObj.language = 'en';
        const userSettings = await Promise.resolve(userSettingsObj);

        const lastUpdate = await Promise.resolve(new Date().toISOString());

        const userGroups: UserGroups = { active: activeUsers, inactive: inactiveUsers };

        const settingsData: SettingsData = { global: globalSettings, user: userSettings };

        const statisticsData: StatisticsData = { totalUsers: userCount, activeCount: activeUsers.length, lastUpdate: lastUpdate };

        const structure: ComplexNestedStructure = { users: userGroups, settings: settingsData, statistics: statisticsData };
        return structure;
      };

      const builtComplex = await buildComplexStructure(8);
      expect(builtComplex.users.active.length).assertEqual(4);
      expect(builtComplex.users.inactive.length).assertEqual(4);
      expect(builtComplex.statistics.totalUsers).assertEqual(8);
      expect(builtComplex.statistics.activeCount).assertEqual(4);
      expect(builtComplex.settings.global.enableNotifications).assertEqual(true);
      expect(builtComplex.settings.user.theme).assertEqual('dark');
    });

    /**
     * @tc.name   asyncFirTest0076
     * @tc.number ASYNC_FIR_TEST_0076
     * @tc.desc   Empty complex nested structure validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const returnEmptyComplexStructure = async (): Promise<ComplexNestedStructure> => {
        const emptyUserGroups: UserGroups = { active: [], inactive: [] };

        const emptyGlobalSettings: Record<string, boolean> = {};
        const emptyUserSettings: Record<string, string> = {};
        const emptySettingsData: SettingsData = { global: emptyGlobalSettings, user: emptyUserSettings };

        const emptyStatisticsData: StatisticsData = { totalUsers: 0, activeCount: 0, lastUpdate: '1970-01-01T00:00:00Z' };

        const structure: ComplexNestedStructure = { users: emptyUserGroups, settings: emptySettingsData, statistics: emptyStatisticsData };
        return await Promise.resolve(structure);
      };

      const emptyComplex = await returnEmptyComplexStructure();
      expect(emptyComplex.users.active.length).assertEqual(0);
      expect(emptyComplex.users.inactive.length).assertEqual(0);
      expect(Object.keys(emptyComplex.settings.global).length).assertEqual(0);
      expect(Object.keys(emptyComplex.settings.user).length).assertEqual(0);
      expect(emptyComplex.statistics.totalUsers).assertEqual(0);
      expect(emptyComplex.statistics.activeCount).assertEqual(0);
    });
    /**
     * @tc.name   asyncFirTest0077
     * @tc.number ASYNC_FIR_TEST_0077
     * @tc.desc   Test basic logic execution: computation, assignment, and state changes after await
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFirTest0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let globalState = 100;

      const calculateAsync = async (input: number): Promise<number> => {
        let localVal = input * 2;

        const modifier = await Promise.resolve(5);

        localVal += modifier;

        globalState = globalState + localVal;

        return localVal;
      };

      const result = await calculateAsync(10);

      expect(result).assertEqual(25);
      expect(globalState).assertEqual(125);
    });

    /**
     * @tc.name   asyncFirTest0078
     * @tc.number ASYNC_FIR_TEST_0078
     * @tc.desc   Test conditional branches (if/else/switch) with async operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFirTest0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const processCondition = async (type: string): Promise<string> => {
        let status = 'pending';

        if (type === 'fast') {
          status = await Promise.resolve('completed_fast');
        } else if (type === 'slow') {
          await Promise.resolve(1);
          status = 'completed_slow';
        } else {
          switch (type) {
            case 'complex':
              const part1 = await Promise.resolve('comp');
              const part2 = await Promise.resolve('lex');
              status = part1 + part2;
              break;
            default:
              status = 'unknown';
          }
        }
        return status;
      };

      const resFast = await processCondition('fast');
      expect(resFast).assertEqual('completed_fast');

      const resSlow = await processCondition('slow');
      expect(resSlow).assertEqual('completed_slow');

      const resComplex = await processCondition('complex');
      expect(resComplex).assertEqual('complex');

      const resDefault = await processCondition('none');
      expect(resDefault).assertEqual('unknown');
    });

    /**
     * @tc.name   asyncFirTest0079
     * @tc.number ASYNC_FIR_TEST_0079
     * @tc.desc   Test loop integrity (for/for...of) ensuring await pauses iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFirTest0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const numbers = [10, 20, 30];
      const accumulator: number[] = [];

      const processArray = async (arr: number[]): Promise<number> => {
        let sum = 0;
        for (const num of arr) {
          const val = await Promise.resolve(num + 1);
          sum += val;
          accumulator.push(val);
        }
        return sum;
      };

      const processLoopIndex = async (): Promise<string> => {
        let str = '';
        for (let i = 0; i < 3; i++) {
          const char = await Promise.resolve(i.toString());
          str += char;
        }
        return str;
      };

      const totalSum = await processArray(numbers);
      expect(totalSum).assertEqual(63);

      expect(accumulator.length).assertEqual(3);
      expect(accumulator[0]).assertEqual(11);
      expect(accumulator[2]).assertEqual(31);

      const loopStr = await processLoopIndex();
      expect(loopStr).assertEqual('012');
    });

    /**
     * @tc.name   asyncFirTest0080
     * @tc.number ASYNC_FIR_TEST_0080
     * @tc.desc   Test generic async function compatibility and logic consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFirTest0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const wrapInAsync = async <T>(item: T): Promise<T> => {
        const result = await Promise.resolve(item);
        return result;
      };

      interface TestObj {
        id: number;
        val: string;
      }

      const numRes = await wrapInAsync<number>(12345);
      expect(numRes).assertEqual(12345);

      const strRes = await wrapInAsync<string>('Generic Test');
      expect(strRes).assertEqual('Generic Test');

      const objInput: TestObj = { id: 1, val: 'obj' };
      const objRes = await wrapInAsync<TestObj>(objInput);
      expect(objRes.id).assertEqual(1);
      expect(objRes.val).assertEqual('obj');

      expect(objRes).assertEqual(objInput);
    });
  })
}