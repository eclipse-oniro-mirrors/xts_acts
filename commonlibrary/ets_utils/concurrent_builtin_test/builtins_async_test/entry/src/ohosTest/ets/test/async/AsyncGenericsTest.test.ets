import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { sleep } from './utils';

export default function asyncGenericsTest() {
  describe('asyncGenericsTest', () => {
    afterEach(async () => {
      await sleep(50)
    })

    /**
     * @tc.name   asyncGenericsTest001
     * @tc.number SUB_BUILTINS_asyncGenerics_TEST_001
     * @tc.desc   Test async function with single generic type parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncGenericsTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const identity = async <T>(value: T): Promise<T> => {
        return await Promise.resolve(value);
      };

      const numResult = await identity<number>(42);
      const strResult = await identity<string>('hello');
      const boolResult = await identity<boolean>(true);

      expect(numResult).assertEqual(42);
      expect(strResult).assertEqual('hello');
      expect(boolResult).assertEqual(true);
    });

    /**
     * @tc.name   asyncGenericsTest002
     * @tc.number SUB_BUILTINS_asyncGenerics_TEST_002
     * @tc.desc   Test async function with generic type inference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncGenericsTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const identityInferred = async <T>(value: T): Promise<T> => {
        return value;
      };

      const result1 = await identityInferred(42);
      const result2 = await identityInferred('test');
      const result3 = await identityInferred([1, 2, 3]);

      expect(result1).assertEqual(42);
      expect(result2).assertEqual('test');
      expect(result3).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   asyncGenericsTest003
     * @tc.number SUB_BUILTINS_asyncGenerics_TEST_003
     * @tc.desc   Test async function with multiple generic type parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncGenericsTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const combine = async <T, U>(
        first: T,
        second: U
      ): Promise<[T, U]> => {
        return [first, second];
      };

      const result = await combine<number, string>(42, 'hello');
      expect(result[0]).assertEqual(42);
      expect(result[1]).assertEqual('hello');
    });

    /**
     * @tc.name   asyncGenericsTest004
     * @tc.number SUB_BUILTINS_asyncGenerics_TEST_004
     * @tc.desc   Test async function with generic constraint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncGenericsTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class WithLength {
        public length: number = 0;
      }

      const getLength = async <T extends WithLength>(item: T): Promise<number> => {
        return item.length;
      };

      const str: WithLength = new WithLength();
      str.length = 5;
      const strResult = await getLength(str);

      const arr: WithLength = new WithLength();
      arr.length = 3;
      const arrResult = await getLength(arr);

      expect(strResult).assertEqual(5);
      expect(arrResult).assertEqual(3);
    });

    /**
     * @tc.name   asyncGenericsTest005
     * @tc.number SUB_BUILTINS_asyncGenerics_TEST_005
     * @tc.desc   Test async function with generic array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncGenericsTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const first = async <T>(items: T[]): Promise<T | undefined> => {
        return items[0];
      };

      const numResult = await first<number>([1, 2, 3]);
      const strResult = await first<string>(['a', 'b', 'c']);

      expect(numResult).assertEqual(1);
      expect(strResult).assertEqual('a');
    });

    /**
     * @tc.name   asyncGenericsTest006
     * @tc.number SUB_BUILTINS_asyncGenerics_TEST_006
     * @tc.desc   Test async function with generic promise wrapper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncGenericsTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class TestObj {
        id: number = 0;
        name: string = '';
      }

      const wrapInPromise = async <T>(value: T): Promise<T> => {
        return await Promise.resolve(value);
      };

      const obj: TestObj = { id: 1, name: 'test' };
      const result = await wrapInPromise(obj);
      expect(result.id).assertEqual(1);
      expect(result.name).assertEqual('test');
    });

    /**
     * @tc.name   asyncGenericsTest007
     * @tc.number SUB_BUILTINS_asyncGenerics_TEST_007
     * @tc.desc   Test async function with generic default type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncGenericsTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const withDefault = async <T = string>(value: T): Promise<T> => {
        return value;
      };

      const result1 = await withDefault('hello');
      const result2 = await withDefault<number>(42);

      expect(result1).assertEqual('hello');
      expect(result2).assertEqual(42);
    });

    /**
     * @tc.name   asyncGenericsTest008
     * @tc.number SUB_BUILTINS_asyncGenerics_TEST_008
     * @tc.desc   Test async function with generic map operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncGenericsTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const asyncMap = async <T, U>(
        items: T[],
        mapper: (item: T) => Promise<U>
      ): Promise<U[]> => {
        const results: U[] = [];
        for (const item of items) {
          results.push(await mapper(item));
        }
        return results;
      };

      const result = await asyncMap([1, 2, 3], async (x) => x * 2);
      expect(result).assertDeepEquals([2, 4, 6]);
    });

    /**
     * @tc.name   asyncGenericsTest009
     * @tc.number SUB_BUILTINS_asyncGenerics_TEST_009
     * @tc.desc   Test async function with generic filter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncGenericsTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const asyncFilter = async <T>(
        items: T[],
        predicate: (item: T) => Promise<boolean>
      ): Promise<T[]> => {
        const results: T[] = [];
        for (const item of items) {
          if (await predicate(item)) {
            results.push(item);
          }
        }
        return results;
      };

      const result = await asyncFilter([1, 2, 3, 4, 5], async (x) => x % 2 === 0);
      expect(result).assertDeepEquals([2, 4]);
    });

    /**
     * @tc.name   asyncGenericsTest010
     * @tc.number SUB_BUILTINS_asyncGenerics_TEST_010
     * @tc.desc   Test async function with generic reduce
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncGenericsTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const asyncReduce = async <T, U>(
        items: T[],
        initial: U,
        reducer: (acc: U, item: T) => Promise<U>
      ): Promise<U> => {
        let accumulator = initial;
        for (const item of items) {
          accumulator = await reducer(accumulator, item);
        }
        return accumulator;
      };

      const result = await asyncReduce(
        [1, 2, 3, 4],
        0,
        async (sum, x) => sum + x
      );
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   asyncGenericsTest011
     * @tc.number SUB_BUILTINS_asyncGenerics_TEST_011
     * @tc.desc   Test async function with generic class method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncGenericsTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class Container<T> {
        private value: T;

        constructor(value: T) {
          this.value = value;
        }

        async get(): Promise<T> {
          return this.value;
        }

        async set(value: T): Promise<void> {
          this.value = value;
        }
      }

      const container = new Container<number>(42);
      const result1 = await container.get();

      await container.set(100);
      const result2 = await container.get();

      expect(result1).assertEqual(42);
      expect(result2).assertEqual(100);
    });

    /**
     * @tc.name   asyncGenericsTest012
     * @tc.number SUB_BUILTINS_asyncGenerics_TEST_012
     * @tc.desc   Test async function with generic interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncGenericsTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class User {
        id: number = 0;
        name: string = '';
      }

      interface Repository<T> {
        findById(id: number): Promise<T | undefined>;
        save(item: T): Promise<void>;
      }

      class UserRepository implements Repository<User> {
        private data: Map<number, User> = new Map();

        async findById(id: number): Promise<User | undefined> {
          return this.data.get(id);
        }

        async save(item: User): Promise<void> {
          this.data.set(item.id, item);
        }
      }

      const repo = new UserRepository();
      const user: User = new User();
      user.id = 1;
      user.name = 'Alice';
      await repo.save(user);
      const result = await repo.findById(1);

      expect(result !== undefined).assertTrue();
      expect(result!.id).assertEqual(1);
      expect(result!.name).assertEqual('Alice');
    });

    /**
     * @tc.name   asyncGenericsTest013
     * @tc.number SUB_BUILTINS_asyncGenerics_TEST_013
     * @tc.desc   Test async function with conditional generic type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncGenericsTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const process = async <T extends string | number>(
        value: T
      ): Promise<string> => {
        if (typeof value === 'string') {
          return 'string: ' + value;
        }
        return 'number: ' + value.toString();
      };

      const result1 = await process('hello');
      const result2 = await process(42);

      expect(result1).assertEqual('string: hello');
      expect(result2).assertEqual('number: 42');
    });

    /**
     * @tc.name   asyncGenericsTest014
     * @tc.number SUB_BUILTINS_asyncGenerics_TEST_014
     * @tc.desc   Test async function returning generic promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncGenericsTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const fetchGeneric = async <T>(url: string, defaultValue: T): Promise<T> => {
        return await Promise.resolve(defaultValue);
      };

      class User {
        id: number = 0;
        name: string = '';
      }
      const defaultUser: User = new User();
      const result = await fetchGeneric<User>('/api/user', defaultUser);

      expect(typeof result).assertEqual('object');
    });

    /**
     * @tc.name   asyncGenericsTest015
     * @tc.number SUB_BUILTINS_asyncGenerics_TEST_015
     * @tc.desc   Test async function with generic object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncGenericsTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class User {
        id: number = 0;
        name: string = '';
        age: number = 0;
      }

      const getUser = async (): Promise<User> => {
        const user: User = new User();
        user.id = 1;
        user.name = 'Bob';
        user.age = 30;
        return user;
      };

      const user = await getUser();
      expect(user.name).assertEqual('Bob');
      expect(user.age).assertEqual(30);
    });

    /**
     * @tc.name   asyncGenericsTest016
     * @tc.number SUB_BUILTINS_asyncGenerics_TEST_016
     * @tc.desc   Test async function with generic object update
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncGenericsTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class User {
        id: number = 0;
        name: string = '';
        age: number = 0;
      }

      const updateUser = async (
        obj: User,
        newAge: number
      ): Promise<User> => {
        obj.age = newAge;
        return obj;
      };

      const user: User = { id: 1, name: 'Alice', age: 25 };
      const result = await updateUser(user, 26);

      expect(result.id).assertEqual(1);
      expect(result.name).assertEqual('Alice');
      expect(result.age).assertEqual(26);
    });

    /**
     * @tc.name   asyncGenericsTest017
     * @tc.number SUB_BUILTINS_asyncGenerics_TEST_017
     * @tc.desc   Test async function with generic object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncGenericsTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class TestObj {
        id: number = 0;
        name: string = '';
      }

      const makeCopy = async <T>(obj: T): Promise<T> => {
        return obj;
      };

      const obj: TestObj = { id: 1, name: 'test' };
      const result = await makeCopy(obj);
      expect(result.id).assertEqual(1);
      expect(result.name).assertEqual('test');
    });

    /**
     * @tc.name   asyncGenericsTest018
     * @tc.number SUB_BUILTINS_asyncGenerics_TEST_018
     * @tc.desc   Test async function with generic map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncGenericsTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const createMap = async <V>(
        keys: string[],
        value: V
      ): Promise<Map<string, V>> => {
        const map = new Map<string, V>();
        for (const key of keys) {
          map.set(key, value);
        }
        return map;
      };

      const result = await createMap<number>(['a', 'b', 'c'], 1);
      expect(result.get('a')).assertEqual(1);
      expect(result.get('b')).assertEqual(1);
      expect(result.get('c')).assertEqual(1);
    });

    /**
     * @tc.name   asyncGenericsTest019
     * @tc.number SUB_BUILTINS_asyncGenerics_TEST_019
     * @tc.desc   Test async function with generic selection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncGenericsTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class User {
        id: number = 0;
        name: string = '';
        email: string = '';
        age: number = 0;
      }

      class UserSummary {
        id: number = 0;
        name: string = '';
      }

      const selectProperties = async (
        obj: User
      ): Promise<UserSummary> => {
        const summary: UserSummary = new UserSummary();
        summary.id = obj.id;
        summary.name = obj.name;
        return summary;
      };

      const user: User = new User();
      user.id = 1;
      user.name = 'Alice';
      user.email = 'alice@test.com';
      user.age = 30;

      const result = await selectProperties(user);

      expect(result.id).assertEqual(1);
      expect(result.name).assertEqual('Alice');
    });

    /**
     * @tc.name   asyncGenericsTest020
     * @tc.number SUB_BUILTINS_asyncGenerics_TEST_020
     * @tc.desc   Test async function with generic object transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncGenericsTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class User {
        id: number = 0;
        name: string = '';
        password: string = '';
      }

      class PublicUser {
        id: number = 0;
        name: string = '';
      }

      const toPublicUser = async (obj: User): Promise<PublicUser> => {
        const publicUser: PublicUser = new PublicUser();
        publicUser.id = obj.id;
        publicUser.name = obj.name;
        return publicUser;
      };

      const user: User = new User();
      user.id = 1;
      user.name = 'Alice';
      user.password = 'secret';

      const result = await toPublicUser(user);

      expect(result.id).assertEqual(1);
      expect(result.name).assertEqual('Alice');
    });

    /**
     * @tc.name   asyncGenericsTest022
     * @tc.number SUB_BUILTINS_asyncGenerics_TEST_022
     * @tc.desc   Test async function with generic async queue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncGenericsTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class AsyncQueue<T> {
        private items: T[] = [];

        async enqueue(item: T): Promise<void> {
          this.items.push(item);
        }

        async dequeue(): Promise<T | undefined> {
          return this.items.shift();
        }

        async size(): Promise<number> {
          return this.items.length;
        }
      }

      const queue = new AsyncQueue<number>();
      await queue.enqueue(1);
      await queue.enqueue(2);
      await queue.enqueue(3);

      const size = await queue.size();
      expect(size).assertEqual(3);

      const item1 = await queue.dequeue();
      expect(item1).assertEqual(1);
    });

    /**
     * @tc.name   asyncGenericsTest023
     * @tc.number SUB_BUILTINS_asyncGenerics_TEST_023
     * @tc.desc   Test async function with generic async cache
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncGenericsTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class AsyncCache<K, V> {
        private cache = new Map<K, V>();

        async get(key: K): Promise<V | undefined> {
          return this.cache.get(key);
        }

        async set(key: K, value: V): Promise<void> {
          this.cache.set(key, value);
        }

        async has(key: K): Promise<boolean> {
          return this.cache.has(key);
        }
      }

      const cache = new AsyncCache<string, number>();
      await cache.set('a', 1);
      await cache.set('b', 2);

      const result1 = await cache.get('a');
      const result2 = await cache.has('c');

      expect(result1).assertEqual(1);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.name   asyncGenericsTest024
     * @tc.number SUB_BUILTINS_asyncGenerics_TEST_024
     * @tc.desc   Test async function with generic pipeline
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncGenericsTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // 移除 any 类型，使用具体的函数签名
      const pipe = async (
        value: number,
        ...fns: Array<(input: number) => Promise<number | string>>
      ): Promise<number | string> => {
        let result: number | string = value;
        for (const fn of fns) {
          result = await fn(result as number);
        }
        return result;
      };

      const result = await pipe(
        5,
        async (x: number): Promise<number> => x * 2,
        async (x: number): Promise<number> => x + 10,
        async (x: number): Promise<string> => x.toString()
      );

      expect(result).assertEqual('20');
    });

  });
}
